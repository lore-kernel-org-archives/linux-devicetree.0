From: Yinbo Zhu <yinbo.zhu@nxp.com>
Subject: [PATCH 6/9] soc: fsl: fix the compilation issue
Date: Fri, 11 May 2018 11:35:27 +0800
Message-ID: <20180511033530.7931-6-yinbo.zhu@nxp.com>
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

Signed-off-by: Zhang Ying-22455 <ying.zhang22455@nxp.com>
---
 drivers/soc/fsl/layerscape/ftm_alarm.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/soc/fsl/layerscape/ftm_alarm.c b/drivers/soc/fsl/layerscape/ftm_alarm.c
index 811dcfa..c22ef49 100644
--- a/drivers/soc/fsl/layerscape/ftm_alarm.c
+++ b/drivers/soc/fsl/layerscape/ftm_alarm.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/libata.h>
+#include <linux/module.h>
 
 #define FTM_SC			0x00
 #define FTM_SC_CLK_SHIFT	3
-- 
1.7.1
