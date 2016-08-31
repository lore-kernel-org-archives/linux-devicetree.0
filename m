From: jorik@kippendief.biz
Subject: [PATCH v2 5/7] dts: sun8i-h3: add UART1-3 to Orange Pi PC
Date: Wed, 31 Aug 2016 21:30:56 +0200
Message-ID: <1472671858-29220-6-git-send-email-jorik@kippendief.biz>
References: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472671858-29220-1-git-send-email-jorik@kippendief.biz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jorik Jonker <jorik@kippendief.biz>
List-Id: devicetree@vger.kernel.org

From: Jorik Jonker <jorik@kippendief.biz>

This board has UARTS1-3 exposed on its expansion header

Signed-off-by: Jorik Jonker <jorik@kippendief.biz>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index daf50b9..602b012 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -161,6 +161,21 @@
 	status = "okay";
 };
 
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins_a>;
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins_a>;
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins_a>;
+};
+
 &usbphy {
 	/* USB VBUS is always on */
 	status = "okay";
-- 
2.7.4
