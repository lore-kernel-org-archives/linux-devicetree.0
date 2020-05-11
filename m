Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68E0C47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 15:09:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5AC320643
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 15:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="jSfI+/vZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730462AbgEKPJD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 11:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730432AbgEKPIi (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 May 2020 11:08:38 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A8CC05BD0A
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 08:08:38 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id n5so4805590wmd.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1qePp19LiRiOBXtccpgQ+eI6GUOhz0auoBWQ11adkXY=;
        b=jSfI+/vZR/vNDIop5tYQipIr0sMk/NiKnIXCptTaZ1UCH8HUZKtoJB0OgdBC9z2vBa
         s1xE55pXv652Vn9g5VfKY+a9uy5dJ58vb388YQHIUELGwWKiI2Kklor5r7oNIbEpXyfw
         KV5YwxqgIpXxq6QZxVL59d/K3dLnJ4xHCK9jH8DxWKN9GV74AYB4ifDBaK5c8FIchySB
         jTy+eyVKoq1zegnDbhlXUrBw3PNUSPehwJhxpAelJ3W7RqurHnfFTAdHIpqCDlnFydz2
         ylL+Sv0Z6G9Wnhh7GEJTTL5mfenRpGEj6fqVZUHtSmuR5ND02ayD/nfbulwZMANrTHpk
         vrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1qePp19LiRiOBXtccpgQ+eI6GUOhz0auoBWQ11adkXY=;
        b=C7hEXCPPhRnvfxkk/N1uJeodv2hAjaDyBfUz1lf++5uKzVa2xyueqj+b1yR8TMhDXa
         Wgmb8Z3DnjNdy8woarawSeuu67K29lMbEbTApDEUCay7SIWNSMce9QLRWbDL6Y3T8j7c
         +Z/XG+adXfUuXXfqDuowz74/Z4y6l2PG0td1neNo0f0KSVaB72Z47upDHzFSDoIUv0Qv
         NqOazS9ZqLgeEaUcY3uZwCJ31XJvsqh5G63TQ7d5CxE9/0ILHmGBa5C1s7MYtCbNa7wH
         hpw/cuJznFp1GtoSFsPMCRqXG9ndmO9U4eQbp2BoYm/uHDSsHcnBwVgkUIwM4YqyrAup
         1JRw==
X-Gm-Message-State: AGi0PubN+y/w6dVlobOlupqHKIXoJYu05l4GbV68GTlg8Sl0BSPKcmyg
        wy92uUXNqrSm3UixHgrWVoFjhQ==
X-Google-Smtp-Source: APiQypKpf/qfe7MFRJIMepNxeMQg7U0eG0wqy9FY4xaWhiap/9Tgl6YqeR1YMWRXjoWZty2TygbXNQ==
X-Received: by 2002:a1c:2457:: with SMTP id k84mr30054044wmk.96.1589209717331;
        Mon, 11 May 2020 08:08:37 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 08:08:36 -0700 (PDT)
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
Subject: [PATCH v2 12/14] ARM64: dts: mediatek: add an alias for ethernet0 for pumpkin boards
Date:   Mon, 11 May 2020 17:07:57 +0200
Message-Id: <20200511150759.18766-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add the ethernet0 alias for ethernet so that u-boot can find this node
and fill in the MAC address.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index a31093d7142b..97d9b000c37e 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -9,6 +9,7 @@
 / {
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &ethernet;
 	};
 
 	chosen {
-- 
2.25.0

