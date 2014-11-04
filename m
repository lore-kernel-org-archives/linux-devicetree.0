From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/3] ARM: dts: vf610: enable USB misc/phy nodes where necessary
Date: Tue,  4 Nov 2014 14:07:09 +0100
Message-ID: <1415106430-6271-3-git-send-email-stefan@agner.ch>
References: <1415106430-6271-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415106430-6271-1-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de
Cc: linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stefan@agner.ch
List-Id: devicetree@vger.kernel.org

Since restructuring of the device tree files, the USB misc/phy
nodes are disabled by default. Hence we need to enable those
explicitly when USB is used.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vf-colibri.dtsi | 16 ++++++++++++++++
 arch/arm/boot/dts/vf610-twr.dts   |  8 ++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
index ab9616d7..2371760 100644
--- a/arch/arm/boot/dts/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/vf-colibri.dtsi
@@ -75,6 +75,22 @@
 	status = "okay";
 };
 
+&usbmisc0 {
+	status = "okay";
+};
+
+&usbmisc1 {
+	status = "okay";
+};
+
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
 &iomuxc {
 	vf610-colibri {
 		pinctrl_gpio_ext: gpio_ext {
diff --git a/arch/arm/boot/dts/vf610-twr.dts b/arch/arm/boot/dts/vf610-twr.dts
index 793a376..a0f7621 100644
--- a/arch/arm/boot/dts/vf610-twr.dts
+++ b/arch/arm/boot/dts/vf610-twr.dts
@@ -294,6 +294,14 @@
 	status = "okay";
 };
 
+&usbmisc0 {
+	status = "okay";
+};
+
+&usbmisc1 {
+	status = "okay";
+};
+
 &usbphy0 {
 	status = "okay";
 };
-- 
2.1.3
