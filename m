Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937D1C433EB
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 09:20:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7483920786
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 09:20:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBcDnC8p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgG1JUH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 05:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728271AbgG1JUC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 05:20:02 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6890C0619D4
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 02:20:01 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y18so10591056lfh.11
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nTEYoYUagTTUVqipQAp692MJ5fXnO5ESwesa/LZYugE=;
        b=MBcDnC8pYd9WqxK8HbtkHiHIfwhUKE/0KC4CsT/0MK7hoVPMZKd25m80MCMNJkywJn
         hKjsYXdrnTjtX291O1pBvLfC6fnpDQ8p1j50tkC4fZzLh6d+Ex34/AfnM9Fc0YMq5cAD
         /+yzYRtQwQbhs1kc426jy2vye2e9fdNYiWt2WMK16g8xGlyN1PBji4UjGB86mdz0/co4
         D8lB6v4ib634Iq3MEDBNvDojiBl9+9srgDRyVZwZS1aWJLTDB5Xnog/lDrzHbfuwqLXe
         mTiwLQfqhQJxln4x8rvetnKVzUjGSkWjlVpMA7n9hRwxY94bDBb9toviG89HCtb+O5It
         1OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nTEYoYUagTTUVqipQAp692MJ5fXnO5ESwesa/LZYugE=;
        b=jOdQKp/MOOpwQA8tHsnKr2CbCswfYTFBxzfEZItDMtllij/vvNo0jCsobKaEOREPM2
         LmredBe+XjO0X7bqsiyvc4wl2AHZHxrArcZXDMuFiwiQ3rMJauceG4pkgZlX/A0LeIRZ
         OMqQZEQjZ3DC0Dg6yPtMEIPIAJSSo4KG/KSyls5vhZuvebGYN1xY60n9jAUahZ0Vs7G8
         t4HctvEe9OmnGFAJpnlGh+eiSFQzl3YuJpJnxYf9EFia5gBsSXfcTlFcUQiFaP79qapP
         0uuF/+7LGt3RGttkGlEahoLcboU9AVM3g6XUNjEgNQIUUT0wW2eOmRccEyTtMYrAvvK1
         NMxw==
X-Gm-Message-State: AOAM533UCHRoOslDfWOl270344BR0gW1WoFyVi4gzbsSVHJKjPKPnjrW
        kjKdisJD6KGxpb5gA3vpLQkU0w==
X-Google-Smtp-Source: ABdhPJwH1yrgceQtuctCUZdXGTlEq9oO+R1j+a2uwf4L7+TbtEoo4Hlf9bOLvPV/4jAYSBe66hEOYw==
X-Received: by 2002:ac2:4c05:: with SMTP id t5mr3851846lfq.89.1595928000352;
        Tue, 28 Jul 2020 02:20:00 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id q22sm3643270lfc.33.2020.07.28.02.19.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 02:19:59 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, robh+dt@kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        wmills@ti.com, praneeth@ti.com
Subject: [PATCH v4 5/5] irqchip/irq-pruss-intc: Add support for ICSSG INTC on K3 SoCs
Date:   Tue, 28 Jul 2020 11:18:38 +0200
Message-Id: <1595927918-19845-6-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1595927918-19845-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS IP,
commonly called ICSSG. The PRUSS INTC present within the ICSSG supports
more System Events (160 vs 64), more Interrupt Channels and Host Interrupts
(20 vs 10) compared to the previous generation PRUSS INTC instances. The
first 2 and the last 10 of these host interrupt lines are used by the
PRU and other auxiliary cores and sub-modules within the ICSSG, with 8
host interrupts connected to MPU. The host interrupts 5, 6, 7 are also
connected to the other ICSSG instances within the SoC and can be
partitioned as per system integration through the board dts files.

Enhance the PRUSS INTC driver to add support for this ICSSG INTC
instance.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v3->v4:
- Move generic part to "irqchip/irq-pruss-intc: Add a PRUSS irqchip
  driver for PRUSS interrupts" patch and leave only platform related
  code.
v2->v3:
- Change patch order: use it directly after "irqchip/irq-pruss-intc:
  Implement irq_{get,set}_irqchip_state ops" and before new
  "irqchip/irq-pruss-intc: Add event mapping support" in order to reduce
  diff.
v1->v2:
- https://patchwork.kernel.org/patch/11069773/
---
 drivers/irqchip/Kconfig          | 2 +-
 drivers/irqchip/irq-pruss-intc.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 03e6ac1..d3297b7 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -495,7 +495,7 @@ config TI_SCI_INTA_IRQCHIP
 
 config TI_PRUSS_INTC
 	tristate "TI PRU-ICSS Interrupt Controller"
-	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE
+	depends on ARCH_DAVINCI || SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE || ARCH_K3
 	select IRQ_DOMAIN
 	help
 	   This enables support for the PRU-ICSS Local Interrupt Controller
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index c13ba14..a56065b 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -623,11 +623,20 @@ static const struct pruss_intc_match_data pruss_intc_data = {
 	.num_host_intrs = 10,
 };
 
+static const struct pruss_intc_match_data icssg_intc_data = {
+	.num_system_events = 160,
+	.num_host_intrs = 20,
+};
+
 static const struct of_device_id pruss_intc_of_match[] = {
 	{
 		.compatible = "ti,pruss-intc",
 		.data = &pruss_intc_data,
 	},
+	{
+		.compatible = "ti,icssg-intc",
+		.data = &icssg_intc_data,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, pruss_intc_of_match);
-- 
2.7.4

