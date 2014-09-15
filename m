From: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: make of_device_ids const
Date: Mon, 15 Sep 2014 14:11:49 +0100
Message-ID: <20140915131149.GA5415@arm.com>
References: <1410337579-23466-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1410337579-23466-4-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410337579-23466-4-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 10, 2014 at 09:26:19AM +0100, Uwe Kleine-K=F6nig wrote:
> of_device_ids (i.e. compatible strings and the respective data) are n=
ot
> supposed to change at runtime. All functions working with of_device_i=
ds
> provided by <linux/of.h> work with const of_device_ids. So mark the
> only non-const struct in arch/arm64 as const, too.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm64/kernel/perf_event.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_=
event.c
> index baf5afb7e6a0..aa29ecb4f800 100644
> --- a/arch/arm64/kernel/perf_event.c
> +++ b/arch/arm64/kernel/perf_event.c
> @@ -1276,7 +1276,7 @@ arch_initcall(cpu_pmu_reset);
>  /*
>   * PMU platform driver and devicetree bindings.
>   */
> -static struct of_device_id armpmu_of_device_ids[] =3D {
> +static const struct of_device_id armpmu_of_device_ids[] =3D {
>  	{.compatible =3D "arm,armv8-pmuv3"},
>  	{},
>  };

Acked-by: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>

(I guess you could upstream the patches via the arm-soc tree)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
