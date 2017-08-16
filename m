From: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] pinctrl: qcom: General Purpose clocks for apq8064
Date: Wed, 16 Aug 2017 11:32:17 +0530
Message-ID: <1502863338-6946-1-git-send-email-simhavcs@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:PIN CONTROLLER - QUALCOMM" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add support for general purpose (GP) clocks
for apq8064

DT binding documentation updated for
qcom,apq8064-pinctrl general purpose (GP) clocks.

Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
v1:
* only gp_clk_1b tested in nexus7 anx7808 slimport.

v2:
* bjorn review comments incorporated
  added gp clock functions
  merged documentation and driver to single patch
---
---
 .../bindings/pinctrl/qcom,apq8064-pinctrl.txt      |  3 +-
 drivers/pinctrl/qcom/pinctrl-apq8064.c             | 42 ++++++++++++++++++----
 2 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
index a7bde64..a752a47 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
@@ -46,7 +46,8 @@ Valid values for pins are:
   gpio0-gpio89
 
 Valid values for function are:
-  cam_mclk, codec_mic_i2s, codec_spkr_i2s, gpio, gsbi1, gsbi2, gsbi3, gsbi4,
+  cam_mclk, codec_mic_i2s, codec_spkr_i2s, gp_clk_0a, gp_clk_0b, gp_clk_1a,
+  gp_clk_1b, gp_clk_2a, gp_clk_2b, gpio, gsbi1, gsbi2, gsbi3, gsbi4,
   gsbi4_cam_i2c, gsbi5, gsbi5_spi_cs1, gsbi5_spi_cs2, gsbi5_spi_cs3, gsbi6,
   gsbi6_spi_cs1, gsbi6_spi_cs2, gsbi6_spi_cs3, gsbi7, gsbi7_spi_cs1,
   gsbi7_spi_cs2, gsbi7_spi_cs3, gsbi_cam_i2c, hdmi, mi2s, riva_bt, riva_fm,
diff --git a/drivers/pinctrl/qcom/pinctrl-apq8064.c b/drivers/pinctrl/qcom/pinctrl-apq8064.c
index cd96699..bcf9e61 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8064.c
@@ -295,6 +295,12 @@ enum apq8064_functions {
 	APQ_MUX_cam_mclk,
 	APQ_MUX_codec_mic_i2s,
 	APQ_MUX_codec_spkr_i2s,
+	APQ_MUX_gp_clk_0a,
+	APQ_MUX_gp_clk_0b,
+	APQ_MUX_gp_clk_1a,
+	APQ_MUX_gp_clk_1b,
+	APQ_MUX_gp_clk_2a,
+	APQ_MUX_gp_clk_2b,
 	APQ_MUX_gpio,
 	APQ_MUX_gsbi1,
 	APQ_MUX_gsbi2,
@@ -354,6 +360,24 @@ static const char * const gpio_groups[] = {
 	"gpio78", "gpio79", "gpio80", "gpio81", "gpio82", "gpio83", "gpio84",
 	"gpio85", "gpio86", "gpio87", "gpio88", "gpio89"
 };
+static const char * const gp_clk_0a_groups[] = {
+	"gpio3"
+};
+static const char * const gp_clk_0b_groups[] = {
+	"gpio34"
+};
+static const char * const gp_clk_1a_groups[] = {
+	"gpio4"
+};
+static const char * const gp_clk_1b_groups[] = {
+	"gpio50"
+};
+static const char * const gp_clk_2a_groups[] = {
+	"gpio32"
+};
+static const char * const gp_clk_2b_groups[] = {
+	"gpio25"
+};
 static const char * const ps_hold_groups[] = {
 	"gpio78"
 };
@@ -452,6 +476,12 @@ static const struct msm_function apq8064_functions[] = {
 	FUNCTION(cam_mclk),
 	FUNCTION(codec_mic_i2s),
 	FUNCTION(codec_spkr_i2s),
+	FUNCTION(gp_clk_0a),
+	FUNCTION(gp_clk_0b),
+	FUNCTION(gp_clk_1a),
+	FUNCTION(gp_clk_1b),
+	FUNCTION(gp_clk_2a),
+	FUNCTION(gp_clk_2b),
 	FUNCTION(gpio),
 	FUNCTION(gsbi1),
 	FUNCTION(gsbi2),
@@ -490,8 +520,8 @@ static const struct msm_pingroup apq8064_groups[] = {
 	PINGROUP(0, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(1, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(2, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(3, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(4, NA, NA, cam_mclk, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(3, NA, gp_clk_0a, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(4, NA, NA, cam_mclk, gp_clk_1a, NA, NA, NA, NA, NA, NA),
 	PINGROUP(5, NA, cam_mclk, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(6, gsbi3, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(7, gsbi3, NA, NA, NA, NA, NA, NA, NA, NA, NA),
@@ -512,16 +542,16 @@ static const struct msm_pingroup apq8064_groups[] = {
 	PINGROUP(22, gsbi2, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(23, gsbi2, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(24, gsbi2, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(25, gsbi2, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(25, gsbi2, gp_clk_2b, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(26, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(27, mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(28, mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(29, mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(30, mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(31, mi2s, NA, gsbi5_spi_cs2, gsbi6_spi_cs2, gsbi7_spi_cs2, NA, NA, NA, NA, NA),
-	PINGROUP(32, mi2s, NA, NA, NA, NA, gsbi5_spi_cs3, gsbi6_spi_cs3, gsbi7_spi_cs3, NA, NA),
+	PINGROUP(32, mi2s, gp_clk_2a, NA, NA, NA, gsbi5_spi_cs3, gsbi6_spi_cs3, gsbi7_spi_cs3, NA, NA),
 	PINGROUP(33, mi2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(34, codec_mic_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(34, codec_mic_i2s, gp_clk_0b, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(35, codec_mic_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(36, codec_mic_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(37, codec_mic_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
@@ -537,7 +567,7 @@ static const struct msm_pingroup apq8064_groups[] = {
 	PINGROUP(47, spkr_i2s, gsbi5_spi_cs1, gsbi6_spi_cs1, gsbi7_spi_cs1, NA, NA, NA, NA, NA, NA),
 	PINGROUP(48, spkr_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(49, spkr_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
-	PINGROUP(50, spkr_i2s, NA, NA, NA, NA, NA, NA, NA, NA, NA),
+	PINGROUP(50, spkr_i2s, gp_clk_1b, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(51, NA, gsbi5, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(52, NA, gsbi5, NA, NA, NA, NA, NA, NA, NA, NA),
 	PINGROUP(53, NA, gsbi5, NA, NA, NA, NA, NA, NA, NA, NA),
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
