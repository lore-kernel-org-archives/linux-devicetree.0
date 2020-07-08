Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79ED3C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 06:36:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5544F206E2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 06:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hdYrRret"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729381AbgGHGgx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 02:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgGHGgw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 02:36:52 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB80C08C5DC
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 23:36:52 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id k27so5105518pgm.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 23:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vTSYVuagsPVJ3arZC2dLSrcbPR3/Uq07aVivmBZDIrY=;
        b=hdYrRretcQ5LdTIJlE2lDzR63sUOm/1OPnTs+ON1QbpLSTYnuI4WjQvyBEbw9d21BI
         rAZ1dHBNjIk5h1au77R175NZfCr+riXzTQYuFugu8HZ3uNnRFxc9eeUevwBLqRvZyG6s
         tVQ3tZB09roGkq5QU0/SdsRuAj3c7PgofGPq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vTSYVuagsPVJ3arZC2dLSrcbPR3/Uq07aVivmBZDIrY=;
        b=qWZkvN0qzp3cekqLHMt4mZG6A0AN5oE87C2b7fEoz0umxBzlCfyvO2K+KEGo3eIszo
         UPg3Mx231KsNeSQnnW7hjU/JJLuVB8B54YJzvLTIi+0sd/V9L9yhflRLR0XIQOthXWXV
         5L2VFbczF6vdpeIbnndK6G9m2MfTc4vkg4RW6y3C0HUCvlFcCYTRpGDJ208QH4+8Xb6d
         zBjeYpiGVd1bg91ZBaAkv1kXdO1kCpCvoFdtx9gP8YHRKeotNni3ABLzAFz2UCaY5a4f
         /YFj70eu6bl730qN9pQTkGDJLJlWJtFgx5c4DU+AwgUDtxHYktcdmFMbzoEQANt0pDlf
         wNRA==
X-Gm-Message-State: AOAM533lG0mja/op/AbIaMxrcnS7w7roFuC+u6HVt/KjTm4+TJyl9cPP
        PiMEkkTAWiLDoWgCnOdGYlcf8g==
X-Google-Smtp-Source: ABdhPJwUU4427neVlZCpkn55ESlwB4P0L3vZsLOnF2iY0x/Qha/KVyGzhURpbdm1MBfwyGmX09kOIA==
X-Received: by 2002:a65:63ca:: with SMTP id n10mr49013562pgv.252.1594190211959;
        Tue, 07 Jul 2020 23:36:51 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:ade2:f5f3:8cc0:52f9])
        by smtp.gmail.com with ESMTPSA id c12sm24587898pfn.162.2020.07.07.23.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 23:36:51 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Tom Cubie <tom@radxa.com>,
        Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 2/4] dt-bindings: arm: rockchip: Add Rock Pi N8 binding
Date:   Wed,  8 Jul 2020 12:06:25 +0530
Message-Id: <20200708063627.8365-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200708063627.8365-1-jagan@amarulasolutions.com>
References: <20200708063627.8365-1-jagan@amarulasolutions.com>
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
Changes for v4, v3, v2:
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

