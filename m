Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633C9C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 10:39:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F929207DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 10:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfLDKjp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 05:39:45 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42567 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbfLDKjp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 05:39:45 -0500
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DA0A9E0012;
        Wed,  4 Dec 2019 10:39:42 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Heiko Stuebner <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] arm64: dts: rockchip: Describe PX30 caches
Date:   Wed,  4 Dec 2019 11:39:40 +0100
Message-Id: <20191204103940.22050-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

PX30 SoCs feature 4 Cortex-A35 CPUs with each of them a L1 data and
instruction cache. Both are 32kiB wide (PX30 TRM) and made of 64-bit
lines (ARM Cortex-A35 manual). I-cache is 2-way set associative (ARM
Cortex-A35 manual), D-cache is 4-way set associative (ARM
Cortex-A35manual).

An L2 cache is placed after these 4 L1 caches (PX30 TRM), is 256kiB
wide (PX30 TRM) and made of 64-bit lines (ARM Cortex-A35 manual) and
is 8-way set associative (ARM Cortex-A35 manual).

Describe all of them in the PX30 DTSI.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 1fd12bd09e83..0e10a224a84b 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -48,6 +48,13 @@
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			dynamic-power-coefficient = <90>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu1: cpu@1 {
@@ -60,6 +67,13 @@
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			dynamic-power-coefficient = <90>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu2: cpu@2 {
@@ -72,6 +86,13 @@
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			dynamic-power-coefficient = <90>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu3: cpu@3 {
@@ -84,6 +105,13 @@
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 			dynamic-power-coefficient = <90>;
 			operating-points-v2 = <&cpu0_opp_table>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2>;
 		};
 
 		idle-states {
@@ -107,6 +135,13 @@
 				min-residency-us = <2000>;
 			};
 		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-size = <0x40000>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
 	};
 
 	cpu0_opp_table: cpu0-opp-table {
-- 
2.20.1

