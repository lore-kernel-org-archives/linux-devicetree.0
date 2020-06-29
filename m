Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7F3C433E2
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 21:05:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D48320768
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 21:05:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="of984BLP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388366AbgF2VFh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 17:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730004AbgF2TMn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 15:12:43 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF376C00E3E4
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:04:27 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f18so15867353wml.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7pEL+pOqyLTkwaRij99JSBZiVqVmOtzJ61ge9c76alE=;
        b=of984BLPzSM5P+WwmyOWqcZJYwV98nXnukmPddORm7s4hFfzesBN6/ddh4U2m/PDU6
         U7zyrLEGeItTXvJtQUt1dUuvsThE3lZ38dqMBT9cWCEKwkxHUamDCpBpGaedCu0yU3JA
         OMEKDESF6Z+Dg/P4fdW8bjKYdSptxx+16ZaDAHFgGzM2CCXueszbTt7/jsNP4k3G4wfW
         vhCj/O7zg5dmmRIAaJf3wX6GBBN246Lt1CVVgmSh81ZDHsWzVOmLRAYU13dZqTFhE5mJ
         cUBwbbK/x0XCTDLHW+rUB89GdvYigHL50OJ07XC/TkMc5hT7UvPM8MrNf0tkQ8gdtoxp
         nQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7pEL+pOqyLTkwaRij99JSBZiVqVmOtzJ61ge9c76alE=;
        b=S02xSjsq2dr75SswQJnL8NNH/xN9LIhdN/QFKffFZLJNxOeK/lflI+47OBQA5uXvGy
         i36THFMGKj0FEwJ+ajVM2jemhSNecmKd6KKHKdE661jWVgBbj+rRJTZSa+h518Xlo8yA
         abu0DWcj/BzRTAVi2uJwpi4s8qK56gL23jnOPrF/giHl0h9QizxO80Z0LRvGDGP8X3sz
         PlEjjaoexPJ0kORkI4AAL9PJC6YjGajxbPTRV+Cht68EKrwhHsuLNU6bOoqhQ+RUW6eY
         CBa7SiSq/neQ2FTi1aertN34f0fF1ZlO9NzLWeC6uUbuMzlRMmkd3orOcc+BGcwIHanC
         AtiA==
X-Gm-Message-State: AOAM531rHjdxbQTUoiipXeYdlAewYXuOiy4t8uju7HixcUQt0pjIrA/j
        6oqYujLibGkFOzF2/qZKCXRQAA==
X-Google-Smtp-Source: ABdhPJyd6qa9V9UAIGrinBuxZn8Q8saD0KJTED9NchL3vgnTrBQeXGhAZm//V44PtKtSgMKYvFb6Dg==
X-Received: by 2002:a1c:a70d:: with SMTP id q13mr13901671wme.55.1593432266701;
        Mon, 29 Jun 2020 05:04:26 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 05:04:26 -0700 (PDT)
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
Subject: [PATCH v2 10/10] net: ethernet: mtk-star-emac: use devm_of_mdiobus_register()
Date:   Mon, 29 Jun 2020 14:03:46 +0200
Message-Id: <20200629120346.4382-11-brgl@bgdev.pl>
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

Shrink the code by using the managed variant of of_mdiobus_register().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 3e765bdcf9e1..13250553263b 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1389,7 +1389,7 @@ static int mtk_star_mdio_init(struct net_device *ndev)
 	priv->mii->write = mtk_star_mdio_write;
 	priv->mii->priv = priv;
 
-	ret = of_mdiobus_register(priv->mii, mdio_node);
+	ret = devm_of_mdiobus_register(dev, priv->mii, mdio_node);
 
 out_put_node:
 	of_node_put(mdio_node);
@@ -1441,13 +1441,6 @@ static void mtk_star_clk_disable_unprepare(void *data)
 	clk_bulk_disable_unprepare(MTK_STAR_NCLKS, priv->clks);
 }
 
-static void mtk_star_mdiobus_unregister(void *data)
-{
-	struct mtk_star_priv *priv = data;
-
-	mdiobus_unregister(priv->mii);
-}
-
 static int mtk_star_probe(struct platform_device *pdev)
 {
 	struct device_node *of_node;
@@ -1549,10 +1542,6 @@ static int mtk_star_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(dev, mtk_star_mdiobus_unregister, priv);
-	if (ret)
-		return ret;
-
 	ret = eth_platform_get_mac_address(dev, ndev->dev_addr);
 	if (ret || !is_valid_ether_addr(ndev->dev_addr))
 		eth_hw_addr_random(ndev);
-- 
2.26.1

