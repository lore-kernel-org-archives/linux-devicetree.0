From: Yinbo Zhu <yinbo.zhu@nxp.com>
Subject: [PATCH 2/9] armv8: pm: Fix issue of rcpm driver wrongly program other IP control bits
Date: Fri, 11 May 2018 11:35:23 +0800
Message-ID: <20180511033530.7931-2-yinbo.zhu@nxp.com>
References: <20180511033530.7931-1-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180511033530.7931-1-yinbo.zhu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yinbo.zhu@nxp.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Catalin Marinas )" <catalin.marinas@arm.com>, "Will Deacon )" <will.deacon@arm.com>, "Lorenzo Pieralisi )" <lorenzo.pieralisi@arm.com>, Li Yang <leoyang.li@nxp.com>
Cc: xiaobo.xie@nxp.com, ran.wang_1@nxp.com, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Madalin Bucur <madalin.bucur@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Changming Huang <jerry.huang@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Zhao Qiang <qiang.zhao@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "jiaheng . fan" <jiaheng.fan@nxp.com>, Po Liu <po.liu@nxp.com>, Nipun Gupta <nipun.gupta@nxp.com>, =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>, Sumit Garg <sumit.garg@nxp.com>, costi <constantin.tudor@freescale.com>, Bogdan Purcareata <bogdan.purcareata@nxp.com>, Meng Yi <meng.yi@nxp.com>, Wang Dongsheng <dongsheng.>
List-Id: devicetree@vger.kernel.org

From: Ran Wang <ran.wang_1@nxp.com>

When rcpm driver get target register data from DTS property 'fsl,
rcpm-wakeup' (second value), it directly write that data to register
RCPM_IPPDEXPCRx rather than 'OR' the value read from it before. This
operation will over-write those non-related IP control bit which
might have been programmed, should be prevented.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
---
 drivers/soc/fsl/rcpm.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index ff0477b..39eabfb 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -75,6 +75,7 @@ static void rcpm_wakeup_fixup(struct device *dev, void *data)
 static int rcpm_suspend_prepare(void)
 {
 	int i;
+	u32 val;
 
 	WARN_ON(!rcpm);
 
@@ -84,9 +85,12 @@ static int rcpm_suspend_prepare(void)
 	dpm_for_each_dev(NULL, rcpm_wakeup_fixup);
 
 	for (i = 0; i < rcpm->ipp_num; i++) {
-		rcpm_reg_write(rcpm->ippdexpcr_offset + 4 * i,
-			       rcpm->ippdexpcr[i]);
-		pr_debug("ippdexpcr%d = 0x%x\n", i, rcpm->ippdexpcr[i]);
+		if (rcpm->ippdexpcr[i]) {
+			val = rcpm_reg_read(rcpm->ippdexpcr_offset + 4 * i);
+			rcpm_reg_write(rcpm->ippdexpcr_offset + 4 * i,
+					       val | rcpm->ippdexpcr[i]);
+			pr_debug("ippdexpcr%d = 0x%x\n", i, rcpm->ippdexpcr[i]);
+		}
 	}
 
 	return 0;
-- 
1.7.1
