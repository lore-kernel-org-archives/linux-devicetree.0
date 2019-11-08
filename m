Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B43C5DF60
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 12:02:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B598D2085B
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573214545;
	bh=dkQQjEz/3AL8lCoqR+WhrS+wxdB8zSvy0TZOHAZ0ujY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Q4WYMOWhVrDkK2hdD26qyldmYMKwqIVbRw5BV10LJP+nkKwOGUau4/wgjAI5R8YpQ
	 bBbvruuC7bp12gLOQ3pMZIvOiW6uia0QApITpny1QzAVxY4bjIlGIGm5Ns6hyfq8gp
	 N8pDblKOj75UqyH8DbPTxuSBIDlDLztTCG4YY/OA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390484AbfKHMCU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 07:02:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:57732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388506AbfKHLnT (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 06:43:19 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85E95222CE;
        Fri,  8 Nov 2019 11:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573213399;
        bh=dkQQjEz/3AL8lCoqR+WhrS+wxdB8zSvy0TZOHAZ0ujY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r3GvHRLAXFL3mkPir24mZGKmJXlKkmu5zTrbhM+t83COXBacYNiI1vZeI1XUGMSKj
         rVTm0puyt52LELRiBcyV3CoLusYb6fCJVjOxIO9sHkPZsl9WJYhPtYccyWb96DFEKs
         erXfWMRtdJojGHXb4icVXXOWr7BOcfYVHxCuv0Ig=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Sasha Levin <sashal@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 006/103] arm64: dts: allwinner: a64: NanoPi-A64: Fix DCDC1 voltage
Date:   Fri,  8 Nov 2019 06:41:31 -0500
Message-Id: <20191108114310.14363-6-sashal@kernel.org>
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

From: Andre Przywara <andre.przywara@arm.com>

[ Upstream commit 480f58cdbe392d4387a2193b6131a277e0111dd0 ]

According to the NanoPi-A64 schematics, DCDC1 is connected to a voltage
rail named "VDD_SYS_3.3V". All users seem to expect 3.3V here: the
Ethernet PHY, the uSD card slot, the camera interface and the GPIO pins
on the headers.
Fix up the voltage on the regulator to lift it up to 3.3V.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
index 2beef9e6cb885..aa0b3844ad63e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
@@ -126,9 +126,9 @@
 
 &reg_dcdc1 {
 	regulator-always-on;
-	regulator-min-microvolt = <3000000>;
-	regulator-max-microvolt = <3000000>;
-	regulator-name = "vcc-3v";
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-3v3";
 };
 
 &reg_dcdc2 {
-- 
2.20.1

