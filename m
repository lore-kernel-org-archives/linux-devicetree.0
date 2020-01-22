Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF5DC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 12:44:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D542624684
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 12:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="Z150IZz4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uIJmzyUa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbgAVMoX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 07:44:23 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35799 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726204AbgAVMoX (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jan 2020 07:44:23 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 32F022210C;
        Wed, 22 Jan 2020 07:44:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 22 Jan 2020 07:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=DgDfB/hFawptN
        HZCJCX81NZTCohtpfH3MNlMAuDUEKQ=; b=Z150IZz4hGxFI+wykeLAdtxo6Ddhh
        M5CEhCxbhrM6s1zLBcLKX4zrHzyR5SvMeKGWkLD0C5U9n1GbkuEqB2bbiy6F8OwY
        D2DIqIs1eWDAAYp2R2p7zaW0LWvJ/8Hpdk2OJCnT79mIcVD8TCQNhV3EdF7YjVnU
        JeF3ezdmTudepbEVQSU7n3KbqBL30cRXwAEWjNsO5x3oT3iEElqa4cfpuz5yLtIO
        1DgHiFWhlmkf11wJq67887YYwj6FSoC22wZGhHO6eLKA57oBBJ9ireorTAlhzFwP
        qQUUQLSFD19mpOijSi48wPfonjwW73B0/fLh2hwFCSwodBIncXyK94o4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=DgDfB/hFawptNHZCJCX81NZTCohtpfH3MNlMAuDUEKQ=; b=uIJmzyUa
        RE9JexdjY8rNY+OywLWfPi+Btfh9wrOSpkwEYAdS1B4p9nlRHbR9REQO390Fxq99
        N85270eEsfyTjOaD8Wi6ZF9duoVL7fVik9PSWkufAla7NQy4OmygVs2RTrprkyAu
        xlqOGiLQDFD52Z1Ue2DjzcskgQtGPj/W8v191zcN4R++AgdPAUADY2ThS2q9RaOw
        WESteeGKFoDwvOw7Ksac0rZkwwvvmMSXE3HEmNF9eDcylXPGcD8Ib41zN4HeRA/h
        ikLkkzFvxX343kT8hlQ57UQ80lBxr4yfcUbBPTNIVK2kysoWTJGnQzJ8666NxlRN
        xflNW4FH/kDNOw==
X-ME-Sender: <xms:pkMoXsgmaEntAfh5bt3y9RNcH2GQPGtm2bJXMEn6rJlyi3ZefsM_Gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvddtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pkMoXgeBJlM_AwBrZzpAzASI1RIobCbRh1SDGEVQlg2fxoqzSfJngg>
    <xmx:pkMoXnlNsIv4Xw5BkS6qkAp1XenVe6ShGFcICk0NrERExSAk0dOz7g>
    <xmx:pkMoXhuZZFTZr9WamAWErzchlz0e16zNWF29DGXsPT0dwEzoTB-6GQ>
    <xmx:pkMoXjx2A9AcYRe7KcLGl_O3InAxIgOXTbnqQ0z_1JeHdQR96hrC2w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DCBDF3060CBE;
        Wed, 22 Jan 2020 07:44:21 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/3] arm64: dts: allwinner: h6: Add IOMMU
Date:   Wed, 22 Jan 2020 13:44:09 +0100
Message-Id: <54e22e25c2c13cb1b73cc7ecb645b5d62f325b63.1579696927.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.b2a9e1507135d81e726fcbb65137665a7f0ab74f.1579696927.git-series.maxime@cerno.tech>
References: <cover.b2a9e1507135d81e726fcbb65137665a7f0ab74f.1579696927.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Now that we have a driver for the IOMMU, let's start using it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 29824081b43b..8608bcf1c52c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -53,6 +53,7 @@
 	de: display-engine {
 		compatible = "allwinner,sun50i-h6-display-engine";
 		allwinner,pipelines = <&mixer0>;
+		iommus = <&iommu 0>;
 		status = "disabled";
 	};
 
@@ -122,6 +123,7 @@
 				clock-names = "bus",
 					      "mod";
 				resets = <&display_clocks RST_MIXER0>;
+				iommus = <&iommu 0>;
 
 				ports {
 					#address-cells = <1>;
@@ -345,6 +347,15 @@
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
