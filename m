Return-Path: <SRS0=lcGb=Q2=mellanox.com=kblaiech@kernel.org>
From: Khalil Blaiech <kblaiech@mellanox.com>
Subject: [PATCH v4 2/2] dt-bindings: i2c: I2C binding for Mellanox BlueField SoC
Date: Tue, 19 Feb 2019 18:45:46 -0500
Message-Id: <7af2f2f12bb6e1562c94f867d971953795681d53.1550618900.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1550618900.git.kblaiech@mellanox.com>
References: <cover.1550618900.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1550618900.git.kblaiech@mellanox.com>
References: <cover.1550618900.git.kblaiech@mellanox.com>
To: Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>
Cc: Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, arm-soc <arm@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Added device tree bindings documentation for Mellanox BlueField
I2C SMBus controller.

Reviewed-by: David Woods <dwoods@mellanox.com>
Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
---
 .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt

diff --git a/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
new file mode 100644
index 0000000..3478bb2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt
@@ -0,0 +1,29 @@
+Device tree configuration for the Mellanox I2C SMBus on BlueField SoCs
+
+Required Properties:
+- compatible : should be "mellanox,i2c-mlxbf1" or "mellanox,i2c-mlxbf2".
+
+- reg : address offset and length of the device registers. The
+	registers consist of the following set of resources:
+		1) Smbus block registers.
+		2) Cause master registers.
+		3) Cause slave registers.
+
+- interrupts : interrupt number.
+
+Optional Properties:
+
+- clock-frequency : bus frequency used to configure timing registers;
+			allowed values are 100000, 400000 and 1000000;
+			those are expressed in Hz. Default is 100000.
+
+Example:
+
+i2c@2804000 {
+	compatible = "mellanox,i2c-mlxbf1";
+	reg =	<0x02804000 0x800>,
+		<0x02801200 0x020>,
+		<0x02801260 0x020>;
+	interrupts = <57>;
+	clock-frequency = <100000>;
+};
-- 
2.1.2
