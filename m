From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Fri, 29 Nov 2013 10:57:12 +0100
Message-ID: <20131129095711.GD22771@ulmo.nvidia.com>
References: <20131127172806.GC2291@e103592.cambridge.arm.com>
 <20131128203322.GB14689@mithrandir>
 <20131128211009.GA26447@obsidianresearch.com>
 <20131128222232.GF14689@mithrandir>
 <20131128233147.GA19387@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131128233147.GA19387-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2013 at 04:31:47PM -0700, Jason Gunthorpe wrote:
> On Thu, Nov 28, 2013 at 11:22:33PM +0100, Thierry Reding wrote:
> > On Thu, Nov 28, 2013 at 02:10:09PM -0700, Jason Gunthorpe wrote:
> > > On Thu, Nov 28, 2013 at 09:33:23PM +0100, Thierry Reding wrote:
> > >=20
> > > > >   - Describing masters that master through multiple different bus=
es
> > > > >=20
> > > > >   - How on Earth this fits in with the Linux device model (it doe=
sn't)
> > > > >=20
> > > > >   - Interaction with IOMMU bindings (currently under discussion)
> > > >=20
> > > > This is all very vague. Perhaps everyone else knows what this is all
> > > > about, in which case it'd be great if somebody could clue me in.
> > >=20
> > > It looks like an approach to describe an AXI physical bus topology in
> > > DT..
> >=20
> > Thanks for explaining this. It makes a whole lot more sense now.
>=20
> Hopefully the ARM guys concur, this was just my impression from
> reviewing their patches and having recently done some design work with
> AXI..
>=20
> > > axi
> > > {
> > >    /* Describe a DAG of AXI connections here. */
> > >    cpu { downstream =3D &ax_switch,}
> > >    axi_switch {downstream =3D &memory,&low_speed}
> > >    memory {}
> > >    dma {downstream =3D &memory}
> > >    low_speed {}
> > > }
> >=20
> > Correct me if I'm wrong, but the switch would be what the specification
> > refers to as "interconnect", while a port would correspond to what is
> > called an "interface" in the specification?
>=20
> That seems correct, but for this purpose we are not interested in
> boring dumb interconnect but fancy interconnect with address remapping
> capabilities, or cache coherency (eg the SCU/L2 cache is modeled as
> switch/interconnect in a AXI DAG).
>=20
> I called it a switch because the job of the interconnect block is to
> take an AXI input packet on a slave interface and route it to the
> proper master interface with internal arbitration between slave
> interfaces. In my world that is a called a switch ;)
>=20
> AXI is basically an on-chip point-to-point switched fabric like PCI-E,
> and the stuff that travels on AXI looks fairly similar to PCI-E TLPs..
>=20
> If you refer to the PDF I linked I broadly modeled the above DT
> fragment on that diagram, each axi sub node (vertex) represents an
> 'interconnect' and 'downstream' is a master->slave interface pair (edge).
>=20
> Fundamentally AXI is inherently a DAG, but unlike what we are used to
> in other platforms you don't have to go through a fused
> CPU/cache/memory controller unit to access memory, so there are
> software visible asymmetries depending on how the DMA flows through
> the AXI DAG.
>=20
> > > Which is why I think encoding the AXI DAG directly in DT is probably
> > > the most future proof way to model this stuff - it sticks close to the
> > > tools ARM provides to the SOC designers, so it is very likely to be
> > > able to model arbitary SOC designs.
> >=20
> > I'm not sure I agree with you fully here. At least I think that if what
> > we want to describe is an AXI bus topology, then we should be describing
> > it in terms of the AXI specification.
>=20
> Right, that was what I was trying to describe :)=20
>=20
> The DAG would be vertexes that are 'interconnect' and directed edges
> that are 'master -> slave interface' pairs.
>=20
> This would be an addendum/side-table dataset to the standard 'soc' CPU
> address map tree, that would only be needed to program address
> mapping/iommu hardware.
>=20
> And it isn't really AXI specific, x86 style platforms can have a DAG
> too, it is just much simpler, as there is only 1 vertex - the IOMMU.
>=20
> > I mean, even though device tree is supposed to describe hardware, there
> > needs to be a limit to the amount of detail we put into it. After all it
> > isn't a hardware description language, but rather a language to describe
> > the hardware in a way that makes sense for operating system software to
> > use it.
>=20
> Right - which is why I said the usual 'soc' node should remain as-is
> typical today - a tree formed by viewing the AXI DAG from the CPU
> vertex. That 100% matches the OS perspective of the system for CPU
> originated MMIO.
>=20
> The AXI DAG side-table would be used to resolve weirdness with 'bus
> master' DMA programming. The OS can detect all the required
> configuration and properties by tracing a path through the DAG from
> the source of the DMA to the target - that tells you what IOMMUs are
> involved, if the path is cache coherent, etc.

