From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] dts: sun8i-h3: add sy8106a to orange pi plus
Date: Fri, 28 Sep 2018 15:55:16 +0200
Message-ID: <20180928135516.jxhnsgaa3s2nagv7@flea>
References: <20180927083636.5415-1-jorik@kippendief.biz>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBR7FXDOQKGQE62GH5RA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180927083636.5415-1-jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On Thu, Sep 27, 2018 at 10:36:36AM +0200, jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org wrote:
> From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>

The prefix of your commit title should be "ARM: dts: ..."

> The Orange Pi Plus board lacks voltage scaling capabilities in its
> current form. This results in random freezes during boot when cpufreq is
> enabled, probably due to wrong voltages.
> 
> This patch (a copy/paste of 06139c) does the following things on this
> board:
> - enable r_i2c
> - add sy8106a to the r_i2c bus
> - have the sy8106a regulate VDD of cpu
> 
> I have tested this on two Orange Pi Plus boards, and they run stable
> across a range of voltages (and frequencies).

How was this tested?

> Signed-off-by: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts | 29 ++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> index b403e5d78..fd64b5c94 100644
> --- a/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts
> @@ -74,6 +74,10 @@
>  	};
>  };
>  
> +&cpu0 {
> +	cpu-supply = <&reg_vdd_cpux>;
> +};
> +
>  &ehci3 {
>  	status = "okay";
>  };
> @@ -119,6 +123,31 @@
>  	};
>  };
>  
> +&r_i2c {
> +	status = "okay";
> +
> +	reg_vdd_cpux: regulator@65 {
> +		compatible = "silergy,sy8106a";
> +		reg = <0x65>;
> +		regulator-name = "vdd-cpux";
> +		silergy,fixed-microvolt = <1200000>;
> +		/*
> +		 * The datasheet uses 1.1V as the minimum value of VDD-CPUX,
> +		 * however both the Armbian DVFS table and the official one
> +		 * have operating points with voltage under 1.1V, and both
> +		 * DVFS table are known to work properly at the lowest
> +		 * operating point.
> +		 *
> +		 * Use 1.0V as the minimum voltage instead.
> +		 */

There's not much point to that comment, since it's been that way for
all the other SoCs from Allwinner. However, that would be great to
have it in the commit log.

Thanks!
Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
