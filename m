Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6B8C433E5
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 19:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CBF720781
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 19:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="q29RmjN6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732321AbgGVTKL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 15:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgGVTKL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jul 2020 15:10:11 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534D6C0619E0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 12:10:10 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id md7so1896183pjb.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2020 12:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bCIGRDF+v4rmsAVdntIYzwaSfdyULw3/J/92ZjfTwCs=;
        b=q29RmjN67jVINzmZJ8BZkk9zKx6wl+d6S2ja4yUHdO3cjYZXaseICZ15OQWstGVNip
         hL1/JEW5mA6IcFsomV6+N0X3MSq7X7XB7Dse4S9FtEesrY7TNpuOCEQoD3XyPQkOEQyJ
         0o25B0FrfYXttBwN2jXNN2WraNTTf3H/qI31g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bCIGRDF+v4rmsAVdntIYzwaSfdyULw3/J/92ZjfTwCs=;
        b=rsNR79gyzpUJwG1ozm8eiUmaGnuWb/aME6GehmP7/PyQ8Sr3JTGp45zWzKRdABubA0
         RaEBO5fQYdavhGsNyJtAklH9UDdds7ByjpKBGc7lH7jj1m6Jw6EvSGBYfhm5+Yfr0V1A
         ZiM2ZqztjP0VuAh6i7YstNQvcN9N8FU0t2hVB1/Sz+3yrBOdKO3IhZ3p2CIYO6sheOz8
         tZp49RQJ+umNoUX6fjcgj3kMQOe33nwNKZ4XDMZvHXGnK5FXq5t2ChvIZ0M3T5b5g5ch
         6Ty/nFXCq58HeJKZiuxmQEM0rKl2hDpKc10+llSzMfMhbETXOJpI8hMb0BETU81Bcvm9
         rIvQ==
X-Gm-Message-State: AOAM531Huys3+VqegIwbyYIQKmB0alhtXt0TVBaG8S3Aj76l6qgiDnn6
        IdEzp++CYFKGRLdiWjdo3CzFDQ==
X-Google-Smtp-Source: ABdhPJz0DhSoM1xwsV+m+ZBDSIdc05gHOJrrfQLddbfFcRlyrd1Ph1ga0ZYgwid+a7Mld42GeWVJzw==
X-Received: by 2002:a17:902:e901:: with SMTP id k1mr831705pld.130.1595445009832;
        Wed, 22 Jul 2020 12:10:09 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:fda7:aaf8:9d1a:6749])
        by smtp.gmail.com with ESMTPSA id n137sm342398pfd.194.2020.07.22.12.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 12:10:09 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 3/6] dt-bindings: arm: rockchip: Add ROCKPi 4B binding
Date:   Thu, 23 Jul 2020 00:39:46 +0530
Message-Id: <20200722190949.215656-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722190949.215656-1-jagan@amarulasolutions.com>
References: <20200722190949.215656-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add dt-bindings for ROCKPi 4B which is similar to 4A with
additional AP6256 Wifi/BT, PoE.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- new patch

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 36057c9e4b83..7250adb43d24 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -448,6 +448,12 @@ properties:
           - const: radxa,rockpi4a
           - const: rockchip,rk3399
 
+      - description: Radxa ROCK Pi 4B
+        items:
+          - const: radxa,rockpi4
+          - const: radxa,rockpi4b
+          - const: rockchip,rk3399
+
       - description: Radxa ROCK Pi N8
         items:
           - const: radxa,rockpi-n8
-- 
2.25.1

