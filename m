Return-Path: <SRS0=IhJs=3I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5A8C33CAF
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jan 2020 19:45:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68A0820679
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jan 2020 19:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbgASTpE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 19 Jan 2020 14:45:04 -0500
Received: from muru.com ([72.249.23.125]:51754 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727138AbgASTpE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 19 Jan 2020 14:45:04 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 23B84804F;
        Sun, 19 Jan 2020 19:45:46 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] ARM: dts: motorola-cpcap-mapphone: Configure calibration interrupt
Date:   Sun, 19 Jan 2020 11:45:01 -0800
Message-Id: <20200119194501.17125-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We added coulomb counter calibration support With commit 0cb90f071f73
("power: supply: cpcap-battery: Add basic coulomb counter calibrate
support"), but we also need to configure the related interrupt.

Without the interrupt calibration happens based on a timeout after two
seconds, with the interrupt the calibration just gets done a bit faster.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -27,11 +27,12 @@
 			compatible = "motorola,cpcap-battery";
 			interrupts-extended = <
 				&cpcap 6 0 &cpcap 5 0 &cpcap 3 0
-				&cpcap 20 0 &cpcap 54 0
+				&cpcap 20 0 &cpcap 54 0 &cpcap 57 0
 			>;
 			interrupt-names =
 				"eol", "lowbph", "lowbpl",
-				"chrgcurr1", "battdetb";
+				"chrgcurr1", "battdetb",
+				"cccal";
 			io-channels = <&cpcap_adc 0 &cpcap_adc 1
 				       &cpcap_adc 5 &cpcap_adc 6>;
 			io-channel-names = "battdetb", "battp",
-- 
2.24.1
