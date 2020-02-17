Return-Path: <SRS0=gY8B=4F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641B3C7619B
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 04:02:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3998C2072C
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Feb 2020 04:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581912148;
	bh=XQOujdjrFUN4YnehuiyzCYCn7bsdy4tjBnZOyqleE4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Wv5mYTQuewRgje1xXt2GRzThhNCwCpsTTWVm5zoxbC+5t2qk4LYf31F1V1NrJbW+q
	 n8+iooGTeo5bJT8HxdqmvDN10sKMA+gKsZy/xsZYo6YXOpLlSi4/ThUV48mM8SwfRC
	 SiEzt4hrA188qdjUn7PsuFXZxaZSj0zzJ7PW0cXs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgBQEC1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Feb 2020 23:02:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:33058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726498AbgBQEC1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 16 Feb 2020 23:02:27 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 38D9020726;
        Mon, 17 Feb 2020 04:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581912146;
        bh=XQOujdjrFUN4YnehuiyzCYCn7bsdy4tjBnZOyqleE4Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nTXTxTvIL6ZEDXx7KAe7ydIxNsxkLHOOXEfj+RpLf/d3uxiAko6HxUi7ilWRVHPPr
         TtjmLOxI8MkfFHFjcGF4bEIlGO/QL3e9qF95w9caYwnLT5FnXwXVFdZyjXPmXHyWfa
         kYG9AedJRjrajjd05pwy1ZuvqA/xTZNTSITOkDh0=
Date:   Mon, 17 Feb 2020 12:02:17 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     robh@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, devicetree@vger.kernel.org, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: Re: [PATCH v1 03/12] arm64: dts: librem5-devkit: allow modem to wake
 the system from suspend
Message-ID: <20200217040216.GD5395@dragon>
References: <20200205143003.28408-1-martin.kepplinger@puri.sm>
 <20200205143003.28408-4-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205143003.28408-4-martin.kepplinger@puri.sm>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 05, 2020 at 03:29:54PM +0100, Martin Kepplinger wrote:
> From: "Angus Ainslie (Purism)" <angus@akkea.ca>
> 
> Connect the WoWWAN signal to a gpio key to wake up the system from suspend.
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  .../dts/freescale/imx8mq-librem5-devkit.dts   | 27 +++++++++++++++----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> index 8162576e8f3d..ac6ba227e1da 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> @@ -33,7 +33,7 @@
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_keys>;
> +		pinctrl-0 = <&pinctrl_gpio_keys>, <&pinctrl_wwan_in>;
>  
>  		btn1 {
>  			label = "VOL_UP";
> @@ -55,6 +55,15 @@
>  			wakeup-source;
>  			linux,code = <KEY_HP>;
>  		};
> +
> +		wwan_wake {
> +			label = "WWAN_WAKE";
> +			gpios = <&gpio3 8 GPIO_ACTIVE_LOW>;
> +			interrupt-parent = <&gpio3>;
> +			interrupts = <8 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +			linux,code = <KEY_PHONE>;
> +		};
>  	};
>  
>  	leds {
> @@ -767,11 +776,19 @@
>  		>;
>  	};
>  
> -	pinctrl_wwan: wwangrp {
> +	pinctrl_wwan_in: wwaningrp {
> +		fsl,pins = <
> +		/* nWoWWAN */
> +		MX8MQ_IOMUXC_NAND_DATA02_GPIO3_IO8	0x80

Why not just add it to pinctrl_gpio_keys to make the change minimal.

> +		>;
> +	};
> +
> +	pinctrl_wwan_out: wwanoutgrp {
>  		fsl,pins = <
> -			MX8MQ_IOMUXC_NAND_CE3_B_GPIO3_IO4	0x09 /* nWWAN_DISABLE */
> -			MX8MQ_IOMUXC_NAND_DATA02_GPIO3_IO8	0x80 /* nWoWWAN */
> -			MX8MQ_IOMUXC_NAND_DATA03_GPIO3_IO9	0x19 /* WWAN_RESET */
> +		/* nWWAN_DISABLE */
> +		MX8MQ_IOMUXC_NAND_CE3_B_GPIO3_IO4	0x09
> +		/* WWAN_RESET */
> +		MX8MQ_IOMUXC_NAND_DATA03_GPIO3_IO9	0x19

Unnecessary changes.

Shawn

>  		>;
>  	};
>  };
> -- 
> 2.20.1
> 
