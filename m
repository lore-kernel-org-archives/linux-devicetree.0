Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4064CC2BA18
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 01:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21274207FF
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 01:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390227AbgDCBnw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 21:43:52 -0400
Received: from mx.socionext.com ([202.248.49.38]:19263 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390204AbgDCBnw (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 2 Apr 2020 21:43:52 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 03 Apr 2020 10:43:50 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id B420260057;
        Fri,  3 Apr 2020 10:43:50 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 3 Apr 2020 10:43:50 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 398AC1A01BB;
        Fri,  3 Apr 2020 10:43:50 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v4 4/5] arm64: dts: uniphier: Add ethernet aliases
Date:   Fri,  3 Apr 2020 10:43:06 +0900
Message-Id: <1585878187-8131-5-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585878187-8131-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1585878187-8131-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add 'aliases' properties for ethernet device.

U-boot performs a fix-up of the MAC address and will overwrite the values
from the Linux devicetree for aliased ethernet device. The MAC address can
be inherited from u-boot by adding aliases of ethernet devices.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts | 1 +
 arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts    | 1 +
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts | 1 +
 arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts    | 1 +
 arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts    | 2 ++
 5 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
index f72f048..816ac25 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
@@ -30,6 +30,7 @@
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
+		ethernet0 = &eth;
 	};
 
 	memory@80000000 {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
index b8f6273..693171f 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
@@ -29,6 +29,7 @@
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
+		ethernet0 = &eth;
 	};
 
 	memory@80000000 {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
index 9ca692e..2c00008 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
@@ -30,6 +30,7 @@
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
+		ethernet0 = &eth;
 	};
 
 	memory@80000000 {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
index 406244a..eeb976e 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
@@ -29,6 +29,7 @@
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
+		ethernet0 = &eth;
 	};
 
 	memory@80000000 {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
index 4d00ff9..dc39a73 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dts
@@ -29,6 +29,8 @@
 		i2c6 = &i2c6;
 		spi0 = &spi0;
 		spi1 = &spi1;
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 	};
 
 	memory@80000000 {
-- 
2.7.4

