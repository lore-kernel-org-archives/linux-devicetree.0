Return-Path: <SRS0=mAAg=SA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:53361 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730016AbfC2Tkl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Mar 2019 15:40:41 -0400
From: Khalil Blaiech <kblaiech@mellanox.com>
Subject: [PATCH v5 2/2] dt-bindings: i2c: I2C binding for Mellanox BlueField SoC
Date: Fri, 29 Mar 2019 15:40:29 -0400
Message-Id: <939785cb51f5a7759ea67c6efe99925805c3aed7.1553887256.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1553887255.git.kblaiech@mellanox.com>
References: <cover.1553887255.git.kblaiech@mellanox.com>
In-Reply-To: <cover.1553887255.git.kblaiech@mellanox.com>
References: <cover.1553887255.git.kblaiech@mellanox.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, David Woods <dwoods@mellanox.com>
Cc: Khalil Blaiech <kblaiech@mellanox.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, arm-soc <arm@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Added device tree bindings documentation for Mellanox BlueField
I2C SMBus controller.

Reviewed-by: Rob Herring <robh@kernel.org>
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
