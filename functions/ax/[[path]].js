export async function onRequest(context) {
  const { path } = context.params;

  // Construct the Plausible URL:
  // /ax/js/script.js → https://plausible.io/js/script.js
  const pathSegments = Array.isArray(path) ? path.join("/") : path || "";
  const destinationUrl = `https://plausible.io/${pathSegments}`;

  // Preserve query parameters from original request
  const url = new URL(destinationUrl);
  const originalSearch = new URL(context.request.url).search;
  if (originalSearch) {
    url.search = originalSearch;
  }

  try {
    // Forward the request to Plausible with same method, headers, and body:
    const proxyRequest = new Request(url.toString(), {
      method: context.request.method,
      headers: context.request.headers,
      body: context.request.body,
      redirect: "manual",
    });

    // Fetch from Plausible and return response:
    const response = await fetch(proxyRequest);
    return response;
  } catch (error) {
    console.error("Plausible proxy error:", error);
    return new Response(`Proxy request failed: ${error.message}`, {
      status: 502,
      headers: { "Content-Type": "text/plain" },
    });
  }
}
