Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481ADC33CB3
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 03:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B675206D7
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 03:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mQcwVJDG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730014AbgAQDiC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 22:38:02 -0500
Received: from mail-pg1-f170.google.com ([209.85.215.170]:34570 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbgAQDiC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jan 2020 22:38:02 -0500
Received: by mail-pg1-f170.google.com with SMTP id r11so10982247pgf.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jan 2020 19:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5t137Hgr25MSwppHZChMACb9jtzyL71KI0BNnXvPh60=;
        b=mQcwVJDGKnK0SDcsFxBlyFqk09ppdxI6h15y14y03P7PF6+y+/nFuzCxPPv2xamAmg
         9f1SnyEVfzmq+WI0syd1uuGa2xLJMeO6oxwvTiT4p1daaPWbfSkxNT8xQhoedU2BQ1IW
         aD+OCRq5eDLs7bjHcyv/zf+xeYagRhcADZW/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5t137Hgr25MSwppHZChMACb9jtzyL71KI0BNnXvPh60=;
        b=evPfKJcVzbCx6TgZ9k4KHwVMYbjUOeJr8pUsdU4wKBMZ+IPlhnpFMHFrsautFPkwuK
         AgJJqWJrKhjABPBXHBZvfZp+aqMcgIpi8DMPBSsI9bNnVz9mq56LanchB8d32tIUsK3O
         xKREEiCahHgfpnH2tvXzoOc9a4ynhew88WhLXS74DoxU3CTc2PydhlfjKbAK94stw57+
         GWUzahBHNHElswsPdG3C/CH70G0ABmlqbMOMtgRZ8WTFi5lOiRGjairBtxEr2U9TKbDw
         xMMl5PqE7vs6Xraz6w5YvZNPi6wuoAPWWPmd3LtHASW0Vtbpt/XoZRdtTKL/zmgj3VkL
         5sjA==
X-Gm-Message-State: APjAAAUHYdb/rdqXYtrPe8FNjZcQZexjQqwKYbEy60R3/n3Q3fAE2orv
        GB00+55cURgQ1/CRyUVwe9bNkw==
X-Google-Smtp-Source: APXvYqzy6hYrjE6QOAX5NisMiTl8d4lSUiT1Kk+Lfm0HFpcrBOX/uFVsjFLKOkfbYFQtI0ZIUMMm+Q==
X-Received: by 2002:a62:2cc1:: with SMTP id s184mr911908pfs.111.1579232281428;
        Thu, 16 Jan 2020 19:38:01 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id j38sm25940259pgj.27.2020.01.16.19.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 19:38:01 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH v4 1/3] dt-bindings: arm64: dts: mediatek: Add mt8173 elm and hana
Date:   Fri, 17 Jan 2020 11:37:47 +0800
Message-Id: <20200117033749.137420-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200117033749.137420-1-hsinyi@chromium.org>
References: <20200117033749.137420-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Elm is Acer Chromebook R13. Hana is Lenovo Chromebook. Both uses mt8173
SoC.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/mediatek.yaml     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 4043c5046441..abc544dde692 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -84,6 +84,28 @@ properties:
           - enum:
               - mediatek,mt8135-evbp1
           - const: mediatek,mt8135
+      - description: Google Elm (Acer Chromebook R13)
+        items:
+          - const: google,elm-rev8
+          - const: google,elm-rev7
+          - const: google,elm-rev6
+          - const: google,elm-rev5
+          - const: google,elm-rev4
+          - const: google,elm-rev3
+          - const: google,elm
+          - const: mediatek,mt8173
+      - description: Google Hana (Lenovo Chromebook N23 Yoga, C330, 300e,...)
+        items:
+          - const: google,hana-rev6
+          - const: google,hana-rev5
+          - const: google,hana-rev4
+          - const: google,hana-rev3
+          - const: google,hana
+          - const: mediatek,mt8173
+      - description: Google Hana rev7 (Poin2 Chromebook 11C)
+        items:
+          - const: google,hana-rev7
+          - const: mediatek,mt8173
       - items:
           - enum:
               - mediatek,mt8173-evb
-- 
2.25.0.rc1.283.g88dfdc4193-goog

