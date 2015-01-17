From: Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH 3/3] input: goodix: Add bindings documentation
Date: Sat, 17 Jan 2015 17:36:50 +0300
Message-ID: <1421505410-9537-1-git-send-email-mamlinav@gmail.com>
References: <1421505253-7474-1-git-send-email-mamlinav@gmail.com>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1421505253-7474-1-git-send-email-mamlinav@gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org, Aleksei Mamlin <mamlinav@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Aleksei Mamlin <mamlinav@gmail.com>
---
 .../bindings/input/touchscreen/gt9xx.txt           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/gt9xx.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/gt9xx.txt b/Documentation/devicetree/bindings/input/touchscreen/gt9xx.txt
new file mode 100644
index 0000000..96c17f0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/gt9xx.txt
@@ -0,0 +1,23 @@
+Device tree bindings for Goodix GT9xx series touchscreen controller
+
+Required properties:
+
+ - compatible		: Should be "goodix,gt9xx"
+ - reg			: I2C address of the chip
+ - interrupt-parent 	: Interrupt controller to which the chip is connected
+ - interrupts		: Interrupt to which the chip is connected
+
+Example:
+
+	i2c@00000000 {
+		/* ... */
+
+		gt9xx@5d {
+			compatible = "goodix,gt9xx";
+			reg = <0x5d>;
+			interrupt-parent = <&gpio>;
+			interrupts = <0 2>;
+		};
+
+		/* ... */
+	};
-- 
2.0.5

