Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FDAC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 14:38:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3143B20838
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579876728;
	bh=TDxPorzrIJGs1ZqB7kiIUwv25RiRwUZ8gQeU5ZGA0Yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=NxmGTPAmkB6yfRQyPkIe/g420jo3wnNNOylleGImmDwnM/11kb8PGMsCQJAHd1yjM
	 YDnGK0OG0qZwQwcoIZNoA1oTx8pLx3IRS0/ImaOyQ4z0RkQ81FExlxUHays1exTDv2
	 5H4gfaTlaHIYXiTDyyEd3/aj0MPAnPqLCsRUARfw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388691AbgAXOim (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 09:38:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:38270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390932AbgAXOSj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Jan 2020 09:18:39 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF94F208C4;
        Fri, 24 Jan 2020 14:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579875518;
        bh=TDxPorzrIJGs1ZqB7kiIUwv25RiRwUZ8gQeU5ZGA0Yc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r0fV1D/da4A/2mpzyJpC950PQ2V/861yc9+JBLLk5ULwQcs49yUvC8CtDkAiN4MEG
         7CORZZHhFFiy3XWGQT0H4D//0fUOGapTgqBB1ooHK0kampU0e8rAW/kukr+9gYjsoC
         2TRdR+Jh1dpDimQuq7Ye9i3HUBakBZix9CfDTE6M=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "Angus Ainslie (Purism)" <angus@akkea.ca>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Shawn Guo <shawnguo@kernel.org>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 018/107] arm64: dts: imx8mq-librem5-devkit: use correct interrupt for the magnetometer
Date:   Fri, 24 Jan 2020 09:16:48 -0500
Message-Id: <20200124141817.28793-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124141817.28793-1-sashal@kernel.org>
References: <20200124141817.28793-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: "Angus Ainslie (Purism)" <angus@akkea.ca>

[ Upstream commit 106f7b3bf943d267eb657f34616adcaadb2ab07f ]

The LSM9DS1 uses a high level interrupt.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
Fixes: eb4ea0857c83 ("arm64: dts: fsl: librem5: Add a device tree for the Librem5 devkit")
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index 683a110356431..98cfe67b7db7b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -421,7 +421,7 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_imu>;
 		interrupt-parent = <&gpio3>;
-		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 		vdd-supply = <&reg_3v3_p>;
 		vddio-supply = <&reg_3v3_p>;
 	};
-- 
2.20.1

