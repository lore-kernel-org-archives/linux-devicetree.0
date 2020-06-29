Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF26C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:44:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C49F520663
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:44:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="nQ9byLrD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389481AbgF2UoI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 16:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731612AbgF2TOA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 15:14:00 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10B7C00E3CF
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:04:18 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g75so15105439wme.5
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vANIsXo74NzXiDIyR10LVPoVvN0SF3cCppVREngNaSg=;
        b=nQ9byLrDn58wjHMhoadRsTTETa0UhC6JF4a46q+PYUs7UZGZeUDV+Ialz0dd7h+UZR
         mhqFHyY0EbcDbESld8SYOxPhwBLpUwtVkb7pnzsNitFSbO7EEfGSOy2q2y7CP79Hex0H
         1b+M8CdLjEStcijSVXMq80kujGFckpNmUPo54ebhhky847n6l7blHRFboEfpPZTyy81E
         MMdTQ19QQn9i1JzgLPdR6Txwa+fNw+Wy8dARSM1y/DGypJ0Whb8UBnHg8y/LnybqbSGv
         f43pJWnxIJUXGw1WzhE2J9N+9sBt5Oq9JRyYdz9w5VzjVb+Gsr45rKUvPRAqZkU/fFCF
         warw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vANIsXo74NzXiDIyR10LVPoVvN0SF3cCppVREngNaSg=;
        b=Cgd0ydYue5ecEy0pzr0rHG99gwwQoXSO1TItI2pIaQGZFKgBmUwODrfO43psozYMdO
         K648K/tVUtWy4Oc2XAMWXVk+Nz73EoA4raut9QGFTn+aSv+7g/MOywCzjSazLSLyrrg1
         Sjs4fctd6EhmjRCjeinvbLC2GumhnW39jv1BwvkDxvO5iFU+Fh5LHViFTotL+Kogm3GQ
         uRFZze3hZfXwnOGANBmKBHY/mnbw67Oj80a4jSnP+LyOyYUokkKJTsId4+N8lrd1CdRm
         +mVcqvROlsx5CHrTidENcQsCV8GQjbc4jAReyCpNZpQsQjLJx6bKMx2MMi43nQO9pCoB
         LZ9Q==
X-Gm-Message-State: AOAM532X7lLOpHAn4PHds3MAHCDSPrxUgMxM15Nso086XiceAl0aWv5C
        yE9gBO3zV1ckJWHm8y6GlDITJA==
X-Google-Smtp-Source: ABdhPJzzIpHdKMTQ6SjqhWeqI//sR8Iftgms6VcGQcyabxIbGKuFkf8bRkm3ckDgSAITcNYh0w9Y4Q==
X-Received: by 2002:a7b:c746:: with SMTP id w6mr17250018wmk.171.1593432257471;
        Mon, 29 Jun 2020 05:04:17 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 05:04:16 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 04/10] Documentation: devres: add missing mdio helper
Date:   Mon, 29 Jun 2020 14:03:40 +0200
Message-Id: <20200629120346.4382-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629120346.4382-1-brgl@bgdev.pl>
References: <20200629120346.4382-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We have a devres variant of mdiobus_register() but it's not listed in
devres.rst. Add it under other mdio devm functions.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index e0b58c392e4f..5463fc8a60c1 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -343,6 +343,7 @@ MDIO
   devm_mdiobus_alloc()
   devm_mdiobus_alloc_size()
   devm_mdiobus_free()
+  devm_mdiobus_register()
 
 MEM
   devm_free_pages()
-- 
2.26.1

