Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE21EC33CB3
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 18:15:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 810C62073A
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 18:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579198529;
	bh=mynUvU4VETLk4vLUkgEPwAa4WjJc/2pFfQfwylbPkYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=j1ni+ZRzfVO5HxMkNxZ9hw5EGpQBKz1J2nXSRBMaQAsMM4mS8oRC/SjvI2PxQM5l8
	 lEroOZixUOxcnGyyJ7QLjsGPytPl2e40jQ5bDmrGtv0Fks5tfWl47ROeR7VyXYYGQq
	 9Ann2y67vHqHC4V5inb0yw2ZXWkDFd30y+heLNH4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392845AbgAPR3q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 12:29:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:41750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392462AbgAPR3q (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jan 2020 12:29:46 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC7022470A;
        Thu, 16 Jan 2020 17:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579195785;
        bh=mynUvU4VETLk4vLUkgEPwAa4WjJc/2pFfQfwylbPkYE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k1ZkjEh13eyfql86wVInOymiwYpB6e4YvDILRqUD0TZuvXc8OHOfOsjwoUihzjURS
         oJD8gfZ5vpkdi3eyiOyCBw7/nUIXOyozj/e+LypN5dp5OS6BiosOfj7v9/C4RP+gGK
         fMOdaNje/1/thnKYHHRMls/oWYGWx5uC7xgwjFtg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 308/371] of: mdio: Fix a signedness bug in of_phy_get_and_connect()
Date:   Thu, 16 Jan 2020 12:23:00 -0500
Message-Id: <20200116172403.18149-251-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit d7eb651212fdbafa82d485d8e76095ac3b14c193 ]

The "iface" variable is an enum and in this context GCC treats it as
an unsigned int so the error handling is never triggered.

Fixes: b78624125304 ("of_mdio: Abstract a general interface for phy connect")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/of/of_mdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index 8c1819230ed2..fe26697d3bd7 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -358,7 +358,7 @@ struct phy_device *of_phy_get_and_connect(struct net_device *dev,
 	struct phy_device *phy;
 
 	iface = of_get_phy_mode(np);
-	if (iface < 0)
+	if ((int)iface < 0)
 		return NULL;
 
 	phy_np = of_parse_phandle(np, "phy-handle", 0);
-- 
2.20.1

