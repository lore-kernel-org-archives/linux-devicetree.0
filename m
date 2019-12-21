Return-Path: <SRS0=APCC=2L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F884C3F68F
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Dec 2019 19:36:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FF51206D8
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Dec 2019 19:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyW7hbI+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727190AbfLUTgp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 21 Dec 2019 14:36:45 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53712 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLUTgp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 21 Dec 2019 14:36:45 -0500
Received: by mail-pj1-f65.google.com with SMTP id n96so5634391pjc.3;
        Sat, 21 Dec 2019 11:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ORrC0T+zd9DLceUTGoVwHDDyI0A9+B1dcciiqwr3CkI=;
        b=QyW7hbI+sxpDkg85PTgKX5AXFOk6ScXlz2Idq6eGLPXjmaubwFHk7Tk8ywcmpCRmLv
         E2Jc6gXjdGdsl/+/zxpV/ciEUnw1Px9kEN4YETDYoHwUL6ZQp8t1fEtpnyEV/OHG9vB0
         FMQRm1EisEkEvWF59d7AL1nBtDGGZeDktTku8ejV320/H/ETQDEMlkqoSlobkq6QMHwv
         m4o2p/ClTKpOAYKA6Q4CsWvDAHrGUIa33SgmPJBiVf1nZ0YdxyaDgpRKcq1IXKwual+h
         zLNF1vvXnzxcrd6JONcQmQBvpX3a42TtHAQHfEnOdPydqzJQNcxZ1c1/PgvPhuHEF83M
         9MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ORrC0T+zd9DLceUTGoVwHDDyI0A9+B1dcciiqwr3CkI=;
        b=HZaYi206rrz/iVJo/nWeMvDx6F0fORlEzxXZhT5bECwGWjp96OqzBFWk/LS4MMiJrY
         9DDs3Pf3ZwLZ9s6C7NyZk2klsFcn7HeWQeEOSr8FE8iWlIgJewbdERv/PZQsJo6SsiF3
         ZNDDHji5bewBD4HAehOg3f7f0C/DKF1DyrN6FoLzDrixZiej7Lo4owqyXr5rTwA4op53
         sNs7xi/MmzFGg5izyWX2QG24Nl8AxucLwkWMvw205zAS1y8YMxtbflyuEaqtKPH+tzIL
         E/BBJAL/8ne/GbFz97hOB0v8BCEzQYXyuye6J1NuPidr7KTblCBVgdMwzLU671nbNltB
         J4FA==
X-Gm-Message-State: APjAAAUyNc7TWYUBCC2cEPH3jNHJbNgvRXy8NaIyWJx+btaT1AnONWUd
        OG9NzW5kX7jRN1maGfGu619/LtbN
X-Google-Smtp-Source: APXvYqzfi1wKrKw8CopwrAcp7jQxmLtEJO/yPB8W4iXzW1RHQzPNZHRY377dleM5nKbRMhxB94IsTA==
X-Received: by 2002:a17:902:d686:: with SMTP id v6mr22893200ply.266.1576957004117;
        Sat, 21 Dec 2019 11:36:44 -0800 (PST)
Received: from localhost.localdomain (c-73-241-114-122.hsd1.ca.comcast.net. [73.241.114.122])
        by smtp.gmail.com with ESMTPSA id y197sm18512603pfc.79.2019.12.21.11.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2019 11:36:43 -0800 (PST)
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
Subject: [PATCH V8 net-next 02/12] net: macvlan: Use the PHY time stamping interface.
Date:   Sat, 21 Dec 2019 11:36:28 -0800
Message-Id: <de05fb4ca400758bac3c3930dec47841f3fcba9b.1576956342.git.richardcochran@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576956342.git.richardcochran@gmail.com>
References: <cover.1576956342.git.richardcochran@gmail.com>
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
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
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

