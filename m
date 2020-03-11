Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED60C18E5A
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 01:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E867222C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 01:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbgCKBDi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 21:03:38 -0400
Received: from foss.arm.com ([217.140.110.172]:43550 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727591AbgCKBDi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Mar 2020 21:03:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 178A131B;
        Tue, 10 Mar 2020 18:03:31 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDB6B3F67D;
        Tue, 10 Mar 2020 18:03:29 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        JuanEsf <juanesf91@gmail.com>
Subject: [PATCH] ARM: dts: sun8i: R40: Fix SPI2 and SPI3 MMIO addresses
Date:   Wed, 11 Mar 2020 01:03:08 +0000
Message-Id: <20200311010308.11880-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Copy&paste suggested an MMIO pattern that wasn't there, so the wrong
MMIO base addresses for SPI2 and SPI3 sneaked in.

Fix them, now double checked against the manual and similar SoCs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Fixes: 554581b79139 ("ARM: dts: sun8i: R40: Add SPI controllers nodes and pinmuxes")
Reported-by: JuanEsf <juanesf91@gmail.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 8f09a24b36ec..8c4c4282a055 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -679,10 +679,10 @@
 			#size-cells = <0>;
 		};
 
-		spi2: spi@1c07000 {
+		spi2: spi@1c17000 {
 			compatible = "allwinner,sun8i-r40-spi",
 				     "allwinner,sun8i-h3-spi";
-			reg = <0x01c07000 0x1000>;
+			reg = <0x01c17000 0x1000>;
 			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_SPI2>, <&ccu CLK_SPI2>;
 			clock-names = "ahb", "mod";
@@ -692,10 +692,10 @@
 			#size-cells = <0>;
 		};
 
-		spi3: spi@1c0f000 {
+		spi3: spi@1c1f000 {
 			compatible = "allwinner,sun8i-r40-spi",
 				     "allwinner,sun8i-h3-spi";
-			reg = <0x01c0f000 0x1000>;
+			reg = <0x01c1f000 0x1000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_SPI3>, <&ccu CLK_SPI3>;
 			clock-names = "ahb", "mod";
-- 
2.14.5

