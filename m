Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE68C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 11:26:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C8D820758
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 11:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="f02nBXwL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgETL03 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 07:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgETLZk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 07:25:40 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B696C08C5C0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 04:25:40 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g14so4505583wme.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 04:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=75HMiSxkO2iGkQyQ4GVIN4XRI1pdsKTRs1XUFo380Tg=;
        b=f02nBXwLb4+yDOpRal5KJVxXzopqw7/nIX6xAZeUsGIgPvualoU9kAFP7hn05cf+Nt
         4iN992z6W9yhQF29Y26ynXaCtz+6FsZbP8aBQL1h2coANBLn9o1CgvTQlPIoaSUGQoU5
         qtE7Kg/XGNnDOtxs2MiIdXenBYl4gc/7g7JSA0xuF0npzrYh856vFbLpuh7EWgQel/yD
         +PJzkzPyDmCmB0wgJ0bh0iBQLqQNa1bUi26Wvj+iverCeG0+igs7RlReEDzBCf5hOei/
         UiGA+kRB/lRVBdgGPOhPKZWo3XcjKsYd7C0FQOUoTPHRZ4Gl8kDEn633FffNuzEXzVHE
         LLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=75HMiSxkO2iGkQyQ4GVIN4XRI1pdsKTRs1XUFo380Tg=;
        b=s5Xjq4Bl+V4eslF+xQAvPmLSMccHAj9UaBo09YXS8OUi1ipFRwt2qCofyjGvEW+wKV
         vDQNAubC+OMVZvX9VugpmY6UMABLlkmiIKwA3KK9CMtBThsRSqD+EW7SpeFeQE3VSvqz
         znE4w987uaK3udj6j7JmTmSQ+3FDvpnoQh3VLZPpzPO+K2FsEyJ5dBG19Dhz6KsWzzSv
         77AhFj1jnKg28XKLleTtnrdgNvmxVobEmUcLqgcaBIY8UhtA0vezg4Sa94958EAldM3P
         KvM1Pb4EtqrE9D+pNK/zP8o9jeZgHYGWGqn8++Z4WHhGim0YNurmg0IjK2QUu4tr6NmV
         1wEg==
X-Gm-Message-State: AOAM530zcbocMkyGvljqDHISKlMWtXUDnZXmyPOE56IV0L3MIVEDZnwm
        gHXJkj5/+dmHxeVZ8Io+XQKYdA==
X-Google-Smtp-Source: ABdhPJwE0xHr6PeSbtA1xNoXhD2SOoG7eWG3GrsBM9eyrqQ/EG9y2X0SgSbOAAb2NAS+YgXTC8DuJQ==
X-Received: by 2002:a1c:2184:: with SMTP id h126mr4173395wmh.122.1589973938809;
        Wed, 20 May 2020 04:25:38 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id v22sm2729265wml.21.2020.05.20.04.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 04:25:38 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Edwin Peer <edwin.peer@broadcom.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 05/11] net: ethernet: mediatek: remove unnecessary spaces from Makefile
Date:   Wed, 20 May 2020 13:25:17 +0200
Message-Id: <20200520112523.30995-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520112523.30995-1-brgl@bgdev.pl>
References: <20200520112523.30995-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The Makefile formatting in the kernel tree usually doesn't use tabs,
so remove them before we add a second driver.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/Makefile b/drivers/net/ethernet/mediatek/Makefile
index 2d8362f9341b..3362fb7ef859 100644
--- a/drivers/net/ethernet/mediatek/Makefile
+++ b/drivers/net/ethernet/mediatek/Makefile
@@ -3,5 +3,5 @@
 # Makefile for the Mediatek SoCs built-in ethernet macs
 #
 
-obj-$(CONFIG_NET_MEDIATEK_SOC)                 += mtk_eth.o
+obj-$(CONFIG_NET_MEDIATEK_SOC) += mtk_eth.o
 mtk_eth-y := mtk_eth_soc.o mtk_sgmii.o mtk_eth_path.o
-- 
2.25.0

