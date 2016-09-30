From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/3] Revert "Documentation: devicetree: dwc2: Deprecate g-tx-fifo-size"
Date: Fri, 30 Sep 2016 11:47:21 -0700
Message-ID: <db10dd0c6dcc9479b5a4846c040cf592154b730d.1475202428.git.johnyoun@synopsys.com>
References: <becf876f7fbe993d4cadd4e38e26246e9e697eea.1475202428.git.johnyoun@synopsys.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <becf876f7fbe993d4cadd4e38e26246e9e697eea.1475202428.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This binding was deprecated due to commit aa381a7259c3 ("usb: dwc2:
gadget: fix TX FIFO size and address initialization"). However that
commit is now reverted, so also revert this commit.

The binding is valid and shouldn't be deprecated.

This reverts commit 65e1ff7f4b5b ("Documentation: devicetree: dwc2:
Deprecate g-tx-fifo-size").

Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
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
