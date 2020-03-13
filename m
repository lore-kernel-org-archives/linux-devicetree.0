Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE83C1975A
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 00:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10E5520716
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 00:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgCMA6n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 20:58:43 -0400
Received: from mx.socionext.com ([202.248.49.38]:4532 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbgCMA6n (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Mar 2020 20:58:43 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 13 Mar 2020 09:58:42 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id B2C12603AB;
        Fri, 13 Mar 2020 09:58:42 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 13 Mar 2020 09:58:42 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 223041A01BB;
        Fri, 13 Mar 2020 09:58:42 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 09/10] arm64: dts: uniphier: Set SCSSI clock and reset IDs for each channel
Date:   Fri, 13 Mar 2020 09:58:15 +0900
Message-Id: <1584061096-23686-10-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584061096-23686-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1584061096-23686-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Currently common clock and reset IDs were used, however, each clock and
reset ID should be used for each channel.

Fixes: 925c5c32f31d ("arm64: dts: uniphier: add SPI node for LD20, LD11 and PXs3")
Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi |  4 ++--
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 12 ++++++------
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 5aeb3cc..cd6e159 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -143,8 +143,8 @@
 			interrupts = <0 216 4>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_spi1>;
-			clocks = <&peri_clk 11>;
-			resets = <&peri_rst 11>;
+			clocks = <&peri_clk 12>;
+			resets = <&peri_rst 12>;
 		};
 
 		serial0: serial@54006800 {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index c2868d8..794c0d2 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -248,8 +248,8 @@
 			interrupts = <0 216 4>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_spi1>;
-			clocks = <&peri_clk 11>;
-			resets = <&peri_rst 11>;
+			clocks = <&peri_clk 12>;
+			resets = <&peri_rst 12>;
 		};
 
 		spi2: spi@54006200 {
@@ -259,8 +259,8 @@
 			interrupts = <0 229 4>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_spi2>;
-			clocks = <&peri_clk 11>;
-			resets = <&peri_rst 11>;
+			clocks = <&peri_clk 13>;
+			resets = <&peri_rst 13>;
 		};
 
 		spi3: spi@54006300 {
@@ -270,8 +270,8 @@
 			interrupts = <0 230 4>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_spi3>;
-			clocks = <&peri_clk 11>;
-			resets = <&peri_rst 11>;
+			clocks = <&peri_clk 14>;
+			resets = <&peri_rst 14>;
 		};
 
 		serial0: serial@54006800 {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index 0d4283c..a365fc4 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -207,8 +207,8 @@
 			interrupts = <0 216 4>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_spi1>;
-			clocks = <&peri_clk 11>;
-			resets = <&peri_rst 11>;
+			clocks = <&peri_clk 12>;
+			resets = <&peri_rst 12>;
 		};
 
 		serial0: serial@54006800 {
-- 
2.7.4

