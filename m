Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE75C2D0FA
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 10:30:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E43D206D6
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 10:30:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732759AbgEMKay (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 06:30:54 -0400
Received: from foss.arm.com ([217.140.110.172]:42700 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732741AbgEMKax (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 06:30:53 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDFED11B3;
        Wed, 13 May 2020 03:30:52 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D467B3F305;
        Wed, 13 May 2020 03:30:51 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 17/20] arm64: dts: arm: Fix VExpress LED names
Date:   Wed, 13 May 2020 11:30:13 +0100
Message-Id: <20200513103016.130417-18-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513103016.130417-1-andre.przywara@arm.com>
References: <20200513103016.130417-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The common LED binding wants the LED node names to start with led- and
then have just a single number.

Changing the naming for the 8 user LEDs from using user<x> to led-<x>.
Also there is no default-trigger named "mmc0" in the kernel, so use the
more generic "disk-activity".

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/vexpress-v2m-rs1.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
index f5c8f07b4918..e6308fb76183 100644
--- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
+++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
@@ -51,49 +51,49 @@
 	leds {
 		compatible = "gpio-leds";
 
-		user1 {
+		led-1 {
 			label = "v2m:green:user1";
 			gpios = <&v2m_led_gpios 0 0>;
 			linux,default-trigger = "heartbeat";
 		};
 
-		user2 {
+		led-2 {
 			label = "v2m:green:user2";
 			gpios = <&v2m_led_gpios 1 0>;
 			linux,default-trigger = "disk-activity";
 		};
 
-		user3 {
+		led-3 {
 			label = "v2m:green:user3";
 			gpios = <&v2m_led_gpios 2 0>;
 			linux,default-trigger = "cpu0";
 		};
 
-		user4 {
+		led-4 {
 			label = "v2m:green:user4";
 			gpios = <&v2m_led_gpios 3 0>;
 			linux,default-trigger = "cpu1";
 		};
 
-		user5 {
+		led-5 {
 			label = "v2m:green:user5";
 			gpios = <&v2m_led_gpios 4 0>;
 			linux,default-trigger = "cpu2";
 		};
 
-		user6 {
+		led-6 {
 			label = "v2m:green:user6";
 			gpios = <&v2m_led_gpios 5 0>;
 			linux,default-trigger = "cpu3";
 		};
 
-		user7 {
+		led-7 {
 			label = "v2m:green:user7";
 			gpios = <&v2m_led_gpios 6 0>;
 			linux,default-trigger = "cpu4";
 		};
 
-		user8 {
+		led-8 {
 			label = "v2m:green:user8";
 			gpios = <&v2m_led_gpios 7 0>;
 			linux,default-trigger = "cpu5";
-- 
2.17.1

