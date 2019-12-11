Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FEBC2D0C6
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 15:59:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E3F922B48
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576079998;
	bh=IMKUB3WFZG/+SvJTD6DakkLU6JGoz3fFgZ4SomQZJQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=mk1dl+6YZZDrWQVHZmWnitym55S4UhkfHQcbT7IV28rpBKtPkqOWGME5xEneVO/fF
	 xhaFJe4X/nUKmTRTEGqSHSok7ooLIZH7HOF3AJG0MZyeOQMRtQmWyh7Um/MtXlsXz6
	 k+th/xqm07Z//zoCfdOG3Nb+Huw6AZt6mQ9FNNrs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729945AbfLKP7x (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 10:59:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:38404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731544AbfLKPN6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 10:13:58 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 664BA24689;
        Wed, 11 Dec 2019 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576077238;
        bh=IMKUB3WFZG/+SvJTD6DakkLU6JGoz3fFgZ4SomQZJQc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=is+9F5t0XtX/Z6al/ApsVcyz/eaIp+3c6AEzjNYwEB9L+nQG5W9csovDxjqtrTEeV
         nXMNEywUWT/1CSiEQaZufwW1lGkZn05oBP0SG9/SS0IEdj++qDZ3j3F/IDL5VS6/w9
         oqKg+ULuN0MeZmwe9ORfrvL9yh6BXADFCYhQiK6o=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Erhard Furtner <erhard_f@mailbox.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Tyrel Datwyler <tyreld@linux.ibm.com>,
        Rob Herring <robh@kernel.org>, Sasha Levin <sashal@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 116/134] of: unittest: fix memory leak in attach_node_and_children
Date:   Wed, 11 Dec 2019 10:11:32 -0500
Message-Id: <20191211151150.19073-116-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211151150.19073-1-sashal@kernel.org>
References: <20191211151150.19073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Erhard Furtner <erhard_f@mailbox.org>

[ Upstream commit 2aacace6dbbb6b6ce4e177e6c7ea901f389c0472 ]

In attach_node_and_children memory is allocated for full_name via
kasprintf. If the condition of the 1st if is not met the function
returns early without freeing the memory. Add a kfree() to fix that.

This has been detected with kmemleak:
Link: https://bugzilla.kernel.org/show_bug.cgi?id=205327

It looks like the leak was introduced by this commit:
Fixes: 5babefb7f7ab ("of: unittest: allow base devicetree to have symbol metadata")

Signed-off-by: Erhard Furtner <erhard_f@mailbox.org>
Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/of/unittest.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 92e895d864584..ca7823eef2b40 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1146,8 +1146,10 @@ static void attach_node_and_children(struct device_node *np)
 	full_name = kasprintf(GFP_KERNEL, "%pOF", np);
 
 	if (!strcmp(full_name, "/__local_fixups__") ||
-	    !strcmp(full_name, "/__fixups__"))
+	    !strcmp(full_name, "/__fixups__")) {
+		kfree(full_name);
 		return;
+	}
 
 	dup = of_find_node_by_path(full_name);
 	kfree(full_name);
-- 
2.20.1

