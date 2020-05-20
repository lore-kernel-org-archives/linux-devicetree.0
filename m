Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23DAC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 11:26:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C128D20758
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 11:26:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="1u1GCCM5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgETL0g (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 07:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbgETLZi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 07:25:38 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D3AC08C5C2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 04:25:38 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id v12so2704744wrp.12
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 04:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGk6SHkwZ0/IFFGnE1iOAP01F59WjRCQF/3H+v3exE4=;
        b=1u1GCCM5c2bb6qe8/N+8q+djj3EHhrgKlG/lCEqSBMbFDOv7cQzuicnqTk22ujLZQy
         XOYPOEuTzeKhoYE02Lkd9aWAYQ2h1yx2ieqL21zBzokQqE5kxB5HjTKsiP36oSzvpEJH
         ffn/2YDsVdgjkZTdQY0NV+IN5rZ10d7VOBYfLqFF/K6J7Ae7qR5jIqeyN23WPXOZwoDl
         0hOl7ks9rQkTYmlrNpkx2U/kuhA8YJWIqwnGfeIXJZ48kChLVMF/yL1KbFO9HTiB/htH
         SFCG4OXKsl1FInWE0Q3VDWBkVRTcIJIExlxnygAuBOXjyz6wlJ41PGSP9LTTQDmaQusR
         yPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGk6SHkwZ0/IFFGnE1iOAP01F59WjRCQF/3H+v3exE4=;
        b=LlwFULq2xEWt7A2UjjE31ba6kHAt+fhATPwxuzRgDkckAUs1pD2oMyoTWT/6AOLBzx
         kRJ/XCxpcIOD1K8Zg2EYi33GNx3Eigfs5coqiMx/EgKwRS5v+N/Q0zq78v2mCp/+/b6m
         rdiTl2A9ieDvhppB51NwzYOsDePXH3ngZx5tAO9oyighyUzWRR2JFS/gFT2Q2YigWJT4
         jHmwAthLLU3YXKCLWwzJkQB8NVJMDB+3k9RARxsT+VHNDh4JU97ZF+uj1WgPAs+bQpyk
         xsGfIqnH3SYfYyDGCXbxQAfhRjR88GFzV9Nya7uwFjaANodVaaG8zfj7EB4NWhphAqB3
         gFEA==
X-Gm-Message-State: AOAM5320jqk5z9HNbAD6thysuwThDcwtSaj25163FFRimXBUrgqlCg2a
        gEhMQYD6bcQrkVAX6Gdh+wK+zQ==
X-Google-Smtp-Source: ABdhPJwPv1ax+P99yWCKiaCy0kws5G6OxIcHrZdun4qt8M4YjOs6PnOFsrTm5BaB+LGdlSH65WIKPw==
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr3742481wrm.404.1589973937274;
        Wed, 20 May 2020 04:25:37 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id v22sm2729265wml.21.2020.05.20.04.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 04:25:36 -0700 (PDT)
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
Subject: [PATCH v4 04/11] net: ethernet: mediatek: rename Kconfig prompt
Date:   Wed, 20 May 2020 13:25:16 +0200
Message-Id: <20200520112523.30995-5-brgl@bgdev.pl>
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

We'll soon by adding a second MediaTek Ethernet driver so modify the
Kconfig prompt.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
index 4968352ba188..5079b8090f16 100644
--- a/drivers/net/ethernet/mediatek/Kconfig
+++ b/drivers/net/ethernet/mediatek/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config NET_VENDOR_MEDIATEK
-	bool "MediaTek ethernet driver"
+	bool "MediaTek devices"
 	depends on ARCH_MEDIATEK || SOC_MT7621 || SOC_MT7620
 	---help---
 	  If you have a Mediatek SoC with ethernet, say Y.
-- 
2.25.0

