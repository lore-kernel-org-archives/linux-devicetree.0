From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 03/30] usb: dwc2: gadget: Add descriptor DMA binding
Date: Mon, 07 Nov 2016 14:39:53 -0800
Message-ID: <e0d302ebcbad32242da84894c173b743b9199f71.1478558343.git.johnyoun@synopsys.com>
References: <cover.1478558343.git.johnyoun@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1478558343.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

Add the devicetree binding to enable descriptor DMA and read it in to
the corresponding parameter during probe.

Signed-off-by: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt |  1 +
 drivers/usb/dwc2/core.h                        |  4 ++++
 drivers/usb/dwc2/gadget.c                      | 11 +++++++++++
 drivers/usb/dwc2/params.c                      |  4 ++++
 4 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 389a461..1db9c37 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -27,6 +27,7 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
   Refer to usb/generic.txt
 - snps,host-dma-disable: disable host DMA mode.
 - snps,gadget-dma-enable: enable gadget DMA mode.
+- snps,gadget-dma-desc-enable: enable gadget DMA descriptor mode.
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
 - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index a1075ad..322ffe0 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -421,6 +421,9 @@ enum dwc2_ep0_state {
  * @g_dma:              If true, enables dma usage on the device. This
  *                      setting is not auto-detected. It must be
  *                      explicitly enabled (default: false).
+ * @g_dma_desc:         If true, enables descriptor DMA. this
+ *                      setting is not auto-detected. It must be
+ *                      explicitly enabled (default: false).
  * @g_rx_fifo_size:	The periodic rx fifo size for the device, in
  *			DWORDS from 16-32768 (default: 2048 if
  *			possible, otherwise autodetect).
@@ -500,6 +503,7 @@ struct dwc2_core_params {
 
 	/* Gadget parameters */
 	bool g_dma;
+	bool g_dma_desc;
 	u16 g_rx_fifo_size;
 	u16 g_np_tx_fifo_size;
 	u32 g_tx_fifo_size[MAX_EPS_CHANNELS];
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 1ba0bfc..4013518 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -96,6 +96,17 @@ static inline bool using_dma(struct dwc2_hsotg *hsotg)
 	return hsotg->params.g_dma;
 }
 
+/*
+ * using_desc_dma - return the descriptor DMA status of the driver.
+ * @hsotg: The driver state.
+ *
+ * Return true if we're using descriptor DMA.
+ */
+static inline bool using_desc_dma(struct dwc2_hsotg *hsotg)
+{
+	return hsotg->params.g_dma_desc;
+}
+
 /**
  * dwc2_gadget_incr_frame_num - Increments the targeted frame number.
  * @hs_ep: The endpoint
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index aeece91..244ac0b 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -1172,6 +1172,10 @@ static void dwc2_set_parameters(struct dwc2_hsotg *hsotg,
 					    false, false,
 					    dma_capable);
 
+		dwc2_set_param_bool(hsotg, &p->g_dma_desc, true,
+				    "snps,gadget-dma-desc-enable",
+				    false, false, !!hw->dma_desc_enable);
+
 		/*
 		 * The values for g_rx_fifo_size (2048) and
 		 * g_np_tx_fifo_size (1024) come from the legacy s3c
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
