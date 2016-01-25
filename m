From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: DTS: kirkwood-openrd: fix SD slot default configuration
Date: Mon, 25 Jan 2016 14:41:10 +0100
Message-ID: <87r3h5epzd.fsf@free-electrons.com>
References: <1452629253-21748-1-git-send-email-aaro.koskinen@iki.fi>
	<1452629253-21748-2-git-send-email-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452629253-21748-2-git-send-email-aaro.koskinen-X3B1VOXEql0@public.gmane.org> (Aaro
	Koskinen's message of "Tue, 12 Jan 2016 22:07:33 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Aaro,
 
 On mar., janv. 12 2016, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org> wrote:

> The SD card slot was enabled by default with legacy booting.
> It does not work anymore with DT boot. Fix by providing GPIO configuration
> that matches the old default.
>
> Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>

Applied on mvebu/dt with Andrew Reviewed-by

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/kirkwood-openrd.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/kirkwood-openrd.dtsi b/arch/arm/boot/dts/kirkwood-openrd.dtsi
> index 2a3dafd..f65b727 100644
> --- a/arch/arm/boot/dts/kirkwood-openrd.dtsi
> +++ b/arch/arm/boot/dts/kirkwood-openrd.dtsi
> @@ -65,6 +65,14 @@
>  			status = "okay";
>  			cd-gpios = <&gpio0 29 9>;
>  		};
> +		gpio@10140 {
> +			p2 {
> +				gpio-hog;
> +				gpios = <2 GPIO_ACTIVE_HIGH>;
> +				output-high; /* Select SD by default */
> +				line-name = "SelUARTorSD";
> +			};
> +		};
>  	};
>  };
>  
> -- 
> 2.4.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
