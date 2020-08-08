Return-Path: <SRS0=1SIx=BS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3771C433E1
	for <linux-devicetree@archiver.kernel.org>; Sat,  8 Aug 2020 23:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B74B520672
	for <linux-devicetree@archiver.kernel.org>; Sat,  8 Aug 2020 23:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596930656;
	bh=0/hszbWEWY+uc1pMJXENVvjhlqC59WOheY0I+GsN32Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=jLAoNq0VjiJ9yCB+eFM3ksng3pvzUdr86int7q//lRhNLbqN58x+/Y0D2laBqWsvX
	 P+/DATmBb/2SlxbDp3yHBLK65HxUMcOWc79K/KPfUXC5BmSIRHLW65XmPGAfH4lXp/
	 X08kzdszgFWZ5LL7yUwICNpqSMihIufT8ca6p8hY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgHHXuz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 8 Aug 2020 19:50:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:48568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726479AbgHHXgN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 8 Aug 2020 19:36:13 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 572E820791;
        Sat,  8 Aug 2020 23:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596929773;
        bh=0/hszbWEWY+uc1pMJXENVvjhlqC59WOheY0I+GsN32Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f554LPEyCAzkyMCHnI5UtEhZlGOejBA9tDgbInlWXYwTrfjtTlYIcsS+V0nElGcUZ
         rcOuYV6NHFgyBQ1aVB2BylQJvu5K5n/RB3R2RcVyv6dZCUVIgAVXZl44ooOOiJywhE
         tqlwD1Nwcpu0x+Gi66rSPUSyyiMfapNUJmtN4tu8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ondrej Jirman <megous@megous.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.8 23/72] arm64: dts: sun50i-pinephone: dldo4 must not be >= 1.8V
Date:   Sat,  8 Aug 2020 19:34:52 -0400
Message-Id: <20200808233542.3617339-23-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200808233542.3617339-1-sashal@kernel.org>
References: <20200808233542.3617339-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

[ Upstream commit 86be5c789690eb08656b08c072c50a7b02bf41f1 ]

Some outputs from the RTL8723CS are connected to the PL port (BT_WAKE_AP),
which runs at 1.8V. When BT_WAKE_AP is high, the PL pin this signal is
connected to is overdriven, and the whole PL port's voltage rises
somewhat. This results in changing voltage on the R_PWM pin (PL10),
which is the cause for backlight flickering very noticeably when typing
on a Bluetooth keyboard, because backlight intensity is highly sensitive
to the voltage of the R_PWM pin.

Limit the maximum WiFi/BT I/O voltage to 1.8V to avoid overdriving
the PL port pins via BT and WiFi IO port signals. WiFi and BT
functionality is unaffected by this change.

This completely stops the backlight flicker when using bluetooth.

Fixes: 91f480d40942 ("arm64: dts: allwinner: Add initial support for Pine64 PinePhone")
Signed-off-by: Ondrej Jirman <megous@megous.com>
Link: https://lore.kernel.org/r/20200703194842.111845-4-megous@megous.com
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index cefda145c3c9d..342733a20c337 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -279,7 +279,7 @@ &reg_dldo3 {
 
 &reg_dldo4 {
 	regulator-min-microvolt = <1800000>;
-	regulator-max-microvolt = <3300000>;
+	regulator-max-microvolt = <1800000>;
 	regulator-name = "vcc-wifi-io";
 };
 
-- 
2.25.1

