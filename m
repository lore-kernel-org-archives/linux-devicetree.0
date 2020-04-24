Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6852C55191
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 12:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C72D820706
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 12:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Fqx8dSb4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgDXMoR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 08:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgDXMoR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Apr 2020 08:44:17 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48825C09B046
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 05:44:14 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r26so10570992wmh.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2020 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xOdCgu/2Jy1tRi9zrYa6LH0k7m/VVjyha5EYFTG8NAo=;
        b=Fqx8dSb4SMac40DSvMTs7OdAWMYlayXuzLjkXiSvM/Hffc5WJknmgmnXLrrTHKpn2X
         0LkAKofMeSpQHMPvFNZSJ1Muv0cvJEXfsrkTjZ8le0kNVd10v/kh0p0mGsoPn/Sd01EK
         BE4vRSTePinMwUD/eZb/gMQ9AqXloYjTlbrsEFUpRzRz+z56zW9PSXgllsk4vUpjv9J0
         2PgpgaEiqX/z+UR0BmAH9WVGA5kwS3s3kxg1mBDXq6nkX+IFlROXk79HQnmAlz300v/j
         QxJCl5BQ9xbhC1Rh/MZKGylXN4Uj5ZrtMbxDzoDbay3FocxYJ1jarsL12w114sDejED0
         CeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xOdCgu/2Jy1tRi9zrYa6LH0k7m/VVjyha5EYFTG8NAo=;
        b=KDh4JNbHLpC2+voVCqoG+9qtvOGrGL2RI3kVi0WA8SWfaXsCyiRHJ6ST8wE1cWUCit
         o4B6LhA7uiRHsWKLsKkz1CO+uU1Vw788d5Yb4fRgE7OCihcLCztFNhcnfR3Zs86d6HkY
         SiCYn3wwx1kG/GSk8U5kNygjc3W4aGkrcAgVIpi4IWaGvrzjPhhP8SaJDKaZUNALPr2g
         p4Lp0J7DLOj2W01mrOwPFj5ylVuEd8UYMsrhB4RmKAXUgBNZKcT6IZG7NXzDcYdPzHBd
         kll7ceJYSl4xjeTd5KALbGgyUnzyU9ro3mw0SU4/0SgtCYLDtj703c3bGD2hevfKxts8
         LHeA==
X-Gm-Message-State: AGi0PuaMb7v/na1NIDSBexgNpkFYTms5nuaolXIMZovwuzqnDvsK2u6Q
        LmAR9IAFyzlMjp44obL4daox3w==
X-Google-Smtp-Source: APiQypI4uWmGIsxURAuSlISBDYaM7+FkzOgegq+RzXjv0ah8X7qTCaEjsrJvykKg8cNJ2UGbrdaBFA==
X-Received: by 2002:a1c:44b:: with SMTP id 72mr9777439wme.58.1587732253434;
        Fri, 24 Apr 2020 05:44:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
        by smtp.gmail.com with ESMTPSA id q184sm2692689wma.25.2020.04.24.05.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 05:44:12 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add odroid-c4 bindings
Date:   Fri, 24 Apr 2020 14:44:05 +0200
Message-Id: <20200424124406.13870-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200424124406.13870-1-narmstrong@baylibre.com>
References: <20200424124406.13870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the board bindings for the Hardkernel Odroid-C4 single board computer.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index f74aba48cec1..11908b151e0a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -159,6 +159,7 @@ properties:
           - enum:
               - seirobotics,sei610
               - khadas,vim3l
+              - hardkernel,odroid-c4
           - const: amlogic,sm1
 
       - description: Boards with the Amlogic Meson A1 A113L SoC
-- 
2.22.0

