From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH] Documentation: fsl-quadspi: Add fsl, ls1021-qspi compatible string
Date: Wed, 18 Nov 2015 17:18:11 +0800
Message-ID: <1447838291-9865-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

new compatible string: "fsl,ls1021-qspi".

Signed-off-by: Yuan Yao <yao.yuan@freescale.com>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 862aa2f..00c587b 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -2,7 +2,8 @@
 
 Required properties:
   - compatible : Should be "fsl,vf610-qspi", "fsl,imx6sx-qspi",
-		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi"
+		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
+		 "fsl,ls1021-qspi"
   - reg : the first contains the register location and length,
           the second contains the memory mapping address and length
   - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
-- 
2.1.0.27.g96db324
