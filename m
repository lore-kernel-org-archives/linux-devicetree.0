Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CD8C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:55:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F50A20714
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:55:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvkF5Wb4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgG1Czt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 22:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgG1Czs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 22:55:48 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC06C061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 19:55:48 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o13so11091722pgf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 19:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=etR2ncs18vgJbAdIWyCeb1uJq/TbjsZdQrwX72WYY3o=;
        b=KvkF5Wb4msJY05g+xyOomJxBfCmyXBjzZukMrcyHF3XWtg3jnGJuhFwC6qBmUquXiP
         QP4Fcx7xO7KtRj8f5akD29mJU4+M6DF/XJUE4CTVbpGe6p9VySOroq+AErRO/baRx5FW
         yNqnJlDMT8RaP9+7ci1OU1IHk/Yi+5kMOVxSzA8Cz7/O+zdUHTv/tZE71tE/2zoZ6e3S
         CMZ7rsG5Xuq9QUp75Ompge6vanhjHbE4+pb30tvJqGrKzBnHbcvz+mwKAUc02APecPbk
         pYsMM5L3fI5ujcccmgTzF8RvdJwXuD666JjFKHHbo5t7aqlURwXFi3tgPtvpfYuhkBKc
         weXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=etR2ncs18vgJbAdIWyCeb1uJq/TbjsZdQrwX72WYY3o=;
        b=DeWsR0xTb208t1MfdZ7eMaydcvlLMcVUZINmdbB6hh76N7lMkZEyjjH9EbgEoTReh7
         W5c9cF05WT8izq6CUtYWRaKIrWdTR6HywcWdOjf1gQPm6ShYficl4zMdIwiaZF7w2Y8u
         34ORWhFa56jBxvSg2QC5BZeCrhPR0r+wI5++IlLfKA3gUAPW5rm9Lju0XqlKKPAZqB2V
         6g0+fai5hOf34tXHnMmbemy7mS230i9xSnsmf8iGW7Zx3vLy0bY4x/3CNZxaGkWM5t/G
         Aqb4Z0zMWQ5LYllWAf51FZ/bqFc1LDZZWP3zEu84FU1GH/VOK+TdAuscXh3ClBWjZWPq
         FprA==
X-Gm-Message-State: AOAM532gPCKT6faaYC75wKzZhJZU84MPN27PmCJAnngT1bA0tScYah/0
        hSu2ryzCZFiavDBzkzPi7HkHnpRH83A=
X-Google-Smtp-Source: ABdhPJyqEI/lCzk4+OYvmGLKS68lPcaaIcW1M8qCySclFW71gCmiH/TXMYjvFFsY+PUkox3lfB21Tw==
X-Received: by 2002:a65:4549:: with SMTP id x9mr21970729pgr.415.1595904948210;
        Mon, 27 Jul 2020 19:55:48 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id w9sm15147407pfq.178.2020.07.27.19.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 19:55:47 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     linux-fsi@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 3/5] fsi: aspeed: Run the bus at maximum speed
Date:   Tue, 28 Jul 2020 12:25:25 +0930
Message-Id: <20200728025527.174503-4-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728025527.174503-1-joel@jms.id.au>
References: <20200728025527.174503-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Testing of Tacoma has shown that the ASPEED master can be run at maximum
speed.

The exception is when wired externally with a cable, in which case we
use a divisor of two to ensure reliable operation.

Reviewed-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index c282de76e6e7..f503f64ab32b 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -83,7 +83,11 @@ static const u32 fsi_base = 0xa0000000;
 
 #define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
 
-#define DEFAULT_DIVISOR			14
+/* Run the bus at maximum speed by default */
+#define FSI_DIVISOR_DEFAULT            1
+#define FSI_DIVISOR_CABLED             2
+static u16 aspeed_fsi_divisor = FSI_DIVISOR_DEFAULT;
+
 #define OPB_POLL_TIMEOUT		10000
 
 static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
@@ -385,9 +389,11 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	opb_writel(aspeed, ctrl_base + FSI_MECTRL, reg);
 
 	reg = cpu_to_be32(FSI_MMODE_ECRC | FSI_MMODE_EPC | FSI_MMODE_RELA
-			| fsi_mmode_crs0(DEFAULT_DIVISOR)
-			| fsi_mmode_crs1(DEFAULT_DIVISOR)
+			| fsi_mmode_crs0(aspeed_fsi_divisor)
+			| fsi_mmode_crs1(aspeed_fsi_divisor)
 			| FSI_MMODE_P8_TO_LSB);
+	dev_info(aspeed->dev, "mmode set to %08x (divisor %d)\n",
+			be32_to_cpu(reg), aspeed_fsi_divisor);
 	opb_writel(aspeed, ctrl_base + FSI_MMODE, reg);
 
 	reg = cpu_to_be32(0xffff0000);
@@ -446,6 +452,11 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
 
 	/* If the routing GPIO is high we should set the mux to low. */
 	if (gpio) {
+		/*
+		 * Cable signal integrity means we should run the bus
+		 * slightly slower
+		 */
+		aspeed_fsi_divisor = FSI_DIVISOR_CABLED;
 		gpiod_direction_output(mux_gpio, 0);
 		dev_info(dev, "FSI configured for external cable\n");
 	} else {
-- 
2.27.0

