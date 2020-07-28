Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBFAC43445
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 10:04:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34C1920786
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 10:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="n+zgnpl6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgG1KDs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 06:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728616AbgG1KDr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 06:03:47 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E53C061794
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 03:03:46 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id m16so9624400pls.5
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TXJ1NcT71dEwTgLwEHbAIexF2sZraNkG0dfcffq3WTc=;
        b=n+zgnpl6izxCdwPColEiF7BthmQSJu0W9qVcaU8w2jpHl4AlhvKMhWHYNQ2KGBDP1f
         ht0rOB6qFSPnc51Kw+CVijEUlnreN0DWFdA3IBdNYstF1vrupxKFKhxC+jEEhjcIikPx
         FBhge84POcFmeA3T3N6Cbh6Dg95yj9i/mVmIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TXJ1NcT71dEwTgLwEHbAIexF2sZraNkG0dfcffq3WTc=;
        b=iFONpVe4go+zjIGGGYFyK4/ZpmE9sazA8XbyOny8cpvIOam1jkMgoAVn9uXBhUZrOd
         mXZ9WGz9DZa2GiTznO37tlHny5Bx+Uujyi8uNIt/fv49moaRLzt9x+8GUM5LJpFrPnFb
         pV+SgpH598POQe2RU1lHOV0it6vL+gEdGyXUVRZMsgn1wtAUwwCgpm6Ocd8r/byUArJ7
         QcjW3xbAjZy+QgYBJ330M5ZuUAatk80rAm0G6VeEZ34qLEtMIq3ThiP+ttdbTZqRzR74
         Xlt6eBOq3ClPCAKNvCi7NGDXVxYJB2BBRHsMwhSmONz2T4ErHaWFkSAoiB6ZQtwsYHbz
         2v2w==
X-Gm-Message-State: AOAM532a6GPk4Fht1wRLvRsSUQRBYqq7m+pCV8J5l40NaM1Piho1bGxT
        zUzc5pxKejxT/guqS6LOUMB2cQ==
X-Google-Smtp-Source: ABdhPJymtzzdhRqF/IbX/Qzvm3iVr+Td5JceDYBkjyIaF9cNweNSdmOTtlzXUjz+bkjmqWFrxpjE3A==
X-Received: by 2002:a17:90a:a68:: with SMTP id o95mr4007863pjo.64.1595930625746;
        Tue, 28 Jul 2020 03:03:45 -0700 (PDT)
Received: from shiro.work (p532183-ipngn200506sizuokaden.shizuoka.ocn.ne.jp. [153.199.2.183])
        by smtp.googlemail.com with ESMTPSA id u66sm17779018pfb.191.2020.07.28.03.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 03:03:44 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To:     soc@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, arnd@arndb.de, robh@kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 5/9] ARM: mstar: Adjust IMI size for mercury5
Date:   Tue, 28 Jul 2020 19:03:17 +0900
Message-Id: <20200728100321.1691745-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728100321.1691745-1-daniel@0x0f.com>
References: <20200728100321.1691745-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

mercury5 family chips have 128KB of SRAM in the IMI region.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mercury5.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mercury5.dtsi b/arch/arm/boot/dts/mercury5.dtsi
index f68e6d59c328..a7d0dd9d6132 100644
--- a/arch/arm/boot/dts/mercury5.dtsi
+++ b/arch/arm/boot/dts/mercury5.dtsi
@@ -5,3 +5,7 @@
  */
 
 #include "mstar-v7.dtsi"
+
+&imi {
+	reg = <0xa0000000 0x20000>;
+};
-- 
2.27.0

