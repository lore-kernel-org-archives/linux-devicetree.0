Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65C3C2D0D4
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 18:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B050D2082E
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 18:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qw0Kzk6A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbfLTSPk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 13:15:40 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36642 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfLTSPj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Dec 2019 13:15:39 -0500
Received: by mail-pj1-f65.google.com with SMTP id n59so4475249pjb.1;
        Fri, 20 Dec 2019 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HKXSHOlTb8k+yBB0qfAI+UEUm/dRO/GDXWxCfqIY5xQ=;
        b=qw0Kzk6A52YGuRxVs++n5b1sTelOfMlBW/Q91dWcg3GmySLLD/SMK4kpZP7XO/1LfV
         VtAxeXm0bhBoo7lg7YrgPXqDaN8MidOFPzWm/hsbo/YEETFL9BoC00h71N+Ob9yIaO71
         JDX2wK7aWO2oMPkd6/HCPYs+mi4Sm46edgd75uy0JCX05lWsnGkebNTgpiEZlP5OR3vI
         OmM/8VYT9GqTBK+qGqdnt8HnuXvykaGkdBQPT6228EKLyGnI5L9ohTFetAzIJAbM0pBE
         fdlOIUhvvik0Zl4UlOzAzBTcmIcHp3KUKpDVWwS81eK7QvpKWhh/HhvO911xP6HlKmLg
         6Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HKXSHOlTb8k+yBB0qfAI+UEUm/dRO/GDXWxCfqIY5xQ=;
        b=W7248PmUineGJRGdxYU1soZiz6VkjjZAKDrrCGxIqRj/MIqivDUI25uCn2FzVUU6ti
         DRKMFKUkVWAd/F8z02GtjGsbJo37kvGioNAcO8nXVpND+TlZfBaR6IbFsiMAwoL4LvDt
         Lc6P4Y/P4ZNrZ47PVga2h9/gQ6tHH233lhayjkJmSB/zTtxnY+FGjKrcRFEENf1hCXtN
         9js8/NVmQ9XPe6/2rp00OFzWq/dyRyoraXatPzy6rVyjN2oa4SGA88qqQQc2ZLduiq4Z
         Ty1Yq1N/hpD2gKNX2QtRC3joJaf/XvFm/f71TuQpjtN+6rsdHItGVJQikTU5KS0WlLl1
         zxHw==
X-Gm-Message-State: APjAAAVFEvdwr9R9Pf2U0ZwqbBYJxfFxwN2iCZn6rhJs5Npa8NgJoHso
        UoOl3Eoron7qwBwDbh/Q1QGOAMmS
X-Google-Smtp-Source: APXvYqwW+2c8n53FYV39x5rtnZkUEA9aTz5c3nw0Q2dRbJ59yxG+V7/uxTm/WpIgPIpoLdyxBg/EWw==
X-Received: by 2002:a17:902:9a98:: with SMTP id w24mr16595293plp.300.1576865738553;
        Fri, 20 Dec 2019 10:15:38 -0800 (PST)
Received: from localhost.localdomain (c-73-241-114-122.hsd1.ca.comcast.net. [73.241.114.122])
        by smtp.gmail.com with ESMTPSA id j28sm11833869pgb.36.2019.12.20.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 10:15:37 -0800 (PST)
From:   Richard Cochran <richardcochran@gmail.com>
To:     netdev@vger.kernel.org
Cc:     David Miller <davem@davemloft.net>, devicetree@vger.kernel.org,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Miroslav Lichvar <mlichvar@redhat.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Willem de Bruijn <willemb@google.com>,
        Wingman Kwok <w-kwok2@ti.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH V7 net-next 09/11] net: mdio: of: Register discovered MII time stampers.
Date:   Fri, 20 Dec 2019 10:15:18 -0800
Message-Id: <9af33891bfa5f3d4c42654228eabab2e3d39c259.1576865315.git.richardcochran@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576865315.git.richardcochran@gmail.com>
References: <cover.1576865315.git.richardcochran@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

When parsing a PHY node, register its time stamper, if any, and attach
the instance to the PHY device.

Signed-off-by: Richard Cochran <richardcochran@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 drivers/net/phy/phy_device.c |  3 +++
 drivers/of/of_mdio.c         | 30 +++++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index ee45838f90c9..debbda61e12b 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -881,6 +881,9 @@ EXPORT_SYMBOL(phy_device_register);
  */
 void phy_device_remove(struct phy_device *phydev)
 {
+	if (phydev->mii_ts)
+		unregister_mii_timestamper(phydev->mii_ts);
+
 	device_del(&phydev->mdio.dev);
 
 	/* Assert the reset signal */
diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index c6b87ce2b0cc..0b7aee235813 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -42,14 +42,37 @@ static int of_get_phy_id(struct device_node *device, u32 *phy_id)
 	return -EINVAL;
 }
 
+static struct mii_timestamper *of_find_mii_timestamper(struct device_node *node)
+{
+	struct of_phandle_args arg;
+	int err;
+
+	err = of_parse_phandle_with_fixed_args(node, "timestamper", 1, 0, &arg);
+
+	if (err == -ENOENT)
+		return NULL;
+	else if (err)
+		return ERR_PTR(err);
+
+	if (arg.args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	return register_mii_timestamper(arg.np, arg.args[0]);
+}
+
 static int of_mdiobus_register_phy(struct mii_bus *mdio,
 				    struct device_node *child, u32 addr)
 {
+	struct mii_timestamper *mii_ts;
 	struct phy_device *phy;
 	bool is_c45;
 	int rc;
 	u32 phy_id;
 
+	mii_ts = of_find_mii_timestamper(child);
+	if (IS_ERR(mii_ts))
+		return PTR_ERR(mii_ts);
+
 	is_c45 = of_device_is_compatible(child,
 					 "ethernet-phy-ieee802.3-c45");
 
@@ -57,11 +80,14 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio,
 		phy = phy_device_create(mdio, addr, phy_id, 0, NULL);
 	else
 		phy = get_phy_device(mdio, addr, is_c45);
-	if (IS_ERR(phy))
+	if (IS_ERR(phy)) {
+		unregister_mii_timestamper(mii_ts);
 		return PTR_ERR(phy);
+	}
 
 	rc = of_irq_get(child, 0);
 	if (rc == -EPROBE_DEFER) {
+		unregister_mii_timestamper(mii_ts);
 		phy_device_free(phy);
 		return rc;
 	}
@@ -90,10 +116,12 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio,
 	 * register it */
 	rc = phy_device_register(phy);
 	if (rc) {
+		unregister_mii_timestamper(mii_ts);
 		phy_device_free(phy);
 		of_node_put(child);
 		return rc;
 	}
+	phy->mii_ts = mii_ts;
 
 	dev_dbg(&mdio->dev, "registered phy %pOFn at address %i\n",
 		child, addr);
-- 
2.20.1

