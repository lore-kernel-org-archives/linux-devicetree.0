Return-Path: <SRS0=8u50=4L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B402C35669
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Feb 2020 02:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3580B2192A
	for <linux-devicetree@archiver.kernel.org>; Sun, 23 Feb 2020 02:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582424507;
	bh=b0T7XcKyF7fdfoO4CCzBX1iv4p+VefjFERsskt64TYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=qqG3dUQZ8Ztjgetmogc+lVQyoKh3pKmCQAOtsCZ2iiHcOAUzsATvoZRaISkzCqqav
	 nyRwjm98jzKcoyR2D8TgnId9cFkEfZNlieaz2hmZlEEmD3s7E1O85dDj16kKCCBft2
	 GT8d1X0XfwJKP6S5VcRKeaa+5BS2/0mGvCudx17I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727718AbgBWCVq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Feb 2020 21:21:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:50266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727708AbgBWCVp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 22 Feb 2020 21:21:45 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD362214DB;
        Sun, 23 Feb 2020 02:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582424505;
        bh=b0T7XcKyF7fdfoO4CCzBX1iv4p+VefjFERsskt64TYA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i77Vk/J7TDJqXKm6002HID74eMcTfYAZSaWrtUgisXwgqrP7uaWz+jsZd1UfIdSuY
         qVGo6Vda6oDP2e/05DGGsRZGdZNb8ewq5oAlwSNhKimgt/Lm1KkstX7O9aYljVb0+O
         upakQSOxY5hobZaEu1y+Wx4hIC5hzRD/tCgjuNn0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Sasha Levin <sashal@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 21/58] ARM: dts: sti: fixup sound frame-inversion for stihxxx-b2120.dtsi
Date:   Sat, 22 Feb 2020 21:20:42 -0500
Message-Id: <20200223022119.707-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200223022119.707-1-sashal@kernel.org>
References: <20200223022119.707-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit f24667779b5348279e5e4328312a141a730a1fc7 ]

frame-inversion is "flag" not "uint32".
This patch fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stihxxx-b2120.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index 60e11045ad762..d051f080e52ec 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -46,7 +46,7 @@
 			/* DAC */
 			format = "i2s";
 			mclk-fs = <256>;
-			frame-inversion = <1>;
+			frame-inversion;
 			cpu {
 				sound-dai = <&sti_uni_player2>;
 			};
-- 
2.20.1

