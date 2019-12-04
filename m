Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702F4C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 17:15:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AF392081B
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 17:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfLDRPl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 12:15:41 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:40967 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfLDRPl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 12:15:41 -0500
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6CCD9C0002;
        Wed,  4 Dec 2019 17:15:39 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Heiko Stuebner <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Cc:     <linux-arm-kernel@lists.infradead.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] arm64: dts: rockchip: Move xin32k fixed-clock out of PX30 DTSI
Date:   Wed,  4 Dec 2019 18:15:37 +0100
Message-Id: <20191204171537.14163-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This clock has nothing to do in the PX30 DTSI as it is supposed to be
an input of the SoC. Moving it to the EVB DTS (only board file using
this DTSI) makes more sense. Also, when this clock is not a fixed
clock and comes from eg. a PMIC the situation can be described cleanly
in the device tree (avoids having to delete the fixed-clock node
first).

This clock is not mandatory to boot so it should not break existing
users.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/rockchip/px30-evb.dts | 7 +++++++
 arch/arm64/boot/dts/rockchip/px30.dtsi    | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index 6eb7407a84aa..ee0b677209e4 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -89,6 +89,13 @@
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	xin32k: xin32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "xin32k";
+	};
 };
 
 &display_subsystem {
diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 1fd12bd09e83..06328f1b05e8 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -195,13 +195,6 @@
 		clock-output-names = "xin24m";
 	};
 
-	xin32k: xin32k {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
-		clock-output-names = "xin32k";
-	};
-
 	pmu: power-management@ff000000 {
 		compatible = "rockchip,px30-pmu", "syscon", "simple-mfd";
 		reg = <0x0 0xff000000 0x0 0x1000>;
-- 
2.20.1

