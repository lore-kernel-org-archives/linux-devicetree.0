From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] arm64: dts: ls1046a: drop incomplete memory node
Date: Sat, 24 Feb 2018 15:04:56 +0800
Message-ID: <1519455896-8924-1-git-send-email-shawnguo@kernel.org>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Mingkai Hu <Mingkai.Hu@nxp.com>, Shaohui Xie <Shaohui.Xie@nxp.com>
List-Id: devicetree@vger.kernel.org

The memory node in fsl-ls1046a.dtsi has no 'reg' property, and causes
the dtc warning below.

Warning (unit_address_vs_reg): Node /memory@80000000 has a unit name, but no reg property

This is clearly an incomplete memory node.  Let's drop it.  Either
a complete memory should be added, or bootloader needs to fill the node
as a whole.

Cc: Mingkai Hu <Mingkai.Hu@nxp.com>
Cc: Shaohui Xie <Shaohui.Xie@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 606ea496f24e..cbf4b3e15c17 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -129,10 +129,6 @@
 		};
 	};
 
-	memory@80000000 {
-		device_type = "memory";
-	};
-
 	sysclk: sysclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
1.9.1
