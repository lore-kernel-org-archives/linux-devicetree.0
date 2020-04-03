Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20904C2BA19
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 01:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00783206F6
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 01:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390266AbgDCBnw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 21:43:52 -0400
Received: from mx.socionext.com ([202.248.49.38]:19271 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390227AbgDCBnw (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 2 Apr 2020 21:43:52 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 03 Apr 2020 10:43:49 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id EE99218009F;
        Fri,  3 Apr 2020 10:43:49 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 3 Apr 2020 10:43:49 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 8B97E1A01BB;
        Fri,  3 Apr 2020 10:43:49 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v4 3/5] ARM: dts: uniphier: Add ethernet aliases
Date:   Fri,  3 Apr 2020 10:43:05 +0900
Message-Id: <1585878187-8131-4-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585878187-8131-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1585878187-8131-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add an 'aliases' property for ethernet device.

U-boot performs a fix-up of the MAC address and will overwrite the values
from the Linux devicetree for aliased ethernet device. The MAC address can
be inherited from u-boot by adding aliases of ethernet devices.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-ld6b-ref.dts    | 1 +
 arch/arm/boot/dts/uniphier-pro4-ace.dts    | 1 +
 arch/arm/boot/dts/uniphier-pro4-ref.dts    | 1 +
 arch/arm/boot/dts/uniphier-pro4-sanji.dts  | 1 +
 arch/arm/boot/dts/uniphier-pxs2-gentil.dts | 1 +
 arch/arm/boot/dts/uniphier-pxs2-vodka.dts  | 1 +
 6 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-ld6b-ref.dts b/arch/arm/boot/dts/uniphier-ld6b-ref.dts
index 60994b6..079cadc 100644
--- a/arch/arm/boot/dts/uniphier-ld6b-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ld6b-ref.dts
@@ -29,6 +29,7 @@
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
+		ethernet0 = &eth;
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/uniphier-pro4-ace.dts b/arch/arm/boot/dts/uniphier-pro4-ace.dts
index 92cc48d..64246fa 100644
--- a/arch/arm/boot/dts/uniphier-pro4-ace.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-ace.dts
@@ -26,6 +26,7 @@
 		i2c3 = &i2c3;
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
+		ethernet0 = &eth;
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/uniphier-pro4-ref.dts b/arch/arm/boot/dts/uniphier-pro4-ref.dts
index 854f2eb..181442c 100644
--- a/arch/arm/boot/dts/uniphier-pro4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-ref.dts
@@ -29,6 +29,7 @@
 		i2c3 = &i2c3;
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
+		ethernet0 = &eth;
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/uniphier-pro4-sanji.dts b/arch/arm/boot/dts/uniphier-pro4-sanji.dts
index dda1a2f..5396556 100644
--- a/arch/arm/boot/dts/uniphier-pro4-sanji.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-sanji.dts
@@ -25,6 +25,7 @@
 		i2c3 = &i2c3;
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
+		ethernet0 = &eth;
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
index e27fd4f..8e9ac57 100644
--- a/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
+++ b/arch/arm/boot/dts/uniphier-pxs2-gentil.dts
@@ -26,6 +26,7 @@
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
+		ethernet0 = &eth;
 	};
 
 	memory@80000000 {
diff --git a/arch/arm/boot/dts/uniphier-pxs2-vodka.dts b/arch/arm/boot/dts/uniphier-pxs2-vodka.dts
index 23fe42b..8eacc7b 100644
--- a/arch/arm/boot/dts/uniphier-pxs2-vodka.dts
+++ b/arch/arm/boot/dts/uniphier-pxs2-vodka.dts
@@ -24,6 +24,7 @@
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
 		i2c6 = &i2c6;
+		ethernet0 = &eth;
 	};
 
 	memory@80000000 {
-- 
2.7.4

