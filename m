Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E794BC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:36:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C970F20663
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="om4uVtV4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbgEFKgx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 06:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728338AbgEFKgx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 06:36:53 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057E9C061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 03:36:53 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id a7so654394pju.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NyUfCa4vJCe68eCfNgGfux9KsQ2+gDDMK2mefVqlCAw=;
        b=om4uVtV4ScdAbAbqXOFUyoy1ztwGhbwiIexBYNcdLG+KgjsQfosXFHDf3hbIMXvoyZ
         lDaxKjhfrGMGyOpT/qoFx/UjK5pHgafg4FFAKEXwZXyMyWLOq/+iXRL6nSXcVeZ6A7ah
         +CB4o3/G0eiKwlP9V4yiWA56Pq11Evg37fD4IWUL4MraywLVT9AsVrJidVl8ofeo9+Vc
         mh18GCTsHqRqcTKWTQI/s309UE00a25SI/ypFmSSbp72+T1TGlbrwEjgcpv4qemJOSbX
         /KbBv768cYRUdc8kD/Jo0Z0quZr3hbP0wKAoyXkQbHcL4aVpfL2IV583zgwdqiXERkl1
         uymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NyUfCa4vJCe68eCfNgGfux9KsQ2+gDDMK2mefVqlCAw=;
        b=ecsJI80bjFgFZPgvaj/rjv34OxgCSaccDGaEgT6it9jBsUHgjZ5YaR4rG0IXrxanRj
         DQhfn2umPaLN+O+spm0iIkUr4BhsYVheUQQTXjG/qIHR/yKMTHFApy10q8FDlPk+srK6
         Uzg9/JmzFdG9zRWi2lok68E2TH6Xo/8MLlmlHLJTQ0n2j8YSq/Zqg+a97Pov4e+17A9o
         thM4Buapq0O/yLqF04AhVJd2RvuVlMH+wk8yjQJmiS/gSWyfB74SNNxwr5nIjICAOplF
         VFV0LVlr0NnEtCmntEOWW2ka/ub9R5XPjVgDmvNNjAMGWPNDgXXZn/Ab51uMze3MT/VZ
         idLg==
X-Gm-Message-State: AGi0PuY5oXsD8H8jmYi6S1I6iCXfTpCmtkPCwLvzL5FmTzqttOPfEmmc
        c4Tx2FfOElgwqBJjimNPmDs=
X-Google-Smtp-Source: APiQypJ8UpWJLNv2ibr8GmkStj1YLbGnyIzwVViF+uWsg3JwYZsuzqOvITZy3G/+FWnKiLA4H8gbmQ==
X-Received: by 2002:a17:90a:bc8c:: with SMTP id x12mr1316647pjr.114.1588761412427;
        Wed, 06 May 2020 03:36:52 -0700 (PDT)
Received: from localhost.localdomain ([106.215.43.48])
        by smtp.gmail.com with ESMTPSA id i72sm1601582pfe.104.2020.05.06.03.36.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 03:36:51 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org
Cc:     cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC 6/8] dt-bindings: reset: s700: Add binding constants for mmc
Date:   Wed,  6 May 2020 16:06:08 +0530
Message-Id: <1588761371-9078-7-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
References: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds device tree binding reset constants for mmc controller
present on Actions S700 Soc.

Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
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

