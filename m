From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 7/7] ARM: dts: sun9i: Switch to the AC100
 RTC clock outputs for osc32k
Date: Mon, 11 Jul 2016 08:50:42 +0200
Message-ID: <20160711065042.GC4589@lukather>
References: <1467988422-17934-1-git-send-email-wens@csie.org>
 <1467988422-17934-8-git-send-email-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Return-path: <rtc-linux+bncBDSJBYGBRIMBBQ4DRW6AKGQEEO4F7NA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1467988422-17934-8-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Jul 08, 2016 at 10:33:42PM +0800, Chen-Yu Tsai wrote:
> The 32.768 kHz clock inside the A80 SoC is fed from an external source,
> typically the AC100 RTC module.
> 
> Make the osc32k placeholder a fixed-factor clock so board dts files can
> specify its source.
> 
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> Changes since v4: none
> Changes since v3: none
> Changes since v2: none
> Changes since v1: none
> ---
>  arch/arm/boot/dts/sun9i-a80-cubieboard4.dts | 5 +++++
>  arch/arm/boot/dts/sun9i-a80-optimus.dts     | 5 +++++
>  arch/arm/boot/dts/sun9i-a80.dtsi            | 9 +++------
>  3 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
> index cf2f4b72a841..04b014603659 100644
> --- a/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
> +++ b/arch/arm/boot/dts/sun9i-a80-cubieboard4.dts
> @@ -103,6 +103,11 @@
>  	allwinner,drive = <SUN4I_PINCTRL_40_MA>;
>  };
>  
> +&osc32k {
> +	/* osc32k input is from AC100 */
> +	clocks = <&ac100_rtc 0>;
> +};
> +

I'm guessing that an unresolved dependency when the driver has not
loaded yet, or is not even compiled ?

How is it working then?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXg0HCAAoJEBx+YmzsjxAgD1QP/iMPsyu3wQ0/vF2Esn3zV7kR
e2aZO2cZoOclzt+yNxFSgpJyYhP2zLFnm8Iy2BhaLBrLK6PiW3J6BriX31slm6Tw
EdgzPAM3JujEg+7EPv1Ha+YvtWSZdnzIB4fJbdK6SvBLAqjfy9EMl9ra8qN0V+oL
jRxpYwK2ef+Mi+ZMq+WLGpfANt3879bz87h4NPqI9T00mY6pY+gjVM7NayvrRSZo
zvQk/JjH8SAyLa9nq0YKDznMbLScEcWGbEm4TqHp/8ay/VELDcj+GM/NSDVrm4Ai
Vzmq+8qZ2fndJdnr1qEMZbjeezWZkzYEr9FOO5yMC07TV6f/tht7nS8KTjFzHu24
u94KIaHUVtYVqw3pT7NLAaWZsAORUIN554aCbzb+F/ytnwR6nKGhAEdDNxWV2ulw
cZIiv7wOQvLFuisF95zDvdMv2f9GXSb/3zdZyvIOHSBektcWmzde6rdY294l8tiG
7ceTSqo1aGuBchxIheQmdbr6SZpeAmazF1yDex/eaB3rNAtINddKcgePrmMY0SKB
JJHH5I4EIG4T4nB5bjKujsgM+bE4IrOO3tsPhp660IiA/Rat73Qt5+FVQ3zZpmNy
4S0K+QWkB2jZlONtHpv/R7S/kLmUPbQSQxW6sKY2yhzDlv5iCbnbpq0HsfC1jBef
8pxOoGqnOV/QM6hFdWCa
=M6Em
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
