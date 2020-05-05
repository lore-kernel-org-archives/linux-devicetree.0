Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA488C47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 14:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A0AC2078C
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 14:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="GDxtZasc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729344AbgEEOD6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 10:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729343AbgEEODN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 10:03:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60006C061A0F
        for <devicetree@vger.kernel.org>; Tue,  5 May 2020 07:03:12 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h4so2433437wmb.4
        for <devicetree@vger.kernel.org>; Tue, 05 May 2020 07:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XzPWSx814wcuOT9NHWlCidvd/g1LktIvgEhNgxHiB+I=;
        b=GDxtZascuF3VlQT4m8Y6A1NkqjEZJvqBKtGLerb8p0fVRxeFRWzsMAW/5kQknif1ol
         QbdmDFCp8Mm2vnHZsZ3ljrAqdFInnVvc5tKZPRq0UtbxKz1LZzSwBH2EST0Pj3gT1b8c
         h9MdIkBbk4f2IccDCFRiwKmEBA+jjiL96/9D+qaMGQOTRwtWJawUr2fPysWASK4UBcTb
         qaT4zA2gWzkLAbQET4wIE3RVpXzAknkEoA1mk5kfb9c18lSq6eC79m7KDyfNVK2iDXGr
         mFHe23qvpwQEcQVze2B+B+8DL+ADNtS4Zqm07JpzqaF8kdRW50BzHgDtIEVZTIjtKOLC
         nvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XzPWSx814wcuOT9NHWlCidvd/g1LktIvgEhNgxHiB+I=;
        b=rWnya5WM6RMRoqguEZY04o79X5ASUU6MeF9Ur2rFi5r+b4SJC1HvVyzyJj/5X2opxy
         A0c2t1vmAE3jdb3FnWwRHkfDW5mLao2AYQQhYX6e2kkYiarjmpEI0knaJy8UQo30+4TO
         tewLy2fibIWuSQ75yF84uylP2+rwx+GAYtIoNSJMehIIXQ/ogHVufz3ypyJLRU0Q6Cqc
         NSsrIG652NcpGUn+aPPpGC0B/sYHzGciHIWv0nj9h4TbmxpyLIuiP3l16aLExXgctHa3
         DXKc5NSx7enjgL2ji+AjyeFw0asMcpwnmyDU1owQonL9LvP/2GPw6MM15k4WUOy40aUB
         5uDQ==
X-Gm-Message-State: AGi0PuY0VTt5++GLimkTD32sOmNnMw9a0xT9dStOOzMdec/dZNnPXvn5
        YBZWG4O69svFjQnqylR49sUQqA==
X-Google-Smtp-Source: APiQypLyQEevQilQF8OGTKaO4x0GDcOOIERMs4KyEuSeUMTmGpGiba4gEr4LNVjh4GeSyFodlYbUjw==
X-Received: by 2002:a1c:ed04:: with SMTP id l4mr3707524wmh.93.1588687391128;
        Tue, 05 May 2020 07:03:11 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id c190sm4075755wme.4.2020.05.05.07.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 07:03:10 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Felix Fietkau <nbd@openwrt.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 05/11] net: core: provide devm_register_netdev()
Date:   Tue,  5 May 2020 16:02:25 +0200
Message-Id: <20200505140231.16600-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200505140231.16600-1-brgl@bgdev.pl>
References: <20200505140231.16600-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide devm_register_netdev() - a device resource managed variant
of register_netdev(). This new helper will only work for net_device
structs that have a parent device assigned and are devres managed too.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/netdevice.h |  4 ++++
 net/core/dev.c            | 48 +++++++++++++++++++++++++++++++++++++++
 net/ethernet/eth.c        |  1 +
 3 files changed, 53 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 130a668049ab..433bd5ca2efc 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1515,6 +1515,8 @@ struct net_device_ops {
  * @IFF_FAILOVER_SLAVE: device is lower dev of a failover master device
  * @IFF_L3MDEV_RX_HANDLER: only invoke the rx handler of L3 master device
  * @IFF_LIVE_RENAME_OK: rename is allowed while device is up and running
+ * @IFF_IS_DEVRES: this structure was allocated dynamically and is managed by
+ *	devres
  */
 enum netdev_priv_flags {
 	IFF_802_1Q_VLAN			= 1<<0,
@@ -1548,6 +1550,7 @@ enum netdev_priv_flags {
 	IFF_FAILOVER_SLAVE		= 1<<28,
 	IFF_L3MDEV_RX_HANDLER		= 1<<29,
 	IFF_LIVE_RENAME_OK		= 1<<30,
+	IFF_IS_DEVRES			= 1<<31,
 };
 
 #define IFF_802_1Q_VLAN			IFF_802_1Q_VLAN
@@ -4206,6 +4209,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 			 count)
 
 int register_netdev(struct net_device *dev);
+int devm_register_netdev(struct net_device *ndev);
 void unregister_netdev(struct net_device *dev);
 
 /* General hardware address lists handling functions */
diff --git a/net/core/dev.c b/net/core/dev.c
index 522288177bbd..99db537c9468 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -9519,6 +9519,54 @@ int register_netdev(struct net_device *dev)
 }
 EXPORT_SYMBOL(register_netdev);
 
+struct netdevice_devres {
+	struct net_device *ndev;
+};
+
+static void devm_netdev_release(struct device *dev, void *this)
+{
+	struct netdevice_devres *res = this;
+
+	unregister_netdev(res->ndev);
+}
+
+/**
+ *	devm_register_netdev - resource managed variant of register_netdev()
+ *	@ndev: device to register
+ *
+ *	This is a devres variant of register_netdev() for which the unregister
+ *	function will be call automatically when the parent device of ndev
+ *	is detached.
+ */
+int devm_register_netdev(struct net_device *ndev)
+{
+	struct netdevice_devres *dr;
+	int ret;
+
+	/* struct net_device itself must be devres managed. */
+	BUG_ON(!(ndev->priv_flags & IFF_IS_DEVRES));
+	/* struct net_device must have a parent device - it will be the device
+	 * managing this resource.
+	 */
+	BUG_ON(!ndev->dev.parent);
+
+	dr = devres_alloc(devm_netdev_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	ret = register_netdev(ndev);
+	if (ret) {
+		devres_free(dr);
+		return ret;
+	}
+
+	dr->ndev = ndev;
+	devres_add(ndev->dev.parent, dr);
+
+	return 0;
+}
+EXPORT_SYMBOL(devm_register_netdev);
+
 int netdev_refcnt_read(const struct net_device *dev)
 {
 	int i, refcnt = 0;
diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index c8b903302ff2..ce9b5e576f20 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -423,6 +423,7 @@ struct net_device *devm_alloc_etherdev_mqs(struct device *dev, int sizeof_priv,
 
 	*dr = netdev;
 	devres_add(dev, dr);
+	netdev->priv_flags |= IFF_IS_DEVRES;
 
 	return netdev;
 }
-- 
2.25.0

