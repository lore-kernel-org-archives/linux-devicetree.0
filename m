Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09245C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 16:12:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE4D1206A5
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 16:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCpA9Den"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgENQMP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 12:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727935AbgENQMP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 12:12:15 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57594C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 09:12:14 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id f15so1341149plr.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nf2fUh4L0xvb2gBsE6dqAlNe1Fn7n9Y6ufB37FLzpcs=;
        b=bCpA9Den6BRXP6DtJeKNE+xIPbA7NjvVBhI1cxHv25mwT6y/E4hqujy+oLv6uoFaxr
         dQeApqnC6ZTze3DEiCXMH2krcO0pOE9zZf6gsc174k8WX/O+bxvf0fDjVHqWVBRywKYJ
         wIo7JQGecv2bop3W91Gr/viQRaUE96Cthcgl8t/0XlCH/ghYTq4n9g3LmabrtVO3bFnD
         IyGH4yLOk1Phu597psLCI0blmYRhltWZlkoEOlV8OAvvQAntHrkYF7ccOCdAfSSI0vCh
         V8KLJ5f399PNQdesRpJF8RhqgZS2tOBcfxEk/Rk1RdjroP4bPotYbOOhjAVGjQc49Hd4
         E4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nf2fUh4L0xvb2gBsE6dqAlNe1Fn7n9Y6ufB37FLzpcs=;
        b=VziYkaMHT2+x4gAOAWC2PWQ7f1dYIgP8nVx545piMT8OKBIP2vSi3RbzyRyQlOu75R
         8qd5Ag3qLuhZL7ZTA/pweLROgkumXL5dOM0s2fRTc2sMUmMGpNsQi8vXGIdTRCV4eIi7
         aV/wycC3SpUTrT0K6nKwES4F7d1jFiStPYXO1HtN5PzpvxkkL+q9eZKuw3fy518bfZb9
         v/zT3D7viT/BYDPvyyHhShWCUn8uIhRbJse/bBEmBKLqalyYcyuw2NhnDD5eLr3rPrFo
         VaJhPl1Q2A4tzeeAq8sRCBanWBDnOs8f8CMUisNcfDa2bd3Wb+8Is/AGuKcgubu/eO6D
         vXCA==
X-Gm-Message-State: AGi0PubMmfmR+73kqdh/DQXziIq64I2VMVkCBdDa0lOb+9P1BtDL4RQV
        /XZNqIW26UtHRUMwbYrBAl6XFwec74Ur+A==
X-Google-Smtp-Source: APiQypIbw0aDPscUlDaeGJmUDx8BKosvpgvswBPyfcGiXK06S3xVDQfhzXazzdb43RYmuGX1crGV2A==
X-Received: by 2002:a17:90a:6403:: with SMTP id g3mr36897703pjj.99.1589472733793;
        Thu, 14 May 2020 09:12:13 -0700 (PDT)
Received: from localhost.localdomain ([106.215.24.137])
        by smtp.gmail.com with ESMTPSA id t5sm2331755pgp.80.2020.05.14.09.12.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 09:12:13 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org
Cc:     cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v1 7/9] dt-bindings: reset: s700: Add binding constants for mmc
Date:   Thu, 14 May 2020 21:40:55 +0530
Message-Id: <1589472657-3930-8-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
References: <1589472657-3930-1-git-send-email-amittomer25@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds device tree binding reset constants for mmc controller
present on Actions S700 Soc.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
Changes since RFC:
	* added Rob's acked-by tag
---
 include/dt-bindings/reset/actions,s700-reset.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/reset/actions,s700-reset.h b/include/dt-bindings/reset/actions,s700-reset.h
index 5e3b16b8ef53..a3118de6d7aa 100644
--- a/include/dt-bindings/reset/actions,s700-reset.h
+++ b/include/dt-bindings/reset/actions,s700-reset.h
@@ -30,5 +30,8 @@
 #define RESET_UART4				20
 #define RESET_UART5				21
 #define RESET_UART6				22
+#define RESET_SD0				23
+#define RESET_SD1				24
+#define RESET_SD2				25
 
 #endif /* __DT_BINDINGS_ACTIONS_S700_RESET_H */
-- 
2.7.4

