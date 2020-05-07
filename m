Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E047C4724C
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:24:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29C6120725
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgEGLYu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:24:50 -0400
Received: from foss.arm.com ([217.140.110.172]:56852 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgEGLYu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 7 May 2020 07:24:50 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3418E101E;
        Thu,  7 May 2020 04:24:50 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00B0E3F68F;
        Thu,  7 May 2020 04:24:48 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 05/17] arm64: dts: juno: Fix mem-timer
Date:   Thu,  7 May 2020 12:24:18 +0100
Message-Id: <20200507112430.183940-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507112430.183940-1-andre.przywara@arm.com>
References: <20200507112430.183940-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Juno's mem-timer DT node was not fully compliant with the DT binding,
which has certain expectation about child nodes and their size and
address cells values.

Use a cell size of 1, as the binding requests, and spell out the ranges
property to be binding compliant.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index f5889281545f..3feefd61eb76 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -11,14 +11,14 @@
 		compatible = "arm,armv7-timer-mem";
 		reg = <0x0 0x2a810000 0x0 0x10000>;
 		clock-frequency = <50000000>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0x2a820000 0x20000>;
 		status = "disabled";
 		frame@2a830000 {
 			frame-number = <1>;
 			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
-			reg = <0x0 0x2a830000 0x0 0x10000>;
+			reg = <0x10000 0x10000>;
 		};
 	};
 
-- 
2.17.1

