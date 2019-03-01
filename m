From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH nand-next 1/2] dt-bindings: nand: meson: add support for more SoCs
Date: Fri,  1 Mar 2019 19:29:21 +0100
Message-ID: <20190301182922.8309-2-martin.blumenstingl@googlemail.com>
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: liang.yang@amlogic.com
Cc: linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Older Amlogic SoCs have a slightly different integration of the NFC
(NAND flash controller) than the new ones (GXL, GXM, AXG).

On GXL, AXG and newer the "NAND device clock" is shared with sd_emmc_c.
This requires muxing the signal of that clock between the sd_emmc_c
controller and the NAND controller. The "amlogic,mmc-syscon" property
exists for this purpose.

Older SoCs (Meson8, Meson8b, Meson8m2 and GXBB) have a dedicated "NAND
device clock". Thus we don't need to "amlogic,mmc-syscon" property for
muxing the clock on these older SoCs.

The clock implementation itself is also more advanced on newer SoCs
because the phase of the RX and TX clock can be controlled. Older SoCs
cannot change the phase of the "NAND device clock". Thus the "rx" and
"tx" clock-names are only required for the GXL, GXM and AXG SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/mtd/amlogic,meson-nand.txt | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
index 3983c11e062c..8766d4e82a74 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
@@ -5,6 +5,9 @@ the MTD NAND bindings.
 
 Required properties:
 - compatible : contains one of:
+  - "amlogic,meson8-nfc"
+  - "amlogic,meson8b-nfc"
+  - "amlogic,meson-gxbb-nfc"
   - "amlogic,meson-gxl-nfc"
   - "amlogic,meson-axg-nfc"
 - clocks     :
@@ -13,12 +16,13 @@ Required properties:
 
 - clock-names: Should contain the following:
 	"core" - NFC module gate clock
-	"device" - device clock from eMMC sub clock controller
-	"rx" - rx clock phase
-	"tx" - tx clock phase
+	"device" - NAND device clock
+	"rx" - rx clock phase, only used on the GXL, GXM and AXG SoCs.
+	"tx" - tx clock phase, only used on the GXL, GXM and AXG SoCs.
 
-- amlogic,mmc-syscon	: Required for NAND clocks, it's shared with SD/eMMC
-				controller port C
+- amlogic,mmc-syscon	: Only used on the GXL, GXM and AXG SoCs.
+			  Required for NAND clocks, it's shared with SD/eMMC
+			  controller port C
 
 Optional children nodes:
 Children nodes represent the available nand chips.
-- 
2.21.0
