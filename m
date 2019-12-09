Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96319C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 06:31:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64F0720721
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 06:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575873105;
	bh=JNkb10Pp1zc5am3FaANhCosXMk76s6PelvibBjYsbEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XPqzGPt9wvGndLhwClRiaAaS8qtcN73Mz4Tw1qszrM5wEqrsMVwDlin3AtUu1ovYG
	 tCkSZNjp3ZtMg0jJA6ZuBVEsQSNnpdfxntbUHbizHJ4jpwXNYpoT+WDH0GumpuCMpq
	 xG5dVGw8kFCzV2mU7aiAyQAdZPWXotlUqVERs9Ag=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfLIGbp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 01:31:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:39332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbfLIGbo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 9 Dec 2019 01:31:44 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A72FE206D3;
        Mon,  9 Dec 2019 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575873104;
        bh=JNkb10Pp1zc5am3FaANhCosXMk76s6PelvibBjYsbEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jv7TDuaJMLzYAplOE7S/vegyKqXBl777tgut/yWVB777Oc75VcrOu/z40SOYG8q0H
         /LWCB8Okp1KJ4T1qTAscOO67lW/j7LEPxs09U61Yb0+bNpXdIh5IIuQrfxT1wmdDlN
         es01oTBnJhrAlNGZZes3u1spL6M4crN53P9fA3VI=
Date:   Mon, 9 Dec 2019 14:31:29 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/4] arm64: dts: ls1028a: add missing sai nodes
Message-ID: <20191209063128.GC3365@dragon>
References: <20191123201317.25861-1-michael@walle.cc>
 <20191123201317.25861-3-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191123201317.25861-3-michael@walle.cc>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Nov 23, 2019 at 09:13:15PM +0100, Michael Walle wrote:
> The LS1028A has six SAI cores.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index f2e71fd57b20..6730922c2d47 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -534,6 +534,20 @@
>  			status = "disabled";
>  		};
>  
> +		sai3: audio-controller@f120000 {
> +			#sound-dai-cells = <0>;
> +			compatible = "fsl,vf610-sai";
> +			reg = <0x0 0xf120000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
> +				 <&clockgen 4 1>, <&clockgen 4 1>;
> +			clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +			dma-names = "tx", "rx";
> +			dmas = <&edma0 1 8>,
> +			       <&edma0 1 7>;
> +			status = "disabled";
> +		};
> +
>  		sai4: audio-controller@f130000 {
>  			#sound-dai-cells = <0>;
>  			compatible = "fsl,vf610-sai";
> @@ -548,6 +562,34 @@
>  			status = "disabled";
>  		};
>  
> +		sai5: audio-controller@f140000 {
> +			#sound-dai-cells = <0>;
> +			compatible = "fsl,vf610-sai";
> +			reg = <0x0 0xf140000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
> +				 <&clockgen 4 1>, <&clockgen 4 1>;
> +			clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +			dma-names = "tx", "rx";
> +			dmas = <&edma0 1 12>,
> +			       <&edma0 1 11>;
> +			status = "disabled";
> +		};
> +
> +		sai6: audio-controller@f150000 {
> +			#sound-dai-cells = <0>;
> +			compatible = "fsl,vf610-sai";
> +			reg = <0x0 0xf150000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clockgen 4 1>, <&clockgen 4 1>,
> +				 <&clockgen 4 1>, <&clockgen 4 1>;
> +			clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +			dma-names = "tx", "rx";
> +			dmas = <&edma0 1 14>,
> +			       <&edma0 1 13>;
> +			status = "disabled";
> +		};
> +
>  		tmu: tmu@1f00000 {

Not sure what your base is, but I have tmu@1f80000.  And that makes
the patch applying fail here.

Shawn

>  			compatible = "fsl,qoriq-tmu";
>  			reg = <0x0 0x1f80000 0x0 0x10000>;
> -- 
> 2.20.1
> 
