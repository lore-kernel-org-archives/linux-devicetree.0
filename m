Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4698FA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 11:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7087C222CF
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573213864;
	bh=qDKjb23qMwMmQedUVQV3sCSnLpgnmjDuN8SzcUJWMbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=02ejj+895CmWC1ldBp3oJEt5LW55FV91qmpyzuxxMMnI3snUBCXNvVaKeS9O+NnPn
	 KrLgfD1AN50lRJQr4MyfYBw0S4nONfG3zt2wpeb8bUdjzBQoEGWgX5qzf8v+SOdyLL
	 0+PypyjMGpwd8N3Nx85HdeUGoVuR8P4xil1uo+mk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391615AbfKHLrn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:47:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:36276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403851AbfKHLrh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 06:47:37 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB5D2222CE;
        Fri,  8 Nov 2019 11:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573213657;
        bh=qDKjb23qMwMmQedUVQV3sCSnLpgnmjDuN8SzcUJWMbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A0TOmDkKi3beJA6f7Z90MnsEWhf8DhxGBwxiz74oFQlCUpAM2gh3VAzfs6mzM0A76
         CmE6AUZh3g4yJXcCPGzHhNQ817N8Fi9KDitAKry7eyaKF9JXh0od57YjwpIKMbI+1I
         o1Jj4Lr8WZ4ZteISHgdjDfBIt58vvdZhsi7piyEM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marcel Ziswiler <marcel@ziswiler.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 12/44] ARM: dts: pxa: fix power i2c base address
Date:   Fri,  8 Nov 2019 06:46:48 -0500
Message-Id: <20191108114721.15944-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108114721.15944-1-sashal@kernel.org>
References: <20191108114721.15944-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Marcel Ziswiler <marcel@ziswiler.com>

[ Upstream commit 8a1ecc01a473b75ab97be9b36f623e4551a6e9ae ]

There is one too many zeroes in the Power I2C base address. Fix this.

Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/pxa27x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 210192c38df3c..4448505e34d3b 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -63,7 +63,7 @@
 			clocks = <&clks CLK_PWM1>;
 		};
 
-		pwri2c: i2c@40f000180 {
+		pwri2c: i2c@40f00180 {
 			compatible = "mrvl,pxa-i2c";
 			reg = <0x40f00180 0x24>;
 			interrupts = <6>;
-- 
2.20.1

