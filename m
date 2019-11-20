Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEA7C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 03:50:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9E292240D
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 03:50:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbfKTDuf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 22:50:35 -0500
Received: from muru.com ([72.249.23.125]:43028 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727415AbfKTDuf (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 19 Nov 2019 22:50:35 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 60553809B;
        Wed, 20 Nov 2019 03:51:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] ARM: dts: Fix vcsi regulator to be always-on for droid4 to prevent hangs
Date:   Tue, 19 Nov 2019 19:50:30 -0800
Message-Id: <20191120035030.50133-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In addition to using vcsi regulator for the display, looks like droid4 is
using vcsi regulator to trigger off mode internally with the PMIC firmware
when the SoC enters deeper idle states. This is configured in the Motorola
Mapphone Linux kernel sources as "zerov_regulator".

As we currently don't support off mode during idle for omap4, we must
prevent vcsi from being disabled when the display is blanked to prevent
the PMIC change to off mode. Otherwise the device will hang on entering
idle when the display is blanked.

Before commit 089b3f61ecfc ("regulator: core: Let boot-on regulators be
powered off"), the boot-on regulators never got disabled like they should
and vcsi did not get turned off on idle.

Let's fix the issue by setting vcsi to always-on for now. Later on we may
want to claim the vcsi regulator also in the PM code if needed.

Fixes: 089b3f61ecfc ("regulator: core: Let boot-on regulators be powered off")
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -162,12 +162,12 @@ vcam: VCAM {
 		regulator-enable-ramp-delay = <1000>;
 	};
 
-	/* Used by DSS */
+	/* Used by DSS and is the "zerov_regulator" trigger for SoC off mode */
 	vcsi: VCSI {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-enable-ramp-delay = <1000>;
-		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	vdac: VDAC {
-- 
2.24.0
