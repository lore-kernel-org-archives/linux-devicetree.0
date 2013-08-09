Return-Path: <devicetree-owner@vger.kernel.org>
Received: from nbd.name ([46.4.11.11]:33243 "EHLO nbd.name"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030715Ab3HIS7I (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Fri, 9 Aug 2013 14:59:08 -0400
From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 1/2] DT: Add documentation for spi-rt2880
Date: Fri,  9 Aug 2013 20:51:26 +0200
Message-Id: <1376074288-29302-1-git-send-email-blogic@openwrt.org>
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: John Crispin <blogic@openwrt.org>, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <devicetree@vger.kernel.org>

Describe the SPI master found on the MIPS based Ralink SoC.

Signed-off-by: John Crispin <blogic@openwrt.org>
Cc: devicetree@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: linux-mips@linux-mips.org
---
 .../devicetree/bindings/spi/spi-rt2880.txt         |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-rt2880.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-rt2880.txt b/Documentation/devicetree/bindings/spi/spi-rt2880.txt
new file mode 100644
index 0000000..d946626
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-rt2880.txt
@@ -0,0 +1,26 @@
+Ralink SoC RT2880 and famile SPI master controller.
+
+Required properties:
+- compatible : "ralink,rt2880-spi"
+- reg : The register base for the controller.
+- #address-cells : <1>, as required by generic SPI binding.
+- #size-cells : <0>, also as required by generic SPI binding.
+
+Child nodes as per the generic SPI binding.
+
+Example:
+
+	spi@b00 {
+		compatible = "ralink,rt2880-spi";
+		reg = <0xb00 0x100>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		m25p80@0 {
+			compatible = "m25p80";
+			reg = <0>;
+			spi-max-frequency = <10000000>;
+		};
+	};
+
-- 
1.7.10.4

