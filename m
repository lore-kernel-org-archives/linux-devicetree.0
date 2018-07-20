Return-Path: <SRS0=Niv/=KE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr690054.outbound.protection.outlook.com ([40.107.69.54]:64144
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731731AbeGTPw6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Jul 2018 11:52:58 -0400
From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH V5 1/2] dt-bindings: mux: add adi,adgs1408
Date: Fri, 20 Jul 2018 18:03:55 +0300
Message-ID: <20180720150355.2871-1-mircea.caprioru@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: peda@axentia.se, robh+dt@kernel.org
Cc: davem@davemloft.net, mchehab+samsung@kernel.org, akpm@linux-foundation.org, rdunlap@infradead.org, devicetree@vger.kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-ID: <devicetree@vger.kernel.org>

Adding documentation for adgs1408/1409 multiplexer. The bindings
follow the standard SPI and mux bindings and do not require any
additional custom properties.

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
---
Changelog V4 -> V5
- no modifications here

 .../devicetree/bindings/mux/adi,adgs1408.txt  | 49 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mux/adi,adgs1408.txt

diff --git a/Documentation/devicetree/bindings/mux/adi,adgs1408.txt b/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
new file mode 100644
index 000000000000..cc7698e7d1ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
@@ -0,0 +1,49 @@
+Bindings for Analog Devices ADGS1408/1409 8:1/Dual 4:1 Mux
+
+Required properties:
+- compatible : Should be one of
+	* "adi,adgs1408"
+	* "adi,adgs1409"
+* Standard mux-controller bindings as described in mux-controller.txt
+
+Optional properties for ADGS1408/1409:
+- gpio-controller : if present, #gpio-cells is required.
+- #gpio-cells : should be <2>
+			- First cell is the GPO line number, i.e. 0 to 3
+			for ADGS1408 and 0 to 4 for ADGS1409
+			- Second cell is used to specify active high (0)
+			or active low (1)
+
+Optional properties:
+- idle-state : if present, array of states that the mux controllers will have
+  when idle. The special state MUX_IDLE_AS_IS is the default and
+  MUX_IDLE_DISCONNECT is also supported.
+
+States 0 through 7 correspond to signals S1 through S8 in the datasheet.
+For ADGS1409 only states 0 to 3 are available.
+
+Example:
+
+	/*
+	 * One mux controller.
+	 * Mux state set to idle as is (no idle-state declared)
+	 */
+	&spi0 {
+		mux: mux-controller@0 {
+			compatible = "adi,adgs1408";
+			reg = <0>;
+			spi-max-frequency = <1000000>;
+			#mux-control-cells = <0>;
+		};
+	}
+
+	adc-mux {
+		compatible = "io-channel-mux";
+		io-channels = <&adc 1>;
+		io-channel-names = "parent";
+		mux-controls = <&mux>;
+
+		channels = "out_a0", "out_a1", "test0", "test1",
+			"out_b0", "out_b1", "testb0", "testb1";
+
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 192d7f73fd01..55dfdbf835c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -810,6 +810,12 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/ad9389b*
 
+ANALOG DEVICES INC ADGS1408 DRIVER
+M:	Mircea Caprioru <mircea.caprioru@analog.com>
+S:	Supported
+F:	drivers/mux/adgs1408.c
+F:	Documentation/devicetree/bindings/mux/adgs1408.txt
+
 ANALOG DEVICES INC ADV7180 DRIVER
 M:	Lars-Peter Clausen <lars@metafoo.de>
 L:	linux-media@vger.kernel.org
-- 
2.17.1

