Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27926C55194
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 12:26:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08BB220776
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587731170;
	bh=OEI2R7+enJOr2IEcMB4Te9qDBFNBaSxgakT36s5/Vl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=DyyN5eosLk76iehA+Bn/tMMzMRACfuGxiK3qI4lOUFHD64Pful3WB/US+3w7ne+G9
	 YzRh9HzieJEO7zuTftzSdUIMbGoUa79EphyNLRQ0ON44t2bhACkcGn8TUI8CQ07wtP
	 jeszZp2iN3HDDSLorjqEG6w7arQ6O/6E1W2R1F70=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgDXM0A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 08:26:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:56016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728614AbgDXMZB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Apr 2020 08:25:01 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B35B21655;
        Fri, 24 Apr 2020 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587731101;
        bh=OEI2R7+enJOr2IEcMB4Te9qDBFNBaSxgakT36s5/Vl0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=brpbhhRn3ih6sEYy222GBZ3PRI0F+5SVaL0mwAI9hSy1+FOG93P6Hg2QtlKP++jh3
         LFiJ7iPKlC+1OBIHyTShcr9NdIzKMAdPy/Y7SI+x+yDN0SsLBq7Ydb9cU+FPE7Vm4e
         R6BJRQ7PI0hf2WH4KquSU7E0jlVpwaoM0w/z5/QU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Frank Rowand <frank.rowand@sony.com>,
        "Erhard F ." <erhard_f@mailbox.org>, Rob Herring <robh@kernel.org>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 12/13] of: unittest: kmemleak on changeset destroy
Date:   Fri, 24 Apr 2020 08:24:45 -0400
Message-Id: <20200424122447.10882-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424122447.10882-1-sashal@kernel.org>
References: <20200424122447.10882-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

[ Upstream commit b3fb36ed694b05738d45218ea72cf7feb10ce2b1 ]

kmemleak reports several memory leaks from devicetree unittest.
This is the fix for problem 1 of 5.

of_unittest_changeset() reaches deeply into the dynamic devicetree
functions.  Several nodes were left with an elevated reference
count and thus were not properly cleaned up.  Fix the reference
counts so that the memory will be freed.

Fixes: 201c910bd689 ("of: Transactional DT support.")
Reported-by: Erhard F. <erhard_f@mailbox.org>
Signed-off-by: Frank Rowand <frank.rowand@sony.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/of/unittest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 92530525e3556..40d170c1ecd50 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -539,6 +539,10 @@ static void __init of_unittest_changeset(void)
 	unittest(!of_changeset_revert(&chgset), "revert failed\n");
 
 	of_changeset_destroy(&chgset);
+
+	of_node_put(n1);
+	of_node_put(n2);
+	of_node_put(n21);
 #endif
 }
 
-- 
2.20.1

