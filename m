Return-Path: <SRS0=K2Zf=ON=mellanox.com=kblaiech@kernel.org>
From: Khalil Blaiech <kblaiech@mellanox.com>
Subject: [PATCH v2 2/2] dt-bindings: i2c: I2C binding for Mellanox BlueField SoC
Date: Tue,  4 Dec 2018 12:40:58 -0500
Message-Id: <559a79756c9da9a7b188ffa141a2056a83c60de6.1543941145.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1543941145.git.kblaiech@mellanox.com>
References: <cover.1543941145.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1543941145.git.kblaiech@mellanox.com>
References: <cover.1543941145.git.kblaiech@mellanox.com>
To: Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>
Cc: Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Added device tree bindings documentation for Mellanox BlueField
I2C SMBus controller.

Reviewed-by: David Woods <dwoods@mellanox.com>
Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
---
 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt

diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
new file mode 100644
index 0000000..61a8037
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
@@ -0,0 +1,67 @@
+Device tree configuration for the Mellanox I2C SMBus on BlueField SoCs
+
+Required Properties:
+- reg        :	address offset and length of the device registers. The
+		registers consists of a set of dedicated and shared
+	       	resources:
+
+			1: Smbus block registers (dedicated)
+			2: Cause master registers (dedicated)
+			3: Cause slave registers (dedicated)
+			4: Cause coalesce registers (shared)
+			5: GPIO 0 registers (shared)
+			6: CorePLL registers (shared)
+
+		The BlueField SoCs includes three I2C bus controllers;
+		the set of resources <address length> must be defined
+		as follow:
+
+		i2c bus 0:
+		    <0x02804000 0x800>	/* Smbus[0]        */
+		    <0x02801200 0x020>	/* Cause Master[0] */
+		    <0x02801260 0x020>	/* Cause Slave[0]  */
+		    <0x02801300 0x010>	/* Cause Coalesce  */
+		    <0x02802000 0x100>	/* GPIO 0          */
+		    <0x02800358 0x008>	/* CorePll         */
+
+		i2c bus 1:
+		    <0x02804800 0x800>	/* Smbus[1]        */
+		    <0x02801220 0x020>	/* Cause Master[1] */
+		    <0x02801280 0x020>	/* Cause Slave[1]  */
+		    <0x02801300 0x010>	/* Cause Coalesce  */
+		    <0x02802000 0x100>	/* GPIO 0          */
+		    <0x02800358 0x008>	/* CorePll         */
+
+		i2c bus 2:
+		    <0x02805000 0x800>	/* Smbus[2]        */
+		    <0x02801240 0x020>	/* Cause Master[2] */
+		    <0x028012a0 0x020>	/* Cause Slave[2]  */
+		    <0x02801300 0x010>	/* Cause Coalesce  */
+		    <0x02802000 0x100>	/* GPIO 0          */
+		    <0x02800358 0x008>	/* CorePll         */
+
+- compatible : 	should be "mellanox,i2c-mlxbf".
+- interrupts : 	interrupt number.
+
+Optional Properties:
+- clock-frequency :	bus frequency used to configure timing registers;
+  		    	allowed values are 100000, 400000 and 1000000;
+		    	those are expressed in Hz.
+
+Example:
+
+aliases {
+	i2c0 = &i2c_0
+};
+
+i2c_0: i2c {
+	compatible = "mellanox,i2c-mlxbf";
+	reg = <0x02804000 0x800>,
+	      <0x02801200 0x020>,
+	      <0x02801260 0x020>,
+	      <0x02801300 0x010>,
+	      <0x02802000 0x100>,
+	      <0x02800358 0x008>;
+	interrupts = <57>;
+	clock-frequency = <100000>;
+};
-- 
2.1.2
