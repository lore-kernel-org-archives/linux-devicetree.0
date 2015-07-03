From: Alban Bedel <albeu@free.fr>
Subject: [PATCH] DEVICETREE: Misc fix for the AR7100 SPI controller binding
Date: Fri,  3 Jul 2015 10:14:57 +0200
Message-ID: <1435911297-10389-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>
List-Id: devicetree@vger.kernel.org

Fix the clocks property documentation and use lower case for
hex values in the example.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 Documentation/devicetree/bindings/spi/spi-ath79.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-ath79.txt b/Documentation/devicetree/bindings/spi/spi-ath79.txt
index f1ad9c3..9c696fa 100644
--- a/Documentation/devicetree/bindings/spi/spi-ath79.txt
+++ b/Documentation/devicetree/bindings/spi/spi-ath79.txt
@@ -3,7 +3,7 @@ Binding for Qualcomm Atheros AR7xxx/AR9xxx SPI controller
 Required properties:
 - compatible: has to be "qca,<soc-type>-spi", "qca,ar7100-spi" as fallback.
 - reg: Base address and size of the controllers memory area
-- clocks: phandle to the AHB clock.
+- clocks: phandle of the AHB clock.
 - clock-names: has to be "ahb".
 - #address-cells: <1>, as required by generic SPI binding.
 - #size-cells: <0>, also as required by generic SPI binding.
@@ -12,9 +12,9 @@ Child nodes as per the generic SPI binding.
 
 Example:
 
-	spi@1F000000 {
+	spi@1f000000 {
 		compatible = "qca,ar9132-spi", "qca,ar7100-spi";
-		reg = <0x1F000000 0x10>;
+		reg = <0x1f000000 0x10>;
 
 		clocks = <&pll 2>;
 		clock-names = "ahb";
-- 
2.0.0
