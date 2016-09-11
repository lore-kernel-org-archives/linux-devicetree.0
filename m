From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 1/6] usb: dwc2: add support for Meson8b and GXBB SoCs
Date: Sun, 11 Sep 2016 15:41:06 +0200
Message-ID: <20160911134111.31141-2-martin.blumenstingl@googlemail.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160911134111.31141-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160911134111.31141-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Add compatible strings for amlogic Meson8b and GXBB SoCs with the
corresponding configuration parameters.

Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt |  2 ++
 drivers/usb/dwc2/platform.c                    | 34 ++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 20a68bf..2c30a54 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -10,6 +10,8 @@ Required properties:
   - "rockchip,rk3288-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3288 Soc;
   - "lantiq,arx100-usb": The DWC2 USB controller instance in Lantiq ARX SoCs;
   - "lantiq,xrx200-usb": The DWC2 USB controller instance in Lantiq XRX SoCs;
+  - "amlogic,meson8b-usb": The DWC2 USB controller instance in Amlogic Meson8b SoCs;
+  - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index fc6f525..8f7b34c 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -181,6 +181,38 @@ static const struct dwc2_core_params params_ltq = {
 	.hibernation			= -1,
 };
 
+static const struct dwc2_core_params params_amlogic = {
+	.otg_cap			= DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE,
+	.otg_ver			= -1,
+	.dma_enable			= 1,
+	.dma_desc_enable		= 0,
+	.dma_desc_fs_enable		= 0,
+	.speed				= DWC2_SPEED_PARAM_HIGH,
+	.enable_dynamic_fifo		= 1,
+	.en_multiple_tx_fifo		= -1,
+	.host_rx_fifo_size		= 512,
+	.host_nperio_tx_fifo_size	= 500,
+	.host_perio_tx_fifo_size	= 500,
+	.max_transfer_size		= -1,
+	.max_packet_count		= -1,
+	.host_channels			= 16,
+	.phy_type			= DWC2_PHY_TYPE_PARAM_UTMI,
+	.phy_utmi_width			= -1,
+	.phy_ulpi_ddr			= -1,
+	.phy_ulpi_ext_vbus		= -1,
+	.i2c_enable			= -1,
+	.ulpi_fs_ls			= -1,
+	.host_support_fs_ls_low_power	= -1,
+	.host_ls_low_power_phy_clk	= -1,
+	.ts_dline			= -1,
+	.reload_ctl			= 1,
+	.ahbcfg				= GAHBCFG_HBSTLEN_INCR8 <<
+					  GAHBCFG_HBSTLEN_SHIFT,
+	.uframe_sched			= 0,
+	.external_id_pin_ctl		= -1,
+	.hibernation			= -1,
+};
+
 /*
  * Check the dr_mode against the module configuration and hardware
  * capabilities.
@@ -464,6 +496,8 @@ static const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "lantiq,xrx200-usb", .data = &params_ltq },
 	{ .compatible = "snps,dwc2", .data = NULL },
 	{ .compatible = "samsung,s3c6400-hsotg", .data = NULL},
+	{ .compatible = "amlogic,meson8b-usb", .data = &params_amlogic },
+	{ .compatible = "amlogic,meson-gxbb-usb", .data = &params_amlogic },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
