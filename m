From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] dt-bindings: eeprom: at25: Document device-specific compatible values
Date: Thu, 30 Nov 2017 14:29:46 +0100
Message-ID: <1512048586-17534-4-git-send-email-geert+renesas@glider.be>
References: <1512048586-17534-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512048586-17534-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ivo Sieben <meltedpianoman@gmail.com>
Cc: Chris Wright <chrisw@sous-sol.org>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Document the recommended presence of a device-specific compatible value,
and list examples that are already in use or soon will be.
This will allow checkpatch to validate compatible values in DTS.

Update the example to match current best practices (generic node name,
specific compatible value first).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/eeprom/at25.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/eeprom/at25.txt b/Documentation/devicetree/bindings/eeprom/at25.txt
index 9b1782809386844d..7129affb2956bb0d 100644
--- a/Documentation/devicetree/bindings/eeprom/at25.txt
+++ b/Documentation/devicetree/bindings/eeprom/at25.txt
@@ -1,7 +1,12 @@
 EEPROMs (SPI) compatible with Atmel at25.
 
 Required properties:
-- compatible : "atmel,at25".
+- compatible : Should be "<vendor>,<type>", and generic value "atmel,at25".
+  Example "<vendor>,<type>" values:
+    "microchip,25lc040"
+    "st,m95m02"
+    "st,m95256"
+
 - reg : chip select number
 - spi-max-frequency : max spi frequency to use
 - pagesize : size of the eeprom page
@@ -24,8 +29,8 @@ Obsolete legacy properties can be used in place of "size", "pagesize",
 Additional compatible properties are also allowed.
 
 Example:
-	at25@0 {
-		compatible = "atmel,at25", "st,m95256";
+	eeprom@0 {
+		compatible = "st,m95256", "atmel,at25";
 		reg = <0>
 		spi-max-frequency = <5000000>;
 		spi-cpha;
-- 
2.7.4
