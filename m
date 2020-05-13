Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419F3CA90AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 10:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21EB5206CC
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 10:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732644AbgEMKao (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 06:30:44 -0400
Received: from foss.arm.com ([217.140.110.172]:42644 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729731AbgEMKao (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 06:30:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A30C4D6E;
        Wed, 13 May 2020 03:30:43 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E45D3F305;
        Wed, 13 May 2020 03:30:42 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 10/20] arm64: dts: arm: foundation: Fix GIC child nodes
Date:   Wed, 13 May 2020 11:30:06 +0100
Message-Id: <20200513103016.130417-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513103016.130417-1-andre.przywara@arm.com>
References: <20200513103016.130417-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The GIC DT nodes for the fastmodels were not fully compliant with the
DT binding, which has certain expectations about child nodes and their
size and address cells values.

Use smaller #address-cells and #size-cells values, as the binding
requests, and adjust the reg properties accordingly.
This requires adjusting the interrupt nexus nodes as well, as one
field of the interrupt-map property depends on the GIC's address-size.

Since the .dts files share interrupt nexus nodes across different
interrupt controllers (GICv2 vs. GICv3), we need to use the only
commonly allowed #address-size value of <1> for both.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../boot/dts/arm/foundation-v8-gicv2.dtsi     |  2 +-
 .../boot/dts/arm/foundation-v8-gicv3.dtsi     |  8 +-
 arch/arm64/boot/dts/arm/foundation-v8.dtsi    | 86 +++++++++----------
 3 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
index f17e744163a5..655fdcce1561 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
+++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
@@ -8,7 +8,7 @@
 	gic: interrupt-controller@2c001000 {
 		compatible = "arm,gic-400", "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
-		#address-cells = <2>;
+		#address-cells = <1>;
 		interrupt-controller;
 		reg = <0x0 0x2c001000 0 0x1000>,
 		      <0x0 0x2c002000 0 0x2000>,
diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv3.dtsi b/arch/arm64/boot/dts/arm/foundation-v8-gicv3.dtsi
index f2c75c756039..906f51935b36 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8-gicv3.dtsi
+++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv3.dtsi
@@ -8,9 +8,9 @@
 	gic: interrupt-controller@2f000000 {
 		compatible = "arm,gic-v3";
 		#interrupt-cells = <3>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2f000000 0x100000>;
 		interrupt-controller;
 		reg =	<0x0 0x2f000000 0x0 0x10000>,
 			<0x0 0x2f100000 0x0 0x200000>,
@@ -22,7 +22,7 @@
 		its: its@2f020000 {
 			compatible = "arm,gic-v3-its";
 			msi-controller;
-			reg = <0x0 0x2f020000 0x0 0x20000>;
+			reg = <0x20000 0x20000>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
index e5b8a9b5c410..63efb88595d4 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
+++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
@@ -128,49 +128,49 @@
 
 		#interrupt-cells = <1>;
 		interrupt-map-mask = <0 0 63>;
-		interrupt-map = <0 0  0 &gic 0 0 GIC_SPI  0 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  1 &gic 0 0 GIC_SPI  1 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  2 &gic 0 0 GIC_SPI  2 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  3 &gic 0 0 GIC_SPI  3 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  4 &gic 0 0 GIC_SPI  4 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  5 &gic 0 0 GIC_SPI  5 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  6 &gic 0 0 GIC_SPI  6 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  7 &gic 0 0 GIC_SPI  7 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  8 &gic 0 0 GIC_SPI  8 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0  9 &gic 0 0 GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 10 &gic 0 0 GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 11 &gic 0 0 GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 12 &gic 0 0 GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 13 &gic 0 0 GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 14 &gic 0 0 GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 15 &gic 0 0 GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 16 &gic 0 0 GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 17 &gic 0 0 GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 18 &gic 0 0 GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 19 &gic 0 0 GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 20 &gic 0 0 GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 21 &gic 0 0 GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 22 &gic 0 0 GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 23 &gic 0 0 GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 24 &gic 0 0 GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 25 &gic 0 0 GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 26 &gic 0 0 GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 27 &gic 0 0 GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 28 &gic 0 0 GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 29 &gic 0 0 GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 30 &gic 0 0 GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 31 &gic 0 0 GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 32 &gic 0 0 GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 33 &gic 0 0 GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 34 &gic 0 0 GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 35 &gic 0 0 GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 36 &gic 0 0 GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 37 &gic 0 0 GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 38 &gic 0 0 GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 39 &gic 0 0 GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 40 &gic 0 0 GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 41 &gic 0 0 GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
-				<0 0 42 &gic 0 0 GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-map = <0 0  0 &gic 0 GIC_SPI  0 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  1 &gic 0 GIC_SPI  1 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  2 &gic 0 GIC_SPI  2 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  3 &gic 0 GIC_SPI  3 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  4 &gic 0 GIC_SPI  4 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  5 &gic 0 GIC_SPI  5 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  6 &gic 0 GIC_SPI  6 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  7 &gic 0 GIC_SPI  7 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  8 &gic 0 GIC_SPI  8 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0  9 &gic 0 GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 10 &gic 0 GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 11 &gic 0 GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 12 &gic 0 GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 13 &gic 0 GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 14 &gic 0 GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 15 &gic 0 GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 16 &gic 0 GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 17 &gic 0 GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 18 &gic 0 GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 19 &gic 0 GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 20 &gic 0 GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 21 &gic 0 GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 22 &gic 0 GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 23 &gic 0 GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 24 &gic 0 GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 25 &gic 0 GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 26 &gic 0 GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 27 &gic 0 GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 28 &gic 0 GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 29 &gic 0 GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 30 &gic 0 GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 31 &gic 0 GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 32 &gic 0 GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 33 &gic 0 GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 34 &gic 0 GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 35 &gic 0 GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 36 &gic 0 GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 37 &gic 0 GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 38 &gic 0 GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 39 &gic 0 GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 40 &gic 0 GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 41 &gic 0 GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 42 &gic 0 GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 
 		ethernet@202000000 {
 			compatible = "smsc,lan91c111";
-- 
2.17.1

