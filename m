Return-Path: <SRS0=pm85=R6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56301 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbfC0MJc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Mar 2019 08:09:32 -0400
Date: Wed, 27 Mar 2019 13:09:27 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] ARM: dts: rskrza1: Add remaining LEDs
Message-ID: <20190327120844.4h75vl6v2obeyt6v@verge.net.au>
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <20190320194410.14870-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190320194410.14870-3-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 20, 2019 at 08:44:10PM +0100, Geert Uytterhoeven wrote:
> Describe the remaining 3 LEDs, which are driven by the first CAT9554
> port expander.
> 
> Drop the superfluous status property from the leds node while at it.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.2.

> ---
>  arch/arm/boot/dts/r7s72100-rskrza1.dts | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> index 60e80ecbbf6826bc..ff24301dc1be54de 100644
> --- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
> +++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> @@ -34,12 +34,23 @@
>  	};
>  
>  	leds {
> -		status = "okay";
>  		compatible = "gpio-leds";
>  
>  		led0 {
>  			gpios = <&port7 1 GPIO_ACTIVE_LOW>;
>  		};
> +
> +		led1 {
> +			gpios = <&io_expander1 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led2 {
> +			gpios = <&io_expander1 1 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led3 {
> +			gpios = <&io_expander1 2 GPIO_ACTIVE_LOW>;
> +		};
>  	};
>  };
>  
> -- 
> 2.17.1
> 
