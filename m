From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/2] iio:iio-interrupt-trigger: device-tree support
Date: Sat, 12 Mar 2016 12:08:48 +0000
Message-ID: <56E406D0.5090902@kernel.org>
References: <cover.1455908065.git.gregor.boirie@parrot.com>
 <d8f7902dbfe6e911e6ac0d1117502a02b1212022.1455908065.git.gregor.boirie@parrot.com>
 <56CA162C.5010406@kernel.org> <20160222190521.GA30054@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160222190521.GA30054@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22/02/16 19:05, Rob Herring wrote:
> On Sun, Feb 21, 2016 at 07:55:24PM +0000, Jonathan Cameron wrote:
>> On 19/02/16 19:18, Gregor Boirie wrote:
>>> From: Gr=E9gor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
>>>
>>> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
>> Snag here is that iio_interrupt_trigger is a very linux specific
>> name and device tree bindings should be just about the hardware.
>>
>> Not entirely sure how we avoid this though as the use is rather
>> hard to describe generically.
>>
>> cc'd device tree list and bindings maintainers.
>>
>> As a brief summary - this IIO trigger driver takes a generic
>> interrupt (from whatever) and uses it to drive sampling of IIO devic=
es.
>> The interrupt might be associated with particularly simple sensors d=
irectly
>> but is more commonly a gpio interrupt line used cause samples to be =
captured
>> from unrelated devices.  Sometimes the source of that interrupt can =
be a convoluted
>> external mux setup over which linux has no control for example.
>=20
> If linux has no control of the setup, then do we care? It's just some=
=20
> blackbox driving a signal.
>=20
>> Any suggestions on appropriate naming?
>=20
> I would think of it outside of IIO perhaps. We already have gpio-keys=
=20
> which is kind of similar. Maybe just "external interrupt"? Is it alwa=
ys=20
> a GPIO interrupt or could be polled GPIO or some other mechanism?

The challenge is that we need to be able to capture it's use.
>=20
> Could you add "trigger-gpios" to every device that uses it and allow =
for=20
> it to appear multiple times? It somewhat depends on how static settin=
g=20
> the trigger source is whether that would be appropriate.
Right now we don't have a device - the interrupt trigger is only soft
associated (via sysfs) with it's users at a later date.

I think we just have 'make up a device' for this to represent the use c=
ase
so we can probe the interrupt trigger driver in iio.

sensor sampling trigger perhaps?

>=20
>> We aren't really describing hardware here, rather a policy decision =
on what
>> a given interrupt is to be used for.
>>
>> I suppose ultimately we could take the view this should be handled v=
ia another
>> route (from userspace via an appropriate configfs interface for exam=
ple).
>=20
> You would still need to know which GPIOs you could use or assign, so =
I=20
> think we need something in DT.
Absolutely. Short of allowing completely generic grabbing from a config=
fs call
of an interrupt, definitely need to specify which interrupts are suitab=
le for
use like this.=20

I think a 'fictional' device is going to have to exist to allow this..

Jonathan
