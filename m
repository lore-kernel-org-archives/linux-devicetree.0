Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:53171 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751492Ab3HUIcF (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 04:32:05 -0400
Received: by mail-wg0-f52.google.com with SMTP id b13so117939wgh.7
        for <devicetree@vger.kernel.org>; Wed, 21 Aug 2013 01:32:04 -0700 (PDT)
Date: Wed, 21 Aug 2013 09:31:56 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] dt: dbx5x0: remove mentor,musb binding
Message-ID: <20130821083156.GD29850@lee--X1>
References: <1377016827-26827-1-git-send-email-bigeasy@linutronix.de>
 <1377016827-26827-2-git-send-email-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1377016827-26827-2-git-send-email-bigeasy@linutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, linus.walleij@linaro.org
List-ID: <devicetree@vger.kernel.org>

> The "mentor,musb" binding isn't documented so I was about to document
> it.
> The node is missing a few properties for configuration like
> "multipoint", "dyn_fifo", "num_eps" or "ram_bits". However I am not sure
> "missing" is the right word here because some of those informations
> might be obtained from the chip itself but it is not done (yet).
> Further the ePARP 2.3.1 says the matching goes from left to right taking
> the fist match. Right now there is jus a driver for
> "stericsson,db8500-musb" and none for "mentor,musb". I'm not 100% that
> it is simply possible to have a generic since even for DMA we have
> ifdefs in the driver between "generic mentor dma" and "ux500 dma" and I
> mean within musb and not the dma code.
> 
> For that reason (that I am not sure a generic musb binding is possible and
> how its binding / required properties will look like) and the reason that
> we have here a minor binding without a driver to look at I suggest to
> remove that binding.
> If the majority of people prefer to keep this binding I'm curious how
> the documentation of the binding should look like.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  Documentation/devicetree/bindings/usb/ux500-usb.txt | 2 +-
>  arch/arm/boot/dts/dbx5x0.dtsi                       | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ux500-usb.txt b/Documentation/devicetree/bindings/usb/ux500-usb.txt
> index 330d6ec..439a41c 100644
> --- a/Documentation/devicetree/bindings/usb/ux500-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/ux500-usb.txt
> @@ -15,7 +15,7 @@ Ux500 MUSB
>  Example:
>  
>  usb_per5@a03e0000 {
> -	compatible = "stericsson,db8500-musb", "mentor,musb";
> +	compatible = "stericsson,db8500-musb";
>  	reg = <0xa03e0000 0x10000>;
>  	interrupts = <0 23 0x4>;
>  	interrupt-names = "mc";
> diff --git a/arch/arm/boot/dts/dbx5x0.dtsi b/arch/arm/boot/dts/dbx5x0.dtsi
> index a152945..4522aff8 100644
> --- a/arch/arm/boot/dts/dbx5x0.dtsi
> +++ b/arch/arm/boot/dts/dbx5x0.dtsi
> @@ -177,8 +177,7 @@
>  		};
>  
>  		usb_per5@a03e0000 {
> -			compatible = "stericsson,db8500-musb",
> -				"mentor,musb";
> +			compatible = "stericsson,db8500-musb";
>  			reg = <0xa03e0000 0x10000>;
>  			interrupts = <0 23 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "mc";
> -- 
> 1.8.4.rc2
> 

Patch looks fine to me, but you probably want to CC the maintainer.

-- 
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
