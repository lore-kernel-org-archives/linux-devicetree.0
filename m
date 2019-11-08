Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB02FA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 11:43:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE124222CB
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 11:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573213401;
	bh=LSJuR6xuJV+Zd/1X8vuZZ7n0Yx4USt8B+Uah0jtEuXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=tB50rxVjva2Hu9GqtNv1yA+7f06z5Mk7i0dmg2U+xw6NmfPWQOxsCWiBa9pMCJ/Ks
	 SMhHPF77WFMUFPcOZ38oQ6QkodwOrEAjTZrRgkwYNsgn5Ene0rGSknKbpYIXO7Y/n3
	 I4JqKTVz3jcS2Hl7iAbey3vjMg+UCU8aAewJTQcU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390417AbfKHLnU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:43:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:57704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390410AbfKHLnS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 06:43:18 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4746B222CF;
        Fri,  8 Nov 2019 11:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573213398;
        bh=LSJuR6xuJV+Zd/1X8vuZZ7n0Yx4USt8B+Uah0jtEuXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YYsaFNRT5UjfnhtYlbbEOCV7nJI/uJXkNj5nMdH0LSWNINGw23EiU/BvL5lhcRcJs
         ByBkrm4kGjf6jMhpPinaxLu/jO8hED2eM8p0IVSlnUsTkdXAsD0RLN8BCoDkt+EKtf
         6mM7OasqouP6V4Yqr5NmhBnz8oqnu4AaQLtnlUG0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Martin Lucina <martin@lucina.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Sasha Levin <sashal@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 005/103] arm64: dts: allwinner: a64: Olinuxino: fix DRAM voltage
Date:   Fri,  8 Nov 2019 06:41:30 -0500
Message-Id: <20191108114310.14363-5-sashal@kernel.org>
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

[ Upstream commit 93366b49a35f3a190052734b3f32c8fe2535b53f ]

The Olinuxino board uses DDR3L chips which are supposed to be driven
with 1.35V. The reset default of the AXP is properly set to 1.36V.

While technically the chips can also run at 1.5 volts, changing the
voltage on the fly while booting Linux is asking for trouble. Also
running at a lower voltage saves power.

So fix the DCDC5 value to match the actual board design.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Martin Lucina <martin@lucina.net>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
index 338e786155b1f..2ef779b027572 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
@@ -120,10 +120,14 @@
 
 /* DCDC3 is polyphased with DCDC2 */
 
+/*
+ * The board uses DDR3L DRAM chips. 1.36V is the closest to the nominal
+ * 1.35V that the PMIC can drive.
+ */
 &reg_dcdc5 {
 	regulator-always-on;
-	regulator-min-microvolt = <1500000>;
-	regulator-max-microvolt = <1500000>;
+	regulator-min-microvolt = <1360000>;
+	regulator-max-microvolt = <1360000>;
 	regulator-name = "vcc-ddr3";
 };
 
-- 
2.20.1

