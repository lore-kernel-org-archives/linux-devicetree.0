From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC PATCH v2 2/2] devicetree: reserved-memory: document the optional
 no-exclusive parameter
Date: Mon, 2 Nov 2015 12:04:45 +0100
Message-ID: <5637434D.9070401@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Josh Cartwright <joshc@codeaurora.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Document the 'no-exclusive' parameter used for the 'shared-dma-pool'
compatible reserved-memory type.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
index 3da0ebd..897aada 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
@@ -63,6 +63,9 @@ reusable (optional) - empty property
       able to reclaim it back. Typically that means that the operating
       system can use that region to store volatile or cached data that
       can be otherwise regenerated or migrated elsewhere.
+no-exclusive (optional) - empty property
+    - Indicates the operating system can fall back to the default allocation
+      mechanism if no more enough memory is available from this pool.

 Linux implementation note:
 - If a "linux,cma-default" property is present, then Linux will use the
-- 
1.9.1
