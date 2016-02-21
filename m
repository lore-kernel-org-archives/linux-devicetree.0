From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/2] iio:iio-interrupt-trigger: device-tree support
Date: Sun, 21 Feb 2016 19:55:24 +0000
Message-ID: <56CA162C.5010406@kernel.org>
References: <cover.1455908065.git.gregor.boirie@parrot.com>
 <d8f7902dbfe6e911e6ac0d1117502a02b1212022.1455908065.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d8f7902dbfe6e911e6ac0d1117502a02b1212022.1455908065.git.gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19/02/16 19:18, Gregor Boirie wrote:
> From: Gr=C3=A9gor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
>=20
> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Snag here is that iio_interrupt_trigger is a very linux specific
name and device tree bindings should be just about the hardware.

Not entirely sure how we avoid this though as the use is rather
hard to describe generically.

cc'd device tree list and bindings maintainers.

As a brief summary - this IIO trigger driver takes a generic
interrupt (from whatever) and uses it to drive sampling of IIO devices.
The interrupt might be associated with particularly simple sensors dire=
ctly
but is more commonly a gpio interrupt line used cause samples to be cap=
tured
from unrelated devices.  Sometimes the source of that interrupt can be =
a convoluted
external mux setup over which linux has no control for example.

Any suggestions on appropriate naming?

We aren't really describing hardware here, rather a policy decision on =
what
a given interrupt is to be used for.

I suppose ultimately we could take the view this should be handled via =
another
route (from userspace via an appropriate configfs interface for example=
).

Jonathan
> ---
>  drivers/iio/trigger/iio-trig-interrupt.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/trigger/iio-trig-interrupt.c b/drivers/iio/t=
rigger/iio-trig-interrupt.c
> index 572bc6f..3c4e18f 100644
> --- a/drivers/iio/trigger/iio-trig-interrupt.c
> +++ b/drivers/iio/trigger/iio-trig-interrupt.c
> @@ -104,11 +104,20 @@ static int iio_interrupt_trigger_remove(struct =
platform_device *pdev)
>  	return 0;
>  }
> =20
> +#if defined(CONFIG_OF)
> +static const struct of_device_id iio_interrupt_trigger_of_match[] =3D=
 {
> +	{ .compatible =3D "iio-interrupt-trigger" },
> +	{}
> +};
> +#endif
> +
>  static struct platform_driver iio_interrupt_trigger_driver =3D {
>  	.probe =3D iio_interrupt_trigger_probe,
>  	.remove =3D iio_interrupt_trigger_remove,
>  	.driver =3D {
> -		.name =3D "iio_interrupt_trigger",
> +		.name           =3D "iio_interrupt_trigger",
> +		.owner          =3D THIS_MODULE,
> +		.of_match_table =3D of_match_ptr(iio_interrupt_trigger_of_match)
>  	},
>  };
> =20
>=20
