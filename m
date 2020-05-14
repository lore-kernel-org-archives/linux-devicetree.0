Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C01C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:01:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97E562065D
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 08:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="sy1VaUH3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbgENIB2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 04:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726159AbgENIAN (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 04:00:13 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150F9C05BD43
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:00:12 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id g12so31303028wmh.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 01:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hGk6SHkwZ0/IFFGnE1iOAP01F59WjRCQF/3H+v3exE4=;
        b=sy1VaUH34NUebXKcvazHWXxPF3ogvwlwIUiwdr//8TZImO1DzPnfHcTTZcIhBS2t/I
         Qtz3nDiCiZ5pQS4wSr6e0/W22c8uNiAYlEeHd8fIYxiJiPKBfex5hi0ce7n8Fhr0+9wa
         AbBd8vdDewHJDp4jNw8kHPOel9OBU2sY66VvLM5e4uEu6Gm8EdeBBbtGWKRQRCiVZ1uE
         06unoy6QL1YcMQtVm38WtgYVV2to6HPRNnV1qZTXU7IICbxebW47wE4iLEHHDatV3H3K
         6bBJXYtxb0k3v4LtjawRCa9xGcftkVmdzRZMERNYGj2uveFxL+9fwRDpzPprIiY5/R2M
         9fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGk6SHkwZ0/IFFGnE1iOAP01F59WjRCQF/3H+v3exE4=;
        b=fuRx2F9//9UJXGiPhtuMwYkZdA7lTVH8fEvEXI2DsebUuiBRngHIT9JXgmRm8ok0BK
         +rASszEiwbHMQuj1nL+Ee+zF1lIC5XPkLrjZEGlqt5ZMqpy6rBdqy+EC7DsCGIlSDQVR
         6XL6UXNf3YST12csyiWDT+bE/YJ+OtgLZ9CfaBTpdDk/NZKZtp6rYl7XKl4PMgaVYNIw
         lxnW4SrkjY7i8pdCVMCJnoNcc0pEi5gknJf9GY0hIe6ZvHu7MIsKKClg4pboIBohwppT
         33ACB/ZjW03o2mhlAegDdHokwUdj6NhpfztIJLsDQP0hVZCAXFOh8VfpQF5cJ6+iIH6Z
         rWmw==
X-Gm-Message-State: AGi0PuazMAtlSO4AAXLxasl8u9C8bU7ecGorAPY5MWTi7Tygl2nHi9Bg
        oP4aS1DIHolakUuxv/OBSql35g==
X-Google-Smtp-Source: APiQypKTmELbtmt9F3Y+bsG9moFkBY9H/xGDo99tpE05kdW0Y8evm2kVDCSS/WwL66naHiCax7tGDA==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr47408066wmy.30.1589443210396;
        Thu, 14 May 2020 01:00:10 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 01:00:09 -0700 (PDT)
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
Subject: [PATCH v3 04/15] net: ethernet: mediatek: rename Kconfig prompt
Date:   Thu, 14 May 2020 09:59:31 +0200
Message-Id: <20200514075942.10136-5-brgl@bgdev.pl>
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

