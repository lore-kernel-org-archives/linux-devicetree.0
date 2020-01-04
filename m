Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984D1C3276F
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 06:35:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66CAB2465B
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 06:35:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1wY7mau"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgADGfQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 01:35:16 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43263 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgADGfQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 01:35:16 -0500
Received: by mail-pf1-f194.google.com with SMTP id x6so23380193pfo.10;
        Fri, 03 Jan 2020 22:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SloPzaQUm48i+euJ9SPgozPrNYGcAsYY8nvYw6D2HVg=;
        b=Y1wY7mauLBv7oaOllvmoHt99Z978+COG6HD/v3ZS9aRqidQWRBkkI9tf1M8ukgmWst
         AuruzHyn6ayI1c+1wqkA8ddbjl7wx+a9iKgAztxNlPcOKOQZc6g7MrZmYr5GJ8N8NTgN
         gv837uuURUGlAopvFZYTNTSjErozvuOQh9RflUcrzg9cc2Idul8rDTerV884kMbOtLUR
         tORJnoCo1YOFtfBaQQT7m1OWvaOjNVPQ+7ZrI54+5PPzS4EHJj2KFYxjYYaC+qQY8W/6
         mq146l/vhc6g1KxupAoW4PpoyXVQkMIp89JtodfVSKz2cax1KNWsCwEmgKTg94MaqVVD
         qtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SloPzaQUm48i+euJ9SPgozPrNYGcAsYY8nvYw6D2HVg=;
        b=s9cL8sAzp7mDPOVrMSEfvloN5FNNrP8H+U6GAa8GJCYRr8qOYxFop+jG27LZ8J2g9g
         Uvj+yWmRvgw5Y5rmwJE3KH1gMytw7axxU3Rd2Jz4PnwZf8K0XAGxdwUsGq/6vN4t5cny
         eVK8WG3shCAVQEtvo6u7HJpdYOvnhs/Wc9u5qIz0PShPbL3MImffQkbSUwjLlBlzcUvD
         En5gka96QJFn5sXqUrYQjAGDfC2X+Z2TccpNyDjCUpW4gWdCQcJpdv5nEH95VQDxEGBz
         KkHyQH/uexmUzfTNulVrodjIAEDvD1xrfTgYeZWRE9HON/UKeb0ppaGMNB5PS0ciMaVp
         YVVQ==
X-Gm-Message-State: APjAAAWidFMqa3Cm+zk2O2MWv6tqF0sWwRiXngMs6KXEVEn416t7Acc8
        adQTUBUU2K8+m1Ht1q2j2bU=
X-Google-Smtp-Source: APXvYqyRc2s3lo5lzbr/lBfdxvyvN66VWXyPfn741RO3s8zgkT2sjHUqc0sisIUEK81fxn9ePs6wzQ==
X-Received: by 2002:a63:770c:: with SMTP id s12mr103738254pgc.25.1578119715439;
        Fri, 03 Jan 2020 22:35:15 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id u2sm64761580pgc.19.2020.01.03.22.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 22:35:15 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Icenowy Zheng <icenowy@aosc.io>,
        Vasily Khoruzhick <vasilykh@arista.com>
Subject: [PATCH 1/3] clk: sunxi-ng: add mux and pll notifiers for A64 CPU clock
Date:   Fri,  3 Jan 2020 22:35:03 -0800
Message-Id: <20200104063505.219030-2-anarsoul@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200104063505.219030-1-anarsoul@gmail.com>
References: <20200104063505.219030-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy@aosc.io>

The A64 PLL_CPU clock has the same instability if some factor changed
without the PLL gated like other SoCs with sun6i-style CCU, e.g. A33,
H3.

Add the mux and pll notifiers for A64 CPU clock to workaround the
problem.

Fixes: c6a0637460c2 ("clk: sunxi-ng: Add A64 clocks")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Vasily Khoruzhick <vasilykh@arista.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 28 ++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 49bd7a4c015c..5f66bf879772 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -921,11 +921,26 @@ static const struct sunxi_ccu_desc sun50i_a64_ccu_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_a64_ccu_resets),
 };
 
+static struct ccu_pll_nb sun50i_a64_pll_cpu_nb = {
+	.common	= &pll_cpux_clk.common,
+	/* copy from pll_cpux_clk */
+	.enable	= BIT(31),
+	.lock	= BIT(28),
+};
+
+static struct ccu_mux_nb sun50i_a64_cpu_nb = {
+	.common		= &cpux_clk.common,
+	.cm		= &cpux_clk.mux,
+	.delay_us	= 1, /* > 8 clock cycles at 24 MHz */
+	.bypass_index	= 1, /* index of 24 MHz oscillator */
+};
+
 static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 {
 	struct resource *res;
 	void __iomem *reg;
 	u32 val;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	reg = devm_ioremap_resource(&pdev->dev, res);
@@ -939,7 +954,18 @@ static int sun50i_a64_ccu_probe(struct platform_device *pdev)
 
 	writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
 
-	return sunxi_ccu_probe(pdev->dev.of_node, reg, &sun50i_a64_ccu_desc);
+	ret = sunxi_ccu_probe(pdev->dev.of_node, reg, &sun50i_a64_ccu_desc);
+	if (ret)
+		return ret;
+
+	/* Gate then ungate PLL CPU after any rate changes */
+	ccu_pll_notifier_register(&sun50i_a64_pll_cpu_nb);
+
+	/* Reparent CPU during PLL CPU rate changes */
+	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
+				  &sun50i_a64_cpu_nb);
+
+	return 0;
 }
 
 static const struct of_device_id sun50i_a64_ccu_ids[] = {
-- 
2.24.1

