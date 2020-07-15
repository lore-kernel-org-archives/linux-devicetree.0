Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAEFC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 16:06:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 562ED20672
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 16:06:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1DFHr94"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgGOQGP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 12:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGOQC5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 12:02:57 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8314AC08C5DD
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 09:02:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k71so3281471pje.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 09:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ONMsXX62nreiDek2NacvQXRvDdUz5gOYMEjImyh+rKM=;
        b=b1DFHr94cTrHN8JQTkhLe4T5+9sKO7kL2Z89KtRkC6H5yCC8NnJidJ9Cbchb7m4yTq
         U/oiuabTwBC04Gi8AH2vCwx4U2Mrxdkb6PUdK26xbBLY01kywiaPyaPxR1s9BDna5SOX
         hygzbXDpavG+9Baqx12pVeCXMg4RXY0CSRLP5uADPZMqHehJcH6xeY0lXQBNoqq+1Txl
         yzRTr3ZpLznfnllWLsQxAJ5Sg7viPeTK74ZoVdVdkRbSGfJF9IhdrRfFP1ObIbyUBSF3
         y2cC/EWYVY4fOmywKF7oFEtDnNIB+LryEHnWh7L9j6DUX1lVdiF2FcZ2VDnEjydiGwcC
         p7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ONMsXX62nreiDek2NacvQXRvDdUz5gOYMEjImyh+rKM=;
        b=b/fG2dGa3geVwGOb6LlzkKkuie+u7heY8fscO7m83jAOoa47MZ1g11R90rVap8eeKx
         XBb7bJsQRzWbaqukuYOdedfxVs8xxqTykJNHbMc3cNmtZ4Tu7jq7FmQ2M2gs945/J3ta
         fRi+xjIyDNqblqbFCe47SOPS+wDILYvhJAqSN6fcfKeurxgk/h68EIbJl8Hky2rqih9s
         FICm9TqclJbFQ81IVXPHvZbzRPA3l9voJ/Sksm3SMQriI9/JxjTZnjmDGGLKH3KjtKTb
         tyKV95u9BZnopF7No9hakB1Pit4XSzaBIYWL3oNkzqw/oWTXTMGLCmTYY3SOB8TyAFwj
         q8lw==
X-Gm-Message-State: AOAM532oAi5jBeVCvqJBWqXMDkHTQYtBpyKjbc+VKU2LMsPIf3uYLpRJ
        vDPSiYFGDy06VjfnyX2CBm5sy/e/
X-Google-Smtp-Source: ABdhPJyro64eyt/drNbskWh/gd9L12mmYcHVdGkhNqWQ0dNOPgalDclPEDPxI6wC3tu/DbC0y2GsZA==
X-Received: by 2002:a17:902:8681:: with SMTP id g1mr110985plo.303.1594828962977;
        Wed, 15 Jul 2020 09:02:42 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.198])
        by smtp.gmail.com with ESMTPSA id 4sm2520157pgk.68.2020.07.15.09.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 09:02:42 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCHv1 3/3] arm64: defconfig: Enable RTC devices for Amlogic boards
Date:   Wed, 15 Jul 2020 16:02:09 +0000
Message-Id: <20200715160209.652-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715160209.652-1-linux.amoon@gmail.com>
References: <20200715160209.652-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enables the RTC PCF8563 driver used on Amlogic Libretech-pc
and Odroid-N2 boards supported in mainline kernel.

Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 883e8bace3ed..a0e8d46c3d06 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -750,6 +750,7 @@ CONFIG_RTC_DRV_DS1307=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_PCF85363=m
+CONFIG_RTC_DRV_PCF8563=m
 CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_S5M=y
 CONFIG_RTC_DRV_DS3232=y
-- 
2.27.0

