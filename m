From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: Add DT entry for ReadyNAS Duo v2 to use
 gpio-poweroff driver
Date: Fri, 22 Nov 2013 08:41:13 -0500
Message-ID: <20131122134113.GF29241@titan.lakedaemon.net>
References: <87iovl4ahq.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87iovl4ahq.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 22, 2013 at 12:10:25AM +0100, Arnaud Ebalard wrote:
> 
> Without that fix, at the end of the shutdown process, the board is
> still powered (led glowing, fan running, ...).
> 
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> ---
> Hi,
> 
> I have prepared some cleanup patches for existing ReadyNAS .dts files
> which I intend to send for review in the next fex days. The GPIO
> voltage level is still a value below but the cleanup patch for this
> .dts will handle that globally.
> 
>  arch/arm/boot/dts/kirkwood-netgear_readynas_duo_v2.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/kirkwood-netgear_readynas_duo_v2.dts b/arch/arm/boot/dts/kirkwood-netgear_readynas_duo_v2.dts
> index e6a102c..4e3cae1 100644
> --- a/arch/arm/boot/dts/kirkwood-netgear_readynas_duo_v2.dts
> +++ b/arch/arm/boot/dts/kirkwood-netgear_readynas_duo_v2.dts
> @@ -60,6 +60,10 @@
>  				marvell,pins = "mpp29";
>  				marvell,function = "gpio";
>  			};
> +			pmx_poweroff: pmx-poweroff {
> +				marvell,pins = "mpp30";
> +				marvell,function = "gpio";
> +			};
>  		};
>  
>  		clocks {
> @@ -158,6 +162,13 @@
>  		};
>  	};
>  
> +	gpio-poweroff {
> +		compatible = "gpio-poweroff";
> +		pinctrl-0 = <&pmx_poweroff>;
> +		pinctrl-names = "default";
> +		gpios = <&gpio0 30 1>;

GPIO_... ?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
