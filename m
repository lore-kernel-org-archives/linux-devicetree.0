From: Yinbo Zhu <yinbo.zhu@nxp.com>
Subject: [PATCH v2] arm64: dts: ls1043a: Add configure-gfladj property to USB3 node
Date: Wed, 29 Aug 2018 11:30:55 +0800
Message-ID: <20180829033055.22245-1-yinbo.zhu@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: yinbo.zhu@nxp.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ran Wang <ran.wang_1@nxp.com>, linux-kernel@vger.kernel.org
Cc: xiaobo.xie@nxp.com, Shawn Guo <shawnguo@kernel.org>, Minghuan Lian <Minghuan.Lian@nxp.com>, Yuantian Tang <andy.tang@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Changming Huang <jerry.huang@nxp.com>, Sumit Garg <sumit.garg@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rajesh Bhagat <rajesh.bhagat@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Rajesh Bhagat <rajesh.bhagat@freescale.com>

Add "configure-gfladj" boolean property to USB3 node. This property
is used to determine whether frame length adjustment is required or
not

Signed-off-by: Rajesh Bhagat <rajesh.bhagat@nxp.com>
Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
---
Change in v2:
		Modified some word misspellings in commit information

 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 7881e3d..ed3fa79 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -609,6 +609,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			configure-gfladj;
 		};
 
 		usb1: usb3@3000000 {
@@ -618,6 +619,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			configure-gfladj;
 		};
 
 		usb2: usb3@3100000 {
@@ -627,6 +629,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			configure-gfladj;
 		};
 
 		sata: sata@3200000 {
-- 
1.7.1
