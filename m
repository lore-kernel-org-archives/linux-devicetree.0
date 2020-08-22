Return-Path: <SRS0=iyGu=CA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C9CC433E1
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 12:56:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C07B207CD
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 12:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598100979;
	bh=U7mpvXQdGn70HSUWKU7XcQpkVB9QbWSEISFpglwYwS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Z4c8sBV2H05c7pAMI1G6OxHW6WZ+lg+n7Q4dhHtHBISCNRH2MxnbmwC9qyHUyvnWv
	 utFYxgpPm3oipntAXH3lNtfmw357mNkrFTjvTVjb4wKk3dDO+DQY/JFgeJNdaKBtKc
	 bk9XOloXqsiNpYRwDoRGPYgfXXEonPSmDp1CJOqs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgHVM4S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Aug 2020 08:56:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:44692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728019AbgHVM4S (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 22 Aug 2020 08:56:18 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D51F82072D;
        Sat, 22 Aug 2020 12:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598100977;
        bh=U7mpvXQdGn70HSUWKU7XcQpkVB9QbWSEISFpglwYwS4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AlfQxWFsWhmKfzWnAHHFfLVNhMPknCbfM+oVBfuFyrNefc+Rl1q3wGvlJEQ04nN0E
         yNLn1K7SqTbUMMkoq0h4iOwo96M3tno5eT218LzUQ54Qyd0RMTXQjVliHYNhBpzJPp
         biPgxg9wU3ChokDdpaBjulOTIEMj15a0EEYMxeho=
Date:   Sat, 22 Aug 2020 20:56:12 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx25-pinfunc: Fix gpio function name for pads
 GPIO_[A-F]
Message-ID: <20200822125611.GB30094@dragon>
References: <20200810084725.16112-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200810084725.16112-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Aug 10, 2020 at 10:47:25AM +0200, Uwe Kleine-König wrote:
> The pinfunc definitions used GPIO_A as function instead of GPIO_1_0 as

Is this how i.MX25 RM names the function?

Shawn

> done for all the other pins with GPIO functionality. Fix for consistency.
> 
> There are no mainline users that needs adaption.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx25-pinfunc.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx25-pinfunc.h b/arch/arm/boot/dts/imx25-pinfunc.h
> index e14140e62b9b..55948e668410 100644
> --- a/arch/arm/boot/dts/imx25-pinfunc.h
> +++ b/arch/arm/boot/dts/imx25-pinfunc.h
> @@ -563,15 +563,15 @@
>  #define MX25_PAD_DE_B__DE_B			0x1f0 0x3ec 0x000 0x00 0x000
>  #define MX25_PAD_DE_B__GPIO_2_20		0x1f0 0x3ec 0x000 0x05 0x000
>  
> -#define MX25_PAD_GPIO_A__GPIO_A			0x1f4 0x3f0 0x000 0x00 0x000
> +#define MX25_PAD_GPIO_A__GPIO_1_0		0x1f4 0x3f0 0x000 0x00 0x000
>  #define MX25_PAD_GPIO_A__CAN1_TX		0x1f4 0x3f0 0x000 0x06 0x000
>  #define MX25_PAD_GPIO_A__USBOTG_PWR		0x1f4 0x3f0 0x000 0x02 0x000
>  
> -#define MX25_PAD_GPIO_B__GPIO_B			0x1f8 0x3f4 0x000 0x00 0x000
> +#define MX25_PAD_GPIO_B__GPIO_1_1		0x1f8 0x3f4 0x000 0x00 0x000
>  #define MX25_PAD_GPIO_B__USBOTG_OC		0x1f8 0x3f4 0x57c 0x02 0x001
>  #define MX25_PAD_GPIO_B__CAN1_RX		0x1f8 0x3f4 0x480 0x06 0x001
>  
> -#define MX25_PAD_GPIO_C__GPIO_C			0x1fc 0x3f8 0x000 0x00 0x000
> +#define MX25_PAD_GPIO_C__GPIO_1_2		0x1fc 0x3f8 0x000 0x00 0x000
>  #define MX25_PAD_GPIO_C__PWM4_PWMO		0x1fc 0x3f8 0x000 0x01 0x000
>  #define MX25_PAD_GPIO_C__I2C2_SCL		0x1fc 0x3f8 0x51c 0x02 0x001
>  #define MX25_PAD_GPIO_C__KPP_COL4		0x1fc 0x3f8 0x52c 0x03 0x001
> @@ -579,18 +579,18 @@
>  #define MX25_PAD_GPIO_C__CAN2_TX		0x1fc 0x3f8 0x000 0x06 0x000
>  #define MX25_PAD_GPIO_C__CSPI2_SS2		0x1fc 0x3f8 0x000 0x07 0x000
>  
> -#define MX25_PAD_GPIO_D__GPIO_D			0x200 0x3fc 0x000 0x00 0x000
> +#define MX25_PAD_GPIO_D__GPIO_1_3		0x200 0x3fc 0x000 0x00 0x000
>  #define MX25_PAD_GPIO_D__I2C2_SDA		0x200 0x3fc 0x520 0x02 0x001
>  #define MX25_PAD_GPIO_D__CAN2_RX		0x200 0x3fc 0x484 0x06 0x001
>  #define MX25_PAD_GPIO_D__CSPI3_SS2		0x200 0x3fc 0x4c4 0x07 0x001
>  
> -#define MX25_PAD_GPIO_E__GPIO_E			0x204 0x400 0x000 0x00 0x000
> +#define MX25_PAD_GPIO_E__GPIO_1_4		0x204 0x400 0x000 0x00 0x000
>  #define MX25_PAD_GPIO_E__I2C3_CLK		0x204 0x400 0x524 0x01 0x002
>  #define MX25_PAD_GPIO_E__LD16			0x204 0x400 0x000 0x02 0x000
>  #define MX25_PAD_GPIO_E__AUD7_TXD		0x204 0x400 0x000 0x04 0x000
>  #define MX25_PAD_GPIO_E__UART4_RXD		0x204 0x400 0x570 0x06 0x002
>  
> -#define MX25_PAD_GPIO_F__GPIO_F			0x208 0x404 0x000 0x00 0x000
> +#define MX25_PAD_GPIO_F__GPIO_1_5		0x208 0x404 0x000 0x00 0x000
>  #define MX25_PAD_GPIO_F__LD17			0x208 0x404 0x000 0x02 0x000
>  #define MX25_PAD_GPIO_F__AUD7_TXC		0x208 0x404 0x000 0x04 0x000
>  #define MX25_PAD_GPIO_F__UART4_TXD		0x208 0x404 0x000 0x06 0x000
> -- 
> 2.27.0
> 
