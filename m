Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5442BC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 20:16:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D76720890
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 20:16:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BCVdtmJK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgGDUQZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 16:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgGDUQZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 16:16:25 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CBFC061794
        for <devicetree@vger.kernel.org>; Sat,  4 Jul 2020 13:16:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id cm21so5819363pjb.3
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2020 13:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Pwa3FaE5tOhqm9VWi06eI/JUnaCwiRKrrFOCb3b/8Q=;
        b=BCVdtmJKEOCU6r8JCrHzJDPVM8EN/dHK2ItKsV6ymk1nWYbMIDlpH2ntTdb0FGtNNM
         cVEZYBXy/siafz6+boGi5TIO7o/+Ui7iGET7PFc+hIznFJ3XUiWvK3fe4JWm7yj3rKRv
         Xy25e2cAzVqORcpmPUrrmsEidl+wKmC31LENY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Pwa3FaE5tOhqm9VWi06eI/JUnaCwiRKrrFOCb3b/8Q=;
        b=bse71QLLf86VoROj5s7wqqV13kpqfDs6NlUIfwrCzuW711KXeDJevxPjafMXs+ThA9
         Ddl+xHiNtEr/6jvKDmfnVcWtAFAt0DmO6EI5gPhkcQRZGtJ4gtrkKbAKPW/x/dyS6lph
         eJml/PTnztZ2kBVR8zQ/oSXHXOxF9pDnVkYpfelDuQus5e9g4TdmFiSYZHh2pgSxeeBf
         SrMbgsfMcVJlkHTOCUNjlke2CrikOYjnzCRQ6IJhMIHWHUT3oa5jgerH53o60+zeAN2c
         RqeJJDBKbSueTUjiwdKtWNASMQ2EoDDiFLm4lBxopDi8+JwZT8qTJaGbRBfCrQUYmmel
         UAJA==
X-Gm-Message-State: AOAM532DWplleBz0A/3VG3dejOxr03+bwjuo+ypA4ZN1xdg3aAsIevPQ
        haWT5nBQke3LrOEOJU3sYxXxJQ==
X-Google-Smtp-Source: ABdhPJymbkAyrSbZ5ZZKlEnTRh+eUkzfKWa0yEMfNlD594tOjsE7aqAlUDNARxd465x1LgdSWEp9mg==
X-Received: by 2002:a17:90b:2348:: with SMTP id ms8mr42173414pjb.5.1593893784799;
        Sat, 04 Jul 2020 13:16:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:bdf4:3289:4b66:dcc0])
        by smtp.gmail.com with ESMTPSA id d16sm14960791pfo.156.2020.07.04.13.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 13:16:24 -0700 (PDT)
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
Subject: [PATCH v3 2/4] dt-bindings: arm: rockchip: Add Rock Pi N8 binding
Date:   Sun,  5 Jul 2020 01:46:02 +0530
Message-Id: <20200704201604.85343-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704201604.85343-1-jagan@amarulasolutions.com>
References: <20200704201604.85343-1-jagan@amarulasolutions.com>
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
Changes for v3:
- none
Changes for v2:
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

