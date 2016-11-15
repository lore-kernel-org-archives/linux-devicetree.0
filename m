From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/3] Revert "usb: dwc2: Add bindings to disable gadget DMA modes"
Date: Mon, 14 Nov 2016 18:29:52 -0800
Message-ID: <1e2c31bb1cff21edc45dcda045138b032ecd6bb9.1479176826.git.johnyoun__8748.12872284583$1479177043$gmane$org@synopsys.com>
References: <cover.1479176826.git.johnyoun@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1479176826.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This reverts commit 9acc1ee2b723 ("usb: dwc2: Add bindings to disable
gadget DMA modes").

Don't add bindings and don't read them in. These are not yet needed by
any hardware.

Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 2 --
 drivers/usb/dwc2/params.c                      | 9 ++-------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 10a2a4b..389bb13 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -26,8 +26,6 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
 - dr_mode: shall be one of "host", "peripheral" and "otg"
   Refer to usb/generic.txt
 - snps,host-dma-disable: disable host DMA mode.
-- snps,gadget-dma-disable: disable gadget DMA mode.
-- snps,gadget-dma-desc-disable: disable gadget DMA descriptor mode.
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
 - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 64d5c66..2f18a7b 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -1091,22 +1091,17 @@ static void dwc2_set_gadget_dma(struct dwc2_hsotg *hsotg)
 	struct dwc2_hw_params *hw = &hsotg->hw_params;
 	struct dwc2_core_params *p = &hsotg->params;
 	bool dma_capable = !(hw->arch == GHWCFG2_SLAVE_ONLY_ARCH);
-	bool disable;
 
 	/* Buffer DMA */
-	disable = device_property_read_bool(hsotg->dev,
-					    "snps,gadget-dma-disable");
 	dwc2_set_param_bool(hsotg, &p->g_dma,
 			    false, "gadget-dma",
-			    !disable, false,
+			    true, false,
 			    dma_capable);
 
 	/* DMA Descriptor */
-	disable = device_property_read_bool(hsotg->dev,
-					    "snps,gadget-dma-desc-disable");
 	dwc2_set_param_bool(hsotg, &p->g_dma_desc, false,
 			    "gadget-dma-desc",
-			    p->g_dma && !disable, false,
+			    p->g_dma, false,
 			    !!hw->dma_desc_enable);
 }
 
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
