From: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
Subject: [PATCH] dt-bindings: Add compatible string for LS1028A-QDS
Date: Fri, 24 Aug 2018 12:32:07 +0530
Message-ID: <1535094127-5025-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, shawnguo@kernel.org
Cc: oss@buserror.net, Rai Harninder <harninder.rai@nxp.com>, Sudhanshu Gupta <sudhanshu.gupta@nxp.com>, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sudhanshu Gupta <sudhanshu.gupta@nxp.com>
Signed-off-by: Rai Harninder <harninder.rai@nxp.com>
Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index ea08bf2..3e44804 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -163,6 +163,18 @@ LS1012A ARMv8 based QDS Board
 Required root node properties:
     - compatible = "fsl,ls1012a-qds", "fsl,ls1012a";
 
+LS1028A SoC
+Required root node properties:
+    - compatible = "fsl,ls1028a";
+
+LS1028A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls1028a-rdb", "fsl,ls1028a"
+
+LS1028A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls1028a-qds", "fsl,ls1028a";
+
 LS1043A SoC
 Required root node properties:
     - compatible = "fsl,ls1043a";
-- 
1.9.1
