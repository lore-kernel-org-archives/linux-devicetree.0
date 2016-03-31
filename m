From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH 1/2] Documentation: fsl-quadspi: Add fsl,
 ls1043a-qspi compatible string
Date: Thu, 31 Mar 2016 14:45:00 +0800
Message-ID: <1459406701-40993-2-git-send-email-yao.yuan@freescale.com>
References: <1459406701-40993-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459406701-40993-1-git-send-email-yao.yuan@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com, pawel.moll@arm.com, han.xu@nxp.com, shawnguo@kernel.org, leoyang.li@nxp.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yuan Yao <yao.yuan@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan@nxp.com>

new compatible string: "fsl,ls1043a-qspi".

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 0333ec8..c34aa6f 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -5,7 +5,8 @@ Required properties:
 		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
 		 "fsl,ls1021a-qspi"
 		 or
-		 "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi"
+		 "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi",
+		 "fsl,ls1043a-qspi" followed by "fsl,ls1021a-qspi"
   - reg : the first contains the register location and length,
           the second contains the memory mapping address and length
   - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
-- 
2.1.0.27.g96db324
