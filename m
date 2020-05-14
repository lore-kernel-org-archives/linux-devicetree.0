Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48D7C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:01:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9222020575
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="SidQb2k3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgENIB1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 04:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726072AbgENIAN (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 04:00:13 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D80C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:00:13 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so2616810wrt.5
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=75HMiSxkO2iGkQyQ4GVIN4XRI1pdsKTRs1XUFo380Tg=;
        b=SidQb2k3EhXCryAgRq6gIPuNO1gSc1ymSxmVWmaAMjWgIA8V7nqMU6gzB5DHBHPwUA
         tbB5YxAQ3a8Y9XCmyxdwx7HmOh5WdFDKBHtWMJJxPLgeXTgBOgqAMBm+PK+eh5D7yM+v
         8HA+rZQ5NsDizXjPwTnrqGlHMsaAXQAvKtARpjRHk0erwPsnkhwsgB0cO59MoGtN4HyH
         Sso5t3yIewzdpRasYjH4Buni7el0CFRHSV9X6JcQdvImZbW9asceazSSx6KVXVW+eluY
         nN61T0d4cD8Hl5LM8eWKTtX0oGIz0iIvfzksYD3TNEzS7mmVo1utx1a2uqDICPUVNhHK
         fhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=75HMiSxkO2iGkQyQ4GVIN4XRI1pdsKTRs1XUFo380Tg=;
        b=YmkHv3q4nujRQNS02QqW4frkmYnyGhU/z95D400jXAYD4jx6DjefvfPvPzrEwnrRh7
         LiGzuqY1qPUEh6VuhyGv/zAo0yl9V0350dCQCYIGyYQFjpOZtdMNK8HqugGETrkwKbU1
         bHuwBmfhl8u/SfZkjGJRVytOPVFafVgaz2wf8Pp+Yd8TfWMfTZ4n1pqV/WKRrJr20vuO
         frCYQeBNKGCV17J1G41zhNTsDlRAcSvpgl4ALDe5n4e0ER8YblLKX/lXca3psyhy914j
         DkSqNre44YZYz1MEMRl1XH1Hf5I0wRDUY6x24/vGxXult/4DSGFn88fgkP2ff4B7M/K9
         1IuA==
X-Gm-Message-State: AOAM530Y13n65q8vd8GL/F9Fd2okyhLxUYYsyXqLYzMbzyJGLcc//TSt
        cUcRaG7cvtiZrtcRk2gUe4R2sg==
X-Google-Smtp-Source: ABdhPJyPB8tR3ALwj2/06aB+MU3MgeCuCaNoqPzuspDC4TKtFqqj7Hvg40WVJk8Hlp8ZczryagK4ew==
X-Received: by 2002:a05:6000:1104:: with SMTP id z4mr4196133wrw.57.1589443211875;
        Thu, 14 May 2020 01:00:11 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 01:00:11 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH v3 05/15] net: ethernet: mediatek: remove unnecessary spaces from Makefile
Date:   Thu, 14 May 2020 09:59:32 +0200
Message-Id: <20200514075942.10136-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514075942.10136-1-brgl@bgdev.pl>
References: <20200514075942.10136-1-brgl@bgdev.pl>
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

