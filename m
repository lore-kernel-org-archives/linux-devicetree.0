Return-Path: <SRS0=7QPV=7V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B57C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 23:13:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 406772151B
	for <linux-devicetree@archiver.kernel.org>; Mon,  8 Jun 2020 23:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591658014;
	bh=S5DIYHBVPtyga/0O3sP4/9sG7cR7paSmpGq1tweZE3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=VqzGCU/zG9Iv+SfRJULLy0wz0gIu8AKGYrL+HhnY8P5Jv6bSwN3iJVDFlaLiW3Vkq
	 jyGcNC+4pxL/2CO9eZRznW6Xf2zCmeg1Fxi69rQGPbcns2VHU0shKQSiTMwqm+9S8B
	 GTZtDYkGVNeVmSnpr/aVn7lts4gB/yjCnkfqqWoc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgFHXNc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 8 Jun 2020 19:13:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:33298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729403AbgFHXNa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 8 Jun 2020 19:13:30 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CD3321508;
        Mon,  8 Jun 2020 23:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591658010;
        bh=S5DIYHBVPtyga/0O3sP4/9sG7cR7paSmpGq1tweZE3E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LDRI/QtBON6/Hlo6gZ+srpDWwtbZdYWGAV1BN2qqarZ4ksCrobZFfNXlJxN8uFrxH
         fWdArLlPC/GMyRrbFHQtG1+O3Vl3pPVLiCtPgQ36YcfLXobRa2v1eTTPAPE5m5t6ad
         JSxLeq06IQA05LXKLlIK8ocAXOHXc+EX5VHwIq68=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 065/606] ARM: dts: r8a7740: Add missing extal2 to CPG node
Date:   Mon,  8 Jun 2020 19:03:10 -0400
Message-Id: <20200608231211.3363633-65-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

commit e47cb97f153193d4b41ca8d48127da14513d54c7 upstream.

The Clock Pulse Generator (CPG) device node lacks the extal2 clock.
This may lead to a failure registering the "r" clock, or to a wrong
parent for the "usb24s" clock, depending on MD_CK2 pin configuration and
boot loader CPG_USBCKCR register configuration.

This went unnoticed, as this does not affect the single upstream board
configuration, which relies on the first clock input only.

Fixes: d9ffd583bf345e2e ("ARM: shmobile: r8a7740: add SoC clocks to DTS")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Link: https://lore.kernel.org/r/20200508095918.6061-1-geert+renesas@glider.be
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm/boot/dts/r8a7740.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
index ebc1ff64f530..90feb2cf9960 100644
--- a/arch/arm/boot/dts/r8a7740.dtsi
+++ b/arch/arm/boot/dts/r8a7740.dtsi
@@ -479,7 +479,7 @@ fsibck_clk: fsibck {
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7740-cpg-clocks";
 			reg = <0xe6150000 0x10000>;
-			clocks = <&extal1_clk>, <&extalr_clk>;
+			clocks = <&extal1_clk>, <&extal2_clk>, <&extalr_clk>;
 			#clock-cells = <1>;
 			clock-output-names = "system", "pllc0", "pllc1",
 					     "pllc2", "r",
-- 
2.25.1

