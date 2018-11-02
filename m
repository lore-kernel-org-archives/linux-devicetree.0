Return-Path: <SRS0=9rGL=NN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:58808 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728008AbeKCCCJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 2 Nov 2018 22:02:09 -0400
From: Khalil Blaiech <kblaiech@mellanox.com>
Subject: [PATCH 2/2] dt-bindings: i2c: I2C binding for Mellanox BlueField SoC
Date: Fri,  2 Nov 2018 12:53:11 -0400
Message-Id: <894b09ec9b4a18c91c3573145c59b8ff41c8ea04.1541174814.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1541174814.git.kblaiech@mellanox.com>
References: <cover.1541174814.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1541174814.git.kblaiech@mellanox.com>
References: <cover.1541174814.git.kblaiech@mellanox.com>
Sender: devicetree-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>
Cc: Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Added device tree bindings documentation for Mellanox BlueField
I2C SMBus controller.

Reviewed-by: David Woods <dwoods@mellanox.com>
Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
---
 .../devicetree/bindings/i2c/mellanox,i2c-mlx.txt   | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt

diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt
new file mode 100644
index 0000000..49c9e2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlx.txt
@@ -0,0 +1,58 @@
+Device tree configuration for the Mellanox I2C SMBus on BlueField SoCs
+
+Required Properties:
+- reg        : address offset and range of bus device registers
+- compatible : should be "mellanox,i2c-mlx"
+- interrupts : interrupt number
+- bus        : hardware bus identifier. BlueField ARM side has three bus
+               controllers; thus, values might be 0, 1, or 2
+- profile    : device profile. This ensures compatibility between actual
+               driver and ACPI/DT. The most recent profile is "mlnx-bf18"
+
+Optional Properties:
+- bus-freq   : bus frequency used to configure timing registers; allowed
+               values are 100, 400 and 1000; those are expressed in KHz
+
+Examples:
+
+i2c0 {
+	compatible = "mellanox,i2c-mlx";
+	reg = <0x02804000 0x800>,	/* Smbus[0]        */
+              <0x02801200 0x020>, 	/* Cause Master[0] */
+              <0x02801260 0x020>, 	/* Cause Slave[0]  */
+              <0x02801300 0x010>, 	/* Cause Coalesce  */
+              <0x02802000 0x100>, 	/* GPIO 0          */
+              <0x02800358 0x008>; 	/* CorePll         */
+	interrupts = <57>;
+	bus = <1>;
+	bus-freq = <100>;
+	profile = "mlnx-bf18";
+};
+
+i2c1 {
+	compatible = "mellanox,i2c-mlx";
+	reg = <0x02804800 0x800>,	/* Smbus[1]        */
+              <0x02801220 0x020>, 	/* Cause Master[1] */
+              <0x02801280 0x020>, 	/* Cause Slave[1]  */
+              <0x02801300 0x010>, 	/* Cause Coalesce  */
+              <0x02802000 0x100>, 	/* GPIO 0          */
+              <0x02800358 0x008>; 	/* CorePll         */
+	interrupts = <57>;
+	bus = <1>;
+	bus-freq = <100>;
+	profile = "mlnx-bf18";
+};
+
+i2c2 {
+	compatible = "mellanox,i2c-mlx";
+	reg = <0x02805000 0x800>,	/* Smbus[2]        */
+              <0x02801240 0x020>, 	/* Cause Master[2] */
+              <0x028012a0 0x020>, 	/* Cause Slave[1]  */
+              <0x02801300 0x010>, 	/* Cause Coalesce  */
+              <0x02802000 0x100>, 	/* GPIO 0          */
+              <0x02800358 0x008>; 	/* CorePll         */
+	interrupts = <57>;
+	bus = <2>;
+	bus-freq = <400>;
+	profile = "mlnx-bf18";
+};
-- 
2.1.2
