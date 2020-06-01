Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338AAC433E2
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1130A2077D
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0e7CsGj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgFAIdV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 04:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgFAIdU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 04:33:20 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B339C08C5C9
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 01:33:19 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s1so7104830ljo.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 01:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T1ygFxHJVIxEBt6wXXS/imDDNlnn54bixhav2ujTgeQ=;
        b=G0e7CsGjPB7bgfXmsPT+GreUt0bZgbxMN5m4lGkUd6yEVQAi55HORmkcn/abWwOdEI
         0v4q3609ST8WdBQlLr9N1dUp9OkeL+xxc82LwOiA9Z6XI/PFp2OW9tUwlmxnY3ig/b+l
         CIkgRX9mTxEhWVpTKe9iDFG11CJ3Quc5ZJbwtEqhEXOy34yorbdB3UZCqb3+INMo5QE6
         odaU15AEbUisl3tMTVhtK5pHyMVq/nvlssu0yFRG6sZ7xGlgmOj7ySXoxM98v8EK7rnW
         VkJp395C1d0OsxcRiJ2N9IZMSG64JXXaV8PSqhJY7tPhKK/FWblyivhC6jf1fdTBMiqW
         ZKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=T1ygFxHJVIxEBt6wXXS/imDDNlnn54bixhav2ujTgeQ=;
        b=Xgok/5KnEpDwxArQh/k20eEO+/swHUqazp8sroLftVuwsSfKrgzeh/T4vK9ONfJ63l
         bse/TYpy0TXULTzl7LDvqG0hbF5Jv7x83oNFl2g0xwaD6RhC3IZxrfQgMK150xb8OjWF
         b7NlEVYBQmPOEGFnyn96QNzE4YQHtz3WcRqGvSe1uqNIz4Ib8h5EsCSBA+HVt7kfTeSA
         xX6fqGdUVxYyt8btoteMzMarvT5OzZrpe8Pv+0MCyRHIFTrxvYyzdG3xWH7uMpg3IOZS
         kk/oWmgyFWEFlsG0k5TpvmZgg4AYMgtNUUAVWf5eDKDS7wZubKwrkqAo1U+pSG3KA/hk
         3szA==
X-Gm-Message-State: AOAM531jSuBJft9wDeOell0pV8M0KCXGN8wDn2YeYikCwkdDVqO37CuB
        pJc2c5U8jx3aKW90kuGO8Qg=
X-Google-Smtp-Source: ABdhPJzp/TfYcE3kAes7KMoLCdOp5eZmICS8+hAoxDkSoycB5KLiH2g1SAmw5tlYuxcvBHTTyGtGBg==
X-Received: by 2002:a05:651c:502:: with SMTP id o2mr9750506ljp.434.1591000397645;
        Mon, 01 Jun 2020 01:33:17 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
        by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 01:33:17 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v1 3/6] dt-bindings: panel: add Hitachi 3,5" QVGA panel
Date:   Mon,  1 Jun 2020 10:33:06 +0200
Message-Id: <20200601083309.712606-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601083309.712606-1-sam@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This panel is used on evaluation boards for Atmel at91sam9261 and
at91sam6263.

The panel is named: TX09D71VM1CCA

The panel is a dumb panel that matches the panel-simple binding

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 60cc093fbd75..6fe0ac86696d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -133,6 +133,8 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
+        # Hitachi Ltd. Corporation 3,5" QVGA (240x320) TFT LCD panel
+      - hit,tx09d71vm1cca
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-- 
2.25.1

