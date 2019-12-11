Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9274C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 07:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA32D214D8
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 07:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576049621;
	bh=wqq8HXBEy6kKnW9r+Hvsm89s6WjUyuoqKasNSnB5z9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=h3RiTDb5lj1gVmZ7I0H4T3A30votm+4iNNIpLaMz3BAxLHJqkkfVIGUKBy5F/0cww
	 yzLTw83pqiyIYIsZ4l1McxnLSDDKdIKF4Mi8MD1mlP2NMB9+Ulgy6A2TXbAx10Sj0v
	 Ih5ZWYAU47FXp1vwaiAQ0zYSbgbMZuOWDjzB0DQ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfLKHdl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 02:33:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:48478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725800AbfLKHdl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 02:33:41 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 481F72054F;
        Wed, 11 Dec 2019 07:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576049620;
        bh=wqq8HXBEy6kKnW9r+Hvsm89s6WjUyuoqKasNSnB5z9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NHj44Wu15jmo2iRTAz85IvchxlBdOCwYDSFxy+6nIgsr+YjswMDHpdEpcXbl65DuL
         mG5JVy5OIFLHkqyq6X/lgloXVAVayxLuxUal4pjCj7R0txuaq0IuDqfZSIq8cYthoM
         WM9r4pO+1yUXsOqglsnceKydti2pe189rgzw+wBU=
Date:   Wed, 11 Dec 2019 15:33:31 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Jon Nettleton <jon@solid-run.com>,
        Rabeeh Khoury <rabeeh@solid-run.com>,
        Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: lx2160a: add MDIO descriptions
Message-ID: <20191211073330.GO15858@dragon>
References: <20191209120010.GG25745@shell.armlinux.org.uk>
 <E1ieHiP-0004wT-2O@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ieHiP-0004wT-2O@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 09, 2019 at 12:00:37PM +0000, Russell King wrote:
> Add MDIO descriptions to the lx2160a dtsi file, so we can use them in
> the SolidRun Clearfog CX platform.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> index 0bd98f179bfa..617e1f1a2339 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> @@ -863,6 +863,26 @@
>  			fsl,extts-fifo;
>  		};
>  
> +		emdio1: mdio@8b96000 {
> +			compatible = "fsl,fman-memac-mdio";
> +			reg = <0x00 0x8b96000 0x00 0x1000>;
> +			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +			little-endian;
> +			#address-cells = <0x01>;
> +			#size-cells = <0x00>;
> +			status = "disabled";
> +		};
> +
> +		emdio2: mdio@8b97000 {
> +			compatible = "fsl,fman-memac-mdio";
> +			reg = <0x00 0x8b97000 0x00 0x1000>;
> +			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> +			little-endian;
> +			#address-cells = <0x01>;
> +			#size-cells = <0x00>;
> +			status = "disabled";
> +		};
> +

Ioana Ciornei already had a patch [1] adding emdio1, but unfortunately,
emdio2 was missing from there.

Shawn

[1] https://lkml.org/lkml/2019/12/4/675

>  		fsl_mc: fsl-mc@80c000000 {
>  			compatible = "fsl,qoriq-mc";
>  			reg = <0x00000008 0x0c000000 0 0x40>,
> -- 
> 2.20.1
> 
