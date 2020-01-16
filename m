Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCD2C33CB3
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 19:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C2EF206E6
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 19:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579201833;
	bh=3eSdQKBCKCZUZxrA8ohD1vqLNUjmacg3tdsdP3Ld41c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=XenT06InZRZDLm1JjJ54S3rLOBKNE9piPJXbKsK5vufChACc++DiF5MlSm29EAl9h
	 1Gskza+Ms9soMqGwx45KVFUJPYIrP5PFKu2Ne9qkjuP0/iLFpS2ATQLMXA7BJr6zyq
	 2TsfVByxb96kxRsZswF91/XnuCGPm29xixCe+a5A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388895AbgAPTKR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 14:10:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:50238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387837AbgAPRAa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jan 2020 12:00:30 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 268842467C;
        Thu, 16 Jan 2020 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579194029;
        bh=3eSdQKBCKCZUZxrA8ohD1vqLNUjmacg3tdsdP3Ld41c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XjuTvFYeuxqI2R2WefEkXbdUzsg/JyYnCPp5ZXMgRh/xdfWFCA47U6cqE6T68Lhi+
         WSkiqVTQLrUgWnuhn5oo6Fl1IvjEklhrVHqTW9mBKeXpQzLlfJWG+BCLZOwmeRu7CP
         Z9Y7IR0Kv9hOfUdHdUPQ4JIVLPHo+T+HmcKDgKBA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Vladimir Zapolskiy <vz@mleia.com>, Sasha Levin <sashal@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 149/671] ARM: dts: lpc32xx: fix ARM PrimeCell LCD controller variant
Date:   Thu, 16 Jan 2020 11:50:58 -0500
Message-Id: <20200116165940.10720-32-sashal@kernel.org>
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

[ Upstream commit 7a0790a4121cbcd111cc537cdc801c46ccb789ee ]

ARM PrimeCell PL111 LCD controller is found on On NXP LPC3230
and LPC3250 SoCs variants, the original reference in compatible
property to an older one ARM PrimeCell PL110 is invalid.

Fixes: e04920d9efcb3 ("ARM: LPC32xx: DTS files for device tree conversion")
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 4f8f671c3343..cfd422e7f774 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -139,7 +139,7 @@
 		};
 
 		clcd: clcd@31040000 {
-			compatible = "arm,pl110", "arm,primecell";
+			compatible = "arm,pl111", "arm,primecell";
 			reg = <0x31040000 0x1000>;
 			interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_LCD>;
-- 
2.20.1

