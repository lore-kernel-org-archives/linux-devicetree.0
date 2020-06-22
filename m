Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C60C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 09:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D556206C1
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 09:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="H1Ldib1J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgFVJJW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 05:09:22 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.221]:17590 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgFVJJW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 05:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592816956;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=S6bYQw3zQoFPKezXkLlmR/gLwK36xiQySvi3IzEfiYE=;
        b=H1Ldib1JhP6NDeJRKkW5nbOm9m+RRrnKUQ7E2d5zlaoKkazsxOZIz6He45Gv6PYb81
        ZpxcZC7RcmKC1oarqZkBJqzSOSsPaLfJSkk/mkGRtMYrk4kQ2Lp5K83ao2EM34+T5ndD
        c43twmIk8092HeHHSZKSlSNSko4GDUt7I9V1sPkcapcF+MmbFErg7GF3umAp1mfITlBj
        x3iMTCV2t//6Z42xEfzEuijZJ7k9d9mHcJ2bH1EB0T/pMAnJB/Kz2Mhqw4PUXrZt4KQP
        g2TFghyBSxlLdbRHTiPQ6Lg88uJZ7no8/aXXRJFg14Ycpr82tUZEhryr7C2ZoWGJfCKo
        3goQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IczHboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id 6005e9w5M99D1ie
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 22 Jun 2020 11:09:13 +0200 (CEST)
Date:   Mon, 22 Jun 2020 11:09:05 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Nick Reitemeyer <nick.reitemeyer@web.de>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: ux500: samsung-golden: Add touchkey
Message-ID: <20200622090905.GA170221@gerhold.net>
References: <20200621193822.133683-1-nick.reitemeyer@web.de>
 <20200621193822.133683-2-nick.reitemeyer@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621193822.133683-2-nick.reitemeyer@web.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Jun 21, 2020 at 09:38:23PM +0200, Nick Reitemeyer wrote:
> Adds support for the back and menu keys on golden.
> 
> Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>

Thanks for sending this!

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Tested-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  .../arm/boot/dts/ste-ux500-samsung-golden.dts | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
> index 5b499c0b2745..1e26b711d43d 100644
> --- a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
> +++ b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
> @@ -24,6 +24,32 @@ chosen {
>  		stdout-path = &serial2;
>  	};
> 
> +	i2c-gpio-0 {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&gpio2 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&gpio2 13 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&i2c_gpio_0_default>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		touchkey@20 {
> +			compatible = "coreriver,tc360-touchkey";
> +			reg = <0x20>;
> +			vdd-supply = <&ab8500_ldo_aux4_reg>;
> +			vcc-supply = <&ab8500_ldo_aux6_reg>;
> +
> +			interrupt-parent = <&gpio2>;
> +			interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&touchkey_default>;
> +			linux,keycodes = <KEY_MENU KEY_BACK>;
> +		};
> +	};
> +
>  	i2c-gpio-1 {
>  		compatible = "i2c-gpio";
>  		sda-gpios = <&gpio4 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> @@ -403,6 +429,16 @@ golden_cfg1 {
>  		};
>  	};
> 
> +	i2c-gpio-0 {
> +		i2c_gpio_0_default: i2c_gpio_0 {
> +			golden_cfg1 {
> +				pins = "GPIO77",	/* TOUCHKEY_SCL */
> +				       "GPIO78";	/* TOUCHKEY_SDA */
> +				ste,config = <&gpio_in_nopull>;
> +			};
> +		};
> +	};
> +
>  	i2c-gpio-1 {
>  		i2c_gpio_1_default: i2c_gpio_1 {
>  			golden_cfg1 {
> @@ -413,6 +449,15 @@ golden_cfg1 {
>  		};
>  	};
> 
> +	touchkey {
> +		touchkey_default: touchkey_default {
> +			golden_cfg1 {
> +				pins = "GPIO79";	/* TOUCHKEY_INT */
> +				ste,config = <&gpio_in_nopull>;
> +			};
> +		};
> +	};
> +
>  	sdi0 {
>  		sd_level_translator_default: sd_level_translator_default {
>  			golden_cfg1 {
> --
> 2.27.0
> 
