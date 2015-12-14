From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Generic DT binding for IPIs
Date: Mon, 14 Dec 2015 12:40:57 +1100
Message-ID: <20151214014057.GM22783@voom.fritz.box>
References: <561E2BE6.2090807@imgtec.com>
 <5628BE00.4020106@imgtec.com>
 <20151022115551.GI3953@io.lakedaemon.net>
 <56684877.3020708@imgtec.com>
 <CAL_Jsq+yv1UnBhrR+x+DEA41yETVANY9_-5W0DSQJVEQ4+Mx_w@mail.gmail.com>
 <56695201.2070807@imgtec.com>
 <20151211003902.GE20139@voom.fritz.box>
 <566AA9DD.6040404@imgtec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8c07nsHwQobhlezh"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <566AA9DD.6040404-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lisa Parratt <Lisa.Parratt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--8c07nsHwQobhlezh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2015 at 10:47:57AM +0000, Qais Yousef wrote:
> On 12/11/2015 12:39 AM, David Gibson wrote:
> >On Thu, Dec 10, 2015 at 10:20:49AM +0000, Qais Yousef wrote:
> >>
> >>The IPIs have two properties that are different from a regular interrup=
ts:
> >>
> >>     1. An IPI is not only received, it could also be sent.
> >Any interrupt is sent by the device, received by an interrupt
> >controller, so this isn't really anything fundamentally different.
>=20
> No they're not fundamentally different. It's just the way they're created
> and used.
>=20
> >>     2. The IPI is dynamic. There's an actual allocation from a pool of
> >>available
> >>         IPIs happening when we ask for one to be reserved.
> >It's not really clear to me what that means, and why it requires any
> >particular different information in the device tree.
>=20
> Maybe it would help to look at the new IPI reservation API?
>=20
>     https://lkml.org/lkml/2015/12/8/249

Hmm.. not as much as I might have hoped.

=46rom the API, it looks like you're reserving IPIs to signal between
different CPUs all of which are in Linux.  From your description here
it sounds like the coproc is a separate specialized thing not running
Linux (or at least, not the same Linux instance as the host OS which
this device tree is for).

> >>The difference might be borderline..
> >>
> >>Do you have any rough idea on what a possible extension could look like?
> >>Reusing means writing less code, which is always better of course :)
> >>
> >>By the way, on MIPS GIC, we can use interrupts property to describe an =
IPI
> >>the host system will receive. But to send one to the coprocessor, we ne=
ed to
> >>define an outgoing IPI.
> >Ah, ok, so is what you're trying to describe here (from the host OS
> >and CPU point of view) a purely outgoing signal to the coproc?
>=20
> Yes.

Ok.  In that case 'interrupts' is definitely *not* the right way to
describe this.  'interrupts' describes a signal going _from_ the node
in which it appears, _to_ the (host) cpu.  Or at least to an interrupt
controller which will generally forward it to the host cpu one way or
another.


> >>In this case, the firmware will be hardcoded to send an interrupt to a
> >>specific hwirq, so one can then describe it in DT as a regular interrup=
t to
> >>the host system. Hardcoding is not ideal and less portable though.
> >Or is the signal that goes to the coproc then somehow being translated
> >into a host interrupt?  If that's so you should be able to represent
> >the coproc as an interrupt controller or interrupt nexus.
> >
>=20
> I'm not sure I understood you completely but no, there's no translation
> happening. When the IPI is allocated it would be routed
> to the coproc. When the host wants to send a signal, it'll use the alloca=
ted
> hwirq value (indirectly via the virq) to write to a register, which will
> cause an interrupt to be generated at the coproc.

Where is this magic register located?  In the host cpu?  In the
coproc?  In some special IPI controller?

> >>>>      };
> >>>>
> >>>>      coproc2 {
> >>>>              ipi-refs =3D <&coproc1 "in">, <&coproc1 "coproc2data">,=
 <&coproc1
> >>>>"corpoc2ctrl">;
> >>>This isn't actually parseable. You need a known length of cells after =
a phandle.
> >>>
> >>To clarify, what you're saying we can't pass strings, right?
> >So, I'm not entirely sure what point Rob was making.  The above
> >certainly isn't valid dts syntax - strings can't appear within
> >the < > construct.  But if you make the obvious fix to:
> >     ipi-refs =3D <&coproc1>, "in", <&coproc1>, "coproc2data";
> >
> >then it's certainly a parseable property format.  It's kind of clunky
> >mixing integers and strings that way, but it's possible and there are
> >existing bindings using properties in a similar format.
> >
>=20
> Ah OK thanks! I think this form would be handy to get the refs even if we
> end up reusing the interrupts property to allocate an IPI.
>=20
> So if reusing the interrupts property is the right thing to do, do you (or
> anyone else) have a rough idea how this should look like?

So as noted above, I'm now sure that 'interrupts' is not the right
thing.  I'm trying to understand the coprocs and the ipi mechanism a
bit better to work out if there is something existing which would make
sense, or if we do need something entirely new.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8c07nsHwQobhlezh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWbh4pAAoJEGw4ysog2bOS2RMQALwcxxCdIi0qhCkpnvPHsa5x
vwNT6jwtoyTH9DqFqy5rYXRkUCNcQUITmAqqBg+qYtGMaIAEVEUm3+206eyFij+c
UYJisscffDn+IS6WjOiLq5nfJYZ/MKyR1QEO9GNL0PGh7GIysAk1LamVmgQOvPTA
SRM5JQm9kFohWEEOto38TbdCIViUkzO1DOBY9pznQDsCL4RBc/NV7jvpHFcZkZRY
4PDSg4CDj2X++G2Q2+Al9zQ4HlJWJaF4Z74Epmt+ODh6+mNYeUnPKse1dvzQJ8RI
XnP1wP2D7t2iBEPHudwqc4nY1x4Hl279KuX0wsuTznuLQFtOJUdGsHzF0AEUhHxb
f2X3cShaocZqb8aQVKTUE9qMevXm3gNd930xaFe7bE+c/A3ZE80MQkLZRxmr7DUE
HIxhFgxSMICPRTE7AK4/5/WPhCG87dmDwgHi9dXH7mZXFsJTHqZcVOECMzBLuB8f
1M58DV95zxOZ8dYSjxTmxRRaK3dcndqY+SaSG3pEx3HVypC7QGysv4dAn2EKoZ+W
HqXFJrLLH8k+qE/ywhsGPd3L+wgwALrn7BoNnSt1fMx8T+YFrV/iy1b3dMzBe9H+
5vL7FgoKAC8v1ucf6PcOItK8K572TRitvXwFnITlLHOLxs5wpfysZ1mACFJpMU8P
y5aFthsxeq9WFRmm92n2
=nh/h
-----END PGP SIGNATURE-----

--8c07nsHwQobhlezh--
