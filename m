From: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: stih407: Enable PWM nodes only board level
Date: Wed, 23 Sep 2015 21:37:27 +0200
Message-ID: <1443037049-6167-2-git-send-email-maxime.coquelin@st.com>
References: <1443037049-6167-1-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443037049-6167-1-git-send-email-maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: maxime.coquelin-qxv4g6HH51o@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The PWM may not be used on some boards, so enable them only the board file.

Signed-off-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 6 ++++--
 arch/arm/boot/dts/stihxxx-b2120.dtsi  | 8 ++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index ae05277..9975e8f 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -585,7 +585,6 @@
 		/* COMMS PWM Module */
 		pwm0: pwm@9810000 {
 			compatible	= "st,sti-pwm";
-			status		= "okay";
 			#pwm-cells	= <2>;
 			reg		= <0x9810000 0x68>;
 			pinctrl-names	= "default";
@@ -593,12 +592,13 @@
 			clock-names	= "pwm";
 			clocks		= <&clk_sysin>;
 			st,pwm-num-chan = <1>;
+
+			status		= "disabled";
 		};
 
 		/* SBC PWM Module */
 		pwm1: pwm@9510000 {
 			compatible	= "st,sti-pwm";
-			status		= "okay";
 			#pwm-cells	= <2>;
 			reg		= <0x9510000 0x68>;
 			pinctrl-names	= "default";
@@ -609,6 +609,8 @@
 			clock-names	= "pwm";
 			clocks		= <&clk_sysin>;
 			st,pwm-num-chan = <4>;
+
+			status		= "disabled";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index f589fe4..ab029f7 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -27,6 +27,14 @@
 			};
 		};
 
+		pwm0: pwm@9810000 {
+			status = "okay";
+		};
+
+		pwm1: pwm@9510000 {
+			status = "okay";
+		};
+
 		i2c@9842000 {
 			status = "okay";
 		};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
