Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B43C00454
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D045F2080D
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BjpNSB0H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbfLIOip (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 09:38:45 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44403 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727743AbfLIOio (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 09:38:44 -0500
Received: by mail-wr1-f67.google.com with SMTP id q10so16457625wrm.11
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 06:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0cCfs61dLVx99fBZ8UFqKBrRs+hUJEpQvqJWKvBMa08=;
        b=BjpNSB0H6WS+od4I9bWu7mlwGn05HdzHiVd7EYabnNtot4Dn/na/nH45rPrdImid/J
         75FjSOBvibW/Luu/9AxWOHuAYSGJ0mzkLyq2sutVsVezSxgFykoCtVWT1k4vx7Mbpjhc
         UYXRNVyIgHzzQQzV6FwKEUyLKUW5nQqtkB8GXEwMA/MTqi+/VbX+32/61QajiVtZgcA4
         +qq11SKhrE8bKeFclgsiYG1X6Yr9xjGZ/VMDrXh1FWCEQ4Q1l7Ka+C96/rFXWcXyokdM
         MPxrmWqGTQVxo+GsiGX44ZXLAcFra5YNstiC4L/BKDs2+t2bIyHJj/nJnX0YJsicd4xy
         9J5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0cCfs61dLVx99fBZ8UFqKBrRs+hUJEpQvqJWKvBMa08=;
        b=iVZqijuyemr+rHi+DG0HeF+iXcQ8RHIMcRxN56kD9+5r1iAIyK3euf8mX/1XYIZpnQ
         1mA78Tkh435rCV1FF+kRDjxQhci3CYeKTLxN1hnBQbchkNV8KdOpCLZA234H2mTM62YN
         gNwk4v/z4Y1OAZtXVCax5N42mPJogjV0Cv6GLYrBMDqXufYeEzIdbUNKIULIOv4L85/T
         1FhqpZ+g+qmOjY9gRD3qtJanJO2OZf7ojGmY5BrhkGIhFFkRB/8v7kQ2XkMLAX7UVBnz
         GvsoJ+Cqgam3/4N6kFQeVCRfdWUZgpJoy5bkd8zETNlOxrfPk56ET/33Wibk7XK6SPyx
         CTMA==
X-Gm-Message-State: APjAAAX1emi19lYX9p6TTqdb2GroIC2g800xe74MfsuYy8GGEGaCC6CS
        dw4yt4Uxd4eYTdy9Y4/rzhZ2eQLSFrQ=
X-Google-Smtp-Source: APXvYqxuKaXKo89bA2CEldplyJh5hTpjzijO2zBIg9wfzU3ZNPMf2FYGVCGr68YLEg/CiaQcsRPXzQ==
X-Received: by 2002:adf:f091:: with SMTP id n17mr2560209wro.387.1575902323022;
        Mon, 09 Dec 2019 06:38:43 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a1sm1904165wrr.80.2019.12.09.06.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:38:42 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: arm: amlogic: add libretech-pc bindings
Date:   Mon,  9 Dec 2019 15:38:35 +0100
Message-Id: <20191209143836.825990-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209143836.825990-1-jbrunet@baylibre.com>
References: <20191209143836.825990-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the board bindings for the libretech PC form factor

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index c6a443352ef8..2660ba3b129b 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -104,6 +104,7 @@ properties:
           - enum:
               - amlogic,p230
               - amlogic,p231
+              - libretech,aml-s905d-pc
               - phicomm,n1
           - const: amlogic,s905d
           - const: amlogic,meson-gxl
@@ -115,6 +116,7 @@ properties:
               - amlogic,q201
               - khadas,vim2
               - kingnovel,r-box-pro
+              - libretech,aml-s912-pc
               - nexbox,a1
               - tronsmart,vega-s96
           - const: amlogic,s912
-- 
2.23.0

