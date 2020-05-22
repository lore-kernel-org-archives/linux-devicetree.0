Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C05C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 12:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 998B3206F6
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 12:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="agS9SYZm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729624AbgEVMHe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 08:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729363AbgEVMHd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 May 2020 08:07:33 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAA1C08C5C3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 05:07:31 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h4so8418465wmb.4
        for <devicetree@vger.kernel.org>; Fri, 22 May 2020 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A3BhZ5w2nZuK3+ZudhXc+00fKQMrXVNQ6trbR5U2M5Y=;
        b=agS9SYZmiExPn1QFT+zp3KAP7WUdbVr14uPS6nJ27iB1uTA+ehxDy0YnoR9vFVYpwe
         ejKdXTzf8HvvGvnXEBEKYv0XRMvOXLfibnVZ4RxWk+opDqL/ZcUAhJfc3z/bq9Kd+/Lv
         ruVgGtvfmDrn3JOLXqEAJ6ZeygoSjuZdHAhLF0oHaU+To5M7N4RW+0P2ItNRNBKmSbBE
         P4pXfoUCxapPvWFYEm/mn3y/hTHEXZT2TuYxVmxdofXn2xpEq3tf4L0boBEWWiTDpsO9
         6AKtCVsk83JdgrJUbOkFst5Wy7TT750YifbEa617FJS68K9UwdH1KMuj3t3gdeqwoNUh
         txoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A3BhZ5w2nZuK3+ZudhXc+00fKQMrXVNQ6trbR5U2M5Y=;
        b=BE2x0wImr9xHa1PpnLrWJzUpngfRFSOhvtO7CBLD+kUdndZRzHadErgBc+Rr3KXLTr
         okYQ/REIDgBcDpoanl2aFl98/YyMu+ZniqwmWpFnPO8PqgOGDU5SAUHf9UjQr0ufFxcJ
         Zxf1+U1bYCAJx+CQBg0Tz8tFtFBhYse2npABvDlCPiV+EguLH3ThfLV1pC/Z7CD/fq0c
         IwbAp1pecyC1RCEhSzKDo7ELyGAAlWSb461FonaJiTCG9zNzbME2xxRGvVMNXCARVVvW
         BXJ8fWU4q5C7fyX12KW1+g+Pnwv77FRqf4Flbxx/RSef5s3FDFuSljMm8XuNMUIz8/Zd
         M1wA==
X-Gm-Message-State: AOAM533ivMj/AxMWZMGynJ1hPQpGCG0G2zqbJ/UY1aFBujJnAhjjfadD
        cBCW9SuHsJ8vN4TeTkSEwmQ9fQ==
X-Google-Smtp-Source: ABdhPJyMDEfpWBgRlr7TcCLSZc1VpzT4+1vIWxF001lm1q4j5p/zwqQ3+nBq6019j5V6S7cI+dSStA==
X-Received: by 2002:a7b:c778:: with SMTP id x24mr13962597wmk.144.1590149250359;
        Fri, 22 May 2020 05:07:30 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id f128sm9946233wme.1.2020.05.22.05.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:07:29 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Edwin Peer <edwin.peer@broadcom.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 07/11] ARM64: dts: mediatek: add pericfg syscon to mt8516.dtsi
Date:   Fri, 22 May 2020 14:06:56 +0200
Message-Id: <20200522120700.838-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200522120700.838-1-brgl@bgdev.pl>
References: <20200522120700.838-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds support for the PERICFG register range as a syscon. This will
soon be used by the MediaTek Ethernet MAC driver for NIC configuration.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 2f8adf042195..8cedaf74ae86 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -191,6 +191,11 @@ infracfg: infracfg@10001000 {
 			#clock-cells = <1>;
 		};
 
+		pericfg: pericfg@10003050 {
+			compatible = "mediatek,mt8516-pericfg", "syscon";
+			reg = <0 0x10003050 0 0x1000>;
+		};
+
 		apmixedsys: apmixedsys@10018000 {
 			compatible = "mediatek,mt8516-apmixedsys", "syscon";
 			reg = <0 0x10018000 0 0x710>;
-- 
2.25.0

