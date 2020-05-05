Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CF0C47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 10:09:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFD75206E6
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 10:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="H0yjZ4Ol";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rd+Xg/4s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgEEKJq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 06:09:46 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53799 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728402AbgEEKJq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 06:09:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 06F1C5C00A6;
        Tue,  5 May 2020 06:09:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 05 May 2020 06:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=PP4evYCSYqJBd
        tsevGHWNnZYY8QlYKk1hl6EGB/KqB0=; b=H0yjZ4OlhAfuNz13EOHIe6FyIyHpc
        NuV9z/rZ7+P3eaTjbbV+3g1j+kXlidUHehQZSzuOTkr2W/TzUpQXUzztkuH9IYHi
        sJVl/yHhfCrr/F2ORbllRUt9TwWXbGWj/ASV/93ysbFj4a5NsLuFHuKkpL68g0yE
        oo3gbHgM6XXhL+0T+zHC9QkYPN+5I4qfWHlkbm1YS00riIiMRf0mI2A1aioWdNOd
        qEVZpRunZpRx8/iYphslNISHcjmH21UshgOoQFOFSceOaWNJFCeCAzJ3XSZFdXGr
        uJqQ6z66whTgoQmf6xbk4nk4pqFq4omBUC0f+2ln26vq0vo9P09d2eqYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=PP4evYCSYqJBdtsevGHWNnZYY8QlYKk1hl6EGB/KqB0=; b=rd+Xg/4s
        uKPJkr8c1RnHUdwCOAQZCvnfQdX+2QpQz41dwNyb7WCMmUVyvQVkK5kR61p8bG/o
        mPnFjPbpczCK00fNkpNxPOpO8cfrVAfunuIcTZHgnSHc/80TMrE+P3a0FvRXzKK8
        po9BxGaYuy1EhNg12qNePjeR7/jiQNeHJazw8+RsaDysZpfLj2ZxDXT/2/513KZ+
        lL6+9ty5KMAumBBFb4BzujJKqJWfHHDK/DefIzndKGxyHtPCJJ49sXAU5WaO3lJo
        pVnekLUcebku6QBvzC6k7lYECsc1Ss5IiD4QNUf/1dG+LmLQ5M25nii6FqzEQERl
        mIQLTmMVE4IVbA==
X-ME-Sender: <xms:aDuxXlmSwDrdzMLXTvf5a4ZqyLilCGrjali_54ISFlD_1_Ft5Rws_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeigddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aDuxXk02GWIt9t8WK_ZPUAQissQSfhFRLo2zTJrmFZev8bLgbTyv4g>
    <xmx:aDuxXsSBMRRrZ3N9n0apfmx8BVAOyyGhWFkzinBqwl6K9sVyaiPLJg>
    <xmx:aDuxXlemXUELViOWBtZLAD4JptqPzPnLouaJbG9HEU-akwMJmyrl0w>
    <xmx:aTuxXh_wlNCI1S6aCn2-d1iI8O33hqE72lE8Tog4NYFnqWFW5uaifQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 96DDF3280063;
        Tue,  5 May 2020 06:09:44 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 4/5] arm64: dts: allwinner: h6: Add IOMMU
Date:   Tue,  5 May 2020 12:09:33 +0200
Message-Id: <c728eee8371962db79e53b321e1102f3e763db0d.1588673353.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.70f96f9afd2e04161ebece593ae6cd7e17eca41b.1588673353.git-series.maxime@cerno.tech>
References: <cover.70f96f9afd2e04161ebece593ae6cd7e17eca41b.1588673353.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Now that we have a driver for the IOMMU, let's start using it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index b9ab7d8fa8af..bba64a4030e2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -123,6 +123,7 @@
 				clock-names = "bus",
 					      "mod";
 				resets = <&display_clocks RST_MIXER0>;
+				iommus = <&iommu 0>;
 
 				ports {
 					#address-cells = <1>;
@@ -387,6 +388,15 @@
 			#interrupt-cells = <3>;
 		};
 
+		iommu: iommu@30f0000 {
+			compatible = "allwinner,sun50i-h6-iommu";
+			reg = <0x030f0000 0x10000>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_IOMMU>;
+			resets = <&ccu RST_BUS_IOMMU>;
+			#iommu-cells = <1>;
+		};
+
 		mmc0: mmc@4020000 {
 			compatible = "allwinner,sun50i-h6-mmc",
 				     "allwinner,sun50i-a64-mmc";
-- 
git-series 0.9.1
