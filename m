Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA72C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 11:13:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C292D206B5
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 11:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r61kbsKL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgHRLNS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 07:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgHRLNB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 07:13:01 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61394C061342
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 04:13:00 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id w9so14759167qts.6
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 04:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=QZPVo01MYYk5xHm6yZPHdluHMUcvUj34eRmnqhtEXHg=;
        b=r61kbsKLJEEaByRouJ8Y4DCt9bcmLuo8XWaiRQB1ugCQCN0/6QF7GZaOXWtxyMP3TX
         jOfh/kiytmv2ZDwAxcJprnDmUD2A6OG969j8UAZ6EWroUUKvmVjrdUA2Uvn/Tx1XwXAp
         go5Ivyj1kkH9xKkiVNF9JhTt98hqMJ8cn+wdGiYXV0RedhT4iMf/BzhuomdqAYSGachv
         OpwuI/4jS9matArh+RIstXD1hMm2LJYMsoG8NTDx6M6OXxuhtK0+iqCvPrqaWt0aQqgl
         wVUoTj3Dzbr29+N8P89OT5fvS98sl33bJkXPyRyl3kHIVZ55YNRUuEXZZfhrJ1fr9H7I
         QZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QZPVo01MYYk5xHm6yZPHdluHMUcvUj34eRmnqhtEXHg=;
        b=iIwsJKkamthCURozVAIMmzXZv3525GLrvnLoDZGjg64QAzQVuXRVrMkEbjYfPml41E
         xKifwyDtAkN+yv4Ylmk4yKvQ9lflChSwaQgAFYHR89ueXikLhlOkAD0ufRhGQENBSWfq
         8WUnt1zKtTq7eBp5SPMYRY+TQRq7M+nHBKLJk8H13QTKhD955YDfelTFrZPoC3cQypuJ
         Xe6ABwKgjFQKye2w5h2B/MQw+7V3tZGuA/I7DukfiTcQeQyGGqFte8NjkfF684b+ioiE
         T9Tooe5K6OQ1Vu4R+b/Kqmr8ftIjRGQdOROwocpNsvzdf9Ac33wDQY6wLZ6G9OeppO/R
         xFrg==
X-Gm-Message-State: AOAM531CGTGoZ2ug7d9eWkzm6Zt+XAa1m3lRaNfK5D5SbLVN6MDJiu1A
        9Z1MqRHkzm26GUYxg30r4qtMSCWQal8=
X-Google-Smtp-Source: ABdhPJza94G0Ak3u0/BkjKTiF4PRNbv2ZkFOUa5XTan91Wdx3WCz33ghFTclIPecl+wPFzuqrtMqbA==
X-Received: by 2002:ac8:180b:: with SMTP id q11mr17591527qtj.389.1597749179420;
        Tue, 18 Aug 2020 04:12:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:4fb::1000])
        by smtp.gmail.com with ESMTPSA id t83sm19635528qke.133.2020.08.18.04.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 04:12:58 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     robh+dt@kernel.org
Cc:     shawnguo@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: Use Shawn Guo's preferred e-mail for i.MX bindings
Date:   Tue, 18 Aug 2020 08:12:45 -0300
Message-Id: <20200818111245.17047-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Use Shawn Guo's kernel.org address for the i.MX related bindings
as per the MAINTAINERS entries.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/clock/imx23-clock.yaml   | 2 +-
 Documentation/devicetree/bindings/clock/imx28-clock.yaml   | 2 +-
 Documentation/devicetree/bindings/gpio/gpio-mxs.yaml       | 2 +-
 Documentation/devicetree/bindings/i2c/i2c-mxs.yaml         | 2 +-
 Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml   | 2 +-
 Documentation/devicetree/bindings/mmc/mxs-mmc.yaml         | 2 +-
 Documentation/devicetree/bindings/pwm/mxs-pwm.yaml         | 2 +-
 Documentation/devicetree/bindings/spi/fsl-imx-cspi.yaml    | 2 +-
 Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx23-clock.yaml b/Documentation/devicetree/bindings/clock/imx23-clock.yaml
index 66cb238a1040..ad21899981af 100644
--- a/Documentation/devicetree/bindings/clock/imx23-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx23-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX23
 
 maintainers:
-  - Shawn Guo <shawn.guo@linaro.org>
+  - Shawn Guo <shawnguo@kernel.org>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
diff --git a/Documentation/devicetree/bindings/clock/imx28-clock.yaml b/Documentation/devicetree/bindings/clock/imx28-clock.yaml
index 72328d5ca09a..f1af1108129e 100644
--- a/Documentation/devicetree/bindings/clock/imx28-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx28-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX28
 
 maintainers:
-  - Shawn Guo <shawn.guo@linaro.org>
+  - Shawn Guo <shawnguo@kernel.org>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
index ccf5b50e798b..dfa1133f8c5e 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale MXS GPIO controller
 
 maintainers:
-  - Shawn Guo <shawn.guo@linaro.org>
+  - Shawn Guo <shawnguo@kernel.org>
   - Anson Huang <Anson.Huang@nxp.com>
 
 description: |
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml b/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
index d3134ed775fa..21ae7bce038e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mxs.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale MXS Inter IC (I2C) Controller
 
 maintainers:
-  - Shawn Guo <shawn.guo@linaro.org>
+  - Shawn Guo <shawnguo@kernel.org>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index 75dc1168d717..10b45966f1b8 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale Enhanced Secure Digital Host Controller (eSDHC) for i.MX
 
 maintainers:
-  - Shawn Guo <shawn.guo@linaro.org>
+  - Shawn Guo <shawnguo@kernel.org>
 
 allOf:
   - $ref: "mmc-controller.yaml"
diff --git a/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml b/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml
index 1cccc0478d49..bec8f8c71ff2 100644
--- a/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/mxs-mmc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale MXS MMC controller
 
 maintainers:
-  - Shawn Guo <shawn.guo@linaro.org>
+  - Shawn Guo <shawnguo@kernel.org>
 
 description: |
   The Freescale MXS Synchronous Serial Ports (SSP) can act as a MMC controller
diff --git a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
index da68f4a25dd9..8740e076061e 100644
--- a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale MXS PWM controller
 
 maintainers:
-  - Shawn Guo <shawn.guo@linaro.org>
+  - Shawn Guo <shawnguo@kernel.org>
   - Anson Huang <anson.huang@nxp.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/spi/fsl-imx-cspi.yaml b/Documentation/devicetree/bindings/spi/fsl-imx-cspi.yaml
index 1b50cedbfb3e..50df1a40bbe3 100644
--- a/Documentation/devicetree/bindings/spi/fsl-imx-cspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl-imx-cspi.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale (Enhanced) Configurable Serial Peripheral Interface (CSPI/eCSPI) for i.MX
 
 maintainers:
-  - Shawn Guo <shawn.guo@linaro.org>
+  - Shawn Guo <shawnguo@kernel.org>
 
 allOf:
   - $ref: "/schemas/spi/spi-controller.yaml#"
diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index aedac1669998..16b57f57d103 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP i.MX Thermal Binding
 
 maintainers:
-  - Shawn Guo <shawn.guo@linaro.org>
+  - Shawn Guo <shawnguo@kernel.org>
   - Anson Huang <Anson.Huang@nxp.com>
 
 properties:
-- 
2.17.1

