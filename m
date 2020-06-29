Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6331AC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 19:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 478ED206C3
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 19:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="VvL4yO6j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbgF2TSt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731771AbgF2TOV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 15:14:21 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EEBC0F26CE
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:04:13 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o2so15872476wmh.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hz0iVZuquqaAZG91zpdXr2Uyq4D9Tl6Yab1oO2oLyu4=;
        b=VvL4yO6jCcGsEdtzYiLzKqRQKd+CJHaFyeqJWf7CcFeUmtn3q8wK56Ka3u84RH2/TB
         NB1CiAymp//XtqnFz5/H+ApJeRCUh/SqYJkad+wuFzUrSypwMyamn05nNgh9bLzgio/4
         QBu82NPhZZT4p9ki5bX41KR4ZogP7bglHyn0k1CHfqSTORfkjFmMOuW3F+ZcTgaapo1B
         kH2qepefaYlMyQ/1lvRS5epPqtlijcTGvri5VRyh7kANgzWCz96TsJFHbd1OpXN75CnZ
         b9jNoyvkUTRs0Vyin0UkoI4pBwLsrwpFCWDaCSYqIKh9GuRWgBS4RIRv05e4D75Eph+2
         us+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hz0iVZuquqaAZG91zpdXr2Uyq4D9Tl6Yab1oO2oLyu4=;
        b=CO2N9CcL2uMwUTOss8Kiw31ETnPfpcbl/xfDK3IcQqxP+B7JJD52DkLqvnBr3h2WAc
         f8rurbA5ZPz8LR/YQiT1SKFQWz653+y1RcFXXKnkOYDKWaGnjWRHIXS7mD/6kUTzWTH9
         mEloLkThPaSxLxaKopTeqKSjM/T6oa7DrbGP2SMu++SzU95O/S4rnTxWc+5dCkqQGGpz
         eaKjPFEqkNMMDknj74+zKTYw63XBJQdYS9FlTi9WpxMj0CtJjff9hP/tk6O1etDqZMUr
         QB65hI8A+qzA4kGa+JqTFbVGkfex5MsCSRHSGj0VPOdGdzPPnZ/QQO1Rcd/ja1G6oFmX
         uYYg==
X-Gm-Message-State: AOAM532kWJyOjo8SHdZ/aCMoipAy/UTgJjwPGQWRbp8hCYNey+ebVxfY
        a/xnZm4Cy54mNSc2kxb4A+R6tg==
X-Google-Smtp-Source: ABdhPJwR+XCjvBHh7hN27yb4wbyQ2NgRHNnJda5bGoNm1j9W8pobPb9+mBDwQzfYrDFvbqSH7NAqWg==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr17632537wma.180.1593432252690;
        Mon, 29 Jun 2020 05:04:12 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 05:04:12 -0700 (PDT)
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
Subject: [PATCH v2 01/10] net: ethernet: ixgbe: check the return value of ixgbe_mii_bus_init()
Date:   Mon, 29 Jun 2020 14:03:37 +0200
Message-Id: <20200629120346.4382-2-brgl@bgdev.pl>
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

This function may fail. Check its return value and propagate the error
code.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index 97a423ecf808..8752b5eea091 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -11175,10 +11175,14 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			IXGBE_LINK_SPEED_10GB_FULL | IXGBE_LINK_SPEED_1GB_FULL,
 			true);
 
-	ixgbe_mii_bus_init(hw);
+	err = ixgbe_mii_bus_init(hw);
+	if (err)
+		goto err_netdev;
 
 	return 0;
 
+err_netdev:
+	unregister_netdev(netdev);
 err_register:
 	ixgbe_release_hw_control(adapter);
 	ixgbe_clear_interrupt_scheme(adapter);
-- 
2.26.1

