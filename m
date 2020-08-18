Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B0FC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 16:41:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F031E20658
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 16:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3vQ1Ipy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgHRQll (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 12:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgHRQlW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 12:41:22 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C09CC061389
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 09:41:21 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id x12so15617694qtp.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vKX4IlBJnfB0xmvluNZPR99o+cLrN2unDCn3Aze27C8=;
        b=q3vQ1IpyQCDhf9u+B+kWNTK6xYYTD1P0ansnz5pVE0vcdiSdKQotkOEXhACmvzOD9D
         cVxrbT5lXxCxUyPF1cd4Dc7fuFwXY6bpwincdRxVxCKFazJ987cHIlcyygktIOPMc9rO
         iAg+1VaPOO5qcgcLoLtgu8MPgZ614sizH5PxdKS3Z3bpPysgVbQVOIfV75oBOpfaRs20
         j6NmJoVSHQ3CcJO8qgXjWGjQELJnU47wuL7LkLXNy3/Sxjjz94IZMAqoo64Aq+t478O7
         bTcUP79JrVLLogvgSdeKHgP3EmWWov9euynmR9dW9qKK+gXmy7Hgo8uqCEb6J6xORqpK
         5PjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vKX4IlBJnfB0xmvluNZPR99o+cLrN2unDCn3Aze27C8=;
        b=SBX+KsvL2583o6yYwEJpU5KETmNPy2QNDrNIG8TZOTSUAhTgF2Si0VeMZFIlI5cNaP
         JbfT9grG4o3yHpeCyT6IomUdJnSt7ZPm+Few1gd2nxkf9Zy/Gx37b4nyg1hCoH2NLGPR
         CtUq1TMnGNaKBBel+Hm0CWP7nKXKMQf2Uw3kmRGVRt6dHDCai+rb96BlYZ1R/9fsJvzg
         ZOhjpjzDM3T5K5Oif34laLp5Xq9HABfboQ8+YDdrfO/ZJ6sGqfMykKqfV7JNa/X0MMOM
         M3W5A9UQHgvbaHO5sZd4eoXpOQzaeZC+uBvpo1jjYqlsqVq6Zh+7Z2t9b+qA2J0t8aFn
         tW/w==
X-Gm-Message-State: AOAM532NnuWqAChFyIs4EVB6xlZi9kVuo7I4rroFPpLO7b85BWDYpWOd
        80p5M/TY3HT2xywdtUEjncQ=
X-Google-Smtp-Source: ABdhPJySNUSyAi9QKzpJIPEathkIdEwaL90E/c/r3Q+2novoq66vaehYMpo0KGT4jvzET7V8zgbepg==
X-Received: by 2002:ac8:3868:: with SMTP id r37mr17782759qtb.95.1597768879746;
        Tue, 18 Aug 2020 09:41:19 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:4fb::1000])
        by smtp.gmail.com with ESMTPSA id i75sm21929768qke.70.2020.08.18.09.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 09:41:18 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, shawnguo@kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: Replace Fabio Estevam's old freescale e-mail
Date:   Tue, 18 Aug 2020 13:40:42 -0300
Message-Id: <20200818164042.13969-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The freescale.com e-mail domain is gone for quite some time.

Use a valid e-mail address instead.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/clock/imx27-clock.yaml | 2 +-
 Documentation/devicetree/bindings/clock/imx31-clock.yaml | 2 +-
 Documentation/devicetree/bindings/clock/imx5-clock.yaml  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx27-clock.yaml b/Documentation/devicetree/bindings/clock/imx27-clock.yaml
index b5f3ed084ea0..160268f24487 100644
--- a/Documentation/devicetree/bindings/clock/imx27-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx27-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX27
 
 maintainers:
-  - Fabio Estevam <fabio.estevam@freescale.com>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
diff --git a/Documentation/devicetree/bindings/clock/imx31-clock.yaml b/Documentation/devicetree/bindings/clock/imx31-clock.yaml
index 1b6f75d3928a..d2336261c922 100644
--- a/Documentation/devicetree/bindings/clock/imx31-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx31-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX31
 
 maintainers:
-  - Fabio Estevam <fabio.estevam@freescale.com>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.yaml b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
index f5c2b3d7a910..1b902406e4e1 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX5
 
 maintainers:
-  - Fabio Estevam <fabio.estevam@freescale.com>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
-- 
2.17.1

