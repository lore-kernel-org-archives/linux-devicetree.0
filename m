From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 05/30] usb: dwc2: Add bindings to disable gadget DMA modes
Date: Wed, 09 Nov 2016 19:27:50 -0800
Message-ID: <16733114b9252b8163c11cc7ca95b2b152b66e0e.1478748145.git.johnyoun__16784.1066410348$1478748523$gmane$org@synopsys.com>
References: <cover.1478748145.git.johnyoun@synopsys.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1478748145.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that the gadget driver automatically detects DMA modes, we need to
provide a way to disable them. Certain platforms may still have issues
with DMA and require it to be disabled. It is also needed for IP
validation purposes.

Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 2 ++
 drivers/usb/dwc2/params.c                      | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 389bb13..10a2a4b 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -26,6 +26,8 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
 - dr_mode: shall be one of "host", "peripheral" and "otg"
   Refer to usb/generic.txt
 - snps,host-dma-disable: disable host DMA mode.
+- snps,gadget-dma-disable: disable gadget DMA mode.
+- snps,gadget-dma-desc-disable: disable gadget DMA descriptor mode.
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
 - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 2f18a7b..64d5c66 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -1091,17 +1091,22 @@ static void dwc2_set_gadget_dma(struct dwc2_hsotg *hsotg)
 	struct dwc2_hw_params *hw = &hsotg->hw_params;
 	struct dwc2_core_params *p = &hsotg->params;
 	bool dma_capable = !(hw->arch == GHWCFG2_SLAVE_ONLY_ARCH);
+	bool disable;
 
 	/* Buffer DMA */
+	disable = device_property_read_bool(hsotg->dev,
+					    "snps,gadget-dma-disable");
 	dwc2_set_param_bool(hsotg, &p->g_dma,
 			    false, "gadget-dma",
-			    true, false,
+			    !disable, false,
 			    dma_capable);
 
 	/* DMA Descriptor */
+	disable = device_property_read_bool(hsotg->dev,
+					    "snps,gadget-dma-desc-disable");
 	dwc2_set_param_bool(hsotg, &p->g_dma_desc, false,
 			    "gadget-dma-desc",
-			    p->g_dma, false,
+			    p->g_dma && !disable, false,
 			    !!hw->dma_desc_enable);
 }
 
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
