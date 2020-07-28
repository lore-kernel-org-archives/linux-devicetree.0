Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D0BC433E8
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F19920759
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ozzO8Eqz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgG1Czx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 22:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgG1Czw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 22:55:52 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AF3C061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 19:55:52 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id f185so5209909pfg.10
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 19:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LSKd0G5Txp3QCoH0wblOaMdjCRcT0SQZyQIDSr/GeGM=;
        b=ozzO8EqzqybbL7ON31QioltDqBbDlQAkv8dbA2uiGm7Z7h8yLUFqMHddmxSsQuoUIn
         twUEUjYyNeesMrtzbv/MqY5JKwjrwl3+zT3pPyHxH0lXBPMPG30ZxrqZA00Op3EapAST
         /H8gkAZhQKHzXg1uZSTC8cbadi/94tGJ3nMzpfXJMOSL59OHoBPU1RMLCUJk+uBQVDEu
         uBrkJyjBnn7kw3VCf/3qoh9kmEu9EOOc9lIzabEIdBeEO0Tpau2Zd5g3y2QikOgRzGID
         gqlnX9fKazhPZK28L+dPlLYEvm8wp4irfELCrzBXQhW/E+S2PFAoI0blh0617tUiPcha
         LhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=LSKd0G5Txp3QCoH0wblOaMdjCRcT0SQZyQIDSr/GeGM=;
        b=bsYpBApdZ/xrZFM6OBvzM25oFMqgXTWyiXK4HI5BHzQ4M+mwGsm50pMO5rkExsuy9P
         uEF4HIY4aco5xbhE2v2XUpSaZs0OTFDEXT4Y3MDVk0U4PRxbgwA+8BRyd/zV4iYSm6cl
         i/yUv+bTXIc6azHJnRaIciqkFwg9Y8nZwz+HXlJIl7/LNlvmVWUEQxSFlzeZt3WsQhdc
         MXldEmNoajNxn2Vj4gnkyvh7yZg1MSifxE3SCGxDjabBj5QeZwYsU/+pWmdzx3673s51
         Ewi275CXFwBYx2pzw2PnDK5jZ5DwG5fuOwgdfcchf1rzV1aC1F+N1ZB3r1w7XDzbbfWC
         3B2A==
X-Gm-Message-State: AOAM530xs7WUaqNQdvBtgahKj3lYeSiQLUkiTcnwy0mXnyKqkZX/dhPZ
        uZaJCw75mT5pwJ6UETt30VA=
X-Google-Smtp-Source: ABdhPJz1jvzbg9lif0geIL/79cRtoqM0ogGNeVTpK8rAn5SyGc6I7ZdN/0EmA0Mqw5hu0GD548OfWw==
X-Received: by 2002:a63:7cd:: with SMTP id 196mr22043450pgh.230.1595904952308;
        Mon, 27 Jul 2020 19:55:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id w9sm15147407pfq.178.2020.07.27.19.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 19:55:51 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     linux-fsi@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 4/5] fsi: aspeed: Add module param for bus divisor
Date:   Tue, 28 Jul 2020 12:25:26 +0930
Message-Id: <20200728025527.174503-5-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728025527.174503-1-joel@jms.id.au>
References: <20200728025527.174503-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

For testing and hardware debugging a user may wish to override the
divisor at runtime. By setting fsi_master_aspeed.bus_div=N, the divisor
will be set to N, if 0 < N <= 0x3ff.

This is a module parameter and not a device tree option as it will only
need to be set when testing or debugging.

Reviewed-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f503f64ab32b..2531e826ba8b 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -87,6 +87,7 @@ static const u32 fsi_base = 0xa0000000;
 #define FSI_DIVISOR_DEFAULT            1
 #define FSI_DIVISOR_CABLED             2
 static u16 aspeed_fsi_divisor = FSI_DIVISOR_DEFAULT;
+module_param_named(bus_div,aspeed_fsi_divisor, ushort, 0);
 
 #define OPB_POLL_TIMEOUT		10000
 
@@ -454,9 +455,12 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
 	if (gpio) {
 		/*
 		 * Cable signal integrity means we should run the bus
-		 * slightly slower
+		 * slightly slower. Do not override if a kernel param
+		 * has already overridden.
 		 */
-		aspeed_fsi_divisor = FSI_DIVISOR_CABLED;
+		if (aspeed_fsi_divisor == FSI_DIVISOR_DEFAULT)
+			aspeed_fsi_divisor = FSI_DIVISOR_CABLED;
+
 		gpiod_direction_output(mux_gpio, 0);
 		dev_info(dev, "FSI configured for external cable\n");
 	} else {
-- 
2.27.0

