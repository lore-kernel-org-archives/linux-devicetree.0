Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD42C33CA2
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22CFA2474C
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vOOpviAx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfLMNaB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 08:30:01 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40584 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfLMNaB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 08:30:01 -0500
Received: by mail-wm1-f66.google.com with SMTP id t14so6567667wmi.5
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 05:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CgnEiw//WJHGzufAg0EVPn2uPGD0ymse5mrY0tAd6l4=;
        b=vOOpviAxpLRGWbDnsRDeW/Z1cMyneMze+jcUF80fZMjE8m6MgW1/3+1igyAiE8jaQZ
         sd0ebigH6c+U2qkc0FI8CrJdSX8t/BFyvVanWL+z/ZwFmiq8KMr6hU04tpRbTrysoWaa
         yoPfSR4+yq0vvpWheb1LEqa6KrqxM4/w1DHAbcWu6R2h7cUrw86N2hRISkX0Sqf11C5/
         tomV/QGS/iS3FPhs4Qvi1TeuZWNaa5y1JuD7iZ079m1bD5Zbm6JGMM/bbeJrhG+RBg4J
         V4ST4UPBQEhdvtiaiIlEFYgjErWwFvWkj9ry2CB3q4X2skuv5zdQMWGc0Xopg/dgE4z+
         fPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CgnEiw//WJHGzufAg0EVPn2uPGD0ymse5mrY0tAd6l4=;
        b=Rf/hoYZzwgJSMLUxWnkBYdA5wlWb3JJ+uJzgwOAzto72JPedHU0BOirULrDwe6pBVg
         sfwFKVBtROWvKEVnLS3+rE9vqMD6VrKeAGWmzDiP7XfJv3fPUqcIXVmkIQ47GmFPvdjg
         NQXYa3KxqBsPZ0eDT3Y3YQzudvWD51HSONb8bMEGedq6azMRvRbMqfuFBn9JKnydBZR7
         bHTftsgNbuPD3qQ15MO9vlQ2tLCJl8nHJdxIHljYOGbLzeo5iYYmb0jD9deoW4YKVElV
         8KghmbBIw783I0OOlnT/eUf86ukJECG990uxs/9ujX3fuNbbiGH0lE8rZpmL8JTUbOe/
         FsOg==
X-Gm-Message-State: APjAAAXohjHdX0f5ukr+U2QGAx7hc8XMD0rGewDtCyBvISnAPNL20ZlZ
        1J8+ryv2C0TlaS3DL+ew28spjQ==
X-Google-Smtp-Source: APXvYqys8/RNfak7NGL62z6NcWptRE36wV1YR+wvRxs1Ya8mDCpWIYIyNly0sr/UON3XlfgQlSltTw==
X-Received: by 2002:a05:600c:149:: with SMTP id w9mr12997218wmm.132.1576243799677;
        Fri, 13 Dec 2019 05:29:59 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
        by smtp.gmail.com with ESMTPSA id n3sm10540543wmc.27.2019.12.13.05.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:29:59 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: dt-bindings: media: meson-ao-cec: Add support of ao-sysctrl syscon
Date:   Fri, 13 Dec 2019 14:29:54 +0100
Message-Id: <20191213132956.11074-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213132956.11074-1-glaroque@baylibre.com>
References: <20191213132956.11074-1-glaroque@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

ao-sysctrl syscon phandle property is needed for CEC wakeup support.
This property is optional.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
index 41197578f19a..1f721498d249 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
@@ -32,6 +32,10 @@ properties:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/phandle
 
+  amlogic,ao-sysctrl:
+    description: phandle to the ao-sysctrl syscon
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+
 allOf:
   - if:
       properties:
-- 
2.17.1

