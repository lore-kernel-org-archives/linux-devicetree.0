Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4327C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 10:03:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81E74206F1
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 10:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="LpewbTVA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgFVKC7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 06:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbgFVKBJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 06:01:09 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317DDC061795
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 03:01:08 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x16so5120559wmj.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5QarOMVR645D9ubKovjzVLDL1uXK7z1gDINN/6iJvAs=;
        b=LpewbTVAIvBpnXi99/xVv5fbqz2WujW0FcFIKxrOtFsxX8fD+Q/1J+ukHVtzm2tM0u
         nrSNkek+MnZpGtu/cb3IES/Oe0XCrkBfBJI7bMVzqbKrpKpiN6tkeNUJijkQQ2taMHgV
         F2/kkG8pj76PGjfgqO9kVPMj+M50223gvL2bEDlGEZm57XR+OYc7hJ2fylF1Euolc3X2
         Sv/NLPTj62fMq3VPOxv/PcWtMYNVFJgKmLsSKRZG3V9OJmDfKzvarPK3gG08+dN+VRLN
         hib1dKtxy+nGusP97umOk8eJL3G8NZUA6W5f4/aFKPSPpMx8D1c5kMmHmm6jkKV4D31K
         rYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5QarOMVR645D9ubKovjzVLDL1uXK7z1gDINN/6iJvAs=;
        b=AwDSd0Pbw6YoMSIN7oZHVDgQXJquEvv2yYH9Vt8lM6IvmtbRTidBspGG9r9anlXePP
         bN+2r4DLFuMxekPrPF7N9onuVHumVxYSwIVSZtRYXTtIa9iFPsE2daBKl9uwBFEcWVSm
         2EYKfWGJ4jbuYzhVcK83wTbuv7QCZ+t4b5t1OaEf6fkikYI63fz/D89yFlrMZWh7MQbk
         HgMD5yK+r3/W2Ywnw7PrCNm81XpB6DVfTt5Nq+4e6I7R/eac0qBDMrs9qaqeq0+hgtNg
         shBoergSmMx7jk+UmpZn0QU8cfgdS3QqavxuZ9/nxCp8hQ+Gv8A6Vp6G6/KW/ktDNycm
         yqXA==
X-Gm-Message-State: AOAM533jknoJFW+Ibp+UO6mmqKtE4DuKS8x1TQbkMEqCbGIqHqPJSQ7D
        L8rEnYKcOj9Tq6Ym254GkhGfcg==
X-Google-Smtp-Source: ABdhPJyQJrKCdVTA5/4h6jLuGo2TntfNLAXOnjZEpfXKXnJs07i++H3XlKxtAUGNs97IxT5JDpCRCw==
X-Received: by 2002:a1c:bc55:: with SMTP id m82mr10040285wmf.92.1592820066976;
        Mon, 22 Jun 2020 03:01:06 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id x205sm16822187wmx.21.2020.06.22.03.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:01:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Realtek linux nic maintainers <nic_swsd@realtek.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 01/11] net: ethernet: ixgbe: check the return value of ixgbe_mii_bus_init()
Date:   Mon, 22 Jun 2020 12:00:46 +0200
Message-Id: <20200622100056.10151-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200622100056.10151-1-brgl@bgdev.pl>
References: <20200622100056.10151-1-brgl@bgdev.pl>
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
index f162b8b8f345..4ec4eeb9736b 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -11167,10 +11167,14 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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

