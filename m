Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09793C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 20:17:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D505B20772
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 20:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com header.i=@semihalf-com.20150623.gappssmtp.com header.b="mGVQsM1O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgGBURH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 16:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGBURG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 16:17:06 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC08DC08C5DF
        for <devicetree@vger.kernel.org>; Thu,  2 Jul 2020 13:17:05 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id n23so33909845ljh.7
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2020 13:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gzH+omRURB7g5dnoNMP6PMHslLf/Y7F/kj6XzNA/QUw=;
        b=mGVQsM1OHmkNMuQKfEJYsFI5quyzsuJsFTAUZWJ/6KyBegagF4WknJv8hivqEbilbd
         0iqCOMqN0lqbLtp6iy0H6LpC2Me+ocoD+Q2lm7mfie7rwf/yhiPBDkl60nOiuIs9/1JV
         Q6l/zKH9YBlnHxcV2R6Bp/FhIh+Jimc5V+21skqNt29/8oNAgjYRHEGBxLqlUdG9NsiB
         842yg9EimH7LtQKfGIM2EptqxVipxSrbMkoYSSiRpUsZEUPtdud1fFvHZ6ex+csGIwai
         TaKVOpdNjWEhMuAaqmf+XoPlc45UO6X/u9lb8TRI3aUJgBeA2CGOhduk3EnpZsnB1vc2
         8/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gzH+omRURB7g5dnoNMP6PMHslLf/Y7F/kj6XzNA/QUw=;
        b=ahi5PcB4VKiTgymHdQu/bn1Wt5PdNMseZvrQisnXhTR2hm4MgRrh6P8ySdPeKAUxWs
         dIL7xytJyU4CStXFFaojSqgAqo3WQLoqYqrpt/9X/tMNgW6LDopo5e+QPmq7oVgkfL6n
         O5FWnqhdPYQ7I0yzR1LLeu/xfSZycdXfBNgX7QkW2n/CCHdwI2JMyvt1kBpvhZ+AQWXX
         nsHv40Ttg2lebNmA/Ombb6jkKZn3a+CG3SsgrgAOBiKSXU2DU+Y9/0W7a7ifLz/oOMeX
         /iAwsmeY9g7PdLPwGbs7tbE9zvPVgTAGiDObrlOxgWMuAOZssncDhunsglR72OBCAZ8y
         8u+g==
X-Gm-Message-State: AOAM532x48iVxmZ2zSuKqx9t8V8tvVvFldtLh8o09qCR7GMm7ot1093u
        zlnnvn+iaTEqrO+XF97/qA1xXQ==
X-Google-Smtp-Source: ABdhPJyAEBFVxmo+Nfl2SUUNGRJI1G7JcT5WyW5G2pp8pha1D7djhhHUEvpahtR9RO3iOMUzRApxJg==
X-Received: by 2002:a2e:98d0:: with SMTP id s16mr7703772ljj.457.1593721024303;
        Thu, 02 Jul 2020 13:17:04 -0700 (PDT)
Received: from localhost.localdomain ([83.68.95.66])
        by smtp.gmail.com with ESMTPSA id y2sm3320372lji.8.2020.07.02.13.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 13:17:03 -0700 (PDT)
From:   Tomasz Nowicki <tn@semihalf.com>
To:     will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        gregory.clement@bootlin.com, robh+dt@kernel.org, hannah@marvell.com
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        devicetree@vger.kernel.org, catalin.marinas@arm.com,
        nadavh@marvell.com, linux-arm-kernel@lists.infradead.org,
        mw@semihalf.com, Tomasz Nowicki <tn@semihalf.com>
Subject: [PATCH v3 4/4] arm64: dts: marvell: add SMMU support
Date:   Thu,  2 Jul 2020 22:16:33 +0200
Message-Id: <20200702201633.22693-5-tn@semihalf.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702201633.22693-1-tn@semihalf.com>
References: <20200702201633.22693-1-tn@semihalf.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Marcin Wojtas <mw@semihalf.com>

Add IOMMU node for Marvell AP806 based SoCs together with platform
and PCI device Stream ID mapping.

Signed-off-by: Marcin Wojtas <mw@semihalf.com>
Signed-off-by: Tomasz Nowicki <tn@semihalf.com>
---
 arch/arm64/boot/dts/marvell/armada-8040.dtsi  | 36 +++++++++++++++++++
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 17 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040.dtsi b/arch/arm64/boot/dts/marvell/armada-8040.dtsi
index 7699b19224c2..25c1df709f72 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040.dtsi
@@ -23,3 +23,39 @@
 &cp0_rtc {
 	status = "disabled";
 };
+
+&cp0_usb3_0 {
+	iommus = <&smmu 0x440>;
+};
+
+&cp0_usb3_1 {
+	iommus = <&smmu 0x441>;
+};
+
+&cp0_sata0 {
+	iommus = <&smmu 0x444>;
+};
+
+&cp0_sdhci0 {
+	iommus = <&smmu 0x445>;
+};
+
+&cp1_sata0 {
+	iommus = <&smmu 0x454>;
+};
+
+&cp1_usb3_0 {
+	iommus = <&smmu 0x450>;
+};
+
+&cp1_usb3_1 {
+	iommus = <&smmu 0x451>;
+};
+
+&cp0_pcie0 {
+	iommu-map =
+		<0x0   &smmu 0x480 0x20>,
+		<0x100 &smmu 0x4a0 0x20>,
+		<0x200 &smmu 0x4c0 0x20>;
+	iommu-map-mask = <0x031f>;
+};
diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
index 7f9b9a647717..ded8b8082d79 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
@@ -56,6 +56,23 @@
 			compatible = "simple-bus";
 			ranges = <0x0 0x0 0xf0000000 0x1000000>;
 
+			smmu: iommu@5000000 {
+				compatible = "marvell,ap806-smmu-500", "arm,mmu-500";
+				reg = <0x100000 0x100000>;
+				dma-coherent;
+				#iommu-cells = <1>;
+				#global-interrupts = <1>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			gic: interrupt-controller@210000 {
 				compatible = "arm,gic-400";
 				#interrupt-cells = <3>;
-- 
2.17.1

