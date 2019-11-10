Return-Path: <SRS0=/VR8=ZC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49FBC17443
	for <linux-devicetree@archiver.kernel.org>; Sun, 10 Nov 2019 03:13:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70E60215EA
	for <linux-devicetree@archiver.kernel.org>; Sun, 10 Nov 2019 03:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573355620;
	bh=MxlgPNIfRZUc8+XjXZZznbftC8zjMG5AwsiChYigWyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ukBrfErHn/6kXv7mOdnMQ9TWPpnm8pDeuYOF7yhxtswex/X9jXejDp/7pOeoTn3Ez
	 oKwfGvgfUiX5rW5adhBs6piMJXy1U/aCcq9dU9ShaFXFExDdQ5e0Imr4ARKDmzNzND
	 sxAmqxMjzCHHEL5jOF8PL43qWphcJXW/ltHTTLhs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbfKJCmp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 9 Nov 2019 21:42:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:39210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727984AbfKJCmo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 9 Nov 2019 21:42:44 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A4C7E21924;
        Sun, 10 Nov 2019 02:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573353764;
        bh=MxlgPNIfRZUc8+XjXZZznbftC8zjMG5AwsiChYigWyQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xZ4o2iniO4wfPDVdgE4kQgxnEt7tiHFQW3Z12eiSihtYv+QfgDRzPuVtzS5TRmnNz
         V+63z686kMw4OnQ9uB8dc+7zkTYEHRKpWtb0aW/iklKGhsHzw2SAtdqJwvEyARUlqY
         Dx8UI07L8/rx5OqEAk8Rylej5VBbMnnHIXxciWI0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Baruch Siach <baruch@tkos.co.il>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 076/191] ARM: dts: clearfog: fix sdhci supply property name
Date:   Sat,  9 Nov 2019 21:38:18 -0500
Message-Id: <20191110024013.29782-76-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Baruch Siach <baruch@tkos.co.il>

[ Upstream commit e807f0298144c06740022a2f900d86b7f115595e ]

The vmmc phandle, like all power supply property names, must have the
'-supply' suffix.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
index 7c6ad2afb0947..1b0d0680c8b62 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
@@ -48,7 +48,7 @@
 					     &clearfog_sdhci_cd_pins>;
 				pinctrl-names = "default";
 				status = "okay";
-				vmmc = <&reg_3p3v>;
+				vmmc-supply = <&reg_3p3v>;
 				wp-inverted;
 			};
 
-- 
2.20.1

