From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/5] irqchip: add dumb demultiplexer implementation
Date: Thu, 15 Jan 2015 10:26:45 +0100
Message-ID: <54B787D5.9070408@atmel.com>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com> <1421174781-4340-2-git-send-email-boris.brezillon@free-electrons.com> <CAL_JsqJ5DSo6jmAuHPDdV6pMca8BVbg5V-GZ5=2qu96_QYXMtQ@mail.gmail.com> <alpine.DEB.2.11.1501141110190.5526@nanos> <CAL_JsqLwBvV5s531_YsA=sCE4_LG=eXTua8mh069ufRjSNFhng@mail.gmail.com> <alpine.DEB.2.11.1501151003430.5526@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1501151003430.5526@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 15/01/2015 10:11, Thomas Gleixner a =E9crit :
> On Wed, 14 Jan 2015, Rob Herring wrote:
>> On Wed, Jan 14, 2015 at 4:36 AM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org=
> wrote:
>>> All attempts to work around that have resulted in horrible bandaids=
 so
>>> far. That's why I guided Boris to implement this dummy demultiplexi=
ng
>>> mechanism. It solves the problem at hand nicely without adding nast=
y
>>> hackarounds into the suspend/resume code and inflicting platform
>>> knowledge on multi-platform device drivers.
>>
>> This change will break on old kernels with a new dtb. Would you be
>> happy if a BIOS update required a new kernel? Fixing this for any
>> platform requires a dtb update which may not be possible on some
>> platforms. I don't have a problem with this breakage for 1 platform
>> and the at91 guys may not care, but we'd ultimately be changing how
>> all shared irqs are specified for all DT. Maybe we decide that this =
is
>> how we want to describe things, but that needs much wider discussion
>> and agreement.
>=20
> We do not change shared interrupts in any way. We provide an
> alternative mechanism for braindead hardware. And if the at91 folks

Let me add subtle details: "Old braindead hardware, with possibility to
use alternative set of timers which doesn't have shared interrupt lines=
" ;-)

> are fine with the DT change, then it's their decision. Nothing forces
> this on everyone.

Yes I do agree to change DT.

>>> If you have a proper solution for the problem at hand which
>>>
>>>    - avoids the demux dummy
>>>
>>>    - works straight forward with suspend/resume/wakeup
>>>
>>>    - does not add horrible new APIs
>>>
>>>    - does not add conditionals to the interrupt hotpath
>>>
>>>    - does not inflict platform knowledge about interrupt chip detai=
ls
>>>      on drivers
>>>
>>> then I'm happy to take it.
>>>
>>> But as long as you can't come up with anything sane, the demux dumm=
y
>>> is the best solution for this problem we've seen so far.
>>
>> What if during suspend you move all actions w/o IRQF_NO_SUSPEND to a
>> suspended action list? This would leave only the actions with
>> IRQF_NO_SUSPEND set in the active action list. The cost would be a
>> pointer in irq_desc and moving the actions during suspend and resume=
=2E
>=20
> That's exactly what we want NOT. Because it prevents us to do proper
> sanity checks for IRQF_NO_SUSPEND. We've been there and I rejected it
> for that very reason.
> =20
>> There are probably ways to do this demux irqchip without a DT change=
=2E
>=20
> What's the problem with a DT change for a single platform, if the
> maintainers are willing to take it and deal with the fallout?
>=20
> And in case of AT91 the new kernel will simply work with the old DT
> and just emit the same warning vs. the IRQF_NO_SUSPEND mismatch. Olde=
r
> kernels won't work with a new DT, but that's about it.
>=20
> Aside of that, I'm quite amused about your DT update worries. DTs
> break with every kernel version on very popular platforms in very
> weird and subtle ways.

DT on AT91 is a Work In Progress (for 3.5 years) and the facts have tol=
d
us that DT updates were absolutely necessary. So, for now, I agree to
change DT as far as AT91 is concerned.

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
