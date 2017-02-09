From: Harninder Rai <harninder.rai@nxp.com>
Subject: [PATCH 2/3] Documentation: DT: Add entry for FSL LS1088A RDB,
 QDS boards
Date: Thu, 9 Feb 2017 16:34:11 +0530
Message-ID: <1486638251-9688-1-git-send-email-harninder.rai@nxp.com>
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
Cc: oss@buserror.net, Harninder Rai <harninder.rai@nxp.com>, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Harninder Rai <harninder.rai@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index c9c567a..f4f350b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -179,6 +179,18 @@ LS1046A ARMv8 based RDB Board
 Required root node properties:
     - compatible = "fsl,ls1046a-rdb", "fsl,ls1046a";
 
+LS1088A SoC
+Required root node properties:
+    - compatible = "fsl,ls1088a";
+
+LS1088A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls1088a-qds", "fsl,ls1088a";
+
+LS1088A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls1088a-rdb", "fsl,ls1088a";
+
 LS2080A SoC
 Required root node properties:
     - compatible = "fsl,ls2080a";
-- 
2.7.4
