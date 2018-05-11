From: Yinbo Zhu <yinbo.zhu@nxp.com>
Subject: [PATCH 8/9] arm64: dts: ls1046a: Add the identify of the platform to support to set rcpm bit
Date: Fri, 11 May 2018 11:35:29 +0800
Message-ID: <20180511033530.7931-8-yinbo.zhu@nxp.com>
References: <20180511033530.7931-1-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180511033530.7931-1-yinbo.zhu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yinbo.zhu@nxp.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Catalin Marinas )" <catalin.marinas@arm.com>, "Will Deacon )" <will.deacon@arm.com>, "Lorenzo Pieralisi )" <lorenzo.pieralisi@arm.com>, Li Yang <leoyang.li@nxp.com>
Cc: xiaobo.xie@nxp.com, ran.wang_1@nxp.com, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Madalin Bucur <madalin.bucur@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Changming Huang <jerry.huang@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Zhao Qiang <qiang.zhao@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "jiaheng . fan" <jiaheng.fan@nxp.com>, Po Liu <po.liu@nxp.com>, Nipun Gupta <nipun.gupta@nxp.com>, =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>, Sumit Garg <sumit.garg@nxp.com>, costi <constantin.tudor@freescale.com>, Bogdan Purcareata <bogdan.purcareata@nxp.com>, Meng Yi <meng.yi@nxp.com>, Wang Dongsheng <dongsheng.>
List-Id: devicetree@vger.kernel.org

From: Zhang Ying-22455 <ying.zhang22455@nxp.com>

Add the identify of the platform to support set the rcpm with
big-endian or little-endian.

Signed-off-by: Zhang Ying-22455 <ying.zhang22455@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 3e09bcb..1ce1153 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -575,7 +575,7 @@
 		};
 
 		ftm0: ftm0@29d0000 {
-			compatible = "fsl,ftm-alarm";
+			compatible = "fsl,ls1046a-ftm";
 			reg = <0x0 0x29d0000 0x0 0x10000>,
 			      <0x0 0x1ee2140 0x0 0x4>;
 			reg-names = "ftm", "FlexTimer1";
-- 
1.7.1
