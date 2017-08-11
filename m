From: Vinay Simha BN <simhavcs@gmail.com>
Subject: [PATCH 1/2] pinctrl: msm: GP clock for pinctrl-apq8064 binding
Date: Fri, 11 Aug 2017 12:25:15 +0530
Message-ID: <1502434516-9056-1-git-send-email-simhavcs@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Cc: Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:PIN CONTROLLER - QUALCOMM" <linux-arm-msm@vger.kernel.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

DT binding documentation for qcom,apq8064-pinctrl driver
for general purpose (GP) clocks.

Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.7.4

