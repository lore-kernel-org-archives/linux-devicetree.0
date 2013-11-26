From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>
Subject: [PATCH 3/3] ARM: dts: imx27: imx27-apf27dev: add pinctrl for cspi, i2c,
 sdhc and framebuffer
Date: Tue, 26 Nov 2013 16:40:44 +0100
Message-ID: <1385480444-77808-3-git-send-email-gwenhael.goavec-merou@armadeus.com>
References: <1385480444-77808-1-git-send-email-gwenhael.goavec-merou@armadeus.com>
 <1385480444-77808-2-git-send-email-gwenhael.goavec-merou@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1385480444-77808-2-git-send-email-gwenhael.goavec-merou@armadeus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, shawn.guo@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>
---
 arch/arm/boot/dts/imx27-apf27dev.dts | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/imx27-apf27dev.dts b/arch/arm/boot/dts/imx27-apf27dev.dts
index 9197329..812f22c 100644
--- a/arch/arm/boot/dts/imx27-apf27dev.dts
+++ b/arch/arm/boot/dts/imx27-apf27dev.dts
@@ -60,6 +60,8 @@
 &cspi1 {
 	fsl,spi-num-chipselects = <1>;
 	cs-gpios = <&gpio4 28 1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_cspi1>;
 	status = "okay";
 };
 
@@ -67,17 +69,23 @@
 	fsl,spi-num-chipselects = <3>;
 	cs-gpios = <&gpio4 21 1>, <&gpio4 27 1>,
 			<&gpio2 17 1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_cspi2>;
 	status = "okay";
 };
 
 &fb {
 	display = <&display>;
 	fsl,dmacr = <0x00020010>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_imxfb1>;
 	status = "okay";
 };
 
 &i2c1 {
 	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
 	status = "okay";
 
 	rtc@68 {
@@ -87,11 +95,43 @@
 };
 
 &i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 };
 
+&iomuxc {
+	imx27-apf27dev {
+		pinctrl_cspi1: cspi1grp {
+			fsl,pins = <MX27_CSPI1_PINGRP1>;
+		};
+
+		pinctrl_cspi2: cspi2grp {
+			fsl,pins = <MX27_CSPI2_PINGRP1>;
+		};
+
+		pinctrl_imxfb1: imxfb1grp {
+			fsl,pins = <MX27_FB1_PINGRP1>;
+		};
+
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins = <MX27_I2C1_PINGRP1>;
+		};
+
+		pinctrl_i2c2: i2c2grp {
+			fsl,pins = <MX27_I2C2_PINGRP1>;
+		};
+
+		pinctrl_sdhc2: sdhc2grp {
+			fsl,pins = <MX27_SDHC2_PINGRP1>;
+		};
+	};
+};
+
 &sdhci2 {
 	bus-width = <4>;
 	cd-gpios = <&gpio3 14 0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sdhc2>;
 	status = "okay";
 };
-- 
1.8.3.2
