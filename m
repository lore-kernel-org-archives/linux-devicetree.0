From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: [RFCv4 6/7] soc: imx8mm: Register interconnect platform device
Date: Fri, 23 Aug 2019 17:36:59 +0300
Message-ID: <d900252a824b9a5f34fa6d2b49343bc359e62a14.1566570260.git.leonard.crestez@nxp.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1566570260.git.leonard.crestez@nxp.com>
In-Reply-To: <cover.1566570260.git.leonard.crestez@nxp.com>
References: <cover.1566570260.git.leonard.crestez@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@partner.samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Alexandre Bailon <abailon@baylibre.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Since there is no virtual devicetree node representing the interconnect
we need to probe the icc device externally. Probing this from the SOC
driver allows the interconnect device to be built as a module.

This is very similar to imx-cpufreq-dt.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/soc/imx/soc-imx8.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/imx/soc-imx8.c b/drivers/soc/imx/soc-imx8.c
index b9831576dd25..24d515a9fdb2 100644
--- a/drivers/soc/imx/soc-imx8.c
+++ b/drivers/soc/imx/soc-imx8.c
@@ -22,10 +22,11 @@
 /* Same as ANADIG_DIGPROG_IMX7D */
 #define ANADIG_DIGPROG_IMX8MM	0x800
 
 struct imx8_soc_data {
 	char *name;
+	char *icc_driver;
 	u32 (*soc_revision)(void);
 };
 
 static u64 soc_uid;
 
@@ -115,10 +116,11 @@ static const struct imx8_soc_data imx8mq_soc_data = {
 };
 
 static const struct imx8_soc_data imx8mm_soc_data = {
 	.name = "i.MX8MM",
 	.soc_revision = imx8mm_soc_revision,
+	.icc_driver = "imx8mm-interconnect",
 };
 
 static const struct imx8_soc_data imx8mn_soc_data = {
 	.name = "i.MX8MN",
 	.soc_revision = imx8mm_soc_revision,
@@ -185,10 +187,12 @@ static int __init imx8_soc_init(void)
 	if (ret)
 		goto free_rev;
 
 	if (IS_ENABLED(CONFIG_ARM_IMX_CPUFREQ_DT))
 		platform_device_register_simple("imx-cpufreq-dt", -1, NULL, 0);
+	if (IS_ENABLED(CONFIG_INTERCONNECT_IMX))
+		platform_device_register_simple(data->icc_driver, -1, NULL, 0);
 
 	return 0;
 
 free_rev:
 	if (strcmp(soc_dev_attr->revision, "unknown"))
-- 
2.17.1
