From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/2] iio:iio-interrupt-trigger: device-tree support
Date: Mon, 22 Feb 2016 13:05:21 -0600
Message-ID: <20160222190521.GA30054@rob-hp-laptop>
References: <cover.1455908065.git.gregor.boirie@parrot.com>
 <d8f7902dbfe6e911e6ac0d1117502a02b1212022.1455908065.git.gregor.boirie@parrot.com>
 <56CA162C.5010406@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56CA162C.5010406-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 21, 2016 at 07:55:24PM +0000, Jonathan Cameron wrote:
> On 19/02/16 19:18, Gregor Boirie wrote:
> > From: Gr=E9gor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
> >=20
> > Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
> Snag here is that iio_interrupt_trigger is a very linux specific
> name and device tree bindings should be just about the hardware.
>=20
> Not entirely sure how we avoid this though as the use is rather
> hard to describe generically.
>=20
> cc'd device tree list and bindings maintainers.
>=20
> As a brief summary - this IIO trigger driver takes a generic
> interrupt (from whatever) and uses it to drive sampling of IIO device=
s.
> The interrupt might be associated with particularly simple sensors di=
rectly
> but is more commonly a gpio interrupt line used cause samples to be c=
aptured
> from unrelated devices.  Sometimes the source of that interrupt can b=
e a convoluted
> external mux setup over which linux has no control for example.

If linux has no control of the setup, then do we care? It's just some=20
blackbox driving a signal.

> Any suggestions on appropriate naming?

I would think of it outside of IIO perhaps. We already have gpio-keys=20
which is kind of similar. Maybe just "external interrupt"? Is it always=
=20
a GPIO interrupt or could be polled GPIO or some other mechanism?

Could you add "trigger-gpios" to every device that uses it and allow fo=
r=20
it to appear multiple times? It somewhat depends on how static setting=20
the trigger source is whether that would be appropriate.

> We aren't really describing hardware here, rather a policy decision o=
n what
> a given interrupt is to be used for.
>=20
> I suppose ultimately we could take the view this should be handled vi=
a another
> route (from userspace via an appropriate configfs interface for examp=
le).

You would still need to know which GPIOs you could use or assign, so I=20
think we need something in DT.

Rob
