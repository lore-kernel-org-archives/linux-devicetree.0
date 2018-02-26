From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] arm64: dts: ls1046a: add a dummy memory 'reg' property
Date: Mon, 26 Feb 2018 14:33:50 +0800
Message-ID: <1519626830-14370-1-git-send-email-shawnguo@kernel.org>
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
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Mingkai Hu <Mingkai.Hu@nxp.com>, Li Yang <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

The memory node in fsl-ls1046a.dtsi has no 'reg' property, and causes
the dtc warning below.

Warning (unit_address_vs_reg): Node /memory@80000000 has a unit name, but no reg property

Let's add a 'reg' property with dummy memory size, since bootloader will
need to fill the correct one per board memory configuration anyway.

Cc: Mingkai Hu <Mingkai.Hu@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 606ea496f24e..136ebfa9b333 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -131,6 +131,8 @@
 
 	memory@80000000 {
 		device_type = "memory";
+		/* Real size will be filled by bootloader */
+		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
 	sysclk: sysclk {
-- 
1.9.1
