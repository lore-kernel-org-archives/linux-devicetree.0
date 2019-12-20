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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D15C2D0C8
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 18:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F10C21927
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 18:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkJ/1JKu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727474AbfLTSP3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 13:15:29 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:56029 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727655AbfLTSP2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 20 Dec 2019 13:15:28 -0500
Received: by mail-pj1-f68.google.com with SMTP id d5so4441065pjz.5;
        Fri, 20 Dec 2019 10:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OODuO3cQf/sLnSJw+k4jnIKQWXPwOQBlARmdG3AU+0k=;
        b=XkJ/1JKuB1MJJOEquZ97MzqaKfowCu87bNEnlrytD4tPP3ftTKzwoB9cjlamvkb5tQ
         nTh9EFQxLaz8r3ynE8/2RDxDUvtvg/t73d3bNDQ72BX6qJLECTovfWHVyKgqHmpO8oHa
         eVkIXtl1075WltNtcC+OFppoRlbdLXhBtgclR4lQYqlomwk3qWyxIaAwXi57qakQUlR/
         9mn872XrnPklLRxDekzcJaURLdQH0eYtvlXax8bHsu04ZOY66Lq0NIbH1Hf9o3DCmjOC
         oRepnb0RYR5ZUHD9ImT60dvK1wX+OJPcxW2UuiScdFnw7GMTJkEYKAdRkOROE4vRGDCP
         Gqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OODuO3cQf/sLnSJw+k4jnIKQWXPwOQBlARmdG3AU+0k=;
        b=A7h0dnh2OxohFS+a0rtEgJ1W4NS4yIgdH8n2nKJz5D/KYR8c0AgjjvH+hbfNjhx9LD
         L8fwTl9yWlvLZhyqhA22sDps57olSaAAJSF3yWFOCh3hMn/nHqtUf3zdz8rX6h/RWXSc
         3UNdYVECBkUNNE4frLomCcitqMi8zVk0FkxLdN6WSHLGehBK7f7uPBXQJ5zbPTZD51Gq
         ge0noB7cPRJjVdJ7U7O/gzTlgBjief0Quaz3fpwrDBXr5ZFremm9Ms9u8pYXFyvCmk2u
         3ibmJl4hOZxqDhlZ1emb/brPKzIs6uG8qiBNyrDApM43onV4zn3GMBOL35UixeaL1R7O
         GzVw==
X-Gm-Message-State: APjAAAUWVW1FQdqNhWkjn9uxgS6CD2NvCTX6zfSx8+PeJ+8wGNEBBXjT
        TbnzuwWMXiUZGMIW8tj1fZ1cc81q
X-Google-Smtp-Source: APXvYqxE1ElTIVWW0eiq9xiG7EA5QhHDgsyLRTUMo8sWWLhyWYJDiae41BLfJQslKGadwK8kokq4/Q==
X-Received: by 2002:a17:902:b611:: with SMTP id b17mr16799950pls.210.1576865727289;
        Fri, 20 Dec 2019 10:15:27 -0800 (PST)
Received: from localhost.localdomain (c-73-241-114-122.hsd1.ca.comcast.net. [73.241.114.122])
        by smtp.gmail.com with ESMTPSA id j28sm11833869pgb.36.2019.12.20.10.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 10:15:26 -0800 (PST)
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
Subject: [PATCH V7 net-next 02/11] net: macvlan: Use the PHY time stamping interface.
Date:   Fri, 20 Dec 2019 10:15:11 -0800
Message-Id: <c0d1f95851ef7459da05d439b3475335d0a00b61.1576865315.git.richardcochran@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576865315.git.richardcochran@gmail.com>
References: <cover.1576865315.git.richardcochran@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The macvlan layer tests fields of the phy_device in order to determine
whether to invoke the PHY's tsinfo ethtool callback.  This patch
replaces the open coded logic with an invocation of the proper
methods.

Signed-off-by: Richard Cochran <richardcochran@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/macvlan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/macvlan.c b/drivers/net/macvlan.c
index 05631d97eeb4..d066cf58c926 100644
--- a/drivers/net/macvlan.c
+++ b/drivers/net/macvlan.c
@@ -1036,8 +1036,8 @@ static int macvlan_ethtool_get_ts_info(struct net_device *dev,
 	const struct ethtool_ops *ops = real_dev->ethtool_ops;
 	struct phy_device *phydev = real_dev->phydev;
 
-	if (phydev && phydev->drv && phydev->drv->ts_info) {
-		 return phydev->drv->ts_info(phydev, info);
+	if (phy_has_tsinfo(phydev)) {
+		return phy_ts_info(phydev, info);
 	} else if (ops->get_ts_info) {
 		return ops->get_ts_info(real_dev, info);
 	} else {
-- 
2.20.1

