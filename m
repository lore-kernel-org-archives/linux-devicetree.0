From: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH][v2] devicetree/binding/powerpc/fsl: Add binding for CPLD
Date: Fri, 4 Jul 2014 10:03:15 +0530
Message-ID: <1404448395-6513-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some Freescale boards like T1040RDB have on board CPLD connected on
the IFC bus. Add binding for this in board.txt file

Signed-off-by: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
Changes for v2:
 convert board name to lower-case based on Scott's suggestions

 .../devicetree/bindings/powerpc/fsl/board.txt      |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/board.txt b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
index 700dec4..f35f295 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/board.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
@@ -84,3 +84,22 @@ Example:
 		compatible = "fsl,bsc9132qds-fpga", "fsl,fpga-qixis-i2c";
 		reg = <0x66>;
 	};
+
+* Freescale on-board CPLD
+
+Some Freescale boards like T1040RDB have on board CPLD connected on
+the IFC bus.
+
+Required properties:
+- compatible: Should be a board-specific string like "fsl,<board>-cpld"
+  Example:
+	"fsl,t1040rdb-cpld", "fsl,t1042rdb-cpld", "fsl,t1042rdb_pi-cpld"
+- reg: Should contain the chip select, address offset and length of the CPLD
+
+Example:
+	cpld@3,0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "fsl,t1040rdb-cpld";
+		reg = <3 0 0x300>;
+	};
-- 
1.7.4.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
