From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCH] ARM: dts: imx53: Add touchscreen reset line
Date: Mon, 15 Jan 2018 15:24:52 +0100
Message-ID: <20180115142452.31278-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martyn Welch <martyn.welch@collabora.co.uk>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

From: Martyn Welch <martyn.welch@collabora.co.uk>

Utilise new support in Atmel MaxTouch driver to drive the
touchscreen controllers reset line correctly.

Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/arm/boot/dts/imx53-ppd.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx53-ppd.dts b/arch/arm/boot/dts/imx53-ppd.dts
index cce959438a79..123297da43a7 100644
--- a/arch/arm/boot/dts/imx53-ppd.dts
+++ b/arch/arm/boot/dts/imx53-ppd.dts
@@ -525,6 +525,7 @@
 
 	touchscreen@4b {
 		compatible = "atmel,maxtouch";
+		reset-gpio = <&gpio5 19 GPIO_ACTIVE_HIGH>;
 		reg = <0x4b>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <4 0x8>;
-- 
2.15.1
