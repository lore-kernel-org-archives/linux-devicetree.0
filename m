From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH V3] irqchip: Add TB10x interrupt controller driver
Date: Thu, 13 Jun 2013 10:26:30 +0200
Message-ID: <20130613082629.GA17071@ab42.lan>
References: <20130530211944.05F4D3E0A90@localhost>
 <1370014348-21121-1-git-send-email-christian.ruppert@abilis.com>
 <alpine.LFD.2.02.1305311835040.2905@ionos>
 <20130531221814.534DF3E08FE@localhost>
 <20130601110133.GA4051@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130601110133.GA4051@ab42.lan>
Sender: linux-doc-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Thomas Gleixner <tglx@linutronix.de>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Pierrick Hascoet <pierrick.hascoet@abilis.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 01, 2013 at 01:01:33PM +0200, Christian Ruppert wrote:
> On Fri, May 31, 2013 at 11:18:14PM +0100, Grant Likely wrote:
> > On Fri, 31 May 2013 19:32:34 +0200 (CEST), Thomas Gleixner <tglx@li=
nutronix.de> wrote:
> > > On Fri, 31 May 2013, Christian Ruppert wrote:
> > >=20
> > > > The SOC interrupt controller driver for the Abilis Systems TB10=
x series of
> > > > SOCs based on ARC700 CPUs.
> > > >=20
> > > > This patch depends on commits eb76bdd407d8a90e59a06cb0158886df3=
90e5d1c and
> > > > 712bc93df9e7f14b8a163148d2aa7c778e151627 from branch irq/for-ar=
m of
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git.
> > >=20
> > > That branch can be pulled into ARC as well. It only contains the
> > > changes, which are necessary for the irq domain support of the ge=
neric
> > > irq chip.
>=20
> Vineet, what do you think about this? For the moment I have pulled th=
e
> patch set into our local branch and to me it doesn't matter, we just
> have to make sure to respect this dependency when merging everything
> together.
>=20
> > > > +static void tb10x_irq_cascade(unsigned int irq, struct irq_des=
c *desc)
> > > > +{
> > > > +	struct irq_domain *domain =3D irq_desc_get_handler_data(desc)=
;
> > > > +
> > > > +	generic_handle_irq(irq_find_mapping(domain, irq));
> > > > +}
> > >=20
> > > ...
> > >=20
> > > > +	for (i =3D 0; i < nrirqs; i++) {
> > > > +		unsigned int irq =3D irq_of_parse_and_map(ictl, i);
> > > > +
> > > > +		irq_set_handler_data(irq, domain);
> > > > +		irq_set_chained_handler(irq, tb10x_irq_cascade);
> > > > +	}
> > >=20
> > > I might be completely confused, but this does not make any sense =
at
> > > all.
> > >=20
> > > You allocate a linear domain and then map the interrupts in the
> > > domain. The mapping function retrieves the hardware interrupt num=
ber
> > > and creates a virtual interrupt number, installs the chip and the
> > > handler for the interrupt and finally returns the virtual interru=
pt
> > > number.
> > >=20
> > > Now you take that virtual interrupt number and install
> > > tb10x_irq_cascade as the handler. irq_set_chained_handler() will
> > > startup (unmask) the interrupt right away.
> > >=20
> > > In the cascade handler you take the virtual interrupt number, whi=
ch
> > > you get as argument, and find the mapping, i.e. the matching VIRT=
UAL
> > > interrupt number for the VIRTUAL interrupt number and then call t=
he
> > > handler.
> > >=20
> > > How is this supposed to work?
> >=20
> > I think what is going on here is that the tb10x interrupt controlle=
r
> > appears to be more of a front-end to another interrupt controller w=
ith
> > each input wired up 1:1 to the interrupt inputs of the other contro=
ller.
>=20
> Exactly. The TB10x interrupt controller is a front-end for the ARC CP=
U
> built-in interrupt controller.
>=20
> > (I don't know why someone would design an interrupt controller that=
 way,
> > but that's another issue).
>=20
> There are several technical reasons for this front-end. The one that
> concerns us most in the kernel is that the TB10x front-end does the
> translation from all kinds of interrupt trigger modes to the level
> triggered interrupts natively understood by the ARC CPU built-in
> controller.
>=20
> > The loop above is mapping each of the
> > interrupt inputs on the parent controller so that each child contro=
ller
> > can be chained to it as an input. I can't think of how else it coul=
d be
> > set up with the current code if the drivers were kept separate.
>=20
> This is exactly the intention. I haven't found an easier way to do th=
is
> either but I'm open to suggestions. Btw, I have noticed that the pare=
nt
> controller interrupts from this loop are not listed in /proc/interrup=
ts.
> I'm not sure if what is done in the loop is sufficient or if I should
> add something else (the naive option of using request_irq doesn't wor=
k,
> the kernel saying something in the lines of "irq XX triggered but noo=
ne
> cares").
>=20
> > Christian, what is the parent interrupt controller for this SoC? It
> > really feels like the tb10x-ictl belongs as part of the parent
> > controller. I went and looked at the parent node, and I saw this:
> >=20
> > 		intc: interrupt-controller {
> > 				compatible =3D "snps,arc700-intc";
> > 				interrupt-controller;
> > 				#interrupt-cells =3D <1>;
> > 		};
> >=20
> > I noticed the conspicuous absence of a reg property. Is this someth=
ing
> > architectural?
>=20
> The parent controller is part of the CPU itself, see
> arch/arc/kernel/irq.c. This controller is maintained by Vineet and IM=
HO
> we should keep it separate from the TB10x one since it is implicitly
> used in all ARC-based platforms whereas the TB10x controller is used =
in
> Abilis chips only.
>=20
> > If I were working on this system I'd drop the
> > snps,arc700-intc node entirely and have a single abilis,tb10x-intc =
that
> > encapsulated the properties of both (you would of course want to sh=
are
> > handler functions for the 'normal' inputs without the custom featur=
es).
> > That would eliminate the goofyness of listing 27 separate interrupt=
s in
> > the abilis,tb10x-ictl interrupts property.
>=20
> To complicate things even further, some ARC CPU built-in peripherals
> (e.g. timers) generate interrupts directly to the ARC built-in interr=
upt
> controller (without going through the TB10x front-end), hence the
> "goofy" list of interrupts in the TB10x DT node.

Hello Thomas,

Any news about this one?

Greetings,
  Christian

--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
