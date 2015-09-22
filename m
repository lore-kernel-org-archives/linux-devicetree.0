From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: sunxi: Introduce Allwinner for
 A83T support
Date: Tue, 22 Sep 2015 17:51:52 +0200
Message-ID: <20150922155152.GJ4684@lukather>
References: <1442936337-3104-1-git-send-email-vishnupatekar0510@gmail.com>
 <1442936337-3104-2-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4+NAehRbGTL7rPxz"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB5HSQWYAKGQEMT5TTSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442936337-3104-2-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--4+NAehRbGTL7rPxz
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Sep 22, 2015 at 11:38:54PM +0800, Vishnu Patekar wrote:
> Allwinner A83T is octa-core cortex-a7 based SoC.
> It's clock control unit and prcm, pinmux are different from previous sun8i
> series.
> Its processor cores are arragned in two clusters 4 cores each,
> similar to A80.
> 
> Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
>  arch/arm/mach-sunxi/sunxi.c                     | 1 +
>  drivers/clk/sunxi/clk-sunxi.c                   | 6 ++++++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
> index 67da205..cf5ed27 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
> @@ -11,4 +11,5 @@ using one of the following compatible strings:
>    allwinner,sun8i-a23
>    allwinner,sun8i-a33
>    allwinner,sun8i-h3
> +  allwinner,sun8i-a83t
>    allwinner,sun9i-a80
> diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
> index 65bab28..b04aefa 100644
> --- a/arch/arm/mach-sunxi/sunxi.c
> +++ b/arch/arm/mach-sunxi/sunxi.c
> @@ -69,6 +69,7 @@ static const char * const sun8i_board_dt_compat[] = {
>  	"allwinner,sun8i-a23",
>  	"allwinner,sun8i-a33",
>  	"allwinner,sun8i-h3",
> +	"allwinner,sun8i-a83t",
>  	NULL,
>  };
>  
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 413070d..f216d5d 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -1212,6 +1212,12 @@ CLK_OF_DECLARE(sun6i_a31s_clk_init, "allwinner,sun6i-a31s", sun6i_init_clocks);
>  CLK_OF_DECLARE(sun8i_a23_clk_init, "allwinner,sun8i-a23", sun6i_init_clocks);
>  CLK_OF_DECLARE(sun8i_a33_clk_init, "allwinner,sun8i-a33", sun6i_init_clocks);
>  
> +static void __init sun8ia83t_init_clocks(struct device_node *node)

Having an underscore between sun8i and a83t would be great :)

> +{
> +	sunxi_init_clocks(NULL, 0);
> +}
> +CLK_OF_DECLARE(sun9i_a83t_clk_init, "allwinner,sun8i-a83t", sun8ia83t_init_clocks);

                  ^ Is this a sun9i or sun8i SoC ?

Is the list of protected clocks always going to be empty, or will you
add some new clocks in that list in the future?

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--4+NAehRbGTL7rPxz--
