From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/4] usb: dwc2: Add binding for AHB burst
Date: Wed, 16 Nov 2016 15:47:18 -0800
Message-ID: <7fa1c1c4d703c435d698cdf140c9d43163347f1d.1479339900.git.johnyoun@synopsys.com>
References: <cover.1479339900.git.johnyoun@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1479339900.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the "snps,ahb-burst" binding and read it in.

This property controls which burst type to perform on the AHB bus as a
master in internal DMA mode. This overrides the legacy param value,
which we need to keep around for now since several platforms use it.

Some platforms may see better or worse performance based on this
value. The HAPS platform is one example where all INCRx have worse
performance than INCR.

Other platforms (such as the Canyonlands board) report that the default
value causes system hangs.

Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt |  2 +
 drivers/usb/dwc2/core.h                        |  9 +++++
 drivers/usb/dwc2/params.c                      | 56 ++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 6c7c2bce..9e7b4b4 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -26,6 +26,8 @@ Optional properties:
 Refer to phy/phy-bindings.txt for generic phy consumer properties
 - dr_mode: shall be one of "host", "peripheral" and "otg"
   Refer to usb/generic.txt
+- snps,ahb-burst: specifies the ahb burst length. Valid arguments are:
+  "SINGLE", "INCR", "INCR4", "INCR8", "INCR16". Defaults to "INCR4".
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
 - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 9548d3e..75c238c 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -430,6 +430,12 @@ enum dwc2_ep0_state {
  *			needed.
  *			0 - No (default)
  *			1 - Yes
+ * @ahb_burst:          Specifies the AHB burst.
+ *                       0 - Single
+ *                       1 - INCR
+ *                       3 - INCR4 (default)
+ *                       5 - INCR8
+ *                       7 - INCR16
  * @g_dma:              Enables gadget dma usage (default: autodetect).
  * @g_dma_desc:         Enables gadget descriptor DMA (default: autodetect).
  * @g_rx_fifo_size:	The periodic rx fifo size for the device, in
@@ -507,6 +513,9 @@ struct dwc2_core_params {
 	 * properties and cannot be set directly in this structure.
 	 */
 
+	/* Global parameters */
+	u8 ahb_burst;
+
 	/* Host parameters */
 	bool host_dma;
 
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index d44b31c..8bc2745 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -1098,6 +1098,60 @@ static void dwc2_set_param_tx_fifo_sizes(struct dwc2_hsotg *hsotg)
 	}
 }
 
+static const char *const ahb_bursts[] = {
+	[GAHBCFG_HBSTLEN_SINGLE]	= "SINGLE",
+	[GAHBCFG_HBSTLEN_INCR]		= "INCR",
+	[GAHBCFG_HBSTLEN_INCR4]		= "INCR4",
+	[GAHBCFG_HBSTLEN_INCR8]		= "INCR8",
+	[GAHBCFG_HBSTLEN_INCR16]	= "INCR16",
+};
+
+static int dwc2_get_property_ahb_burst(struct dwc2_hsotg *hsotg)
+{
+	const char *str = NULL;
+	int burst;
+	int ret;
+
+	ret = device_property_read_string(hsotg->dev,
+					  "snps,ahb-burst", &str);
+	if (ret < 0)
+		return ret;
+
+	burst = match_string(ahb_bursts,
+			     ARRAY_SIZE(ahb_bursts), str);
+	if (burst < 0) {
+		dev_err(hsotg->dev,
+			"Invalid parameter '%s' for ahb-burst\n", str);
+	}
+
+	return burst;
+}
+
+static void dwc2_set_ahb_burst(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+	int burst;
+	int ret;
+
+	/* Default burst value */
+	burst = GAHBCFG_HBSTLEN_INCR4;
+
+	/* Get the legacy param value, if set. */
+	if (p->ahbcfg != -1) {
+		burst = (p->ahbcfg & GAHBCFG_HBSTLEN_MASK) >>
+			GAHBCFG_HBSTLEN_SHIFT;
+	}
+
+	/* Override it from devicetree, if set. */
+	ret = dwc2_get_property_ahb_burst(hsotg);
+	if (ret >= 0)
+		burst = ret;
+
+	/* Set the parameter */
+	p->ahb_burst = (u8)burst;
+	dev_dbg(hsotg->dev, "Setting ahb-burst to %d\n", burst);
+}
+
 static void dwc2_set_gadget_dma(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_hw_params *hw = &hsotg->hw_params;
@@ -1178,6 +1232,8 @@ static void dwc2_set_parameters(struct dwc2_hsotg *hsotg,
 	dwc2_set_param_external_id_pin_ctl(hsotg, params->external_id_pin_ctl);
 	dwc2_set_param_hibernation(hsotg, params->hibernation);
 
+	dwc2_set_ahb_burst(hsotg);
+
 	/*
 	 * Set devicetree-only parameters. These parameters do not
 	 * take any values from @params.
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
