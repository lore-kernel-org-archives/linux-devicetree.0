Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60429C43215
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 12:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 417582067D
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 12:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfKOMbK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 07:31:10 -0500
Received: from mail-eopbgr820048.outbound.protection.outlook.com ([40.107.82.48]:33280
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727196AbfKOMbK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Nov 2019 07:31:10 -0500
Received: from DM6PR02CA0037.namprd02.prod.outlook.com (2603:10b6:5:177::14)
 by MWHPR02MB2189.namprd02.prod.outlook.com (2603:10b6:300:5b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Fri, 15 Nov
 2019 12:31:06 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::206) by DM6PR02CA0037.outlook.office365.com
 (2603:10b6:5:177::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22 via Frontend
 Transport; Fri, 15 Nov 2019 12:31:06 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2451.23
 via Frontend Transport; Fri, 15 Nov 2019 12:31:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVacc-0000lx-MV; Fri, 15 Nov 2019 04:22:42 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVacX-00086n-Jb; Fri, 15 Nov 2019 04:22:37 -0800
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xAFCMaOH011619;
        Fri, 15 Nov 2019 04:22:36 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVacW-00086f-A8; Fri, 15 Nov 2019 04:22:36 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, shubhrajyoti.datta@gmail.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCHv2 1/2] clk: clock-wizard: Move the clockwizard to clk
Date:   Fri, 15 Nov 2019 17:52:31 +0530
Message-Id: <1573820552-21164-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--8.614-7.0-31-1
X-imss-scan-details: No--8.614-7.0-31-1;No--8.614-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132182946663960875;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(979002)(346002)(39860400002)(376002)(396003)(136003)(199004)(189003)(2870700001)(498600001)(66574012)(82202003)(70586007)(6666004)(356004)(486006)(76482006)(36756003)(2616005)(61266001)(47776003)(426003)(14444005)(9786002)(70206006)(50466002)(336012)(4326008)(450100002)(86362001)(23676004)(81156014)(8936002)(81166006)(5660300002)(26005)(2906002)(55446002)(107886003)(126002)(30864003)(73392003)(8676002)(9686003)(476003)(316002)(305945005)(50226002)(42866002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR02MB2189;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a805359b-70a8-474a-2695-08d769c7afbb
X-MS-TrafficTypeDiagnostic: MWHPR02MB2189:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2189E7DA8079D0E211565D0487700@MWHPR02MB2189.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-Forefront-PRVS: 02229A4115
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F/6IQQhndFYxZ41t9jd0nh9CYgGhCD5PJANBVzn/lxO5elbqA8mWH9G2ttZKiGNeflo66ZfagWzKt/dwcFQwW6EH9O0Aif0NmQ64mijcjJBQhTerVFtIzlN3JzeIOlc8xSvmg7MKJwLCFUG8qSS77m4UXrlQICDZV+Z+d3l/3Wot8sHEe44Luj7QrGDEpk9+IXvrToFO6PDWHIGhcr0YLX8eS8XqUfjstTQOABSKtEc+L9VqH70VfcB+TvwCKaVJhpsUsd08cRFvBqBYNqXU+p/WV80+LfDNMElsawzJ/5QdsAnF3Rdz1udRo5yAjMZeSiGqw0J3+nnCLIUO+VPVYJXATWAU5ihifowPZTIjHncJDWGDNPUss6ux5Yt86k+8R16qQYj8TFCEV2EnM0Jrqu2yQzH6QzEG570gYgJj9xa1AVbF8TDW2mrbELrpSWl5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 12:31:06.1719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a805359b-70a8-474a-2695-08d769c7afbb
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2189
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Move the clocking wizard driver from staging to clk.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
this is moving the drivers/staging/clocking-wizard to clk
v2:
Added the makefile  and kconfig

 drivers/clk/Kconfig                 |   6 +
 drivers/clk/Makefile                |   1 +
 drivers/clk/clk-xlnx-clock-wizard.c | 335 ++++++++++++++++++++++++++++++++++++
 3 files changed, 342 insertions(+)
 create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c44247d..ff7d0f6 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -305,6 +305,12 @@ config COMMON_CLK_FIXED_MMIO
 	help
 	  Support for Memory Mapped IO Fixed clocks
 
+config COMMON_CLK_XLNX_CLKWZRD
+	tristate "Xilinx Clocking Wizard"
+	depends on COMMON_CLK && OF
+	help
+	  Support for the Xilinx Clocking Wizard IP core clock generator.
+
 source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/bcm/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 0138fb1..bce022f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -65,6 +65,7 @@ obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_VC5)		+= clk-versaclock5.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
 obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
+obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clk-xlnx-clock-wizard.o
 
 # please keep this section sorted lexicographically by directory path name
 obj-y					+= actions/
diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
new file mode 100644
index 0000000..15b7a82
--- /dev/null
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx 'Clocking Wizard' driver
+ *
+ *  Copyright (C) 2013 - 2014 Xilinx
+ *
+ *  Sören Brinkmann <soren.brinkmann@xilinx.com>
+ */
+
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/err.h>
+
+#define WZRD_NUM_OUTPUTS	7
+#define WZRD_ACLK_MAX_FREQ	250000000UL
+
+#define WZRD_CLK_CFG_REG(n)	(0x200 + 4 * (n))
+
+#define WZRD_CLKOUT0_FRAC_EN	BIT(18)
+#define WZRD_CLKFBOUT_FRAC_EN	BIT(26)
+
+#define WZRD_CLKFBOUT_MULT_SHIFT	8
+#define WZRD_CLKFBOUT_MULT_MASK		(0xff << WZRD_CLKFBOUT_MULT_SHIFT)
+#define WZRD_DIVCLK_DIVIDE_SHIFT	0
+#define WZRD_DIVCLK_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
+#define WZRD_CLKOUT_DIVIDE_SHIFT	0
+#define WZRD_CLKOUT_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
+
+enum clk_wzrd_int_clks {
+	wzrd_clk_mul,
+	wzrd_clk_mul_div,
+	wzrd_clk_int_max
+};
+
+/**
+ * struct clk_wzrd:
+ * @clk_data:		Clock data
+ * @nb:			Notifier block
+ * @base:		Memory base
+ * @clk_in1:		Handle to input clock 'clk_in1'
+ * @axi_clk:		Handle to input clock 's_axi_aclk'
+ * @clks_internal:	Internal clocks
+ * @clkout:		Output clocks
+ * @speed_grade:	Speed grade of the device
+ * @suspended:		Flag indicating power state of the device
+ */
+struct clk_wzrd {
+	struct clk_onecell_data clk_data;
+	struct notifier_block nb;
+	void __iomem *base;
+	struct clk *clk_in1;
+	struct clk *axi_clk;
+	struct clk *clks_internal[wzrd_clk_int_max];
+	struct clk *clkout[WZRD_NUM_OUTPUTS];
+	unsigned int speed_grade;
+	bool suspended;
+};
+
+#define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)
+
+/* maximum frequencies for input/output clocks per speed grade */
+static const unsigned long clk_wzrd_max_freq[] = {
+	800000000UL,
+	933000000UL,
+	1066000000UL
+};
+
+static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
+				 void *data)
+{
+	unsigned long max;
+	struct clk_notifier_data *ndata = data;
+	struct clk_wzrd *clk_wzrd = to_clk_wzrd(nb);
+
+	if (clk_wzrd->suspended)
+		return NOTIFY_OK;
+
+	if (ndata->clk == clk_wzrd->clk_in1)
+		max = clk_wzrd_max_freq[clk_wzrd->speed_grade - 1];
+	else if (ndata->clk == clk_wzrd->axi_clk)
+		max = WZRD_ACLK_MAX_FREQ;
+	else
+		return NOTIFY_DONE;	/* should never happen */
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		if (ndata->new_rate > max)
+			return NOTIFY_BAD;
+		return NOTIFY_OK;
+	case POST_RATE_CHANGE:
+	case ABORT_RATE_CHANGE:
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static int __maybe_unused clk_wzrd_suspend(struct device *dev)
+{
+	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(clk_wzrd->axi_clk);
+	clk_wzrd->suspended = true;
+
+	return 0;
+}
+
+static int __maybe_unused clk_wzrd_resume(struct device *dev)
+{
+	int ret;
+	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
+
+	ret = clk_prepare_enable(clk_wzrd->axi_clk);
+	if (ret) {
+		dev_err(dev, "unable to enable s_axi_aclk\n");
+		return ret;
+	}
+
+	clk_wzrd->suspended = false;
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
+			 clk_wzrd_resume);
+
+static int clk_wzrd_probe(struct platform_device *pdev)
+{
+	int i, ret;
+	u32 reg;
+	unsigned long rate;
+	const char *clk_name;
+	struct clk_wzrd *clk_wzrd;
+	struct resource *mem;
+	struct device_node *np = pdev->dev.of_node;
+
+	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
+	if (!clk_wzrd)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, clk_wzrd);
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	clk_wzrd->base = devm_ioremap_resource(&pdev->dev, mem);
+	if (IS_ERR(clk_wzrd->base))
+		return PTR_ERR(clk_wzrd->base);
+
+	ret = of_property_read_u32(np, "speed-grade", &clk_wzrd->speed_grade);
+	if (!ret) {
+		if (clk_wzrd->speed_grade < 1 || clk_wzrd->speed_grade > 3) {
+			dev_warn(&pdev->dev, "invalid speed grade '%d'\n",
+				 clk_wzrd->speed_grade);
+			clk_wzrd->speed_grade = 0;
+		}
+	}
+
+	clk_wzrd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
+	if (IS_ERR(clk_wzrd->clk_in1)) {
+		if (clk_wzrd->clk_in1 != ERR_PTR(-EPROBE_DEFER))
+			dev_err(&pdev->dev, "clk_in1 not found\n");
+		return PTR_ERR(clk_wzrd->clk_in1);
+	}
+
+	clk_wzrd->axi_clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
+	if (IS_ERR(clk_wzrd->axi_clk)) {
+		if (clk_wzrd->axi_clk != ERR_PTR(-EPROBE_DEFER))
+			dev_err(&pdev->dev, "s_axi_aclk not found\n");
+		return PTR_ERR(clk_wzrd->axi_clk);
+	}
+	ret = clk_prepare_enable(clk_wzrd->axi_clk);
+	if (ret) {
+		dev_err(&pdev->dev, "enabling s_axi_aclk failed\n");
+		return ret;
+	}
+	rate = clk_get_rate(clk_wzrd->axi_clk);
+	if (rate > WZRD_ACLK_MAX_FREQ) {
+		dev_err(&pdev->dev, "s_axi_aclk frequency (%lu) too high\n",
+			rate);
+		ret = -EINVAL;
+		goto err_disable_clk;
+	}
+
+	/* we don't support fractional div/mul yet */
+	reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) &
+		    WZRD_CLKFBOUT_FRAC_EN;
+	reg |= readl(clk_wzrd->base + WZRD_CLK_CFG_REG(2)) &
+		     WZRD_CLKOUT0_FRAC_EN;
+	if (reg)
+		dev_warn(&pdev->dev, "fractional div/mul not supported\n");
+
+	/* register multiplier */
+	reg = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) &
+		     WZRD_CLKFBOUT_MULT_MASK) >> WZRD_CLKFBOUT_MULT_SHIFT;
+	clk_name = kasprintf(GFP_KERNEL, "%s_mul", dev_name(&pdev->dev));
+	if (!clk_name) {
+		ret = -ENOMEM;
+		goto err_disable_clk;
+	}
+	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor
+			(&pdev->dev, clk_name,
+			 __clk_get_name(clk_wzrd->clk_in1),
+			 0, reg, 1);
+	kfree(clk_name);
+	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul])) {
+		dev_err(&pdev->dev, "unable to register fixed-factor clock\n");
+		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul]);
+		goto err_disable_clk;
+	}
+
+	/* register div */
+	reg = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) &
+			WZRD_DIVCLK_DIVIDE_MASK) >> WZRD_DIVCLK_DIVIDE_SHIFT;
+	clk_name = kasprintf(GFP_KERNEL, "%s_mul_div", dev_name(&pdev->dev));
+	if (!clk_name) {
+		ret = -ENOMEM;
+		goto err_rm_int_clk;
+	}
+
+	clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_fixed_factor
+			(&pdev->dev, clk_name,
+			 __clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
+			 0, 1, reg);
+	if (IS_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div])) {
+		dev_err(&pdev->dev, "unable to register divider clock\n");
+		ret = PTR_ERR(clk_wzrd->clks_internal[wzrd_clk_mul_div]);
+		goto err_rm_int_clk;
+	}
+
+	/* register div per output */
+	for (i = WZRD_NUM_OUTPUTS - 1; i >= 0 ; i--) {
+		const char *clkout_name;
+
+		if (of_property_read_string_index(np, "clock-output-names", i,
+						  &clkout_name)) {
+			dev_err(&pdev->dev,
+				"clock output name not specified\n");
+			ret = -EINVAL;
+			goto err_rm_int_clks;
+		}
+		reg = readl(clk_wzrd->base + WZRD_CLK_CFG_REG(2) + i * 12);
+		reg &= WZRD_CLKOUT_DIVIDE_MASK;
+		reg >>= WZRD_CLKOUT_DIVIDE_SHIFT;
+		clk_wzrd->clkout[i] = clk_register_fixed_factor
+			(&pdev->dev, clkout_name, clk_name, 0, 1, reg);
+		if (IS_ERR(clk_wzrd->clkout[i])) {
+			int j;
+
+			for (j = i + 1; j < WZRD_NUM_OUTPUTS; j++)
+				clk_unregister(clk_wzrd->clkout[j]);
+			dev_err(&pdev->dev,
+				"unable to register divider clock\n");
+			ret = PTR_ERR(clk_wzrd->clkout[i]);
+			goto err_rm_int_clks;
+		}
+	}
+
+	kfree(clk_name);
+
+	clk_wzrd->clk_data.clks = clk_wzrd->clkout;
+	clk_wzrd->clk_data.clk_num = ARRAY_SIZE(clk_wzrd->clkout);
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_wzrd->clk_data);
+
+	if (clk_wzrd->speed_grade) {
+		clk_wzrd->nb.notifier_call = clk_wzrd_clk_notifier;
+
+		ret = clk_notifier_register(clk_wzrd->clk_in1,
+					    &clk_wzrd->nb);
+		if (ret)
+			dev_warn(&pdev->dev,
+				 "unable to register clock notifier\n");
+
+		ret = clk_notifier_register(clk_wzrd->axi_clk, &clk_wzrd->nb);
+		if (ret)
+			dev_warn(&pdev->dev,
+				 "unable to register clock notifier\n");
+	}
+
+	return 0;
+
+err_rm_int_clks:
+	clk_unregister(clk_wzrd->clks_internal[1]);
+err_rm_int_clk:
+	kfree(clk_name);
+	clk_unregister(clk_wzrd->clks_internal[0]);
+err_disable_clk:
+	clk_disable_unprepare(clk_wzrd->axi_clk);
+
+	return ret;
+}
+
+static int clk_wzrd_remove(struct platform_device *pdev)
+{
+	int i;
+	struct clk_wzrd *clk_wzrd = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	for (i = 0; i < WZRD_NUM_OUTPUTS; i++)
+		clk_unregister(clk_wzrd->clkout[i]);
+	for (i = 0; i < wzrd_clk_int_max; i++)
+		clk_unregister(clk_wzrd->clks_internal[i]);
+
+	if (clk_wzrd->speed_grade) {
+		clk_notifier_unregister(clk_wzrd->axi_clk, &clk_wzrd->nb);
+		clk_notifier_unregister(clk_wzrd->clk_in1, &clk_wzrd->nb);
+	}
+
+	clk_disable_unprepare(clk_wzrd->axi_clk);
+
+	return 0;
+}
+
+static const struct of_device_id clk_wzrd_ids[] = {
+	{ .compatible = "xlnx,clocking-wizard" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, clk_wzrd_ids);
+
+static struct platform_driver clk_wzrd_driver = {
+	.driver = {
+		.name = "clk-wizard",
+		.of_match_table = clk_wzrd_ids,
+		.pm = &clk_wzrd_dev_pm_ops,
+	},
+	.probe = clk_wzrd_probe,
+	.remove = clk_wzrd_remove,
+};
+module_platform_driver(clk_wzrd_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Soeren Brinkmann <soren.brinkmann@xilinx.com");
+MODULE_DESCRIPTION("Driver for the Xilinx Clocking Wizard IP core");
-- 
2.1.1

