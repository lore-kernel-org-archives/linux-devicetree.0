From: Harninder Rai <harninder.rai@nxp.com>
Subject: [PATCH 1/3] Documentation: DT: Add entry for FSL LS1012A RDB, FRDM,
 QDS boards
Date: Wed, 9 Nov 2016 23:34:11 +0530
Message-ID: <1478714651-12679-1-git-send-email-harninder.rai@nxp.com>
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
To: devicetree@vger.kernel.org, shawnguo@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: oss@buserror.net, Harninder Rai <harninder.rai@nxp.com>, Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Harninder Rai <harninder.rai@nxp.com>
Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index d6ee9c6..3b01338 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -139,6 +139,22 @@ Example:
 Freescale ARMv8 based Layerscape SoC family Device Tree Bindings
 ----------------------------------------------------------------
 
+LS1012A SoC
+Required root node properties:
+    - compatible = "fsl,ls1012a";
+
+LS1012A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls1012a-rdb", "fsl,ls1012a";
+
+LS1012A ARMv8 based FRDM Board
+Required root node properties:
+    - compatible = "fsl,ls1012a-frdm", "fsl,ls1012a";
+
+LS1012A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls1012a-qds", "fsl,ls1012a";
+
 LS1043A SoC
 Required root node properties:
     - compatible = "fsl,ls1043a";
-- 
2.7.4
