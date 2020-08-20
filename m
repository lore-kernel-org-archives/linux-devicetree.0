Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742B4C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 12:14:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37A5A208DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 12:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7lZ41k0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbgHTMOT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 08:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730472AbgHTMNp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 08:13:45 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D51C061386
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 05:13:43 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q93so1144566pjq.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jn+5o4H6zeY7VyKGNupBFWwGj562wXXIPMMgccIApSA=;
        b=A7lZ41k0rW3TynpNLvGqOj0lOKmL59ZV5z5ZoxheEImqxqwomvmgAaUx3cXChvhIvt
         33gv9nx9PIKEWZN6hGKH5CHUzgPx3bciFbWy1rmxDuzGeU91HB1cAC8cf6uleexCthuJ
         ZNA7Jw6I9yCYcFE75YQqil3kJhWgV2J2g9Bteor7tnLMDGVvlcRWlRAw4dKq0ZGpQORR
         oiNj8NjMfcoWQBri3/UT3g0Wh/RJOXDb9Z/A8UDycj+74g5pI3fs0vIUiclGJh/iv0Vb
         yZglv0PGLNYEuqleZ4pS55qyrU2BlbkjNVfn5/DzYdGTLsdRxq9dNIpFKjrLw3rWsqDr
         s2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jn+5o4H6zeY7VyKGNupBFWwGj562wXXIPMMgccIApSA=;
        b=GWKWpTYRMWnHZt8oqWE+7L320VoJQMtmQ3WWb+mGtvn7ixDHNNMT0fZ+m3kZGYQCzM
         oOLxCVJxJFyz0GfkuGdBdQ+kLMDQU8/3uM1r+QWGHchWUG4rcrBd6rvLn6SABdG/TmHw
         Gvk/f7BxetqN3vsw0TxBHGtpUjMeu9jAcjPPFixQuS74MBqpqYInXVIrA03q3WGwgG3B
         QK/mw9nlewc+l3WlnMq1OcQRVM/aPzhm4p9ClaeDr/nXg3di1Bkc05tsXIC/W/GLidTZ
         3d5fXOYk/Ax7HpjaBvC74A76BSAAQE1WAdOujn70HXK5v9Lxd3rJftnFqIEwkCwK/ppJ
         G/Rw==
X-Gm-Message-State: AOAM532wqvCyG3ZzIKB0+SKRbAkGJc6Dpb8BpotE2nquX6cFkaNlLGQ2
        Sy9VSWickdmu3TeJ7kW5QvPASqG2IQ8=
X-Google-Smtp-Source: ABdhPJxcQZ4Ph+CBUf/FlU6S+Ikk2Tw3836twRc+Mg/vKpx39hVWFfhDfq0hPl5C19/rsB4BAFnCkA==
X-Received: by 2002:a17:90a:ea82:: with SMTP id h2mr2256290pjz.75.1597925621188;
        Thu, 20 Aug 2020 05:13:41 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
        by smtp.gmail.com with ESMTPSA id p20sm1985937pjg.44.2020.08.20.05.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 05:13:40 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>,
        Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 2/2] arm64: defconfig: Enable RTC devices for Amlogic boards
Date:   Thu, 20 Aug 2020 17:43:23 +0530
Message-Id: <20200820121323.564-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820121323.564-1-linux.amoon@gmail.com>
References: <20200820121323.564-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enables the RTC PCF8563 driver used on Amlogic Libretech-pc
and Odroid-N2 boards supported in mainline kernel.

Cc: Kevin Hilman <khilman@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e0f33826819f..3d9756833e0e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -773,6 +773,7 @@ CONFIG_RTC_DRV_DS1307=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_PCF85363=m
+CONFIG_RTC_DRV_PCF8563=m
 CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_RV8803=m
 CONFIG_RTC_DRV_S5M=y
-- 
2.28.0

