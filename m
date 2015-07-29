From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 1/2] drm/panel: Add Sharp LS043T1LE01 panel binding documentation
Date: Tue, 28 Jul 2015 18:37:40 -0700
Message-ID: <1438133861-22370-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Werner Johansson <werner.johansson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

From: Werner Johansson <werner.johansson@sonymobile.com>

Signed-off-by: Werner Johansson <werner.johansson@sonymobile.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 .../bindings/panel/sharp,ls043t1le01.txt           | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/sharp,ls043t1le01.txt

diff --git a/Documentation/devicetree/bindings/panel/sharp,ls043t1le01.txt b/Documentation/devicetree/bindings/panel/sharp,ls043t1le01.txt
new file mode 100644
index 000000000000..758d48d33e46
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/sharp,ls043t1le01.txt
@@ -0,0 +1,22 @@
+Sharp Microelectronics 4.3" qHD TFT LCD panel
+
+Required properties:
+- compatible: should be "sharp,ls043t1le01-qhd-vid"
+- reg: DSI virtual channel of the peripheral
+- power-supply: phandle of the regulator that provides the supply voltage
+
+Optional properties:
+- backlight: phandle of the backlight device attached to the panel
+- reset-gpios: a GPIO spec for the reset pin
+
+Example:
+
+	mdss_dsi0: qcom,mdss_dsi@fd922800 {
+		panel: panel@0 {
+			compatible = "sharp,ls043t1le01-qhd-vid";
+			reg = <0>;
+			avdd-supply = <&pm8941_l22>;
+			backlight = <&pm8941_wled>;
+			reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
+		};
+	};
-- 
1.8.2.2
