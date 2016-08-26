From: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
Subject: [PATCH 01/10] dt-bindings: Add compatible property for LS1012A
Date: Fri, 26 Aug 2016 15:57:40 +0530
Message-ID: <1472207269-18499-1-git-send-email-Bhaskar.Upadhaya@nxp.com>
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
Cc: oss@buserror.net, linux-devel@gforge.freescale.net, Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index dbbc095..51b6b03 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -119,7 +119,7 @@ Freescale DCFG
 configuration and status for the device. Such as setting the secondary
 core start address and release the secondary core from holdoff and startup.
   Required properties:
-  - compatible: should be "fsl,ls1021a-dcfg"
+  - compatible: can be "fsl,ls1021a-dcfg", "fsl,ls1012a-dcfg", "fsl,ls1043a-dcfg"
   - reg : should contain base address and length of DCFG memory-mapped registers
 
 Example:
@@ -151,3 +151,14 @@ LS2080A ARMv8 based RDB Board
 Required root node properties:
     - compatible = "fsl,ls2080a-rdb", "fsl,ls2080a";
 
+LS1012A ARMv8 based FRDM Board
+Required root node properties:
+    - compatible = "fsl,ls1012a-frdm", "fsl,ls1012a";
+
+LS1012A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls1012a-rdb", "fsl,ls1012a";
+
+LS1012A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls1012a-qds", "fsl,ls1012a";
-- 
1.9.1
