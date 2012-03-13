From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: kirkwood: rtc-mv devicetree bindings
Date: Tue, 13 Mar 2012 11:03:47 +0100
Message-ID: <20120313100347.GA10400@pengutronix.de>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <cover.1331601448.git.jason@lakedaemon.net>
 <0b9921e304cb46af9c4fbc8b7b8c8b9ba3d18654.1331601448.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0b9921e304cb46af9c4fbc8b7b8c8b9ba3d18654.1331601448.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2012 at 01:57:48AM +0000, Jason Cooper wrote:
> Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> ---
>  drivers/rtc/rtc-mv.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> =

> diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
> index 768e2ed..0dd8421 100644
> --- a/drivers/rtc/rtc-mv.c
> +++ b/drivers/rtc/rtc-mv.c
> @@ -12,6 +12,7 @@
>  #include <linux/bcd.h>
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
> +#include <linux/of.h>
>  #include <linux/delay.h>
>  #include <linux/gfp.h>
>  #include <linux/module.h>
> @@ -294,11 +295,19 @@ static int __exit mv_rtc_remove(struct platform_dev=
ice *pdev)
>  	return 0;
>  }
>  =

> +#ifdef CONFIG_OF
> +static struct of_device_id rtc_mv_of_match_table[] =3D {
> +	{ .compatible =3D "mrvl,orion-rtc", },
> +	{}
> +};
> +#endif
I guess it's a matter of taste, but you could use __maybe_unused instead
of #ifdef .. #endif.

Best regards
Uwe

> +
>  static struct platform_driver mv_rtc_driver =3D {
>  	.remove		=3D __exit_p(mv_rtc_remove),
>  	.driver		=3D {
>  		.name	=3D "rtc-mv",
>  		.owner	=3D THIS_MODULE,
> +		.of_match_table =3D of_match_ptr(rtc_mv_of_match_table),
>  	},
>  };
>  =

> -- =

> 1.7.3.4
> =

> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> =


-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
