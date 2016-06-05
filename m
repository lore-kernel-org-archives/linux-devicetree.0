From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFT 2/4] ARM: dts: imx28-eukrea-mbmx28lc: add missing reg
 properties
Date: Sun,  5 Jun 2016 13:51:06 +0000
Message-ID: <1465134666-13459-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the missing reg properties for the regulator nodes
in order to fix the dtc warnings.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi b/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
index 8859474..581e85f 100644
--- a/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
+++ b/arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi
@@ -84,6 +84,7 @@
 
 		reg_3p3v: regulator@0 {
 			compatible = "regulator-fixed";
+			reg = <0>;
 			regulator-name = "3P3V";
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
@@ -92,6 +93,7 @@
 
 		reg_lcd_3v3: regulator@1 {
 			compatible = "regulator-fixed";
+			reg = <1>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&reg_lcd_3v3_pins_mbmx28lc>;
 			regulator-name = "lcd-3v3";
@@ -103,6 +105,7 @@
 
 		reg_usb0_vbus: regulator@2 {
 			compatible = "regulator-fixed";
+			reg = <2>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&reg_usb0_vbus_pins_mbmx28lc>;
 			regulator-name = "usb0_vbus";
@@ -114,6 +117,7 @@
 
 		reg_usb1_vbus: regulator@3 {
 			compatible = "regulator-fixed";
+			reg = <3>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&reg_usb1_vbus_pins_mbmx28lc>;
 			regulator-name = "usb1_vbus";
-- 
1.7.9.5
