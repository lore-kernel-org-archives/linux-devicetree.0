From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 2/2] clk: imx: scu: add cpu frequency scaling support
Date: Wed, 13 Feb 2019 13:32:28 +0000
Message-ID: <1550064410-28417-2-git-send-email-Anson.Huang@nxp.com>
References: <1550064410-28417-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550064410-28417-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On NXP's i.MX SoCs with system controller inside, CPU frequency
scaling can ONLY be done by system controller firmware, and it
can ONLY be requested from secure mode, so Linux kernel has to
call ARM SMC to trap to ARM-Trusted-Firmware to request system
controller firmware to do CPU frequency scaling.

This patch adds i.MX system controller CPU frequency scaling support,
it reuses cpufreq-dt driver and implement the CPU frequency scaling
inside SCU clock driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
ChangeLog since V1:
	- reuse cpufreq-dt driver for CPU frequency scaling and implement the CPU
	  frequency scaling inside SCU clock driver.
---
 drivers/clk/imx/clk-scu.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 7ccf7ed..65fb63c 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -4,14 +4,32 @@
  *   Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+#include <linux/arm-smccc.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 
 #include "clk-scu.h"
 
+#ifdef CONFIG_CPUFREQ_DT
+#define IMX_SIP_CPUFREQ			0xC2000001
+#define IMX_SIP_SET_CPUFREQ		0x00
+
 static struct imx_sc_ipc *ccm_ipc_handle;
 
+struct imx_sc_cpufreq {
+	const char *clk_name;
+	u32 cluster_id;
+};
+
+static const struct imx_sc_cpufreq imx_sc_cpufreq_data[] = {
+	{
+		.clk_name = "a35_clk",
+		.cluster_id = 0,
+	},
+};
+#endif
+
 /*
  * struct clk_scu - Description of one SCU clock
  * @hw: the common clk_hw
@@ -161,6 +179,35 @@ static int clk_scu_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct imx_sc_msg_req_set_clock_rate msg;
 	struct imx_sc_rpc_msg *hdr = &msg.hdr;
 
+#ifdef CONFIG_CPUFREQ_DT
+	/* CPU clock can ONLY be done by TF-A */
+	if (clk->clk_type == IMX_SC_PM_CLK_CPU) {
+		struct arm_smccc_res res;
+		unsigned int cluster_id;
+		int i;
+
+		for (i = 0; i < ARRAY_SIZE(imx_sc_cpufreq_data); i++) {
+			if (!strcmp(clk_hw_get_name(hw),
+				imx_sc_cpufreq_data[i].clk_name)) {
+				cluster_id = imx_sc_cpufreq_data[i].cluster_id;
+				break;
+			}
+		}
+
+		/*
+		 * As some other clock types have same value as
+		 * IMX_SC_PM_CLK_CPU, so we need to double check
+		 * the clock being scaled is indeed CPU clock which
+		 * matches the table we define.
+		 */
+		if (i < ARRAY_SIZE(imx_sc_cpufreq_data)) {
+			arm_smccc_smc(IMX_SIP_CPUFREQ, IMX_SIP_SET_CPUFREQ,
+				cluster_id, rate, 0, 0, 0, 0, &res);
+			return 0;
+		}
+	}
+#endif
+
 	hdr->ver = IMX_SC_RPC_VERSION;
 	hdr->svc = IMX_SC_RPC_SVC_PM;
 	hdr->func = IMX_SC_PM_FUNC_SET_CLOCK_RATE;
-- 
2.7.4
