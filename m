From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 3/3] Revert "Documentation: devicetree: dwc2: Deprecate g-tx-fifo-size"
Date: Mon, 17 Oct 2016 17:36:28 -0700
Message-ID: <cdd92e1e4e126b0f65871848c1b8598c447b62bf.1476750819.git.johnyoun@synopsys.com>
References: <cover.1476750819.git.johnyoun@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1476750819.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This binding was deprecated due to commit aa381a7259c3 ("usb: dwc2:
gadget: fix TX FIFO size and address initialization"). However that
commit is now reverted, so also revert this commit.

The binding is valid and shouldn't be deprecated.

This reverts commit 65e1ff7f4b5b ("Documentation: devicetree: dwc2:
Deprecate g-tx-fifo-size").

Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 7d16ebf..20a68bf 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -26,10 +26,7 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
 - g-use-dma: enable dma usage in gadget driver.
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
-
-Deprecated properties:
-- g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0)
-  in gadget mode.
+- g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
 
 Example:
 
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
