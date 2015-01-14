From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] irqchip: Add DT binding doc for dumb demuxer
 chips
Date: Wed, 14 Jan 2015 20:08:09 +0100
Message-ID: <20150114200809.0c16baae@bbrezillon>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com>
	<1421174781-4340-3-git-send-email-boris.brezillon@free-electrons.com>
	<20150113190050.GZ24989@titan.lakedaemon.net>
	<20150113215207.185d92b4@bbrezillon>
	<20150114185619.GB24989@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150114185619.GB24989-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

On Wed, 14 Jan 2015 13:56:19 -0500
Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:

> Hey Boris,
>=20
> On Tue, Jan 13, 2015 at 09:52:07PM +0100, Boris Brezillon wrote:
> > On Tue, 13 Jan 2015 14:00:50 -0500 Jason Cooper <jason@lakedaemon.n=
et> wrote:
> > > On Tue, Jan 13, 2015 at 07:46:18PM +0100, Boris Brezillon wrote:
> > > > Add documentation for the dumb demuxer.
> > > >=20
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.=
com>
> > > > ---
> > > >  .../bindings/interrupt-controller/dumb-demux.txt   | 34 ++++++=
++++++++++++++++
> > > >  1 file changed, 34 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/interrupt=
-controller/dumb-demux.txt
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/interrupt-contro=
ller/dumb-demux.txt b/Documentation/devicetree/bindings/interrupt-contr=
oller/dumb-demux.txt
> > > > new file mode 100644
> > > > index 0000000..1c777ef
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/du=
mb-demux.txt
> > > > @@ -0,0 +1,34 @@
> > > > +* Generic Dumb Interrupt Demultiplexer
> > > > +
> > > > +This Dumb demultiplixer simply forward all incoming interrupts=
 to its
> > > > +enabled/unmasked children.
> > >=20
> > > Please forgive the potentially na=C3=AFve question, but what hard=
ware is this
> > > describing?
> >=20
> > That's not a real hardware per se, but on some hardware (like at91 =
SoCs)
> > some IRQ line are shared by several peripherals, and this dumb
> > demultiplex is here to represent such shared irq lines which cannot=
 be
> > easily demultiplexed (because they do not provide a 'cause'
> > register).
> >=20
> > You can see it as a virtual irqchip provided to address broken hard=
ware
> > designs.
>=20
> Hmm.  Well, given tglx's recent reply, I suppose I'll *not* go down t=
he
> rabbit hole of "the DT is for describing hardware."  :-P

Actually I'm a bit surprised no one else already mentioned that :-) (I
thought this would be the first complain regarding this dumb irq
demux chip).

Anyway, IMHO, this can be considered as hardware description since
these irq-lines are really multiplexed into a single one...

>=20
> However, it would probably be a lot more palatable to the DT maintain=
ers
> if we at least change the compatible to prepend "linux,".  This way, =
if
> someone does come up with a better solution down the road, it will be
> much easier to deprecate the binding.
>=20
> I would also be amenable to "virt,", or "hack,", or even
> "work-around-piss-poor-hw,".  Basically, anything that would indicate=
 to
> consumers of the DT that this is not a true reflection of the hardwar=
e,
> and that it may be superseded by a better solution later.

Actually I thought about changing it to "virtual,dumb-irq-demux" :-).

>=20
> It would also be helpful to explain the situation more fully in the
> binding document.

Sure, I'll add a few lines to describe what this irqchip really is.

Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
