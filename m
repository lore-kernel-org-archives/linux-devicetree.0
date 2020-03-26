Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB00C2D0EC
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:00:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 918FA20714
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 17:00:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sfZU1l0C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgCZRAK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 13:00:10 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46976 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbgCZRAJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 26 Mar 2020 13:00:09 -0400
Received: by mail-wr1-f66.google.com with SMTP id j17so8655782wru.13
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2020 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LxcKkp++L7yp/h9Hem5yr49+eGcTTPzuu5jvOWKTxmA=;
        b=sfZU1l0CsD8lTrhTD4XPLlFmnial8LrAHG1mR+jpGFP/i1SKVl8zPCXQPjbF7cihJh
         +A5dlLwmq9wcng6RiXhKVN6ZQPcEy+XekaY1TGo4OS+16+7A1kZ1/mbseAUOEqVQssGj
         iJq4CS4ZFHiDNtO/bVOiImEFDtPYP/aTNNwXzFc6B6TA2zHjeNuH5jICglqU82vI5Q53
         T6vDUfd/1Wqrwj7IVYbzuX9UZj2VhhC102ZjAxm/EY/wumUZBMHbGeTw0QXH6zTUZpfC
         29Eiz/WSLItxD1wbSw3oB9OHO/fCjYlfGcOhkNic3IyLT+teQHi7ww7K64o89DaBA1l7
         PCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LxcKkp++L7yp/h9Hem5yr49+eGcTTPzuu5jvOWKTxmA=;
        b=S3js/GZvPWO83ouctzGWF/cz0zqrs/BDP9mJlchRcpoQMWROvfXkdRKaP7GjOEA8UJ
         w8T9lVDXRYug5B9DCRasdLsBdWizDmOSppMhI3EhVOlHS383zYEGr334aSozMgqw2YFp
         w0MMIFG0sIfPVZj2FordkWjX8JJzgrv6dOisXh2Gz/kGw5uwCvdoo2VpPh6zoMoM4bz3
         L3oi1HlErhvB2ogYjhjcWzjO9VV+dSLeUC9NZbcS3c04tUR12Oej00FqjahRPBoaTkUE
         qdvjRbgLa+ThtX1ifn45F+3cMVpz/bRmK/iTTBRTSXDcaClo35quRb3dOzzczM7TsjHg
         IjKw==
X-Gm-Message-State: ANhLgQ04apK46DFBD42o4CdMArIrXdCQoMCHQccXqzxhoVJWJvXQBnGj
        qHX9mjuWVeFNcbevECW2t81pIQ==
X-Google-Smtp-Source: ADFU+vt678Nhxx77VFoeY4pri/SUs/4tTh321n/fUb14KxYkkqXRV/VnCnyzTCIaRDHORBpwNgx1Jw==
X-Received: by 2002:adf:dec3:: with SMTP id i3mr10862529wrn.351.1585242007735;
        Thu, 26 Mar 2020 10:00:07 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id r15sm4609823wra.19.2020.03.26.10.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 10:00:06 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/5] arm64: dts: meson-g12b-ugoos-am6: fix board compatible
Date:   Thu, 26 Mar 2020 17:59:56 +0100
Message-Id: <20200326165958.19274-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326165958.19274-1-narmstrong@baylibre.com>
References: <20200326165958.19274-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add missing amlogic,s922x in the board compatible list.

It fixes:
meson-g12b-ugoos-am6.dt.yaml: /: compatible: ['ugoos,am6', 'amlogic,g12b'] is not valid under any of the given schemas

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
index 06c5430eb92d..fdaacfd96b97 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
@@ -14,7 +14,7 @@
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
-	compatible = "ugoos,am6", "amlogic,g12b";
+	compatible = "ugoos,am6", "amlogic,s922x", "amlogic,g12b";
 	model = "Ugoos AM6";
 
 	aliases {
-- 
2.22.0

