Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B547C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 14:59:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F2662054F
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 14:59:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dZcgLnNG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728932AbfLLO7a (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 09:59:30 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37910 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728966AbfLLO7a (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 09:59:30 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so2852468wmi.3
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ac9PpPgQ/84i6pezXabxCQJUJWE1oGmfoqB8QI/gWCA=;
        b=dZcgLnNG3uYFgy6p80XmLl3qh+7E3BAQitI3+SR9eKqYAPkjfo95LtHK3USmkYHo50
         AawUALYM+B6a9KUj32JVT/yMJJ98eOmyat2sNM3CxhF3gRX0hCs19y26yN9JNaChJ2Vy
         OdEn0/d/YyS0kFNWPO84pRTr8S1Hv1ZWy8Vgp+rL+eGdCIcWQq7VVHgwCSCjPall2Bse
         iwsiZ73eWKDn80coakwDxHbqO1FafBda38kYY80Ubz6OHu/6C/InoLkI7jQxe5llbW99
         ISY3T0HiO/Lszoq4IsEkE9ZqlFlHMWJ1oAABHkopJKE8D6ZD9OdMw4lff6laB8O/lUD7
         vwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ac9PpPgQ/84i6pezXabxCQJUJWE1oGmfoqB8QI/gWCA=;
        b=qq3ERlILl1qmAk8ycOp3zU/Z3fJQ8NmQDJBIyu5T3MXWrlrcJORQayGJD9HMcrCg3T
         MLG5v4dnsZQik48yJveFOGYDJFwc7JKI2aARrdEjWwr8hPspDW2FiYnanQ9JFpYSDONi
         3tHDL4JouukwT2wmEXr83nx84OcBTcXQXETzJAb/pPj4RatVvHPGW99WRhtmVX2bBVgr
         o4gP8KFBL14RjjoM2sdHmYsCZOaNevH/kuqqycGcazeJ6jzvMUl6LInouwyYsdSOrpNM
         wMuBVkiR48BlbiKMZANgtQKOx3dCe49KPsYrv+rZ9lTJNRqZl5rkgOkNCHDGkpqFUDMm
         Xp8g==
X-Gm-Message-State: APjAAAW04H5uTJ6cWQoL0e7WjlanR5R+7XgHUmqZ9BFOc5GHKEC1T763
        uTKmTDnQpg0IwyoD3afQxak4vw==
X-Google-Smtp-Source: APXvYqz2EGJjniScqk1Lxu2Wl0Wslazw8x8Ill6fOn6GyF/VZNUHKYjPi5ScqDMGw6WkrreVEEsg3A==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr6903909wma.138.1576162768162;
        Thu, 12 Dec 2019 06:59:28 -0800 (PST)
Received: from glaroque-ThinkPad-T480.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h8sm6670292wrx.63.2019.12.12.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 06:59:27 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: dt-bindings: media: meson-ao-cec: Add support of ao-sysctrl syscon
Date:   Thu, 12 Dec 2019 15:59:23 +0100
Message-Id: <20191212145925.32123-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212145925.32123-1-glaroque@baylibre.com>
References: <20191212145925.32123-1-glaroque@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

ao-sysctrl syscon phandle property is needed for CEC wakeup support.
This property is optional.

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

