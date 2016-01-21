From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH v3 2/4] Documentation: fsl-quadspi: Add fsl, ls2080a-qspi compatible string
Date: Thu, 21 Jan 2016 15:09:16 +0800
Message-ID: <1453360158-34236-2-git-send-email-yao.yuan@freescale.com>
References: <1453360158-34236-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453360158-34236-1-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yao.yuan@nxp.com
List-Id: devicetree@vger.kernel.org

new compatible string: "fsl,ls2080a-qspi".

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
Changed in v3:
Add the modifier for new compatible string like:
"fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi"

Changed in v2:
Update my email to <yao.yuan@nxp.com>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 00c587b..0df2f3a 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -3,7 +3,9 @@
 Required properties:
   - compatible : Should be "fsl,vf610-qspi", "fsl,imx6sx-qspi",
 		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
-		 "fsl,ls1021-qspi"
+		 "fsl,ls1021a-qspi"
+		 or
+		 "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi"
   - reg : the first contains the register location and length,
           the second contains the memory mapping address and length
   - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
-- 
2.1.0.27.g96db324
