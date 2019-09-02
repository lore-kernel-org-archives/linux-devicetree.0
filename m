Return-Path: <SRS0=Pz7k=W5=ysoft.com=michal.vokac@kernel.org>
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH input-next 4/4] ARM: dts: imx6dl-yapp4: Enable the MPR121 touchkey controller on Hydra
Date: Mon,  2 Sep 2019 13:40:17 +0200
Message-Id: <1567424417-3914-5-git-send-email-michal.vokac@ysoft.com>
In-Reply-To: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
References: <1567424417-3914-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
List-ID: <devicetree@vger.kernel.org>

Add the touch keyboard present on Hydra board. The controller
is connected only using I2C lines. The interrupt line is not
available hence we use the polling mode.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 13 +++++++++++++
 arch/arm/boot/dts/imx6dl-yapp4-hydra.dts   |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
index e8d800fec637..49e2bcd21a00 100644
--- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pwm/pwm.h>
 
 / {
@@ -330,6 +331,18 @@
 		vcc-supply = <&sw2_reg>;
 		status = "disabled";
 	};
+
+	touchkeys: keys@5a {
+		compatible = "fsl,mpr121-touchkey";
+		reg = <0x5a>;
+		vdd-supply = <&sw2_reg>;
+		autorepeat;
+		linux,keycodes = <KEY_1>, <KEY_2>, <KEY_3>, <KEY_4>, <KEY_5>,
+				<KEY_6>, <KEY_7>, <KEY_8>, <KEY_9>,
+				<KEY_BACKSPACE>, <KEY_0>, <KEY_ENTER>;
+		linux,poll-interval = <50>;
+		status = "disabled";
+	};
 };
 
 &iomuxc {
diff --git a/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts b/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts
index f97927064750..84c275bfdd38 100644
--- a/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts
+++ b/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts
@@ -45,6 +45,10 @@
 	status = "okay";
 };
 
+&touchkeys {
+	status = "okay";
+};
+
 &usdhc3 {
 	status = "okay";
 };
-- 
2.1.4
