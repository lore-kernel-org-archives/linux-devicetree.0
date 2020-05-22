Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F86C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 12:08:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51CCB2072C
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 12:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="BJ3OIkLm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729946AbgEVMIY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 08:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729353AbgEVMH1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 May 2020 08:07:27 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4206BC08C5C0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 05:07:27 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f134so8444949wmf.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGk6SHkwZ0/IFFGnE1iOAP01F59WjRCQF/3H+v3exE4=;
        b=BJ3OIkLmKDJd8mJGXMOAEO0RYtZ+BzOIsHcG2UTpazbPreZ6uDY2fuZCBNsWnHPZjT
         xuescNUhGBE8SFaTTfNfcabLq8y2VIiMaEMMogTnG1fWAg7mF5jI42aIffPUTPA+iePW
         H1+GJn6TtGrfuwlTv2N2j+z+8FJe8t5Tkty0XiPLO8fEfBDLOX5xVk8vM2bkcyuYUIiG
         6s5XAFWCd8aPysT8MuuczJuWiSYnGUnSFXTw1UdujFdRbRa6bEVoWEbUCrd77lm4pXBG
         BJzOUC0xV1s37znu6SdHGwFgX+Imn6MDlvjRUTS+1uVNKUo0q6QE4VM7f6spU26/iS3X
         hWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGk6SHkwZ0/IFFGnE1iOAP01F59WjRCQF/3H+v3exE4=;
        b=iubbo8qK4/Ygr26zruoslJbHSBPmTUATjIACCGDRiPlJPZ9dqliEP4jWBC2oeHQKv5
         FbQvQw4o+bBi628Ei6WmrdNDRj5my8qBRXbNk8ZaKpCrVGinvz7fl52BQ27dYOxfFktw
         5XElgWuC3Jm5Cgc7oSloeneG6/q5V0liy65bY22ldybnFXIoB1At/3Tzoe5gWd9dufP5
         NX4RhgUZj4oFbu3LbUo0TN37GdpeQG35meg8vyP95lrUG8rPSQi7emNCxfezkNKFtSa7
         Ojc/q3Gp06HzoGMbb4ZpXyDRnpbf3UVaS2GPzMyZuNnBQhuXjR1ZfuSv1qnD8TRMNAC9
         08Tw==
X-Gm-Message-State: AOAM532+rHI2l2raium077vE3b0MxkcjWKzLi+BdaBCzH4XrlnZnxBN0
        NCit19aGB582pyZoyIV/gsjxlw==
X-Google-Smtp-Source: ABdhPJzPM9n4wz+olrOocFVpzas4NvH7xuF1o9DtfGChG8Sh1pIB0aDKJyKMN7cmRko0riD9kvETNg==
X-Received: by 2002:a05:600c:2146:: with SMTP id v6mr13654376wml.142.1590149246036;
        Fri, 22 May 2020 05:07:26 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id f128sm9946233wme.1.2020.05.22.05.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:07:25 -0700 (PDT)
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
Subject: [PATCH v5 04/11] net: ethernet: mediatek: rename Kconfig prompt
Date:   Fri, 22 May 2020 14:06:53 +0200
Message-Id: <20200522120700.838-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200522120700.838-1-brgl@bgdev.pl>
References: <20200522120700.838-1-brgl@bgdev.pl>
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

