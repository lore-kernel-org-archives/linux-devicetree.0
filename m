From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH] mfd: syscon: binding: Add syscon endianness support.
Date: Thu, 18 Sep 2014 15:27:29 +0800
Message-ID: <1411025249-34333-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: B29396@freescale.com, pankaj.dubey@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: devicetree@vger.kernel.org

For many drivers which will support rich endianness of Devices
need define DT properties by itself with the binding support.

The regmap core has already support endianness of the following
case:
Index      Device     DT properties needed
------------------------------------------
1          BE         'big-endian'
2          LE         'little-endian'

Please see the regmap binding for more detail information of
the endianness support.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---


This patch hasn't any dependency with Pankaj Dubey's:
    mfd: syscon: Decouple syscon interface from platform devices



 Documentation/devicetree/bindings/mfd/syscon.txt | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
index fe8150b..7c33178 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.txt
+++ b/Documentation/devicetree/bindings/mfd/syscon.txt
@@ -10,11 +10,22 @@ OS driver) to determine the location of the registers, and access the
 registers directly.
 
 Required properties:
-- compatible: Should contain "syscon".
-- reg: the register region can be accessed from syscon
+- compatible:		Should contain "syscon".
+- reg:			The register region can be accessed from syscon
 
-Examples:
+Optional property:
+- {big,little}-endian:	Boolean property. Please see ../regmap/regmap.txt
+			for more information.
+
+Example 1:
 gpr: iomuxc-gpr@020e0000 {
 	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
 	reg = <0x020e0000 0x38>;
 };
+
+Example 2:
+dcfg: dcfg@1ee0000 {
+	compatible = "fsl,ls1021a-dcfg", "syscon";
+	reg = <0x0 0x1ee0000 0x0 0x10000>;
+	big-endian;
+};
-- 
2.1.0.27.g96db324
