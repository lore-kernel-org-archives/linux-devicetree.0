From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] usb: dwc2: add support of hi6220
Date: Wed, 18 Nov 2015 15:39:47 +0800
Message-ID: <1447832387-27549-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Support hisilicon,hi6220-usb for HiKey board

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt |  1 +
 drivers/usb/dwc2/platform.c                    | 32 ++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index fd132cb..2213682 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -4,6 +4,7 @@ Platform DesignWare HS OTG USB 2.0 controller
 Required properties:
 - compatible : One of:
   - brcm,bcm2835-usb: The DWC2 USB controller instance in the BCM2835 SoC.
+  - hisilicon,hi6220-usb: The DWC2 USB controller instance in the hi6220 SoC.
   - rockchip,rk3066-usb: The DWC2 USB controller instance in the rk3066 Soc;
   - "rockchip,rk3188-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3188 Soc;
   - "rockchip,rk3288-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3288 Soc;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 5859b0f..a5cb1bf 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -54,6 +54,37 @@
 
 static const char dwc2_driver_name[] = "dwc2";
 
+static const struct dwc2_core_params params_hi6220 = {
+	.otg_cap			= 2,	/* No HNP/SRP capable */
+	.otg_ver			= 0,	/* 1.3 */
+	.dma_enable			= 1,
+	.dma_desc_enable		= 0,
+	.speed				= 0,	/* High Speed */
+	.enable_dynamic_fifo		= 1,
+	.en_multiple_tx_fifo		= 1,
+	.host_rx_fifo_size		= 512,
+	.host_nperio_tx_fifo_size	= 512,
+	.host_perio_tx_fifo_size	= 512,
+	.max_transfer_size		= 65535,
+	.max_packet_count		= 511,
+	.host_channels			= 16,
+	.phy_type			= 1,	/* UTMI */
+	.phy_utmi_width			= 8,
+	.phy_ulpi_ddr			= 0,	/* Single */
+	.phy_ulpi_ext_vbus		= 0,
+	.i2c_enable			= 0,
+	.ulpi_fs_ls			= 0,
+	.host_support_fs_ls_low_power	= 0,
+	.host_ls_low_power_phy_clk	= 0,	/* 48 MHz */
+	.ts_dline			= 0,
+	.reload_ctl			= 0,
+	.ahbcfg				= GAHBCFG_HBSTLEN_INCR16 <<
+					  GAHBCFG_HBSTLEN_SHIFT,
+	.uframe_sched			= 0,
+	.external_id_pin_ctl		= -1,
+	.hibernation			= -1,
+};
+
 static const struct dwc2_core_params params_bcm2835 = {
 	.otg_cap			= 0,	/* HNP/SRP capable */
 	.otg_ver			= 0,	/* 1.3 */
@@ -282,6 +313,7 @@ static int dwc2_driver_remove(struct platform_device *dev)
 
 static const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "brcm,bcm2835-usb", .data = &params_bcm2835 },
+	{ .compatible = "hisilicon,hi6220-usb", .data = &params_hi6220 },
 	{ .compatible = "rockchip,rk3066-usb", .data = &params_rk3066 },
 	{ .compatible = "snps,dwc2", .data = NULL },
 	{ .compatible = "samsung,s3c6400-hsotg", .data = NULL},
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
