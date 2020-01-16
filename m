Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6640C33CB6
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 19:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B40FA206E6
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 19:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579201816;
	bh=gmmjYdhVeD7er2tUkAkAiRFI6JSPKXZj5K+epVd+gqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=qjpoE++In+E6Yi+Yq6AEtTw9xTnfoaHXlb4j4NiTKRlugpcs8+yt0x9Riie6XT+jz
	 MhaAxPsl1Vr1AqfTsnKUrn9isEpBILMxFvMKMbmoEy84plf0QWbzTAdx3cj3dUxXEQ
	 GtxY0ubARY0nhk/V+Yi1HTXDrtBmAyk1bCZ/SKj4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387845AbgAPRAc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 12:00:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:50280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387839AbgAPRAb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jan 2020 12:00:31 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A68E24681;
        Thu, 16 Jan 2020 17:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579194030;
        bh=gmmjYdhVeD7er2tUkAkAiRFI6JSPKXZj5K+epVd+gqg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2AbJg6Z/Fv9fQF23X0Z+fBQM2/zqA/G+ScwVg0cZOHzJOcBnCKpZQ3dAMw/RJpOO8
         Fxu6ZNjjsTAf49+LT6zS8j/shgrI8qRlHwo+5hzKX82jfxTuOw75Fwp77x86qFT8YY
         OYfJu1+o6lJWi9NBUodIaCDcqM+8Otzjm6DeGjto=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Vladimir Zapolskiy <vz@mleia.com>, Sasha Levin <sashal@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 150/671] ARM: dts: lpc32xx: fix ARM PrimeCell LCD controller clocks property
Date:   Thu, 16 Jan 2020 11:50:59 -0500
Message-Id: <20200116165940.10720-33-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165940.10720-1-sashal@kernel.org>
References: <20200116165940.10720-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Vladimir Zapolskiy <vz@mleia.com>

[ Upstream commit 30fc01bae3cda747e7d9c352b1aa51ca113c8a9d ]

The originally added ARM PrimeCell PL111 clocks property misses
the required "clcdclk" clock, which is the same as a clock to enable
the LCD controller on NXP LPC3230 and NXP LPC3250 SoCs.

Fixes: 93898eb775e5 ("arm: dts: lpc32xx: add clock properties to device nodes")
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index cfd422e7f774..9ad3df11db0d 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -142,8 +142,8 @@
 			compatible = "arm,pl111", "arm,primecell";
 			reg = <0x31040000 0x1000>;
 			interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk LPC32XX_CLK_LCD>;
-			clock-names = "apb_pclk";
+			clocks = <&clk LPC32XX_CLK_LCD>, <&clk LPC32XX_CLK_LCD>;
+			clock-names = "clcdclk", "apb_pclk";
 			status = "disabled";
 		};
 
-- 
2.20.1

