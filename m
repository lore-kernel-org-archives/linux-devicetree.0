Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BDFC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 15:30:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C625E22B48
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 15:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576078249;
	bh=tUQKIA9ui+kepIQIWdRJ34RSX3JHi7IGcr1wZ/OboWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ET8keC/VK1+PRywY0VEUtbnqaVVbl17u/o52dMuqfZPFnG+24wPvMr7x7b2NCvKT9
	 Logc+3jv728ms6evfjXuFRs28RHfOVjcLjprVtO1Mn6R1XvGU92MWsilgYUSOjzBBw
	 o00+YXxJ/d01UdLP5mWBPcNkyVm/lHgd3YFAFgCk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387481AbfLKPao (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 10:30:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:36304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387872AbfLKP3Z (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 10:29:25 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1358224658;
        Wed, 11 Dec 2019 15:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576078164;
        bh=tUQKIA9ui+kepIQIWdRJ34RSX3JHi7IGcr1wZ/OboWk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i79kP5FeYADj7UlGmbPLGT54S1SQ/fE35i1RX0EyAQj+rUsmQzkJqV7InbWbZN4/o
         8FsuBYKzhOFzWj/4UC2WzJNVN9d4kqsVQLgOAxudXKdY1vLGseNyeEpv5DRAWGDBk0
         +viPuIgGX+Kd2BapUMxAObDznvjMIqlP5ZIRP+QE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Erhard Furtner <erhard_f@mailbox.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Tyrel Datwyler <tyreld@linux.ibm.com>,
        Rob Herring <robh@kernel.org>, Sasha Levin <sashal@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 49/58] of: unittest: fix memory leak in attach_node_and_children
Date:   Wed, 11 Dec 2019 10:28:22 -0500
Message-Id: <20191211152831.23507-49-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211152831.23507-1-sashal@kernel.org>
References: <20191211152831.23507-1-sashal@kernel.org>
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
index 9d204649c963c..4bf6a9db6ac0c 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -965,8 +965,10 @@ static void attach_node_and_children(struct device_node *np)
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

