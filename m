From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] usb: dwc2: add amcc,dwc-otg device tree definition
Date: Sun,  6 Nov 2016 01:56:08 +0100
Message-ID: <20161106005608.26386-1-chunkeey@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for the "amcc,usb-otg" device
which is found in the PowerPC Canyonlands' dts.

The device definition was added by:
commit c89b3458d8cc ("powerpc/44x: Add USB DWC DTS entry to Canyonlands board")'.
AMCC produced a standalone driver that was sent to the
linuxppc-dev at the time. However, it was never integrated.

Signed-off-by: Christian Lamparter <chunkeey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
For anyone interested: the driver was sent to the ML multiple times back
in 2012 [0], [1].

[0] <https://lists.ozlabs.org/pipermail/linuxppc-dev/2012-May/097847.html>
[1] <https://lists.ozlabs.org/pipermail/linuxppc-dev/2012-May/097938.html>
---
 Documentation/devicetree/bindings/usb/dwc2.txt |  1 +
 drivers/usb/dwc2/platform.c                    | 33 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 2c30a54..73c4dc5 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -12,6 +12,7 @@ Required properties:
   - "lantiq,xrx200-usb": The DWC2 USB controller instance in Lantiq XRX SoCs;
   - "amlogic,meson8b-usb": The DWC2 USB controller instance in Amlogic Meson8b SoCs;
   - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
+  - "amcc,usb-otg": The DWC2 USB controller instance in AMCC Canyonlands 460EX SoCs;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index dde08d5..8230037 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -214,6 +214,38 @@ static const struct dwc2_core_params params_amlogic = {
 	.hibernation			= -1,
 };
 
+static const struct dwc2_core_params params_amcc_dwc_otg = {
+	.otg_cap			= DWC2_CAP_PARAM_HNP_SRP_CAPABLE,
+	.otg_ver			= -1,
+	.dma_enable			= -1,
+	.dma_desc_enable		= -1,
+	.speed				= -1,
+	.enable_dynamic_fifo		= -1,
+	.en_multiple_tx_fifo		= -1,
+	.host_rx_fifo_size		= -1,
+	.host_nperio_tx_fifo_size	= -1,
+	.host_perio_tx_fifo_size	= -1,
+	.max_transfer_size		= -1,
+	.max_packet_count		= -1,
+	.host_channels			= -1,
+	.phy_type			= -1,
+	.phy_utmi_width			= -1,
+	.phy_ulpi_ddr			= -1,
+	.phy_ulpi_ext_vbus		= -1,
+	.i2c_enable			= -1,
+	.ulpi_fs_ls			= -1,
+	.host_support_fs_ls_low_power	= -1,
+	.host_ls_low_power_phy_clk	= -1,
+	.ts_dline			= -1,
+	.reload_ctl			= -1,
+	/* Avoid system hang during concurrently using USB and SATA */
+	.ahbcfg				= GAHBCFG_HBSTLEN_INCR16 <<
+					  GAHBCFG_HBSTLEN_SHIFT,
+	.uframe_sched			= -1,
+	.external_id_pin_ctl		= -1,
+	.hibernation			= -1,
+};
+
 /*
  * Check the dr_mode against the module configuration and hardware
  * capabilities.
@@ -521,6 +553,7 @@ static const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "samsung,s3c6400-hsotg", .data = NULL},
 	{ .compatible = "amlogic,meson8b-usb", .data = &params_amlogic },
 	{ .compatible = "amlogic,meson-gxbb-usb", .data = &params_amlogic },
+	{ .compatible = "amcc,dwc-otg", .data = &params_amcc_dwc_otg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
