From: <shh.xie@gmail.com>
Subject: [PATCH 07/10] [v3] Documentation: DT: Add entry for QorIQ LS1046A-RDB board
Date: Tue, 13 Sep 2016 16:10:00 +0800
Message-ID: <1473754203-22970-8-git-send-email-shh.xie@gmail.com>
References: <1473754203-22970-1-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473754203-22970-1-git-send-email-shh.xie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, shawnguo@kernel.org, linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, Shaohui Xie <Shaohui.Xie@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Shaohui Xie <Shaohui.Xie@nxp.com>

Signed-off-by: Shaohui Xie <Shaohui.Xie@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
changes from V1 to V3:
1. none.

 Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index a81277f..d6acdb3 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -155,6 +155,10 @@ LS1046A SoC
 Required root node properties:
     - compatible = "fsl,ls1046a";
 
+LS1046A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls1046a-rdb", "fsl,ls1046a";
+
 LS2080A SoC
 Required root node properties:
     - compatible = "fsl,ls2080a";
-- 
2.1.0.27.g96db324
