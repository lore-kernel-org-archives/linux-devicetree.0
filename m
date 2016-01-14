From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: increase vdd_arm voltage for rk3066a-rayeager board
Date: Thu, 14 Jan 2016 13:45:02 +0100
Message-ID: <1709463.R522kSjgXB@phil>
References: <1452774780-16493-1-git-send-email-andy.yan@rock-chips.com> <1452774860-16572-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452774860-16572-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Donnerstag, 14. Januar 2016, 20:34:20 schrieb Andy Yan:
> The current vdd_arm voltage is too low, increase it will make
> the system more stable.
> 
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  arch/arm/boot/dts/rk3066a-rayeager.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3066a-rayeager.dts
> b/arch/arm/boot/dts/rk3066a-rayeager.dts index 0bf6876..3d4c104 100644
> --- a/arch/arm/boot/dts/rk3066a-rayeager.dts
> +++ b/arch/arm/boot/dts/rk3066a-rayeager.dts
> @@ -159,6 +159,14 @@
> 
>  &cpu0 {
>  	cpu0-supply = <&vdd_arm>;
> +	operating-points = <
> +		/* kHz    uV */
> +		1008000 1125000
> +		816000  1125000
> +		600000  1100000
> +		504000  1100000
> +		312000  1075000
> +	>;
>  };
> 
>  &emac {

Does this only apply to the rayeager-board / px2 soc or for all rk3066a/px2 
boards? I.e. the original values come from some sdk kernel and I might've 
transcribed that wrong at the time and I remember having problems trying to 
reach higher frequencies as well.

So could you check what the full operating points looks like for both and if 
this can move to the rk3066a.dtsi, as both should be able to reach at least 
1.4GHz / 1.6GHz.


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
