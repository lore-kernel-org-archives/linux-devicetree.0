From: Zhiqiang Hou <Zhiqiang.Hou@freescale.com>
Subject: [PATCH v2 1/2] Documentation: DT: Add entry for Freescale LS1043a-QDS
 board
Date: Thu, 24 Dec 2015 17:11:37 +0800
Message-ID: <1450948298-33238-1-git-send-email-Zhiqiang.Hou@freescale.com>
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
To: devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: scottwood@freescale.com, Mingkai.Hu@freescale.com, Hou Zhiqiang <Zhiqiang.Hou@freescale.com>, Shaohui.Xie@freescale.com
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
---
new patch

 Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index 752a685..dbbc095 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -135,6 +135,10 @@ LS1043A ARMv8 based RDB Board
 Required root node properties:
     - compatible = "fsl,ls1043a-rdb", "fsl,ls1043a";
 
+LS1043A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls1043a-qds", "fsl,ls1043a";
+
 LS2080A ARMv8 based Simulator model
 Required root node properties:
     - compatible = "fsl,ls2080a-simu", "fsl,ls2080a";
-- 
2.1.0.27.g96db324
