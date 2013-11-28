From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Thu, 28 Nov 2013 23:22:33 +0100
Message-ID: <20131128222232.GF14689@mithrandir>
References: <20131127172806.GC2291@e103592.cambridge.arm.com>
 <20131128203322.GB14689@mithrandir>
 <20131128211009.GA26447@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131128211009.GA26447-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2013 at 02:10:09PM -0700, Jason Gunthorpe wrote:
> On Thu, Nov 28, 2013 at 09:33:23PM +0100, Thierry Reding wrote:
>=20
> > >   - Describing masters that master through multiple different buses
> > >=20
> > >   - How on Earth this fits in with the Linux device model (it doesn't)
> > >=20
> > >   - Interaction with IOMMU bindings (currently under discussion)
> >=20
> > This is all very vague. Perhaps everyone else knows what this is all
> > about, in which case it'd be great if somebody could clue me in.
>=20
> It looks like an approach to describe an AXI physical bus topology in
> DT..

Thanks for explaining this. It makes a whole lot more sense now.

> AFAIK the issue is that the AXI toolkit arm provides encourages a
> single IP block to have several AXI ports - control, DMA, high speed
> MMIO, for instance. Each of those ports is hooked up into an AXI bus
> DAG that has little to do with the CPU address map.
>=20
> Contrasted with something like PCI, where each IP has exactly one bus
> port into the system, so the MMIO register access address range
> directly implies the bus master DMA path.
>=20
> To my mind, a sensble modeling would be to have the DT tree represent
> the AXI DAG flattened into a tree rooted at the CPU vertex. Separately
> in the DT would be the full AXI DAG represented with phandle
> connections.
>=20
> Nodes in the DT would use phandles to indicate their connections into
> the AXI DAG.
>=20
> Hugely roughly:
> soc=20
> {
>    ranges =3D <Some quasi-real ranges indicating IP to CPU mapping>;
>    ip_block=20
>    {=20
>       reg =3D <...>
>       axi-ports =3D <mmio =3D &axi_low_speed_port0, dma =3D &axi_dma_port=
1, .. >;
>    }
> }
>=20
> axi
> {
>    /* Describe a DAG of AXI connections here. */
>    cpu { downstream =3D &ax_switch,}
>    axi_switch {downstream =3D &memory,&low_speed}
>    memory {}
>    dma {downstream =3D &memory}
>    low_speed {}
> }

Correct me if I'm wrong, but the switch would be what the specification
refers to as "interconnect", while a port would correspond to what is
called an "interface" in the specification?

> I was just reading the Zynq manual which gives a pretty good
> description of what one vendor did using the ARM AXI toolkits..
>=20
> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-T=
RM.pdf
> Figure 5-1 pg 122
>=20
> You can see it is a complex DAG of AXI busses. For instance if you
> want to master from a 'High Performance Port M0' to 'On Chip RAM' you
> follow the path AXI_HP[MO] -> Switch1[M2] -> OCM.
>=20
> But you can't master from 'High Performance Port M0' to internal
> slaves, as there is no routing path.
>=20
> Each switch block is an opportunity for the designer to provide
> address remapping/IO MMU hardware that needs configuring :)
>=20
> Which is why I think encoding the AXI DAG directly in DT is probably
> the most future proof way to model this stuff - it sticks close to the
> tools ARM provides to the SOC designers, so it is very likely to be
> able to model arbitary SOC designs.

I'm not sure I agree with you fully here. At least I think that if what
we want to describe is an AXI bus topology, then we should be describing
it in terms of the AXI specification.

On the other hand I fear that this will lead to very many nodes and
properties that we need to add, with potentially no immediate gain. So I
think we should be cautious about what we do add, and restrict ourselves
to what we really need.

I mean, even though device tree is supposed to describe hardware, there
needs to be a limit to the amount of detail we put into it. After all it
isn't a hardware description language, but rather a language to describe
the hardware in a way that makes sense for operating system software to
use it.

Perhaps this is just another way of saying what Greg has already said.
If we continue down this road, we'll eventually end up having to
describe all sorts of nitty gritty details. And we'll need even more
code to deal with those descriptions and the hardware they represent. At
some point we need to start pushing some of the complexity back into
hardware so that we can keep a sane code-base.

Thierry

--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSl8InAAoJEN0jrNd/PrOhEfIP+QE4kKNeN9qnK95Bt1DFPR8C
upa+Iq56byBhazZ9ow0+2lny62MZ3k5FBA9c19Qqi+dAXS+jRDWmpnBxfTZIhLlZ
WCTxjBQ2SrtSZw+HhWuO+zGlK7H+etnMqDeWckRO/E/Gm9DdmoD+DwKOaZ7b7Bkw
wqYjtwjf5VEqXKzH4N239GBs9YwaQmqJXLlpqLWEwngvlktPSQc5U7XAWmoo9SJw
ORX6JHNAwyMrBgpjmgxRt2fceJNRaQ0XK6Hh/FAwQrr8PEm+CgXnx6Lu18JF8HrY
zwZIxFSLV7NudqLcN+Xe6fRGEscbqQDzRcClFDCdT/YzN1y/mRHgH2JQTF10j89o
F7iqRulnXj6qJ1Il5MBpZhdQLO1AyaT8omZON6wPkacmaME74lBVFPg1u/1k7T9j
dYCeXYB+ZerOK5WYrU/0ls6DFyir3eiCsO2Nt4as0S84xoK8UHW7s2LBxAATbO7U
KgfxB8ae5OTcCl4wPJWZNT58842qmfXQ43x8ETdwa+jGoRaf9Fk14yACDQ3GuFKv
qXoNfAjygb/x3Agvbb3awHTP4fvmpJ4m/csSfiBwHXPW6elMsxp7rR5TIHSSzSlJ
g8N7gS1/lU7bwEizGykosL17Bvjq/wdDKVCiVF0GCOwtcyIc29ICORHgYOuemTt1
Bri1CslHPTO/jKu41k+X
=/Myd
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
