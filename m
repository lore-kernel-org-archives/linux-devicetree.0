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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299C4C43141
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 12:11:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDF0D20748
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 12:11:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfKOMLW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 07:11:22 -0500
Received: from mail-eopbgr680079.outbound.protection.outlook.com ([40.107.68.79]:32131
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726983AbfKOMLW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Nov 2019 07:11:22 -0500
Received: from CH2PR02CA0012.namprd02.prod.outlook.com (2603:10b6:610:4e::22)
 by BN7PR02MB4130.namprd02.prod.outlook.com (2603:10b6:406:fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.27; Fri, 15 Nov
 2019 12:11:12 +0000
Received: from SN1NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::202) by CH2PR02CA0012.outlook.office365.com
 (2603:10b6:610:4e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22 via Frontend
 Transport; Fri, 15 Nov 2019 12:11:12 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT006.mail.protection.outlook.com (10.152.72.68) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2451.23
 via Frontend Transport; Fri, 15 Nov 2019 12:11:12 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVaQG-0000L3-1H; Fri, 15 Nov 2019 04:09:56 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVaQA-0005WL-T6; Fri, 15 Nov 2019 04:09:50 -0800
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xAFC9oT9016644;
        Fri, 15 Nov 2019 04:09:50 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVaQ9-0005WA-J1; Fri, 15 Nov 2019 04:09:50 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 1/2] clk: clock-wizard: Move the clockwizard to clk
Date:   Fri, 15 Nov 2019 17:39:44 +0530
Message-Id: <1573819785-6762-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--5.116-7.0-31-1
X-imss-scan-details: No--5.116-7.0-31-1;No--5.116-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132182934723111685;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(30864003)(4326008)(486006)(450100002)(476003)(9786002)(2616005)(6666004)(61266001)(47776003)(356004)(305945005)(86362001)(316002)(126002)(36756003)(5660300002)(8936002)(14444005)(26005)(2906002)(50226002)(23676004)(76482006)(336012)(50466002)(6306002)(73392003)(498600001)(8676002)(82202003)(66574012)(81156014)(81166006)(107886003)(9686003)(55446002)(70586007)(70206006)(426003)(2870700001)(42866002)(2004002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR02MB4130;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b954172-804f-4a0f-8853-08d769c4e7f9
X-MS-TrafficTypeDiagnostic: BN7PR02MB4130:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BN7PR02MB413095BF4D8560B85B38871E87700@BN7PR02MB4130.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:261;
X-Forefront-PRVS: 02229A4115
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: woOuAGlt5mY0T7mvJIva9dVeeo1OkDTi+p85K4ONk27uhPBzwao5ZIYMUA2aKtzYOETMuFTqEGfWeQvfESdXTAgyMCErVgMl9b7+0ZGniy8UduDNGveyJM4Vi56GWs3spE7mJ+ibAMWo0v98omeHTJkb88nTxTP3ogezLHDAxwGLMo88DI65WA9Hg/x7YBfT77HTVl/D4K2QqZ9nwnMSIJ2MzeFCRlh8S7zWu4vawGJZhHupXyBTgSFfhCBdrUsdnlIJBly+cnUJROUqpyPRQuZX+c3pRfv2R+EQOsRlTpVskV23JGXbdhuVmGoWBPcFYEx94aELkD7l3DHntfwlYAbr906Bc4EuUzOMJt2PfFOiSz4Jp//n/ha8cgwBVIDfJJq4KdGHpqxyNk53rsS3oZIabvEIzn9oXZm/AQEgPXC6UUjyjG8EgA+Co33J2k8ZBZGiPZfHvXtJuopQX+Bf0hrGoAVOiXu6SHaZIUjN42k=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 12:11:12.0419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b954172-804f-4a0f-8853-08d769c4e7f9
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4130
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Move the clocking wizard driver from staging to clk.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
this is moving the drivers/staging/clocking-wizard to clk

 drivers/clk/clk-xlnx-clock-wizard.c | 548 ++++++++++++++++++++++++++++++++++++
 1 file changed, 548 insertions(+)
 create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c

diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
new file mode 100644
index 0000000..352e11e
--- /dev/null
+++ b/drivers/clk/clk-xlnx-clock-wizard.c
@@ -0,0 +1,548 @@
+/*
+ * Xilinx 'Clocking Wizard' driver
+ *
+ *  Copyright (C) 2013 - 2014 Xilinx
+ *
+ *  Sören Brinkmann <soren.brinkmann@xilinx.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License v2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
+#define WZRD_CLKOUT_DIVIDE_WIDTH	8
+#define WZRD_CLKOUT_DIVIDE_MASK		(0xff << WZRD_DIVCLK_DIVIDE_SHIFT)
+
+#define WZRD_DR_MAX_INT_DIV_VALUE	255
+#define WZRD_DR_NUM_RETRIES		10000
+#define WZRD_DR_STATUS_REG_OFFSET	0x04
+#define WZRD_DR_LOCK_BIT_MASK		0x00000001
+#define WZRD_DR_INIT_REG_OFFSET		0x25C
+#define WZRD_DR_DIV_TO_PHASE_OFFSET	4
+#define WZRD_DR_BEGIN_DYNA_RECONF	0x03
+
+/* Get the mask from width */
+#define div_mask(width)			((1 << (width)) - 1)
+
+/* Extract divider instance from clock hardware instance */
+#define to_clk_wzrd_divider(_hw) container_of(_hw, struct clk_wzrd_divider, hw)
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
+/**
+ * struct clk_wzrd_divider - clock divider specific to clk_wzrd
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @base:	base address of register containing the divider
+ * @offset:	offset address of register containing the divider
+ * @shift:	shift to the divider bit field
+ * @width:	width of the divider bit field
+ * @flags:	clk_wzrd divider flags
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ * @lock:	register lock
+ */
+struct clk_wzrd_divider {
+	struct clk_hw hw;
+	void __iomem *base;
+	u16 offset;
+	u8 shift;
+	u8 width;
+	u8 flags;
+	const struct clk_div_table *table;
+	spinlock_t *lock;  /* divider lock */
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
+/* spin lock variable for clk_wzrd */
+static DEFINE_SPINLOCK(clkwzrd_lock);
+
+static unsigned long clk_wzrd_recalc_rate(struct clk_hw *hw,
+					  unsigned long parent_rate)
+{
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	void __iomem *div_addr =
+			(void __iomem *)((u64)divider->base + divider->offset);
+	unsigned int val;
+
+	val = readl(div_addr) >> divider->shift;
+	val &= div_mask(divider->width);
+
+	return divider_recalc_rate(hw, parent_rate, val, divider->table,
+			divider->flags);
+}
+
+static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	int err = 0;
+	u16 retries;
+	u32 value;
+	unsigned long flags = 0;
+	unsigned long curr_rate;
+	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+	void __iomem *div_addr =
+			(void __iomem *)((u64)divider->base + divider->offset);
+
+	curr_rate = clk_hw_get_rate(hw);
+
+	if (divider->lock)
+		spin_lock_irqsave(divider->lock, flags);
+	else
+		__acquire(divider->lock);
+
+	value = DIV_ROUND_CLOSEST(parent_rate, rate);
+
+	/* Cap the value to max */
+	if (value > WZRD_DR_MAX_INT_DIV_VALUE)
+		value = WZRD_DR_MAX_INT_DIV_VALUE;
+
+	/* Set divisor and clear phase offset */
+	writel(value, div_addr);
+	writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
+
+	/* Check status register */
+	retries = WZRD_DR_NUM_RETRIES;
+	while (retries--) {
+		if (readl(divider->base + WZRD_DR_STATUS_REG_OFFSET) &
+							WZRD_DR_LOCK_BIT_MASK)
+			break;
+	}
+
+	if (retries == 0) {
+		err = -ETIMEDOUT;
+		goto err_reconfig;
+	}
+
+	/* Initiate reconfiguration */
+	writel(WZRD_DR_BEGIN_DYNA_RECONF,
+	       divider->base + WZRD_DR_INIT_REG_OFFSET);
+
+	/* Check status register */
+	retries = WZRD_DR_NUM_RETRIES;
+	while (retries--) {
+		if (readl(divider->base + WZRD_DR_STATUS_REG_OFFSET) &
+							WZRD_DR_LOCK_BIT_MASK)
+			break;
+	}
+
+	if (retries == 0)
+		err = -ETIMEDOUT;
+
+err_reconfig:
+	if (divider->lock)
+		spin_unlock_irqrestore(divider->lock, flags);
+	else
+		__release(divider->lock);
+
+	return err;
+}
+
+static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *prate)
+{
+	u8 div;
+
+	/*
+	 * since we donot change parent rate we just round rate to closest
+	 * achievable
+	 */
+	div = DIV_ROUND_CLOSEST(*prate, rate);
+
+	return (*prate / div);
+}
+
+const struct clk_ops clk_wzrd_clk_divider_ops = {
+	.round_rate = clk_wzrd_round_rate,
+	.set_rate = clk_wzrd_dynamic_reconfig,
+	.recalc_rate = clk_wzrd_recalc_rate,
+};
+
+static struct clk *clk_wzrd_register_divider(struct device *dev,
+					     const char *name,
+					     const char *parent_name,
+					     unsigned long flags,
+					     void __iomem *base, u16 offset,
+					     u8 shift, u8 width,
+					     u8 clk_divider_flags,
+					     const struct clk_div_table *table,
+					     spinlock_t *lock)
+{
+	struct clk_wzrd_divider *div;
+	struct clk_hw *hw;
+	struct clk_init_data init;
+	int ret;
+
+	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
+		if (width + shift > 16) {
+			pr_warn("divider value exceeds LOWORD field\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	/* allocate the divider */
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	if (clk_divider_flags & CLK_DIVIDER_READ_ONLY)
+		init.ops = &clk_divider_ro_ops;
+	else
+		init.ops = &clk_wzrd_clk_divider_ops;
+	init.flags = flags | CLK_IS_BASIC;
+	init.parent_names = (parent_name ? &parent_name : NULL);
+	init.num_parents = (parent_name ? 1 : 0);
+
+	/* struct clk_divider assignments */
+	div->base = base;
+	div->offset = offset;
+	div->shift = shift;
+	div->width = width;
+	div->flags = clk_divider_flags;
+	div->lock = lock;
+	div->hw.init = &init;
+	div->table = table;
+
+	/* register the clock */
+	hw = &div->hw;
+	ret = clk_hw_register(dev, hw);
+	if (ret) {
+		kfree(div);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw->clk;
+}
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
+	clk_wzrd->clks_internal[wzrd_clk_mul] = clk_register_fixed_factor(
+			&pdev->dev, clk_name,
+			__clk_get_name(clk_wzrd->clk_in1),
+			0, reg, 1);
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
+	clk_wzrd->clks_internal[wzrd_clk_mul_div] = clk_register_fixed_factor(
+			&pdev->dev, clk_name,
+			__clk_get_name(clk_wzrd->clks_internal[wzrd_clk_mul]),
+			0, 1, reg);
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
+		clk_wzrd->clkout[i] = clk_wzrd_register_divider(&pdev->dev,
+								clkout_name,
+				clk_name, 0,
+				clk_wzrd->base, (WZRD_CLK_CFG_REG(2) + i * 12),
+				WZRD_CLKOUT_DIVIDE_SHIFT,
+				WZRD_CLKOUT_DIVIDE_WIDTH,
+				CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO,
+				NULL, &clkwzrd_lock);
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

