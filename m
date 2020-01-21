Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC9AC2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 11:53:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9103924125
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 11:53:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uwou/e7W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgAULxH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 06:53:07 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34025 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbgAULxH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 06:53:07 -0500
Received: by mail-pl1-f193.google.com with SMTP id c9so1251202plo.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jan 2020 03:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/3S5mon5VDk6nkhKS1chVu47TkFHP/2m+taqKFCAbCo=;
        b=uwou/e7W7PCFfX7d2gX6/3Vq7WAki1MzMw1v/9OmR7gq0tETyM1+eMIJCFCmjC20GQ
         P09bH8U92KIT+plgMwGnLaDLwc5MmYzl2TQBY3tvrle4VWwfnQQ+we1V0qzx6WZeyoLu
         8TAIQ9tOKyw8/XfTm0BEXa6FyghzGD5qocDd2Fc68ajlJd9cDA9TCY7uoDp5OiqfWR7q
         //uH89kZFZl4RTnwzAXUVcnaeViY2y0fvdWa9chYTHAgdf8lddJ3+Ydh5HS8rZHAKDzb
         ojJzFiaS5lFFLAVAVYjmBsU/if8wl2tHwcx24QGrHiH4W7jLrTjPAM7iYh1y6rwfxAL+
         wsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/3S5mon5VDk6nkhKS1chVu47TkFHP/2m+taqKFCAbCo=;
        b=N1ymm3bbndH3tnZr1OomAg4BVdgu1Ob8s+q+XcwM/IxeHnggDVsdKqI7y6Ove+7lYD
         8iIgSEfSIuArwzK08f8AoWNSO1HHkKClaT3mtXYGiCvryHPbq6KxETxjEzgjNOYXspGf
         bZl3pRFLMKshx4IsmwPAD+b9mIrpFofHcw7PP7ZJght02faVAZmzxoWJIkUT/31Piz4T
         fLda7up/W1JD+Z6zpGyuXPYYyJfmB4k86RVxabm0aWE5hlvr2No0eS2c/n2kBGnIjmaV
         g17swvyajxganijy28V/x9mwcUUUUecpiYVPQ5IFP8MnkRpGSMmYFUcNM/tj9wj1nhhb
         uoiA==
X-Gm-Message-State: APjAAAX6RQf3USjLuoMPQd6uUvttl/UxNql3jpLh+aSu1NIr3HXvrlO3
        7zl5KF8y33yvHaWZ0lEPXxvLxOQE
X-Google-Smtp-Source: APXvYqztthmY94b4xleeH1RBzVRekGoQHvIFxQkIDCLoTQeMOP3AZ3iqgA50Iv/ewU0LFNKmNKKtGQ==
X-Received: by 2002:a17:902:8b85:: with SMTP id ay5mr4653873plb.253.1579607587173;
        Tue, 21 Jan 2020 03:53:07 -0800 (PST)
Received: from localhost ([43.224.245.181])
        by smtp.gmail.com with ESMTPSA id j38sm41190186pgj.27.2020.01.21.03.53.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jan 2020 03:53:06 -0800 (PST)
From:   lijiazi <jqqlijiazi@gmail.com>
X-Google-Original-From: lijiazi <lijiazi@xiaomi.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     lijiazi <lijiazi@xiaomi.com>, devicetree@vger.kernel.org
Subject: [PATCH] of: Use enum instead of macro to define flag
Date:   Tue, 21 Jan 2020 19:52:36 +0800
Message-Id: <00a5abf82a735ff0de442c28c25a60ff4b408a66.1579603361.git.lijiazi@xiaomi.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Use enum instead of macro to define device node flag.
And it seems that no need start with 1, so let's start with 0.

Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Signed-off-by: lijiazi <lijiazi@xiaomi.com>
---
 include/linux/of.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index c669c0a..b90936c0 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -140,12 +140,14 @@ extern raw_spinlock_t devtree_lock;
  * struct device_node flag descriptions
  * (need to be visible even when !CONFIG_OF)
  */
-#define OF_DYNAMIC		1 /* (and properties) allocated via kmalloc */
-#define OF_DETACHED		2 /* detached from the device tree */
-#define OF_POPULATED		3 /* device already created */
-#define OF_POPULATED_BUS	4 /* platform bus created for children */
-#define OF_OVERLAY		5 /* allocated for an overlay */
-#define OF_OVERLAY_FREE_CSET	6 /* in overlay cset being freed */
+enum of_device_node_flag {
+	OF_DYNAMIC = 0,		/* (and properties) allocated via kmalloc */
+	OF_DETACHED,		/* detached from the device tree */
+	OF_POPULATED,		/* device already created */
+	OF_POPULATED_BUS,	/* platform bus created for children */
+	OF_OVERLAY,		/* allocated for an overlay */
+	OF_OVERLAY_FREE_CSET,	/* in overlay cset being freed */
+};
 
 #define OF_BAD_ADDR	((u64)-1)
 
-- 
2.7.4

