Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B417EC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 01:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83E32212CC
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 01:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593653218;
	bh=5eXMQNhbrRFdB6JrQi+rLl3n4tIXKH8775zN6Y2Z2N8=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=Rb9CfCwSdLzIAKaNbX61BDjdxAmFWck3GlY9w36RMdsc+4IyOoZy81iibOEtL3+37
	 KbKNf4RLXJ3auVbOixOuPkfd4E0U27lPirQtHNyHkz81q827S37yFUpCnWUeURdk0j
	 i9/i9eParbG/KV5PskOBfb7tHcP4JhVWpy6bxtEE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbgGBB05 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 21:26:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:58486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729292AbgGBB0w (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Jul 2020 21:26:52 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C627420748;
        Thu,  2 Jul 2020 01:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593653211;
        bh=5eXMQNhbrRFdB6JrQi+rLl3n4tIXKH8775zN6Y2Z2N8=;
        h=From:To:Cc:Subject:Date:From;
        b=CsgLhQdiK55/hHXuyyIVhTwdzk6LL/F002ACwnEYZmodDW8/yu/5dKmEec70cn62r
         RRD/JZyF5K6GcrFKiuT99F3IhBX3CDSmQKlW04MUWlaPzN6VnAvZCpza9MD7Xvpww0
         lQQXX7NZPP6UA9C3rAApq/5+cmRCrgCktA2Kjidg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>, maemo-leste@lists.dyne.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 01/17] ARM: dts: omap4-droid4: Fix spi configuration and increase rate
Date:   Wed,  1 Jul 2020 21:26:33 -0400
Message-Id: <20200702012649.2701799-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit 0df12a01f4857495816b05f048c4c31439446e35 ]

We can currently sometimes get "RXS timed out" errors and "EOT timed out"
errors with spi transfers.

These errors can be made easy to reproduce by reading the cpcap iio
values in a loop while keeping the CPUs busy by also reading /dev/urandom.

The "RXS timed out" errors we can fix by adding spi-cpol and spi-cpha
in addition to the spi-cs-high property we already have.

The "EOT timed out" errors we can fix by increasing the spi clock rate
to 9.6 MHz. Looks similar MC13783 PMIC says it works at spi clock rates
up to 20 MHz, so let's assume we can pick any rate up to 20 MHz also
for cpcap.

Cc: maemo-leste@lists.dyne.org
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
index bcced922b2807..b4779b0ece96d 100644
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -16,8 +16,10 @@ cpcap: pmic@0 {
 		#interrupt-cells = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		spi-max-frequency = <3000000>;
+		spi-max-frequency = <9600000>;
 		spi-cs-high;
+		spi-cpol;
+		spi-cpha;
 
 		cpcap_adc: adc {
 			compatible = "motorola,mapphone-cpcap-adc";
-- 
2.25.1

