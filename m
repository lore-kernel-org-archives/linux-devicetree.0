Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A665C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 00:08:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E66BD215F1
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 00:08:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYCvHEtN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfK2AIq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 Nov 2019 19:08:46 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40587 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfK2AIq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 Nov 2019 19:08:46 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep1so12493311pjb.7
        for <devicetree@vger.kernel.org>; Thu, 28 Nov 2019 16:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CD0CzYEX/o6Zd/uHP6vbWB6WMoC+4GyO2IXO0mq1OcE=;
        b=UYCvHEtNIYBwa0Za1WBa3dxE1m+gfbQgwgTFwnEcA/XvoOoDQPKR/8UFMlICqzcOj+
         MaiJhlhqUMrtgsOx5uExZR1tttyaSvFblAYt184ik6ZOTv4D7ElSLQA9fuyY3h73bDkQ
         rMBh34ddwhMNb2b8R0DM71jQ6lHEE+jbtdygRCjjOzVJnGfjD2WeKUX2rtYvUw8uPPmY
         Za5R0DWjR/+FkKIdWP7KK6X3qhAklCtjT+lWGbE3QYN8lzaCInn9UnrqIqPGAcm0Ch5O
         G3p6h2MSgc/qUXFBfn2fsWAQxiVm+pKA4ozodjlnePLhyyTz6EAWuaoSobGxCqNcKLs1
         JxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CD0CzYEX/o6Zd/uHP6vbWB6WMoC+4GyO2IXO0mq1OcE=;
        b=GwGIH/fR8Q/o8jHYy+U0rwOnM38r8nUwYqb1TVvB1DGafhfT/RFxFgtHworpkw6qd7
         dN39S8Zlq+4nEHeWrLnFQ6io5eO1DxTbh2MaWqp/vKXyAN8pjl1PUpKiAzN5ojDvz+wV
         kCawiJHibn0v4bDgCBaOHj2EC/m6dF0IYDLZd3vse8K9gR4QRNbOZRTfskA0CrgibfV6
         jHDdiyAzidnbvGae8iCedoQMbqPwRz3BEQIOpoQbHUhdx1ZH7HbceC84JZg5MAKehPyS
         gKsLHaKDoRHr/8sy+PoSOxDQmP1ze/GfneKihnJWIjmCrQ07zZag+Y5a6HMw5ku9FmtV
         ljbQ==
X-Gm-Message-State: APjAAAWwRcaWhJHgB88lo8iHYGu21iU5USZ12uG+ltX1SSo0sgPbRRVX
        fTqQN3Et85hi9MuvIOtNChY=
X-Google-Smtp-Source: APXvYqxmjyy3ULMbqx2R9Xe9O17n8M/xUNkdlkz/MQq0OYoeEpeaKw2qXPIva5xZ4guojBbM3mviHQ==
X-Received: by 2002:a17:902:ac8b:: with SMTP id h11mr5022220plr.87.1574986125721;
        Thu, 28 Nov 2019 16:08:45 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id d188sm21302075pfa.157.2019.11.28.16.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 16:08:45 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 2/2] reset: simple: Add AST2600 compatibility string
Date:   Fri, 29 Nov 2019 10:38:27 +1030
Message-Id: <20191129000827.650566-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191129000827.650566-1-joel@jms.id.au>
References: <20191129000827.650566-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

The AST2600 SoC contains the same LPC register set as the AST2500.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/reset/reset-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 067e7e7b34f1..795c9063fe7b 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -125,6 +125,7 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 		.data = &reset_simple_active_low },
 	{ .compatible = "aspeed,ast2400-lpc-reset" },
 	{ .compatible = "aspeed,ast2500-lpc-reset" },
+	{ .compatible = "aspeed,ast2600-lpc-reset" },
 	{ .compatible = "bitmain,bm1880-reset",
 		.data = &reset_simple_active_low },
 	{ .compatible = "snps,dw-high-reset" },
-- 
2.24.0

