Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
Message-ID: <58917d76.964f620a.f61b6.381dSMTPIN_ADDED_BROKEN@mx.google.com>
Received: from mail-sn1nam01on0044.outbound.protection.outlook.com ([104.47.32.44]:1985
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751005AbdBAGRW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Feb 2017 01:17:22 -0500
From: <y@lvd4224.freescale.com>
Subject: [PATCH v5 1/3] dt-bindings: Add compatible for LS2088A QDS and RDB board
Date: Wed, 1 Feb 2017 11:46:57 +0530
In-Reply-To: <1485929819-17171-1-git-send-email-y>
References: <1485929819-17171-1-git-send-email-y>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org
Cc: scott.wood@nxp.com, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org, Abhimanyu Saini <abhimanyu.saini@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Abhimanyu Saini <abhimanyu.saini@nxp.com>

Signed-off-by: Abhimanyu Saini <abhimanyu.saini@nxp.com>
Signed-off-by: Priyanka Jain <priyanka.jain@nxp.com>
Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index c9c567a..645e8ff 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -195,3 +195,14 @@ LS2080A ARMv8 based RDB Board
 Required root node properties:
     - compatible = "fsl,ls2080a-rdb", "fsl,ls2080a";
 
+LS2088A SoC
+Required root node properties:
+    - compatible = "fsl,ls2088a";
+
+LS2088A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls2088a-qds", "fsl,ls2088a";
+
+LS2088A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls2088a-rdb", "fsl,ls2088a";
-- 
1.9.1

