Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B081C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:24:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 578CB20725
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgEGLYy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:24:54 -0400
Received: from foss.arm.com ([217.140.110.172]:56872 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgEGLYx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 7 May 2020 07:24:53 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EB24101E;
        Thu,  7 May 2020 04:24:53 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF2C93F68F;
        Thu,  7 May 2020 04:24:51 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 07/17] arm64: dts: arm: Fix GIC child nodes
Date:   Thu,  7 May 2020 12:24:20 +0100
Message-Id: <20200507112430.183940-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507112430.183940-1-andre.przywara@arm.com>
References: <20200507112430.183940-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The GIC DT nodes for the Arm Ltd. boards were not fully compliant with
the DT binding, which has certain expectations about child nodes and
their size and address cells values.

Use smaller #address-cells and #size-cells values, as the binding
requests, and adjust the reg properties accordingly.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi |  2 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi           | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
index 61a1750fcdd6..c8ebffca12a7 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
+++ b/arch/arm64/boot/dts/arm/foundation-v8-gicv2.dtsi
@@ -8,7 +8,7 @@
 	gic: interrupt-controller@2c001000 {
 		compatible = "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
-		#address-cells = <2>;
+		#address-cells = <0>;
 		interrupt-controller;
 		reg = <0x0 0x2c001000 0 0x1000>,
 		      <0x0 0x2c002000 0 0x2000>,
diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 3feefd61eb76..6d7b24a8e761 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -74,35 +74,35 @@
 		      <0x0 0x2c02f000 0 0x2000>,
 		      <0x0 0x2c04f000 0 0x2000>,
 		      <0x0 0x2c06f000 0 0x2000>;
-		#address-cells = <2>;
+		#address-cells = <1>;
 		#interrupt-cells = <3>;
-		#size-cells = <2>;
+		#size-cells = <1>;
 		interrupt-controller;
 		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
-		ranges = <0 0 0 0x2c1c0000 0 0x40000>;
+		ranges = <0 0 0x2c1c0000 0x40000>;
 
 		v2m_0: v2m@0 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
-			reg = <0 0 0 0x10000>;
+			reg = <0 0x10000>;
 		};
 
 		v2m@10000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
-			reg = <0 0x10000 0 0x10000>;
+			reg = <0x10000 0x10000>;
 		};
 
 		v2m@20000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
-			reg = <0 0x20000 0 0x10000>;
+			reg = <0x20000 0x10000>;
 		};
 
 		v2m@30000 {
 			compatible = "arm,gic-v2m-frame";
 			msi-controller;
-			reg = <0 0x30000 0 0x10000>;
+			reg = <0x30000 0x10000>;
 		};
 	};
 
-- 
2.17.1

