From: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH][v3]devicetree/binding/powerpc/fsl: Add binding for CPLD
Date: Wed, 9 Jul 2014 09:17:07 +0530
Message-ID: <1404877627-1839-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some Freescale boards like T1040RDB have an on board CPLD connected on
the IFC bus. Add binding for cpld in board.txt file

Signed-off-by: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
Changes for v2: Incorporated Scott's comments

 .../devicetree/bindings/powerpc/fsl/board.txt      |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/board.txt b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
index 700dec4..67ef6a4 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/board.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
@@ -84,3 +84,19 @@ Example:
 		compatible = "fsl,bsc9132qds-fpga", "fsl,fpga-qixis-i2c";
 		reg = <0x66>;
 	};
+
+* Freescale on-board CPLD
+
+Some Freescale boards like T1040RDB have an on board CPLD connected.
+
+Required properties:
+- compatible: Should be a board-specific string like "fsl,<board>-cpld"
+  Example:
+	"fsl,t1040rdb-cpld", "fsl,t1042rdb-cpld", "fsl,t1042rdb_pi-cpld"
+- reg: should describe CPLD registers
+
+Example:
+	cpld@3,0 {
+		compatible = "fsl,t1040rdb-cpld";
+		reg = <3 0 0x300>;
+	};
-- 
1.7.4.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
