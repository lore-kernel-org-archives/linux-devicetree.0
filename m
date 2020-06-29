Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83295C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:41:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E56720663
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="W34A5EzI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387972AbgF2UlH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 16:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731684AbgF2TOI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 15:14:08 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D19EC0F26C2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:04:12 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a6so16286174wrm.4
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3SFeAEvbOoZI/xpVJ8MO71Sd1LqnSCGoIeWQbxnMQg=;
        b=W34A5EzIFj5HWi2O+Uu6ihBeBiDeWhpckbWrX2jnfqXAR3x0qNViaW+WgvnvpxwiWO
         MGqgE1enmwmS0gQxdKT5NnCo8pT8qbnyks2TEEdLnPjFm0OCLBWs+QPHAs9eXm7uQdat
         JWbhorZHQ3BtymX0aXM/lywfKu/bT8ZNk4SSMGwMY45YdISPCRJHVeIp8gOWUa6hI3x5
         yl2q7FCGF3ftBuUSxFt5y3sPjglhVa+3G49n58H+eBi39BWD3W01vtmugl+iYZj5MxaS
         mkrYBWhfSoM6r/EQlCIFuE/GmGSu3DIPQIVdw8C/+juCBxxelde4Yfeywt4RMER4CJbR
         0+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3SFeAEvbOoZI/xpVJ8MO71Sd1LqnSCGoIeWQbxnMQg=;
        b=GgqkL/8KmYS4fZlHLi/8LB8pSnPX2WSNjWBhtNV9/pTQU9gPuP7lq1gHm1zO4/YROr
         UynCyEvWZHf2kbIiLMyrXHTLP+DHYUquLft49kbJKh6kwssgC4TzyGYbGUY36zCXbDQl
         pI5KNs/e6PWXM1AbR7szGj6vransyTKx5EVvkiQzGEoQf6b5AHHnzNp4Va4CpQZn590F
         AoFnFtxlQYADbu3aovnN8r4MBNidUb2i2yAMLwaXtJy5GRChFcNDcPlYEE6frYDP17Md
         NzX5QYOt65fTxga0tSLGLQVH0CSDelHQD9g+6FAklCIz5RdUWnh73e6UOug1tBV1e3B0
         YUBw==
X-Gm-Message-State: AOAM531sQBuztn5WDh8ANrWeWhBYwd9TX7sYZnaFPZbpWcpaKR3P5xee
        ifzb+HSgicUzPiXJg1k8eu2tKw==
X-Google-Smtp-Source: ABdhPJzvKPYK67MLNdl2CXmAriudaJFiLrZRmwhzT6FCEy4WwbiER21DP71IWFlJPEiw6dlp0MpaYQ==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr18038664wrm.271.1593432250982;
        Mon, 29 Jun 2020 05:04:10 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 05:04:10 -0700 (PDT)
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
Subject: [PATCH v2 00/10] net: improve devres helpers
Date:   Mon, 29 Jun 2020 14:03:36 +0200
Message-Id: <20200629120346.4382-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

So it seems like there's no support for relaxing certain networking devres
helpers to not require previously allocated structures to also be managed.
However the way mdio devres variants are implemented is still wrong and I
modified my series to address it while keeping the functions strict.

First two patches modify the ixgbe driver to get rid of the last user of
devm_mdiobus_free().

Patches 3, 4, 5 and 6 are mostly cosmetic.

Patch 7 fixes the way devm_mdiobus_register() is implemented.

Patches 8 & 9 provide a managed variant of of_mdiobus_register() and
last patch uses it in mtk-star-emac driver.

v1 -> v2:
- drop the patch relaxing devm_register_netdev()
- require struct mii_bus to be managed in devm_mdiobus_register() and
  devm_of_mdiobus_register() but don't store that information in the
  structure itself: use devres_find() instead

Bartosz Golaszewski (10):
  net: ethernet: ixgbe: check the return value of ixgbe_mii_bus_init()
  net: ethernet: ixgbe: don't call devm_mdiobus_free()
  net: devres: rename the release callback of devm_register_netdev()
  Documentation: devres: add missing mdio helper
  phy: un-inline devm_mdiobus_register()
  phy: mdio: add kerneldoc for __devm_mdiobus_register()
  net: phy: don't abuse devres in devm_mdiobus_register()
  of: mdio: remove the 'extern' keyword from function declarations
  of: mdio: provide devm_of_mdiobus_register()
  net: ethernet: mtk-star-emac: use devm_of_mdiobus_register()

 .../driver-api/driver-model/devres.rst        |   3 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c |   6 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c  |  14 +-
 drivers/net/ethernet/mediatek/mtk_star_emac.c |  13 +-
 drivers/net/ethernet/realtek/r8169_main.c     |   2 +-
 drivers/net/phy/Makefile                      |   2 +
 drivers/net/phy/mdio_bus.c                    |  73 ----------
 drivers/net/phy/mdio_devres.c                 | 133 ++++++++++++++++++
 include/linux/of_mdio.h                       |  40 +++---
 include/linux/phy.h                           |  21 +--
 net/devres.c                                  |   4 +-
 11 files changed, 174 insertions(+), 137 deletions(-)
 create mode 100644 drivers/net/phy/mdio_devres.c

-- 
2.26.1

