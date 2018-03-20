From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCH 2/2] ARM: dts: imx53: PPD: Update ACHC programming interface
Date: Tue, 20 Mar 2018 18:22:01 +0100
Message-ID: <20180320172201.2065-3-sebastian.reichel@collabora.co.uk>
References: <20180320172201.2065-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180320172201.2065-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Nandor Han <nandor.han@ge.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

Update ACHC programming interface description following the binding
document. This makes it possible to use the new EzPort firmware
update driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/arm/boot/dts/imx53-ppd.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-ppd.dts b/arch/arm/boot/dts/imx53-ppd.dts
index 3c87e0d73f63..03c353be2fe7 100644
--- a/arch/arm/boot/dts/imx53-ppd.dts
+++ b/arch/arm/boot/dts/imx53-ppd.dts
@@ -253,9 +253,10 @@
 	status = "okay";
 
 	spidev0: spi@0 {
-		compatible = "ge,achc";
+		compatible = "ge,achc-ezport";
 		reg = <0>;
-		spi-max-frequency = <1000000>;
+		spi-max-frequency = <300000>;
+		reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
 	};
 
 	spidev1: spi@1 {
-- 
2.16.2
