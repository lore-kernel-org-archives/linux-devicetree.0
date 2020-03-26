Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7135FC43331
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:00:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AB8420714
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wox7ZbpJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbgCZRA0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 13:00:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37956 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgCZRAH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 13:00:07 -0400
Received: by mail-wm1-f65.google.com with SMTP id f6so1289216wmj.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gxa9/8xWJiWiAnJoP5kcdi2AFtJ6sEZwxgWVvybuWHI=;
        b=wox7ZbpJR2NASF2XImey0+PMq5gjabP88qzzrAzsgIO2mqkDbs/puc5HB0nHa32xQk
         TXTvt06zZQwxr82wCkOyNUqWip+K4gcBV0/yfjHqZOB2D9CwNZ6+d/w1wm8ff5Jp7Mg2
         8Lswl8d+TITSc1mb8W4blydnLKgn7V84yBF/4TqWhFxhMPejKD+KiwaoTTjY/0FKBL2y
         /NTigJwaM8l7xFWt9jldZyq1e7u98g4b0cMCCv/UHurzcEBLY9KYDgbvAoBbqGHoBZrG
         FmX+xIPglME3YMudrQ6VCcj1v99R9WvBJ6rm3wuXXvuUu2BmMsxpah4S18PQzuMUERF9
         LwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gxa9/8xWJiWiAnJoP5kcdi2AFtJ6sEZwxgWVvybuWHI=;
        b=k3ay4r/ZFIii9wWY1Buss45/D1fNMKHqNJx67ZhwJDGAF4vmTauWpHRDFdLMgcxpgJ
         P8bUhynk+v4yfnkitbbd5IxR0ewj89S3z5JInWgIy8oPy+OG91UDDqENi0x6rOmcPd/q
         ssCdNLhdRJjY8l0UEJdbnxyuD8jZ+lAtfpcq6Ekcd+6nLpKVE1u/KfBRWf71UiYdDmif
         MbLTwe1o7rJ3fGkUB2ZYn8EvX4z/kroJlbAgveo727T/Y9WA/WNEovsax+viasFyhdxW
         haOWD603bs3a0i6XxaPycVZFf4BWVFndLYpnFCfX4LjyZBZynNnEd1lGrJIWXxmzdhdX
         Gz8A==
X-Gm-Message-State: ANhLgQ1rs3ARebmJfq8wbjE5W/T9O6to5V6jC9F09auucAX/2w7KSPED
        nwoO5AR84xkMWa6hTnZYAVlM5w==
X-Google-Smtp-Source: ADFU+vv6qM1KmchXEKdNWuCW7bywdYt5WvtsW2577e4jpNyneZiOrb68QnerCwIAlSk3xpt9y+hc9g==
X-Received: by 2002:a1c:2c85:: with SMTP id s127mr905935wms.18.1585242004777;
        Thu, 26 Mar 2020 10:00:04 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id r15sm4609823wra.19.2020.03.26.10.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 10:00:03 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/5] dt-bindings: sram: Add Amlogic SCP SRAM compatibles
Date:   Thu, 26 Mar 2020 17:59:54 +0100
Message-Id: <20200326165958.19274-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326165958.19274-1-narmstrong@baylibre.com>
References: <20200326165958.19274-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add compatibles for the Amlogic SCP SRAM memory zones.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 7b83cc6c9bfa..0aea3d239a48 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -73,6 +73,8 @@ patternProperties:
             - allwinner,sun50i-a64-sram-c
             - amlogic,meson8-smp-sram
             - amlogic,meson8b-smp-sram
+            - amlogic,meson-gxbb-scp-shmem
+            - amlogic,meson-axg-scp-shmem
             - renesas,smp-sram
             - rockchip,rk3066-smp-sram
             - samsung,exynos4210-sysram
-- 
2.22.0

