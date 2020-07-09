Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACC4C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:09:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8DCE20663
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 10:09:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iQZYnRQy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgGIKJ3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 06:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgGIKJ2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 06:09:28 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BBDC08C5DC
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 03:09:28 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id md7so899719pjb.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 03:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EExkFy1OcEoe6hs+RoO17R7D/BdcPHITnB4C1QKxAF8=;
        b=iQZYnRQyY/Rd5x6OBKGksxsDi8e2Yb2fu9um+YtWL8vsm53OzTYFtGqd4BwtqP8+qw
         kv0aOjUtaVJb+5jFCASDDmRJcS8LXVH3A0VR0LEKuy/XBFe8HJtwIGPc5N0z6m4kH7eo
         jQ9zFv+SjkJk8jw9QGlzSh4ubuvXsyra9BwwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EExkFy1OcEoe6hs+RoO17R7D/BdcPHITnB4C1QKxAF8=;
        b=Fn6GAeyBYvnYboyj9P/fr+RgJ7QCW7EPcZ1Rs1YDj31Ix7f/6xwA3hz1YQYFCno8dU
         OuspiwlduCbKDtLkA99XTHv0RTsogDS+nbvcdCx+bp038llkYxLvptlnaUnTxZNm4vDD
         jK5y8Dl1Zhf+5n/OxaerQa3q9GBMucggnd6G+Rhl/dpWNKonfeextmRk1bOWVfT0EfSK
         UrEWdefJb1sDbUAn2D6mQ81tThpX01p2cQrEpim2PWtY+D6c7EJnJ2PQERj94vlB56nQ
         F+zgyBjeB6HaQ7qJfh97uBfi+uXV5dnFt61EC3DE77pEm3Tb0q3JC1qwVJri+Zd1adLi
         0G+A==
X-Gm-Message-State: AOAM532xT9hAwisTzkAsV6RxcD/f8nRzDF9pBbbUl0YRzwriV7MlqSdJ
        5qos/L6ZhGEUm++8Ht8eCD/6hA==
X-Google-Smtp-Source: ABdhPJzwzvF/tImkaU6BQ2i/55EtFUm0d/ctbkc1s7I05Kmsez5vCiLsMH/NIVe8h3zCznpVXliR3Q==
X-Received: by 2002:a17:902:d698:: with SMTP id v24mr23031167ply.163.1594289368237;
        Thu, 09 Jul 2020 03:09:28 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:24b9:69b0:e917:1d11])
        by smtp.gmail.com with ESMTPSA id ji2sm2076527pjb.1.2020.07.09.03.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 03:09:27 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v5 2/4] dt-bindings: arm: rockchip: Add Rock Pi N8 binding
Date:   Thu,  9 Jul 2020 15:37:54 +0530
Message-Id: <20200709100756.42384-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709100756.42384-1-jagan@amarulasolutions.com>
References: <20200709100756.42384-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rock Pi N8 is a Rockchip RK3288 based SBC, which has
- VMARC RK3288 SOM (as per SMARC standard) from Vamrs.
- Compatible carrier board from Radxa.

VMARC RK3288 SOM need to mount on top of dalang carrier
board for making Rock PI N8 SBC.

Add dt-bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v5, v4, v3, v2:
- none

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index d4a4045092df..db2e35796795 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -435,6 +435,12 @@ properties:
           - const: radxa,rockpi4
           - const: rockchip,rk3399
 
+      - description: Radxa ROCK Pi N8
+        items:
+          - const: radxa,rockpi-n8
+          - const: vamrs,rk3288-vmarc-som
+          - const: rockchip,rk3288
+
       - description: Radxa ROCK Pi N10
         items:
           - const: radxa,rockpi-n10
-- 
2.25.1

