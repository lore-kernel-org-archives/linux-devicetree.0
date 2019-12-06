Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE774C2D0C0
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 10:02:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 838DC2245C
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 10:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MObQOadh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbfLFKCa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 05:02:30 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52998 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbfLFKC3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Dec 2019 05:02:29 -0500
Received: by mail-wm1-f67.google.com with SMTP id p9so7157008wmc.2
        for <devicetree@vger.kernel.org>; Fri, 06 Dec 2019 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0cCfs61dLVx99fBZ8UFqKBrRs+hUJEpQvqJWKvBMa08=;
        b=MObQOadhYDBbu2EhvJplj3lYX23ZswIvvTlFgDEbGop7S13xO0RHWB3A9+o+ulvTMI
         a08eVr1T8OxYHDi5IiHrdP47EFegmSYJwFjaCYNt7KDdFkWgKQ2WXcswoHYFYNRdbaRq
         Ctytm+wjPnbLnYhfm6U6JYbN2vR1EuAel6sKkVRO5S9t2uv2OQR8saPMdNvcP7xC4kNP
         SqDCvR6r4kwHkSdZsCvW1WpPzmJMp6KTmniuSrMNnN/kHQKcaqEU+EFcz7t6arJ4a+kP
         2e67P2Qm49H2vHiZoIbD8PJTmEYVE1JWbHeCO2qeWbmPUw90J2xtTIPa6ZrFjA2B4R9e
         SfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0cCfs61dLVx99fBZ8UFqKBrRs+hUJEpQvqJWKvBMa08=;
        b=fqKo1y+rjAh2rwaxIPHyfSsiV1iWXkORZJDFcFBS0HkQs7gq14G9RgasQCYTOVtIDx
         8wLsfcOCxhyU8zcKKqIYk2QRhcBByfrFVxSBzopYZkxGZJ6/8ey8JrYlPxRjrugrZhlb
         8Vh/mbRfxChPu6QrKAYKGyjxYhGPTgUmJaCjdvGOdkv9w7vFKcuIn7X3xm6DyuvmNoa5
         KINNvnVT42F93Lso7MQnRyCp5fe2tuoY0PUUNnvNlazJ05Hp4i7CXwwfNfUPf1LJSm4Z
         rdJyNU9d8aFiUIseVRPGCCc3RXeKlQBVc8WHPTHvDsWn1Vi5xS5mtFBhXLdX5OwcOtsf
         1seg==
X-Gm-Message-State: APjAAAUTxtqa2HB75V+zV1YUupcNQIBLrfEAc7VHMe08eoQuKPYak4h9
        NK00g2ux7pQicbBNVmqZCui1rw==
X-Google-Smtp-Source: APXvYqwWyugvW9+TBQfgxQt0TCNZmAm9UhZCkAv4q7Ivnw90ziAaZT6TtZbHNwqGrrWBE5d8nIgB4w==
X-Received: by 2002:a7b:c761:: with SMTP id x1mr9437306wmk.37.1575626547640;
        Fri, 06 Dec 2019 02:02:27 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id d14sm16372314wru.9.2019.12.06.02.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 02:02:26 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: arm: amlogic: add libretech-pc bindings
Date:   Fri,  6 Dec 2019 11:02:17 +0100
Message-Id: <20191206100218.480348-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206100218.480348-1-jbrunet@baylibre.com>
References: <20191206100218.480348-1-jbrunet@baylibre.com>
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

