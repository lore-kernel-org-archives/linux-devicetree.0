Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB33C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 02:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D972620684
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 02:23:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUsNAgPN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfKZCXJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 25 Nov 2019 21:23:09 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36695 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfKZCXJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 25 Nov 2019 21:23:09 -0500
Received: by mail-pl1-f194.google.com with SMTP id d7so7412472pls.3
        for <devicetree@vger.kernel.org>; Mon, 25 Nov 2019 18:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CD0CzYEX/o6Zd/uHP6vbWB6WMoC+4GyO2IXO0mq1OcE=;
        b=FUsNAgPNgMBrg+0iybequZCMxQOlKxjlz+oXNDgAn8Jku3YSeWHZP9QDGhlkW6G0v4
         2VLkOEdhyhaeeWmCmNMnO30N8TqUHA35JVMlmoIu1jlrflWbYz+yuGG0py3W3HnFW6rb
         x3rs8PUhKP67wje1fO22KB0s3VM6KCe0BZaeoi1i2x9+psysSjMnT7GRh03eKKE1Yace
         wIMK9jr7YU0Vv+nKdySEZ0z2k8O1Dmm41DS4Zlt4OthY/prcwe3t7JfwsPdYky1ueZiu
         LmfrI39msbRnsxGpHgs9+BDcE3VlL1dbPoQ88AJWhLVZhTckHlrboyjkSIdWPE/WePF1
         7wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CD0CzYEX/o6Zd/uHP6vbWB6WMoC+4GyO2IXO0mq1OcE=;
        b=YFW03DbDlv0eMZQfUO3tMfDt7KfdRbVEGB9HRuTzicPp5cBUHvuseRQyvIhYHHl3lc
         Trh/JysVteYs9Kxol20SCPx0X6Zh9IGob65+dTuGUAp0Zy3z3zP9tMUDqJZ2ra5Cwme5
         d/o7pit3ZQ+N1oGNIki6aU8L8/x+KvT2xOFHDgrlZ/0MMkzyoNNVrW2oygPwx23O0eA1
         8E5M1Ho86+mqA7m4MzVBDON+yeS+QJN8aUdKvzS0WtOz1nTGI1mVb9y129C00nfub2os
         hz6086o3udVEfDKYRHu1W4AzMc/O8+OmpbfJevM41Z5gNl6212ebuLHm+fUS0Nl4+Cfx
         91QQ==
X-Gm-Message-State: APjAAAUdgiKFx7OTOriCedDMu4X2SeMs4r3fssoU0WOBN9OHLaguS7dN
        QikDPsvevxlQ3BI1lTb1kVmCWXONrEo=
X-Google-Smtp-Source: APXvYqw6UNaft0xfeIv2zeZrxqCAJefQOKEyciNUpcWkgvrwqQ7cKd++GUsr7IxJw5bpatflGHbbcg==
X-Received: by 2002:a17:902:6909:: with SMTP id j9mr31706313plk.136.1574734988435;
        Mon, 25 Nov 2019 18:23:08 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id q70sm666568pjq.26.2019.11.25.18.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 18:23:07 -0800 (PST)
From:   Joel Stanley <joel@jms.id.au>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH 2/2] reset: simple: Add AST2600 compatibility string
Date:   Tue, 26 Nov 2019 12:52:43 +1030
Message-Id: <20191126022243.215261-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126022243.215261-1-joel@jms.id.au>
References: <20191126022243.215261-1-joel@jms.id.au>
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

