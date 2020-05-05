Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE583C47247
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 16:52:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C881B2078C
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 16:52:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730344AbgEEQwk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 12:52:40 -0400
Received: from foss.arm.com ([217.140.110.172]:45476 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730251AbgEEQwk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 5 May 2020 12:52:40 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B195531B;
        Tue,  5 May 2020 09:52:39 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9850A3F305;
        Tue,  5 May 2020 09:52:38 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 10/16] arm64: dts: juno: usb: Use proper DT node name
Date:   Tue,  5 May 2020 17:52:06 +0100
Message-Id: <20200505165212.76466-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505165212.76466-1-andre.przywara@arm.com>
References: <20200505165212.76466-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The EHCI/OCHI DT binding requires to use "usb" as the node name stub.

Replace the existing name with "usb" to comply with the binding.
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 65b6176f76a5..1374e72951c0 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -768,7 +768,7 @@
 		};
 	};
 
-	ohci@7ffb0000 {
+	usb@7ffb0000 {
 		compatible = "generic-ohci";
 		reg = <0x0 0x7ffb0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
@@ -776,7 +776,7 @@
 		clocks = <&soc_usb48mhz>;
 	};
 
-	ehci@7ffc0000 {
+	usb@7ffc0000 {
 		compatible = "generic-ehci";
 		reg = <0x0 0x7ffc0000 0x0 0x10000>;
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.17.1

