From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 13/18] ARM: mvebu: a39x: enable rtc for all Armada-39x SoCs
Date: Thu, 28 Jul 2016 12:53:12 +0200
Message-ID: <8737mukp9j.fsf@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-15-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469105055-25181-15-git-send-email-jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> (Grzegorz
	Jaszczyk's message of "Thu, 21 Jul 2016 14:44:10 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grzegorz,
 
 On jeu., juil. 21 2016, Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> wrote:

> Despite that FS states that rtc is present only in A395 and A398 and not in
> A390, the rtc is working with A390.
>
Change the prefix to "ARM: dts: mvebu: armada-39x:"

Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks,

Gregory

> Signed-off-by: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-39x.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
> index 1225cd8..5bed8b9 100644
> --- a/arch/arm/boot/dts/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/armada-39x.dtsi
> @@ -429,6 +429,13 @@
>  				};
>  			};
>  
> +			rtc@a3800 {
> +				compatible = "marvell,armada-380-rtc";
> +				reg = <0xa3800 0x20>, <0x184a0 0x0c>;
> +				reg-names = "rtc", "rtc-soc";
> +				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
>  			flash@d0000 {
>  				compatible = "marvell,armada370-nand";
>  				reg = <0xd0000 0x54>;
> -- 
> 1.8.3.1
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
