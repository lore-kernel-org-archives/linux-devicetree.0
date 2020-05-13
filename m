Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C63C2D0FD
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 14:07:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06BD720690
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 14:07:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="nSxBjKi2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cNrmk3bC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731192AbgEMOHi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 10:07:38 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33861 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387608AbgEMOHi (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 10:07:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 3D3EE5C01A9;
        Wed, 13 May 2020 10:07:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 13 May 2020 10:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=C5hkAX+x99/Jw
        BSSLrC70gOWyiL6Jt45c8FQFobP2VI=; b=nSxBjKi26aUPOiJYq9YVlXTC9Q25t
        /KuTJJE3sBWSekFREPQEKn1eTfCoC2rPPbrM6oijvzd+r2aY0FO3gf/hTjiEgvbU
        HgRjjPNOJarvkmKbdwDaDVfbFCmUP4tEd3bV+so+Z69H92srjcGIX85WHfnu1tpL
        8z5MCKbQwd4auonUwLHPq0D22VFJ2bjJL9rDhkKSUjksak4BSTtbI2m3qkAg2JBl
        iqFPcxsG7Ei0Rq/XjJtSHQTlgW4w4UDmuFf0SBAxZIVhqyslPSW9c4MISzNS+39o
        YhEVeZITm/pNXsU1QmpC72BnRf+LmXsDjapFz/xqlWPmB0JFAhet4jr5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=C5hkAX+x99/JwBSSLrC70gOWyiL6Jt45c8FQFobP2VI=; b=cNrmk3bC
        JJa18+kHpGNEmwMxh4LbDDd/vQuotqXvuwrX91Q31baTjPgFOJRFn3XMT5UZG6Yk
        5ErcFN4SUN0sxEdP+CIoughnAQIpV/FhaPQx7rbfnfN8UHj/iSNiw163hymRWj24
        +O4ZSAW1nKSclzSiS1A7XzCQSMfvTM2HUZo0dQWKSSbGtApyJfeBeHOpKiCwrZat
        p4o7lRJ8QMhHJyV0N9x2NX6rYbaXnsxizj4a0qE/KSpljzPOuiHXmSeSF/h2bO6b
        ZN4ekC4YHKSuSSh9hEesXHpNvWkf1FGYweN4c+sjZBP/e6ihK4ihw/PLZN8CJ9jf
        TepjQWNJ+l8w9g==
X-ME-Sender: <xms:Kf-7XktQr5zzYFS_nLnCiafMuIsNHc_OKFrwsV1N1p8-wj2DUD3m2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeggdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Kf-7Xheu4o8OhKapzH6wOEsa1JZPzY-3tNLt4lKeF5wBVYzZ2yeVgQ>
    <xmx:Kf-7XvwhgVKhVhquP-k6Ss-s7mUcJOmWhd7gAxW2fjbbpU-titdrfQ>
    <xmx:Kf-7XnNMt0bz3mjC4nQBvEV1-B9ISxyqAOWjqaQ8BzcGOqf2g8KDsw>
    <xmx:Kf-7XkxejVSHhqWhx4uqV8npbsNWR2KvENG_WqNhp7KGUZcbu1Uk_w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B0E45328006C;
        Wed, 13 May 2020 10:07:36 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 4/5] arm64: dts: allwinner: h6: Add IOMMU
Date:   Wed, 13 May 2020 16:07:23 +0200
Message-Id: <2e65d396500d7510c76b7bb9b11bc63014940e4d.1589378833.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.b27dedd61e008ffcf55a028ccddda3bb4d21dfc8.1589378833.git-series.maxime@cerno.tech>
References: <cover.b27dedd61e008ffcf55a028ccddda3bb4d21dfc8.1589378833.git-series.maxime@cerno.tech>
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
index 2e31632c6ca8..78b1361dfbb9 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -135,6 +135,7 @@
 				clock-names = "bus",
 					      "mod";
 				resets = <&display_clocks RST_MIXER0>;
+				iommus = <&iommu 0>;
 
 				ports {
 					#address-cells = <1>;
@@ -413,6 +414,15 @@
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
