Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A324CC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 00:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D68D2074D
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 00:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6edPSIM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbgGAAx5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 20:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgGAAx4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 20:53:56 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A010C061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 17:53:56 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id c139so20593883qkg.12
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 17:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DWfrsv+gYTRmvQeznQWMbo/Wt0pAT4kWAkv0yoG8Cg4=;
        b=D6edPSIMaopOONYaDqlDIyHhCmTpfoUTkuf+ByPTuA1DIfgaz/tpP/9Tk1YxiNeNqT
         +1ehsNI+FbzkW/NBIYdm1DR1dytZqUqpDpEGAU8eriCt3Ex7IR3MjjA4SgP4wXctY4lT
         jOCrr+hxbZ7+DyLhPMulFuXfoazdSbbeUpRYqjOJNGA9vG+xmlPuwkGkFMNSuuE+/XTU
         9sDceY0MVSgpLynqbH0hsO38O70/lRbfsAmwEfJs48DB1zEmbUnQJf4U4KwDvrd/9Gzq
         MfrhZWzXqdg0t7es9vxQhQca6KVFevesOFXznV5PL1SpnvpE+ru/h+QH9lNEP+6IQ7tB
         BxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DWfrsv+gYTRmvQeznQWMbo/Wt0pAT4kWAkv0yoG8Cg4=;
        b=L+F2kemfNnZES4sxvrOlFG9ygHnVs46Dg4AVpdr0hkQPGzBwZOv/WKXiLUtVMnrjCC
         5Vt9oSj/aJ816rcz2Xkpda6V26s0k+j3N8yOVyYgh3PdIL2LGP6rc/ynumaNvD1A3Qg5
         BZothBTJlknkm9HVDFSHOstODvvUnYijoe8DxXJ/X8wcZfmiHuCmNGl/j8BmetLH4CkH
         3iRbAzJlu5l5Q/S1pIUfnSSwXOUb74ariMl6/3YPV9MHc1xL13hnT1C6j0hUJDrWWjnh
         oPzjaK/b3810cJXNOjNAqRArIXaDve/HiM9PlyTJNG0Fmjoeq2ixfo0IUDNN92NpodCf
         PUQw==
X-Gm-Message-State: AOAM5333FT1TX8WHKGkpQw4tigTE9sKqNAZnTvsnHQaBDz3dmsCsgDH+
        N29sef352om1T02qw2H50UI=
X-Google-Smtp-Source: ABdhPJwf33GvITHLbv9vt91a6G3ilvIRzzNfE65IpJvEkoIJqyp8P1bOL0KBbgx8NwupzkBK9udf3w==
X-Received: by 2002:a05:620a:20db:: with SMTP id f27mr20759878qka.345.1593564835782;
        Tue, 30 Jun 2020 17:53:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:d42f:2bc1:abe3:59f0])
        by smtp.gmail.com with ESMTPSA id g22sm3896132qkm.97.2020.06.30.17.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:53:55 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     robh+dt@kernel.org
Cc:     sboyd@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: clock: imx: Fix e-mail address
Date:   Tue, 30 Jun 2020 21:53:46 -0300
Message-Id: <20200701005346.1008-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The freescale.com domain is gone for quite some time.

Use the nxp.com domain instead.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/clock/imx27-clock.yaml | 2 +-
 Documentation/devicetree/bindings/clock/imx31-clock.yaml | 2 +-
 Documentation/devicetree/bindings/clock/imx5-clock.yaml  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx27-clock.yaml b/Documentation/devicetree/bindings/clock/imx27-clock.yaml
index b5f3ed084ea0..a75365453dbc 100644
--- a/Documentation/devicetree/bindings/clock/imx27-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx27-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX27
 
 maintainers:
-  - Fabio Estevam <fabio.estevam@freescale.com>
+  - Fabio Estevam <fabio.estevam@nxp.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
diff --git a/Documentation/devicetree/bindings/clock/imx31-clock.yaml b/Documentation/devicetree/bindings/clock/imx31-clock.yaml
index 1b6f75d3928a..a25a374b3b2a 100644
--- a/Documentation/devicetree/bindings/clock/imx31-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx31-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX31
 
 maintainers:
-  - Fabio Estevam <fabio.estevam@freescale.com>
+  - Fabio Estevam <fabio.estevam@nxp.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.yaml b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
index f5c2b3d7a910..4d9e7c73dce9 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX5
 
 maintainers:
-  - Fabio Estevam <fabio.estevam@freescale.com>
+  - Fabio Estevam <fabio.estevam@nxp.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
-- 
2.17.1

