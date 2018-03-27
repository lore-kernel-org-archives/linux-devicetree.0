From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv2 1/3] dt-bindings: misc: achc: Make ezport distinguishable
Date: Tue, 27 Mar 2018 15:52:57 +0200
Message-ID: <20180327135259.30890-2-sebastian.reichel@collabora.co.uk>
References: <20180327135259.30890-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180327135259.30890-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Nandor Han <nandor.han@ge.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

This updates the GE ACHC binding, so that different compatible
strings are used for the programming interface, which is the
ezport interface from NXP MK20FN1M0VMD12 and the microcontroller's
normal SPI interface.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 Documentation/devicetree/bindings/misc/ge-achc.txt | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/ge-achc.txt b/Documentation/devicetree/bindings/misc/ge-achc.txt
index 77df94d7a32f..6c6bd6568504 100644
--- a/Documentation/devicetree/bindings/misc/ge-achc.txt
+++ b/Documentation/devicetree/bindings/misc/ge-achc.txt
@@ -7,7 +7,13 @@ Note: This device does not expose the peripherals as USB devices.
 
 Required properties:
 
-- compatible : Should be "ge,achc"
+- compatible : Should be
+  "ge,achc" (normal interface)
+  "ge,achc-ezport" (flashing interface)
+
+Required properties (flashing interface only):
+
+- reset-gpios: GPIO Specifier for the reset GPIO
 
 Required SPI properties:
 
@@ -19,8 +25,15 @@ Required SPI properties:
 
 Example:
 
-spidev0: spi@0 {
-	compatible = "ge,achc";
+spidev1: spi@0 {
+	compatible = "ge,achc-ezport";
 	reg = <0>;
+	spi-max-frequency = <300000>;
+	reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+};
+
+spidev0: spi@1 {
+	compatible = "ge,achc";
+	reg = <1>;
 	spi-max-frequency = <1000000>;
 };
-- 
2.16.2
