Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D508BC11D2F
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB48C20836
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 18:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="VVgIVuSp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgBXSDD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 13:03:03 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:63430 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726208AbgBXSDD (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Feb 2020 13:03:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582567382; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zxu+g1RYguhrLklxI8OEVw/IzD4sIA+/4uSorGlT5ts=; b=VVgIVuSpyHWXwCTbBnH9lUiNzJt1KG5jMsXbwk4LspVT4za4Fm3l6E1crivHpAniR9c6caVF
 qheCi2rf81mXzOZcua+0+G76BefqkupWa1kdl5bnhcnS6apRxmsKVHyvdlMI2wnh0D5Awg5J
 eOePC3rxvfBVsFPU/ILk4fkD7nw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e540fc6.7f5a853c3fb8-smtp-out-n01;
 Mon, 24 Feb 2020 18:02:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9160EC4479F; Mon, 24 Feb 2020 18:02:45 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: isaacm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A56F1C43383;
        Mon, 24 Feb 2020 18:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A56F1C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=isaacm@codeaurora.org
From:   "Isaac J. Manjarres" <isaacm@codeaurora.org>
To:     robh+dt@kernel.org, frowand.list@gmail.com
Cc:     Patrick Daly <pdaly@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, lmark@codeaurora.org,
        pratikp@codeaurora.org, kernel-team@android.com,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: [PATCH] of: of_reserved_mem: Increase limit on number of reserved regions
Date:   Mon, 24 Feb 2020 10:02:32 -0800
Message-Id: <1582567352-4664-1-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Patrick Daly <pdaly@codeaurora.org>

Certain SoCs need to support a large amount of reserved memory
regions. For example, Qualcomm's SM8150 SoC requires that 20
regions of memory be reserved for a variety of reasons (e.g.
loading a peripheral subsystem's firmware image into a
particular space).

When adding more reserved memory regions to cater to different
usecases, the remaining number of reserved memory regions--12
to be exact--becomes too small. Thus, double the existing
limit of reserved memory regions.

Signed-off-by: Patrick Daly <pdaly@codeaurora.org>
Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/of/of_reserved_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 6bd610e..1a84bc0 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -22,7 +22,7 @@
 #include <linux/slab.h>
 #include <linux/memblock.h>
 
-#define MAX_RESERVED_REGIONS	32
+#define MAX_RESERVED_REGIONS	64
 static struct reserved_mem reserved_mem[MAX_RESERVED_REGIONS];
 static int reserved_mem_count;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
