From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH 5/5] Documentation: fsl-quadspi: Add fsl,
 ls1012a-qspi compatible string
Date: Thu, 8 Dec 2016 17:23:04 +0800
Message-ID: <1481188984-43683-6-git-send-email-yao.yuan@freescale.com>
References: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, computersforpeace@gmail.com, dwmw2@infradead.org
Cc: devicetree@vger.kernel.org, yao.yuan@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan@nxp.com>

new compatible string: "fsl,ls1012a-qspi".

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index c34aa6f..a2ed621 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -7,6 +7,7 @@ Required properties:
 		 or
 		 "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi",
 		 "fsl,ls1043a-qspi" followed by "fsl,ls1021a-qspi"
+		 "fsl,ls1012a-qspi" followed by "fsl,ls1021a-qspi"
   - reg : the first contains the register location and length,
           the second contains the memory mapping address and length
   - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
-- 
2.1.0.27.g96db324
