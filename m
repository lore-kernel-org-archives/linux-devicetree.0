Return-Path: <SRS0=tHxF=J5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr710061.outbound.protection.outlook.com ([40.107.71.61]:58000
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728187AbeGMMpS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Jul 2018 08:45:18 -0400
From: Mircea Caprioru <mircea.caprioru@analog.com>
Subject: [PATCH 2/2] Documentation: dt-bindings: add adi,adgs140x doc
Date: Fri, 13 Jul 2018 15:30:35 +0300
Message-ID: <20180713123035.6191-1-mircea.caprioru@analog.com>
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
 .../devicetree/bindings/mux/adi,adgs140x.txt  | 39 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mux/adi,adgs140x.txt

diff --git a/Documentation/devicetree/bindings/mux/adi,adgs140x.txt b/Documentation/devicetree/bindings/mux/adi,adgs140x.txt
new file mode 100644
index 000000000000..5f2c2b9e9781
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/adi,adgs140x.txt
@@ -0,0 +1,39 @@
+Bindings for Analog Devices ADGS1408/1409 8:1/Dual 4:1 Mux
+
+Required properties:
+- compatible : "adi,adgs1408" or "adi,adgs1409"
+- #mux-control-cells : <0>
+* Standard mux-controller bindings as described in mux-controller.txt
+
+Optional properties:
+- idle-state : if present, array of states that the mux controllers will have
+  when idle. The special state MUX_IDLE_AS_IS is the default and
+  MUX_IDLE_DISCONNECT is also supported.
+
+States 0 through 7 correspond to signals S1 through S8 in the datasheet.
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
index 7aa68f38ea4b..6e69c3e2d27a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -816,6 +816,7 @@ W:	http://wiki.analog.com/
 W:	http://ez.analog.com/community/linux-device-drivers
 S:	Supported
 F:	drivers/mux/adgs140x.c
+F:	Documentation/devicetree/bindings/mux/adgs140x.txt
 
 ANALOG DEVICES INC ADV7180 DRIVER
 M:	Lars-Peter Clausen <lars@metafoo.de>
-- 
2.17.1

