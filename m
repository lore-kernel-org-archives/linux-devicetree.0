Return-Path: <SRS0=t1WB=AW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032CEC433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jul 2020 14:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC96B20786
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Jul 2020 14:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594477410;
	bh=i6hKd36iicKMTEXCGhxUPRXIZNMbi5YL5dR7KTFIjpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DvSEJ2+vVX5L3OUEpqGMnnaov+JUsLXQMnWMEcx/0IZJ4Knz23LIYM0XB24SNGTPL
	 gG85C34kdzBfGpCrgwiwyujuEEdVyyBkk6DQ96uFSIrcA1gjdW3wnU0GRUYzG4Hn7t
	 beMdXZ/EEnor+mGqaMC/vYjsXZiTMVkYb+cWOvAo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgGKOXa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 11 Jul 2020 10:23:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:49232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbgGKOX3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 11 Jul 2020 10:23:29 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5350D20720;
        Sat, 11 Jul 2020 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594477409;
        bh=i6hKd36iicKMTEXCGhxUPRXIZNMbi5YL5dR7KTFIjpw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yebrohnLQCFk4By/M719fjkVcdyr6qgeJ8BNGqb+KXzmG2y2GI9IyAaaeubShoHn8
         nTKwBUV5DAXfYwi6BVwnAyP4sb4NZybtJ6iNpXIM9H+Okhw0mkZEMsTnzLblbK4qz3
         sJ4+2JPYFvC4k/geHoim08yCorLMQf4Xa/HbWwVY=
Date:   Sat, 11 Jul 2020 22:23:23 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        leoyang.li@nxp.com, Chuanhua Han <chuanhua.han@nxp.com>
Subject: Re: [RESEND PATCH 1/2] arm64: dts: lx2160a: add dspi controller DT
 nodes
Message-ID: <20200711142322.GI21277@dragon>
References: <20200622083109.3441-1-qiang.zhao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622083109.3441-1-qiang.zhao@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 22, 2020 at 04:31:08PM +0800, Qiang Zhao wrote:
> From: Chuanhua Han <chuanhua.han@nxp.com>
> 
> Add the dspi support on lx2160
> 
> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
> Signed-off-by: Bao Xiaowei <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>

When you resend patches, please state why.  Should I drop the patches
I just applied and pick up this version instead?

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 39 ++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index abaeb58..f56172f 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -777,6 +777,45 @@
>  			status = "disabled";
>  		};
>  
> +		dspi0: spi@2100000 {
> +			compatible = "fsl,lx2160a-dspi", "fsl,ls2085a-dspi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0 0x2100000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clockgen 4 7>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <0>;
> +			status = "disabled";
> +		};
> +
> +		dspi1: spi@2110000 {
> +			compatible = "fsl,lx2160a-dspi", "fsl,ls2085a-dspi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0 0x2110000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clockgen 4 7>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <1>;
> +			status = "disabled";
> +		};
> +
> +		dspi2: spi@2120000 {
> +			compatible = "fsl,lx2160a-dspi", "fsl,ls2085a-dspi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0 0x2120000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clockgen 4 7>;
> +			clock-names = "dspi";
> +			spi-num-chipselects = <5>;
> +			bus-num = <2>;
> +			status = "disabled";
> +		};
> +
>  		esdhc0: esdhc@2140000 {
>  			compatible = "fsl,esdhc";
>  			reg = <0x0 0x2140000 0x0 0x10000>;
> -- 
> 2.7.4
> 
