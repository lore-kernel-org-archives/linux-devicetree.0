Return-Path: <SRS0=APCC=2L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34521C2D0C3
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Dec 2019 19:36:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 058C7206B7
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Dec 2019 19:36:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nc+efDrQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfLUTgq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 21 Dec 2019 14:36:46 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35710 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLUTgq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 21 Dec 2019 14:36:46 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so6717548pgk.2;
        Sat, 21 Dec 2019 11:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TUdlEwyS6RYa1hXdLY5fHxlvIjKv50oIs66wiKRqcgw=;
        b=nc+efDrQoSKHiso5ElHqNul4V+XLgFUCmQOc7x9j+51uEFrAI8oqBxtP3jgcEMWVYD
         QAOooNu3hpjz1an5J54xHEH5hVV0lPteuBmLmORxZjE9InFHgqzFiUeFfPfQ0pFMsh/g
         v8rCPkZKhOujgeeMKXzh9s9cVXPSw/rSwgdEvfl2D8Ny61s6Xm83PQdBp4uoZ3zPNuev
         imQ9luhztwzNvBTkAsLk593rMxxWNLfDOtWFK7MW5gpYukMBT4sa+Cg/ev99+vLg2wsm
         WpE3yjjvWQ65lJ+RKOqzAZIqK62wa2b2vUItn4HCK1N7s0eEzqZJakl0WQ/ojWa/J6yB
         GqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TUdlEwyS6RYa1hXdLY5fHxlvIjKv50oIs66wiKRqcgw=;
        b=jHSKO+gNM3Goq+DUz1wvo/cK2QAG5OQCrPPBgWCN1C5Qsf0J70kBwQ3utjUCnK0kS1
         V++DdJBUVyqlniVFD/E6xqJb40/vfOSTjtSPL50lkj22fXOApx7M0mRHltoIegLOF8y0
         6KlKXZBDNKw46JezZqQ48BAPTQLPFBaBAfqU1+WJk+5pXj9pBybRIIEMRdT9c8AfI5T0
         8WPWUkI3bMrH7IDCxjpIVToymOl+8kgGoml/angG/kWsfAc+cZ5aPIDOxV9aM6G8AS8a
         0sgoH4EgEfPGPcGV2TNabICG1icj7si/TI01+mLTUogTLHv+Nh+roEgAmCBFoDCTqYk4
         Gjjw==
X-Gm-Message-State: APjAAAWficQLbv+wuLxfeZIp3OaD08BH4no2FcFMXt9lfTfFKJMu2jCP
        QNliJ5C47ocMuX10ytEkiYN5wH4t
X-Google-Smtp-Source: APXvYqyI3FccCVZg+oNY382QRbFZhTd3bSlEINfGQXaxFZ2HXmrADFKCbthurkNmBP/M+49ZurfeFA==
X-Received: by 2002:a62:d407:: with SMTP id a7mr21300061pfh.242.1576957005574;
        Sat, 21 Dec 2019 11:36:45 -0800 (PST)
Received: from localhost.localdomain (c-73-241-114-122.hsd1.ca.comcast.net. [73.241.114.122])
        by smtp.gmail.com with ESMTPSA id y197sm18512603pfc.79.2019.12.21.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2019 11:36:44 -0800 (PST)
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
        Wingman Kwok <w-kwok2@ti.com>
Subject: [PATCH V8 net-next 03/12] net: vlan: Use the PHY time stamping interface.
Date:   Sat, 21 Dec 2019 11:36:29 -0800
Message-Id: <1febd2b2d0a5bd99d70e9e46e8d794bbf8d118cd.1576956342.git.richardcochran@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576956342.git.richardcochran@gmail.com>
References: <cover.1576956342.git.richardcochran@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The vlan layer tests fields of the phy_device in order to determine
whether to invoke the PHY's tsinfo ethtool callback.  This patch
replaces the open coded logic with an invocation of the proper
methods.

Signed-off-by: Richard Cochran <richardcochran@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 net/8021q/vlan_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index e5bff5cc6f97..5ff8059837b4 100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -646,8 +646,8 @@ static int vlan_ethtool_get_ts_info(struct net_device *dev,
 	const struct ethtool_ops *ops = vlan->real_dev->ethtool_ops;
 	struct phy_device *phydev = vlan->real_dev->phydev;
 
-	if (phydev && phydev->drv && phydev->drv->ts_info) {
-		 return phydev->drv->ts_info(phydev, info);
+	if (phy_has_tsinfo(phydev)) {
+		return phy_ts_info(phydev, info);
 	} else if (ops->get_ts_info) {
 		return ops->get_ts_info(vlan->real_dev, info);
 	} else {
-- 
2.20.1

