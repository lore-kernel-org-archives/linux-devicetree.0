Return-Path: <SRS0=wYQk=7F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1203CC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 23 May 2020 13:27:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E337620727
	for <linux-devicetree@archiver.kernel.org>; Sat, 23 May 2020 13:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="mp9fRUIz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387875AbgEWN11 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 23 May 2020 09:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387866AbgEWN10 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 23 May 2020 09:27:26 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039B9C08C5C1
        for <devicetree@vger.kernel.org>; Sat, 23 May 2020 06:27:25 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u1so11273971wmn.3
        for <devicetree@vger.kernel.org>; Sat, 23 May 2020 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=85LArQ1FkfasqQwvTGBUsmFOdZ74xT3FAzPREvSXT3E=;
        b=mp9fRUIz3f7zzigyw8CU4tWQdJuD/cNnqmRAvK/VRG+g0juXIdGy1ACtv8QzDSAVvX
         zZTtdlmptVqzrDUoGctCNcVv+sp+kvHHQLKobjmUSABO5WlVbnS7ZjDu5eL8ghHSECVm
         K66u1sz1Vvr9cojS1puCVm7MHqwqSP+KeNpcs0Ikin3L/OSp6a6ja1mHMqLhXZ7QSF33
         cmQ40C5Sb89UJ4E1ZZShWVrrBxftRA6RfclHz/BjVeWTuoRi2J+VvqnLv5AlUcR7mc7l
         F0zaODP7z0PlC5yJ+Y5QhZw5HjxWCqux45s0hgaopOwzgqaGcyNlp2dO1XJ/1y0vfKmZ
         FmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=85LArQ1FkfasqQwvTGBUsmFOdZ74xT3FAzPREvSXT3E=;
        b=rrDaa4Xgo1LTFjG6gTSlvGEuAyxz/ZLygcI5aTMGQVfi1p5za/YS5C+M+bMcPZTIxG
         Ewv7ZDwnM54JvnxU5+AQ/0COF53I9EXaCK0Odztbqz3fR/aKB+toKHhVHOoULD3Y9oud
         RckxC+P0ZYwA5Anry2GsyFXaABiXWNNmluwjUvk1m3RYQqy2vFZyP4x9jWI+QEA6Zel9
         /Xvr6lqRIxeTRkMhoAn5vVKXxWbaSabtdkyDN8GYDS3HSb4tQujHA5sxaKW8BOBb53XA
         NNrB29AEKJnWU1ED5Bl4Jah0WpWK5boy+bL0MpfBKijqFiwZqYbk2W4KS0qp9Y4ms+Qa
         ZUGw==
X-Gm-Message-State: AOAM532yEyTwpjaRQxM3ZWVTuwfEVeZmFpAOyEgorve1Dp5Dgu4E1luZ
        pn+LxHCvdNHhQvggDi+KuLLci73tL+A=
X-Google-Smtp-Source: ABdhPJw0PA+P0HcUXiWXYQRZQG2lReeBtiQJfZFPYkFAcWtI7Dg+DCbBae2YfDUJLHDk1mI3Rm2NpA==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr18521019wme.154.1590240443748;
        Sat, 23 May 2020 06:27:23 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id g69sm8098703wmg.15.2020.05.23.06.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 06:27:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
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
Subject: [PATCH v2 3/5] net: devres: define a separate devres structure for devm_alloc_etherdev()
Date:   Sat, 23 May 2020 15:27:09 +0200
Message-Id: <20200523132711.30617-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200523132711.30617-1-brgl@bgdev.pl>
References: <20200523132711.30617-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Not using a proxy structure to store struct net_device doesn't save
anything in terms of compiled code size or memory usage but significantly
decreases the readability of the code with all the pointer casting.

Define struct net_device_devres and use it in devm_alloc_etherdev_mqs().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 net/devres.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/net/devres.c b/net/devres.c
index c1465d9f9019..b97b0c5a8216 100644
--- a/net/devres.c
+++ b/net/devres.c
@@ -7,30 +7,34 @@
 #include <linux/etherdevice.h>
 #include <linux/netdevice.h>
 
-static void devm_free_netdev(struct device *dev, void *res)
+struct net_device_devres {
+	struct net_device *ndev;
+};
+
+static void devm_free_netdev(struct device *dev, void *this)
 {
-	free_netdev(*(struct net_device **)res);
+	struct net_device_devres *res = this;
+
+	free_netdev(res->ndev);
 }
 
 struct net_device *devm_alloc_etherdev_mqs(struct device *dev, int sizeof_priv,
 					   unsigned int txqs, unsigned int rxqs)
 {
-	struct net_device **dr;
-	struct net_device *netdev;
+	struct net_device_devres *dr;
 
 	dr = devres_alloc(devm_free_netdev, sizeof(*dr), GFP_KERNEL);
 	if (!dr)
 		return NULL;
 
-	netdev = alloc_etherdev_mqs(sizeof_priv, txqs, rxqs);
-	if (!netdev) {
+	dr->ndev = alloc_etherdev_mqs(sizeof_priv, txqs, rxqs);
+	if (!dr->ndev) {
 		devres_free(dr);
 		return NULL;
 	}
 
-	*dr = netdev;
 	devres_add(dev, dr);
 
-	return netdev;
+	return dr->ndev;
 }
 EXPORT_SYMBOL(devm_alloc_etherdev_mqs);
-- 
2.25.0

