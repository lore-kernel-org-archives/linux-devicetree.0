Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A47C43215
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:36:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28FF420848
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:36:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfLBRgR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 12:36:17 -0500
Received: from gloria.sntech.de ([185.11.138.130]:44818 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727670AbfLBRgR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 2 Dec 2019 12:36:17 -0500
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1ibpcL-000569-TZ; Mon, 02 Dec 2019 18:36:13 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix IOMMU second clock name
Date:   Mon, 02 Dec 2019 18:36:13 +0100
Message-ID: <2612427.5nXUCueWBK@diego>
In-Reply-To: <20191202170028.26169-1-miquel.raynal@bootlin.com>
References: <20191202170028.26169-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Miquel,

Am Montag, 2. Dezember 2019, 18:00:28 CET schrieb Miquel Raynal:
> By precedence, both the IOMMU driver and the bindings in the doc
> impose two clocks to be filled in Rockchip device trees featuring an
> IOMMU:
> * The AXI clock called 'aclk'.
> * The main peripheral bus clock (PCLK/HCL) called 'iface'.
> 
> Currently, the second clock in px30.dtsi is called 'hclk' and this
> produces the following errors at boot:
> 
>         rk_iommu ff460f00.iommu: Failed to get clk 'iface': -2
>         rk_iommu ff470f00.iommu: Failed to get clk 'iface': -2
> 
> Fix the PX30 device tree by renaming the second misnamed clock. The
> issue has not been reported before probably because the clk_get() call
> is optional for backward DT compatibility reasons.
> 
> Fixes: 7053e06b1422 ("arm64: dts: rockchip: add core dtsi file for PX30 SoCs")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

A similar for that issue is already on its way into mainline for 5.5:
https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/commit/?h=for-next&id=8e57eed2047b9361deb8c5dc4cc3d4e679c5ce50

Heiko


> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index eb992d60e6ba..1fd12bd09e83 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -831,7 +831,7 @@
>  		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
>  		interrupt-names = "vopb_mmu";
>  		clocks = <&cru ACLK_VOPB>, <&cru HCLK_VOPB>;
> -		clock-names = "aclk", "hclk";
> +		clock-names = "aclk", "iface";
>  		power-domains = <&power PX30_PD_VO>;
>  		#iommu-cells = <0>;
>  		status = "disabled";
> @@ -863,7 +863,7 @@
>  		interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
>  		interrupt-names = "vopl_mmu";
>  		clocks = <&cru ACLK_VOPL>, <&cru HCLK_VOPL>;
> -		clock-names = "aclk", "hclk";
> +		clock-names = "aclk", "iface";
>  		power-domains = <&power PX30_PD_VO>;
>  		#iommu-cells = <0>;
>  		status = "disabled";
> 




