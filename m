From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCHv6 2/2] dt/bindings: Add the DT binding documentation for endianness
Date: Tue, 15 Jul 2014 12:23:03 +0800
Message-ID: <1405398183-31345-3-git-send-email-Li.Xiubo@freescale.com>
References: <1405398183-31345-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1405398183-31345-1-git-send-email-Li.Xiubo@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, mark.rutland@arm.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: devicetree@vger.kernel.org

Device-Tree binding for device endianness
Index     Device     Endianness properties
---------------------------------------------------
1         BE         'big-endian'
2         LE         'little-endian'

For one device driver, which will run in different scenarios above
on different SoCs using the devicetree, we need one way to simplify
this.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 .../devicetree/bindings/regmap/regmap.txt          | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regmap/regmap.txt

diff --git a/Documentation/devicetree/bindings/regmap/regmap.txt b/Documentation/devicetree/bindings/regmap/regmap.txt
new file mode 100644
index 0000000..b494f8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regmap/regmap.txt
@@ -0,0 +1,47 @@
+Device-Tree binding for regmap
+
+The endianness mode of CPU & Device scenarios:
+Index     Device     Endianness properties
+---------------------------------------------------
+1         BE         'big-endian'
+2         LE         'little-endian'
+
+For one device driver, which will run in different scenarios above
+on different SoCs using the devicetree, we need one way to simplify
+this.
+
+Required properties:
+- {big,little}-endian: these are boolean properties, if absent
+  meaning that the CPU and the Device are in the same endianness mode,
+  these properties are for register values and all the buffers only.
+
+Examples:
+Scenario 1 : CPU in LE mode & device in LE mode.
+dev: dev@40031000 {
+	      compatible = "name";
+	      reg = <0x40031000 0x1000>;
+	      ...
+};
+
+Scenario 2 : CPU in LE mode & device in BE mode.
+dev: dev@40031000 {
+	      compatible = "name";
+	      reg = <0x40031000 0x1000>;
+	      ...
+	      big-endian;
+};
+
+Scenario 3 : CPU in BE mode & device in BE mode.
+dev: dev@40031000 {
+	      compatible = "name";
+	      reg = <0x40031000 0x1000>;
+	      ...
+};
+
+Scenario 4 : CPU in BE mode & device in LE mode.
+dev: dev@40031000 {
+	      compatible = "name";
+	      reg = <0x40031000 0x1000>;
+	      ...
+	      little-endian;
+};
-- 
1.8.5
