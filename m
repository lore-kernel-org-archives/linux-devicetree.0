Return-Path: <SRS0=FQMj=KB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-by2nam01on0087.outbound.protection.outlook.com ([104.47.34.87]:58592
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731554AbeGQORJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 17 Jul 2018 10:17:09 -0400
From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH V2 2/2] Documentation: dt-bindings: add adi,adgs1408 doc
Date: Tue, 17 Jul 2018 16:44:16 +0300
Message-ID: <20180717134416.5865-1-mircea.caprioru@analog.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: peda@axentia.se, robh+dt@kernel.org
Cc: davem@davemloft.net, mchehab+samsung@kernel.org, akpm@linux-foundation.org, rdunlap@infradead.org, devicetree@vger.kernel.org, Mircea Caprioru <mircea.caprioru@analog.com>
List-ID: <devicetree@vger.kernel.org>

Adding dt-bindings documentation for adgs1408/1409 multiplexer. The
bindings follow the standard SPI and mux bindings and do not require any
additional custom properties.

Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
---
Changelog V1 -> V2
- removed wildcard adgs140x
- removed removed required cells property

 .../devicetree/bindings/mux/adi,adgs1408.txt  | 39 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mux/adi,adgs1408.txt

diff --git a/Documentation/devicetree/bindings/mux/adi,adgs1408.txt b/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
new file mode 100644
index 000000000000..6b1cbe326786
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
@@ -0,0 +1,39 @@
+Bindings for Analog Devices ADGS1408/1409 8:1/Dual 4:1 Mux
+
+Required properties:
+- compatible : "adi,adgs1408" or "adi,adgs1409"
+* Standard mux-controller bindings as described in mux-controller.txt
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
+	 * Mux 1 to 8 set to idle as is (no idle-state declared)
+	 */
+	&spi0 {
+		mux: mux-controller@2 {
+			compatible = "adi,adgs1408";
+			reg = <0>;
+			spi-max-frequency = <1000000>;
+			#mux-control-cells = <0>;
+		};
+	}
+
+	adc-mux@3 {
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
index 458d42d6f4f3..af8ea2638641 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -814,6 +814,7 @@ ANALOG DEVICES INC ADGS1408 DRIVER
 M:	Mircea Caprioru <mircea.caprioru@analog.com>
 S:	Supported
 F:	drivers/mux/adgs1408.c
+F:	Documentation/devicetree/bindings/mux/adi,adgs1408.txt
 
 ANALOG DEVICES INC ADV7180 DRIVER
 M:	Lars-Peter Clausen <lars@metafoo.de>
-- 
2.17.1