That all sounds like an awful amount of data to wade through. Do we
really need all of it to do what we want? Perhaps it can be simplified
a bit. For instance it seems like the majority of hardware where this is
actually required will have to go through one IOMMU (or a cascade of
IOMMUs) and the path isn't cache coherent.

IOMMUs typically require additional parameters to properly map devices
to virtual address spaces, so we'll need to hook them up with masters in
DT anyway. If we further assume that all masters use non-cache-coherent
paths, then the problem becomes much simpler.

Of course that would only work for a specific case and not solve the
more general case. But perhaps it'll be good enough to cover the
majority of uses.

> > Perhaps this is just another way of saying what Greg has already said.
> > If we continue down this road, we'll eventually end up having to
> > describe all sorts of nitty gritty details. And we'll need even more
>=20
> Greg's point makes sense, but the HW guys are not designing things
> this way for kicks - there are real physics based reasons for some of
> these choices...
>=20
> eg An all-to-all bus cross bar (eg like Intel's ring bus) is engery
> expensive compared to a purpose built muxed bus tree. Doing coherency
> look ups on DMA traffic costs energy, etc.

I understand that these may all contribute to saving power. However what
good is a system that's very power-efficient if it's so complex that the
software can no longer control it?

Thierry

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmGT3AAoJEN0jrNd/PrOhatcQAI7iBSnWJrIGXxN/xhyxJWlT
l8MduSTtyEqhRVb6nDynKjXhhIi0tlOAhvVrMIz2hq2ViJ9WdpzQFfUBxXTHQcw5
zmzdGmWyt2XKFgDRtlzSXnQFC8+HFeQTZuuMqwzQ7wzJntDGcDZ/Arhgja1rELHJ
/XgjXtDXxNOaXkh8uHmB8i2sLf6opcD8vEpIXH5lGKad3D0DOCUhya9Hg0x7mzMw
Y5YZimQw0dQMj4pHzQ5BHnB2cUoQwO3WNJX0I/y8u7TaWUadV1WWAWvvP7JI7BnU
atS4hY6w/s2Ku1KOCxucWw5zhMZ1jwwX0lBLnKge6ysa0Ta62HjEBY3iOXYf5pfS
33kJuq3sYrpfuKitcAtsYzaRKbU8C62CXaIQERY8BStslA1gbPO2YRwtYsUBkFwK
z/V5l2k6OxWLPZhnVDBhjJ297L3oMlZjAfGyGnMSmNUbRD4TGFPdhZbAe+2ikVuU
q+gPYM0NwFDn1Euyktk92LQwoRrTS+FaeGhVlLquEdTCJ8VwusVzwHspopS5qg1g
Hh3X7uEJ9Ww8r3vdqXWVHkzhlXzhUQ0RlGDlKHWHu7VI8qVthPX1hsCGR1R4a8If
3/vXY/XNkw2Q2pTJL5smYumVnWc10uy/a2FC0FOhKC+eW9THr+/3CcHiyAWWoCsO
WcEwcOcVzA8A5lLMC93L
=Eqbo
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
