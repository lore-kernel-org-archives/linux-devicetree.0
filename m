From: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] drm: exynos: hdmi: Add dt support for hdmiphy settings
Date: Mon, 28 Oct 2013 11:54:22 +0530
Message-ID: <1382941462-6691-4-git-send-email-s.shirish@samsung.com>
References: <1382941462-6691-1-git-send-email-s.shirish@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1382941462-6691-1-git-send-email-s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds dt support to hdmiphy config settings
as it is board specific and depends on the signal pattern
of board.

Signed-off-by: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/video/exynos_hdmi.txt      |   29 ++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts           |    6 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   70 ++++++++++++++++++--
 3 files changed, 98 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index 323983b..770f92d 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -13,6 +13,27 @@ Required properties:
 	b) pin number within the gpio controller.
 	c) optional flags and pull up/down.
 
+- hdmiphy-confs: following information about the hdmiphy conf settings.
+        a) "nr-confs" specifies the number of pixel clocks supported.
+	b) "confX: confX" specifies the phy configuration settings,
+		"clock-frequency" specifies the pixel clock
+		"con-de-emphasis-level" specifies the configuration
+		of Data De-emphasis levels.
+			0x145D0040h[3:0] permitted values:
+				0000 means 760 mVdiff && 1111 means 1400 mVdiff
+			0x145D0040h[7:4] permitted values:
+				000 	0dB
+				0001	-0.25dB
+				0010	-0.7dB
+				0011	-1.15dB
+				1111	-7.45dB
+		"con-clock-level" specifies the configuration for
+		the corresponding clock level.
+			0x145D005Ch [1:0] permitted values:
+				00 means 0 mVdiff && 11 means 60 mVdiff
+			0x145D005Ch [7:3] permitted values:
+				00000 is 790 mVdiff
+				11111 is 1430 mVdiff
 Example:
 
 	hdmi {
@@ -20,4 +41,12 @@ Example:
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
 		hpd-gpio = <&gpx3 7 1>;
+		hdmiphy-confs {
+			nr-confs = <1>;
+			conf0: conf0 {
+				clock-frequency = <25200000>;
+				conf-de-emphasis-level =  /bits/ 8 <0x26>;
+				conf-clock-level =  /bits/ 8 < 0x66>;
+			};
+		}
 	};
diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index c23f16b..436b75a 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -424,6 +424,9 @@
 
 	hdmi {
 		hpd-gpio = <&gpx3 7 2>;
+		vdd_osc-supply = <&ldo10_reg>;
+		vdd_pll-supply = <&ldo8_reg>;
+		vdd-supply = <&ldo8_reg>;
 		hdmiphy-confs {
 			nr-confs = <13>;
 			conf0: conf0 {
@@ -492,9 +495,6 @@
 				conf-clock-level =  /bits/ 8 < 0x66>;
 			};
 		};
-		vdd_osc-supply = <&ldo10_reg>;
-		vdd_pll-supply = <&ldo8_reg>;
-		vdd-supply = <&ldo8_reg>;
 	};
 
 	mmc_reg: voltage-regulator {
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index a0e10ae..3125e67 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -200,6 +200,9 @@ struct hdmi_context {
 
 	struct hdmi_resources		res;
 
+	struct hdmiphy_config		*confs;
+	int				nr_confs;
+
 	int				hpd_gpio;
 
 	enum hdmi_type			type;
@@ -259,7 +262,7 @@ static const struct hdmiphy_config hdmiphy_v13_configs[] = {
 	},
 };
 
-static const struct hdmiphy_config hdmiphy_v14_configs[] = {
+static struct hdmiphy_config hdmiphy_v14_configs[] = {
 	{
 		.pixel_clock = 25200000,
 		.conf = {
@@ -778,8 +781,8 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 		confs = hdmiphy_v13_configs;
 		count = ARRAY_SIZE(hdmiphy_v13_configs);
 	} else if (hdata->type == HDMI_TYPE14) {
-		confs = hdmiphy_v14_configs;
-		count = ARRAY_SIZE(hdmiphy_v14_configs);
+		confs = hdata->confs;
+		count = hdata->nr_confs;
 	} else
 		return -EINVAL;
 
@@ -1366,7 +1369,7 @@ static void hdmiphy_conf_apply(struct hdmi_context *hdata)
 	if (hdata->type == HDMI_TYPE13)
 		hdmiphy_data = hdmiphy_v13_configs[i].conf;
 	else
-		hdmiphy_data = hdmiphy_v14_configs[i].conf;
+		hdmiphy_data = hdata->confs[i].conf;
 
 	memcpy(buffer, hdmiphy_data, 32);
 	ret = i2c_master_send(hdata->hdmiphy_port, buffer, 32);
@@ -1858,6 +1861,56 @@ void hdmi_attach_hdmiphy_client(struct i2c_client *hdmiphy)
 		hdmi_hdmiphy = hdmiphy;
 }
 
+static int drm_hdmi_dt_parse_phy_conf(struct platform_device *pdev,
+						struct hdmi_context *hdata)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *dev_np = dev->of_node;
+	struct device_node *phy_conf, *cfg_np;
+	int i = 0;
+
+	phy_conf = of_find_node_by_name(dev_np, "hdmiphy-confs");
+	if (phy_conf == NULL) {
+		DRM_ERROR("Did not find hdmiphy_conf node\n");
+		return -ENODEV;
+	}
+
+	of_property_read_u32(phy_conf, "nr-confs", &hdata->nr_confs);
+	hdata->confs = kzalloc((hdata->nr_confs * sizeof
+					(struct hdmiphy_config)), GFP_KERNEL);
+
+	/* Initialize with default config */
+	hdata->confs = hdmiphy_v14_configs;
+
+	for_each_child_of_node(phy_conf, cfg_np) {
+		if (!of_find_property(cfg_np, "clock-frequency", NULL))
+			continue;
+
+		if (of_property_read_u32_array(cfg_np, "clock-frequency",
+					(u32 *)&hdata->confs[i].
+							pixel_clock, 1)) {
+				DRM_ERROR("Failed to get pixel clock\n");
+				return -EINVAL;
+		}
+
+		/* Overwrite the data de-emphasis and data level */
+		if (of_property_read_u8_array(cfg_np, "conf-de-emphasis-level",
+					(u8 *)&hdata->confs[i].conf[16], 1)) {
+				DRM_ERROR("Failed to get conf\n");
+				return -EINVAL;
+		}
+		/* Overwrite the clock level diff */
+		if (of_property_read_u8_array(cfg_np, "conf-clock-level",
+					(u8 *)&hdata->confs[i].conf[23], 1)) {
+				DRM_ERROR("Failed to get conf\n");
+				return -EINVAL;
+		}
+		i++;
+	}
+	return 0;
+
+}
+
 static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 					(struct device *dev)
 {
@@ -1986,6 +2039,15 @@ static int hdmi_probe(struct platform_device *pdev)
 		goto err_hdmiphy;
 	}
 
+	/* get hdmiphy confs */
+	if (hdata->type == HDMI_TYPE14) {
+		ret = drm_hdmi_dt_parse_phy_conf(pdev, hdata);
+		if (ret) {
+			DRM_ERROR("failed to get confs\n");
+			goto err_hdmiphy;
+		}
+	}
+
 	/* Attach HDMI Driver to common hdmi. */
 	exynos_hdmi_drv_attach(drm_hdmi_ctx);
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
