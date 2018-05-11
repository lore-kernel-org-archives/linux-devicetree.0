From: Yinbo Zhu <yinbo.zhu@nxp.com>
Subject: [PATCH 9/9] armv8: add psci 0.2 stardard support
Date: Fri, 11 May 2018 11:35:30 +0800
Message-ID: <20180511033530.7931-9-yinbo.zhu@nxp.com>
References: <20180511033530.7931-1-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180511033530.7931-1-yinbo.zhu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yinbo.zhu@nxp.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Catalin Marinas )" <catalin.marinas@arm.com>, "Will Deacon )" <will.deacon@arm.com>, "Lorenzo Pieralisi )" <lorenzo.pieralisi@arm.com>, Li Yang <leoyang.li@nxp.com>
Cc: xiaobo.xie@nxp.com, ran.wang_1@nxp.com, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Madalin Bucur <madalin.bucur@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Changming Huang <jerry.huang@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Zhao Qiang <qiang.zhao@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "jiaheng . fan" <jiaheng.fan@nxp.com>, Po Liu <po.liu@nxp.com>, Nipun Gupta <nipun.gupta@nxp.com>, =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>, Sumit Garg <sumit.garg@nxp.com>, costi <constantin.tudor@freescale.com>, Bogdan Purcareata <bogdan.purcareata@nxp.com>, Meng Yi <meng.yi@nxp.com>, Wang Dongsheng <dongsheng.>
List-Id: devicetree@vger.kernel.org

From: Yuantian Tang <andy.tang@nxp.com>

In current kernel, only psci v1.0 is supported. But our psci firmware
only support psci v0.2. So update psci driver to support psci v0.2.

Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
---
 drivers/firmware/psci.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
index 0bd795f..c9ed9fb 100644
--- a/drivers/firmware/psci.c
+++ b/drivers/firmware/psci.c
@@ -468,6 +468,8 @@ static void __init psci_init_system_suspend(void)
 	if (!IS_ENABLED(CONFIG_SUSPEND))
 		return;
 
+	suspend_set_ops(&psci_suspend_ops);
+
 	ret = psci_features(PSCI_FN_NATIVE(1_0, SYSTEM_SUSPEND));
 
 	if (ret != PSCI_RET_NOT_SUPPORTED)
@@ -573,6 +575,8 @@ static void __init psci_0_2_set_functions(void)
 
 	pm_power_off = psci_sys_poweroff;
 
+	psci_init_system_suspend();
+
 	suspend_set_ops(&psci_suspend_ops);
 }
 
-- 
1.7.1
