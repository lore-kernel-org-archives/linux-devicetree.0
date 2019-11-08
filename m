Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21900C5DF60
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 11:59:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC98320869
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 11:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573214379;
	bh=HTtoqZyvVxPeVVf9GFCb236etSkJ8xztU8o8/+LFI4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Meo1RFamUkNUtRQtVqCwbRqd2JDoSzIYi+c0x2rjX0ApOMh13AaXfRWS+gyoNX6Pl
	 4z7wz8aXnhLCwEWaKd/ltLoOhrS1kYVQdBSepsr5ZKaVN2fzMsJiGGU6O9AoHAxqX6
	 I47yJRhPNTSrrwx5PrWwl2i9U8n2cYrCX/97qB/U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389726AbfKHL7e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:59:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:58924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390676AbfKHLoI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 06:44:08 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2DA75222CE;
        Fri,  8 Nov 2019 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573213447;
        bh=HTtoqZyvVxPeVVf9GFCb236etSkJ8xztU8o8/+LFI4M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xuek+e3YKn6xcLLrVBnWgUv4r1zWoZrsvmsUD4k7koB53dl67PN4uEMIfDxqT3dBz
         nf8aMUx8iCdkpglQXhCpsmtwFZiqdPKD63AAlA9g5PtlpppExfmNB2fYELr5fKuYMx
         XLN8OI7ax7Oi6l5/QGDtiJqL0HO8yceMUyxfQUXc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 041/103] ARM: dts: exynos: Disable pull control for S5M8767 PMIC
Date:   Fri,  8 Nov 2019 06:42:06 -0500
Message-Id: <20191108114310.14363-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108114310.14363-1-sashal@kernel.org>
References: <20191108114310.14363-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

[ Upstream commit ef2ecab9af5feae97c47b7f61cdd96f7f49b2c23 ]

S5M8767 PMIC interrupt line on Exynos5250-based Arndale board has
external pull-up resistors, so disable any pull control for it in
in controller node. This fixes support for S5M8767 interrupts and
enables operation of wakeup from S5M8767 RTC alarm.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 18a7f396ac5f7..abd1705635f9b 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -169,6 +169,8 @@
 		reg = <0x66>;
 		interrupt-parent = <&gpx3>;
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&s5m8767_irq>;
 
 		vinb1-supply = <&main_dc_reg>;
 		vinb2-supply = <&main_dc_reg>;
@@ -544,6 +546,13 @@
 	cap-sd-highspeed;
 };
 
+&pinctrl_0 {
+	s5m8767_irq: s5m8767-irq {
+		samsung,pins = "gpx3-2";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+};
+
 &rtc {
 	status = "okay";
 };
-- 
2.20.1

