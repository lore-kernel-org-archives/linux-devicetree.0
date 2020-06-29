Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F6CC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:58:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C417B206F1
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 20:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Lju5246x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389927AbgF2U61 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 16:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728979AbgF2TND (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 15:13:03 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A856C00E3DF
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:04:25 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g75so15105769wme.5
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 05:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eg4utbhrf/3v6wZhuPotuFpmqRh7IC4ZAOzFVoP+DSU=;
        b=Lju5246xETI3n7x5ApaA2zIYYyPdv7uL89+PkXu5UmfdDnoJt/A+1kV4EnWbvWHsfT
         U0KiDkQo2C6/d8Ee7wMfJSSmn58uoqIdNiTjX8Hz5nTHyctnp2RJTz/wtYYsoJ+dtuhV
         XjmJm2KbsyS/VgCkUtqgfIB2Q8m9h6+TRtPh688uJ2bkMEAzy6TyrNqZ5+p0Jq6QQPRe
         TpitUFUM90jHaT+neQCa+q1jY5kpWoCkFluHE4al/HsV1lisaXYbrRjufnYUNHF7JcYD
         MtPNLz8KCHYZnMSa1RhX8WtsifRsmdGJ5BQYv8xh4yMTTQv22xrYgZ/0nqbMjj7pN0qH
         WHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eg4utbhrf/3v6wZhuPotuFpmqRh7IC4ZAOzFVoP+DSU=;
        b=HnH28ejF94LtKrda3VarZA7+1tRjNQgXunN0BesLZjF7cX8P66wgat7sZYRcD/qOju
         buI6wiaJ0QBM3Z+Vhfz7Vux1FayiUWCNQBcjqoJJxTZZsxM/Dj+LqjMftGGormJXkdEV
         +PLQL3TnAdXK4HNzsBatLUFScZph6ouEK9xwZfmnz64XK5jDnEzddbKJ7Ec5TB3sgZy6
         A0KY2uI7rgyFe95GlKhBy03nOIvK+SKqUOpAmdHSv+6kL6iK57ml3uZpD3P9u1kTTfIl
         o4d9aOHr8YFTw9TVL+Gac+Od9sefO3sDDUpZZqEDNrCMQATQmmXMG1sDXyLbWPMiUjV0
         bZRA==
X-Gm-Message-State: AOAM531eIo8zaOi9dOC7DzJu3xTmhmTpHTauOR7jvMGQYN5FEpWOm7Qo
        CzZlRfrBvAqSrVSvwj4+lcvNQw==
X-Google-Smtp-Source: ABdhPJyyXNydd+nOMTGEVlBmI0TP9I7QgzsG5vIU8vPWhBARI6Y2TnNfIwesmyvIGRb47dVl+VGcrA==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr17776997wmj.117.1593432263901;
        Mon, 29 Jun 2020 05:04:23 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d81sm25274347wmc.0.2020.06.29.05.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 05:04:23 -0700 (PDT)
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
Subject: [PATCH v2 08/10] of: mdio: remove the 'extern' keyword from function declarations
Date:   Mon, 29 Jun 2020 14:03:44 +0200
Message-Id: <20200629120346.4382-9-brgl@bgdev.pl>
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

The 'extern' keyword in headers doesn't have any benefit. Remove them
all from the of_mdio.h header.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/of_mdio.h | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/include/linux/of_mdio.h b/include/linux/of_mdio.h
index 0f61a4ac6bcf..ba8e157f24ad 100644
--- a/include/linux/of_mdio.h
+++ b/include/linux/of_mdio.h
@@ -12,27 +12,26 @@
 #include <linux/of.h>
 
 #if IS_ENABLED(CONFIG_OF_MDIO)
-extern bool of_mdiobus_child_is_phy(struct device_node *child);
-extern int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np);
-extern struct phy_device *of_phy_find_device(struct device_node *phy_np);
-extern struct phy_device *of_phy_connect(struct net_device *dev,
-					 struct device_node *phy_np,
-					 void (*hndlr)(struct net_device *),
-					 u32 flags, phy_interface_t iface);
-extern struct phy_device *
+bool of_mdiobus_child_is_phy(struct device_node *child);
+int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np);
+struct phy_device *of_phy_find_device(struct device_node *phy_np);
+struct phy_device *
+of_phy_connect(struct net_device *dev, struct device_node *phy_np,
+	       void (*hndlr)(struct net_device *), u32 flags,
+	       phy_interface_t iface);
+struct phy_device *
 of_phy_get_and_connect(struct net_device *dev, struct device_node *np,
 		       void (*hndlr)(struct net_device *));
-struct phy_device *of_phy_attach(struct net_device *dev,
-				 struct device_node *phy_np, u32 flags,
-				 phy_interface_t iface);
-
-extern struct mii_bus *of_mdio_find_bus(struct device_node *mdio_np);
-extern int of_phy_register_fixed_link(struct device_node *np);
-extern void of_phy_deregister_fixed_link(struct device_node *np);
-extern bool of_phy_is_fixed_link(struct device_node *np);
-extern int of_mdiobus_phy_device_register(struct mii_bus *mdio,
-				     struct phy_device *phy,
-				     struct device_node *child, u32 addr);
+struct phy_device *
+of_phy_attach(struct net_device *dev, struct device_node *phy_np,
+	      u32 flags, phy_interface_t iface);
+
+struct mii_bus *of_mdio_find_bus(struct device_node *mdio_np);
+int of_phy_register_fixed_link(struct device_node *np);
+void of_phy_deregister_fixed_link(struct device_node *np);
+bool of_phy_is_fixed_link(struct device_node *np);
+int of_mdiobus_phy_device_register(struct mii_bus *mdio, struct phy_device *phy,
+				   struct device_node *child, u32 addr);
 
 static inline int of_mdio_parse_addr(struct device *dev,
 				     const struct device_node *np)
-- 
2.26.1

