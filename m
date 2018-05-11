From: Yinbo Zhu <yinbo.zhu@nxp.com>
Subject: [PATCH 4/9] arm64: dts: ls208xa: Add the identify of the platform to support to set rcpm bit
Date: Fri, 11 May 2018 11:35:25 +0800
Message-ID: <20180511033530.7931-4-yinbo.zhu@nxp.com>
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
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index fec61af..973e646 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -896,9 +896,11 @@
 		};
 
 		ftm0: ftm0@2800000 {
-			compatible = "fsl,ftm-alarm";
-			reg = <0x0 0x2800000 0x0 0x10000>;
+			compatible = "fsl,ls208xa-ftm";
+			reg = <0x0 0x2800000 0x0 0x10000>,
+			      <0x0 0x1e34050 0x0 0x4>;
 			interrupts = <0 44 4>;
+			reg-names = "ftm", "FlexTimer1";
 		};
 	};
 
-- 
1.7.1
