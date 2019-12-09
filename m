Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E8FC43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 20:03:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A45E4207FF
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 20:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575921813;
	bh=A0I5xt4XVITb5z+wlWL8aR+iy4vFVHNdEWorhG4GJ/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=p1iGKYdnJWD1EjrRlKdHh82heP+5kCvylMLi40l9NX67Kv8FjTUJK8xz3PnR2iT8+
	 dr5PxADb57VYgWeBiC+NhxUMcUfCFacnBYMdwbYNg51xpRzl8QLve/8AJTQMDSFPaF
	 yBLja6qozmWKMNDOHGenUr05CxdD/zqHflhcE1Q8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfLIUDd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 15:03:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:54516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbfLIUDd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Dec 2019 15:03:33 -0500
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E3072073D;
        Mon,  9 Dec 2019 20:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575921812;
        bh=A0I5xt4XVITb5z+wlWL8aR+iy4vFVHNdEWorhG4GJ/Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EpZ4LttEWn+/f/Y3V6o4s1cgDDhtTtCGT82reKJT064VK/o1My1nkUMsM79YglWwX
         R7Zwgd0VkHepPrARH41qnKM9B8sdt7DnN0/1mdbe7Br1ZnU0EkMZJMmGOnbSfTt+AE
         hkqHJWZVKPdB6H94t2fQDteb8ikwRSiClkiVHGK0=
Date:   Mon, 9 Dec 2019 20:31:12 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: a64: set GPU clock to 432 MHz
Message-ID: <20191209193112.qr6un5ryhyxwu6a5@hendrix.lan>
References: <20191203021420.164129-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203021420.164129-1-anarsoul@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Dec 02, 2019 at 06:14:20PM -0800, Vasily Khoruzhick wrote:
> That's what BSP kernel sets it to and it seems to work fine.
>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 27e48234f1c2..0051f39b3d98 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -976,6 +976,9 @@ mali: gpu@1c40000 {
>  			clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
>  			clock-names = "bus", "core";
>  			resets = <&ccu RST_BUS_GPU>;
> +
> +			assigned-clocks = <&ccu CLK_GPU>;
> +			assigned-clock-rates = <432000000>;
>  		};

This doesn't really guarantee anything. If the GPU needs to remain at
that rate, it should be set in the driver. I just saw that you did
send a PR in github, I just merged it.

Maxime
