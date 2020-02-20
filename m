Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89718C11D0C
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 18:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 662CC2467C
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 18:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="iJ1MFhPk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZFgmTXNq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgBTSP0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 13:15:26 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46109 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728480AbgBTSPZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Feb 2020 13:15:25 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 0800621F1E;
        Thu, 20 Feb 2020 13:15:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 20 Feb 2020 13:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=1BfdN/koG36m/
        f9DbPf89uTtUlItLarQ7BWkFlRXBOs=; b=iJ1MFhPkb8XKx37Q4eJJEYJFC4mxg
        TW+9XgktIv6sNoTdgGCpCmR43le3RIdOttSkYXwNPcP1XQLNh6jakyc4yLrccb1+
        T1LdPsVDBevSlP/9c4/3o0geAFBFKXYOEoeLckoPaq/E6NdNIl/7ReFYYzae6Ccm
        XRFt7jfMNElb+9LjGM75BZA3aj1Jnp31KL4v9XKq17fhMDfwpJUnbgjPc73Q/D47
        PaXndkO9Gy6t7lRwpv1AXBx2OBA7KgfVXOgEku1mkzTyE3htL6wegtyCL5KKNHvE
        pkgd2UzvqI5n93KHVy4Jeoqp4OBUE4Pj81/2BgcVknqbOhSB+onPF5Sxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=1BfdN/koG36m/f9DbPf89uTtUlItLarQ7BWkFlRXBOs=; b=ZFgmTXNq
        0Z77UeSd/q2WPKclmS+cia2i0YrtWEQ5p4SPcX8LTODbZBWIgeoc5nztzCzWPPiU
        8ysdEIk9nnaawWaViDRDMZ7HRZoPkyTsKCeS83kMUl4LHs6G7ijEKtHEyv5F1GKS
        XY0sVP80rDRvS139iBVRS2s0k7wZumdLvzfedPBtzSRdilfKmzR1G1ViHuOQMBpt
        CT4EfF7vFmvXJox9lVD1Pvs0iIdVfoh040ErM8PTEqXwfBSumHAnIS6eJDsXDxEg
        nkOBww9VqFejySAdHXJMYj3NJgTXE+3x+UMHv5JfM6tE3T7qVAYqsh+etX/4s8ru
        AHp/bs5sGZwE2A==
X-ME-Sender: <xms:vMxOXthaKzDQB2Ekf5FZFKGJJTw1v_ikjo8JDAhmbRlSs838l91hRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vMxOXtP7MlV-ObceaIWIa4d0RoiicYXHB58zS2l6VHEi0qMbdING7g>
    <xmx:vMxOXg5JsXFv7B7DDQCUrYaBMQ1uoNLxEHv2KIpA5G7_d52N-SjYjQ>
    <xmx:vMxOXsm0swspw0daTL_WhGreioTi6uh9hEZYPYRIp7DP05iZujhU6w>
    <xmx:vcxOXnrr3_DifvpJHd49N-0scaAVWt1CbTW17IU-Le6QL0FTXL1Xvg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 97E5F3060C21;
        Thu, 20 Feb 2020 13:15:24 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: h6: Add IOMMU
Date:   Thu, 20 Feb 2020 19:15:15 +0100
Message-Id: <435c75d9cbccbf32f501ea897775351a73e065f7.1582222496.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.a31c229a83f1d92e6928ae2adb70887da0fd44b3.1582222496.git-series.maxime@cerno.tech>
References: <cover.a31c229a83f1d92e6928ae2adb70887da0fd44b3.1582222496.git-series.maxime@cerno.tech>
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
index 3329283e38ab..2d0777ad39aa 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -131,6 +131,7 @@
 				clock-names = "bus",
 					      "mod";
 				resets = <&display_clocks RST_MIXER0>;
+				iommus = <&iommu 0>;
 
 				ports {
 					#address-cells = <1>;
@@ -370,6 +371,15 @@
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
