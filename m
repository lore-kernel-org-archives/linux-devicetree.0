From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: correct regulator PM properties
Date: Tue, 18 Aug 2015 21:17:06 +0200
Message-ID: <51457775.D3ds00ymOJ@phil>
References: <1439923455-109818-1-git-send-email-briannorris@chromium.org> <1439923455-109818-2-git-send-email-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439923455-109818-2-git-send-email-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,


thanks for catching these oversights, but see below

Am Dienstag, 18. August 2015, 11:44:15 schrieb Brian Norris:
> This DTS file was submitted with non-upstream bindings. I happened
> across this while reviewing the jaq DTS.
> 
> Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Tested on jaq, not minnie
> 
>  arch/arm/boot/dts/rk3288-veyron-minnie.dts | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> b/arch/arm/boot/dts/rk3288-veyron-minnie.dts index
> 0e30bd6bf92b..6f619c154dc6 100644
> --- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> +++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
> @@ -128,12 +128,16 @@
>  			regulator-min-microvolt = <3300000>;
>  			regulator-max-microvolt = <3300000>;
>  			regulator-name = "vcc33_touch";
> -			regulator-suspend-mem-disabled;
> +			regulator-state-mem {
> +				regulator-on-in-suspend;
> +			};
>  		};
> 
>  		vcc5v_touch: SWITCH_REG2 {
>  			regulator-name = "vcc5v_touch";
> -			regulator-suspend-mem-disabled;
> +			regulator-state-mem {
> +				regulator-on-in-suspend;
> +			};

wouldn't regulator-suspend-mem-disabled translate to regulator-off-in-suspend?
At least looks like it according to https://lkml.org/lkml/2013/7/25/592


Heiko

>  		};
>  	};
>  };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
