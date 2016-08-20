From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH v2 4/4] ARM: dts: meson8b: Add Meson8b PWM Controller nodes
Date: Sat, 20 Aug 2016 20:34:43 +0200
Message-ID: <1471718083-11516-5-git-send-email-narmstrong@baylibre.com>
References: <1471718083-11516-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-pwm-owner@vger.kernel.org>
In-Reply-To: <1471718083-11516-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-pwm-owner@vger.kernel.org
To: thierry.reding@gmail.com, carlo@caione.org, khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index fc4080d..41fd536 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -162,6 +162,27 @@
 			reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
 		};
 
+		pwm_ab: pwm@8550 {
+			compatible = "amlogic,meson8b-pwm";
+			reg = <0xc1108550 0x10>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm_cd: pwm@8650 {
+			compatible = "amlogic,meson8b-pwm";
+			reg = <0xc1108650 0x10>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm_ef: pwm@86c0 {
+			compatible = "amlogic,meson8b-pwm";
+			reg = <0xc11086c0 0x10>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		pinctrl_cbus: pinctrl@c1109880 {
 			compatible = "amlogic,meson8b-cbus-pinctrl";
 			reg = <0xc1109880 0x10>;
-- 
1.9.1
