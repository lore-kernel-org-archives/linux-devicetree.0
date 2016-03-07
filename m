From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Subject: [PATCH v3 1/2] Documentation: DT: Add entry for Freescale LS1043a-QDS
 board
Date: Mon, 7 Mar 2016 19:30:31 +0800
Message-ID: <1457350232-12749-1-git-send-email-Zhiqiang.Hou@nxp.com>
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
To: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com, scott.wood@nxp.com, shawnguo@kernel.org
Cc: Shaohui.Xie@nxp.com, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Mingkai.Hu@nxp.com
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
v3:
 - No change.

 Documentation/devicetree/bindings/arm/fsl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index 752a685..f504fdf 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -134,6 +134,7 @@ Freescale ARMv8 based Layerscape SoC family Device Tree Bindings
 LS1043A ARMv8 based RDB Board
 Required root node properties:
     - compatible = "fsl,ls1043a-rdb", "fsl,ls1043a";
+    - compatible = "fsl,ls1043a-qds", "fsl,ls1043a";
 
 LS2080A ARMv8 based Simulator model
 Required root node properties:
-- 
2.1.0.27.g96db324
