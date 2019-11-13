Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDBFC17441
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 02:25:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D5062067B
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 02:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573611907;
	bh=k8Y5H6Z36lm9qTZE69Um8n6ih5/V0cui+ibzPJzQNgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=cgLy+VUzAvB0DYpPOUsND1Ty9hjEVQhCqVoMr4Fb7OfWT2wMzttl5p3muGvuAIOT/
	 QVgwobYB4AU1GnGL2kkMqCrBFLhdiLWeSmP1nPqcD1faYwjPAoYLFfz6E+70BHhXnT
	 dyCPmvZOrxM57FMarlRXs73n5CV5Lbnbd59A3dt0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbfKMBvt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 20:51:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:39978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728003AbfKMBvs (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Nov 2019 20:51:48 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 70C8F20674;
        Wed, 13 Nov 2019 01:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573609908;
        bh=k8Y5H6Z36lm9qTZE69Um8n6ih5/V0cui+ibzPJzQNgE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qOJldV/hl1aMfJJKIiwg9ORcj9OlekZerG6pnJHfFRbtdyTJsI/VNbhyYZ72JjFfe
         vDZ3my0q+3rj8MNmrSaHATyvhI52SFPhg7VQ+CbuQ7h+yGXvRjpN7A8+L4/OFprLEe
         8eKMaz0a4FH7RMiqbDQH1uNaFrUtzeZwiijhgosk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tudor Ambarus <tudor.ambarus@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 059/209] ARM: dts: at91: at91sam9x5cm: fix addressable nand flash size
Date:   Tue, 12 Nov 2019 20:47:55 -0500
Message-Id: <20191113015025.9685-59-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015025.9685-1-sashal@kernel.org>
References: <20191113015025.9685-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

[ Upstream commit 6f270d88a0c4a11725afd8fd2001ae408733afbf ]

at91sam9x5cm comes with a 2Gb NAND flash. Fix the rootfs size to
match this limit.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/at91sam9x5cm.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91sam9x5cm.dtsi b/arch/arm/boot/dts/at91sam9x5cm.dtsi
index 4908ee07e6287..993eabe1cf7a5 100644
--- a/arch/arm/boot/dts/at91sam9x5cm.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5cm.dtsi
@@ -100,7 +100,7 @@
 
 						rootfs@800000 {
 							label = "rootfs";
-							reg = <0x800000 0x1f800000>;
+							reg = <0x800000 0x0f800000>;
 						};
 					};
 				};
-- 
2.20.1

