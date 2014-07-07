From: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] devicetree/bindings/powerpc/fsl: Add binding for board
Date: Mon, 7 Jul 2014 14:06:34 +0530
Message-ID: <1404722194-8103-1-git-send-email-Priyanka.Jain@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Priyanka Jain <Priyanka.Jain-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 .../devicetree/bindings/powerpc/fsl/board.txt      |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/board.txt b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
index f35f295..7800729 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/board.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/board.txt
@@ -1,8 +1,23 @@
 Freescale Reference Board Bindings
 
-This document describes device tree bindings for various devices that
+This document describes device tree bindings for board and  various devices that
 exist on some Freescale reference boards.
 
+* Board node
+Required properties:
+
+ - model : Should be "fsl,<board>"
+ - compatible : Should be "fsl,<board>"
+	example: "fsl,T1040RDB", "fsl,T1042RDB", "fsl,T1042RDB_PI"
+		 "fsl,T1040QDS", "fsl,T1042QDS"
+
+Example:
+
+/ {
+	model = "fsl,T1040RDB";
+	compatible = "fsl,T1040RDB";
+};
+
 * Board Control and Status (BCSR)
 
 Required properties:
-- 
1.7.4.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
