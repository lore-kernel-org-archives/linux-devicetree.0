From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] DT affinity bindings/representing bus masters with DT
Date: Thu, 7 Mar 2013 08:57:14 +1100
Message-ID: <20130306215714.GC6740@truffula.fritz.box>
References: <20130215172102.GF3014@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3873370625667465141=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130215172102.GF3014-7AyDDHkRsp3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============3873370625667465141==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline


--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2013 at 05:21:02PM +0000, Lorenzo Pieralisi wrote:
> Hi all,
>=20
> in order to come up with a solid solution to the affinity bindings concept
> we are facing in the ARM world, I am posting this RFC so that hopefully p=
eople
> on the list can chime in and help us in this endeavour.
>=20
> I tried to keep things simple on purpose and some statements are a bit of=
 an
> oversimplification, we can elaborate on those if needed.
>=20
> Hereafter a summary of what we are trying to achieve.
>=20
> Current device tree bindings allow to describe HW configurations of syste=
ms
> in a bus like fashion, where each bus contains bus slaves and mapping
> heuristics to translate address spaces across bus layers (AMBA -> PCI).
>=20
> The device tree by definition represents the view of the system from the
> perspective of the CPU(s). This means that all devices (but CPUs) present
> in the device tree are to be seen as "slave" components, ie devices sitti=
ng on
> a bus and accessible from the CPU with an addressing mode that can vary a=
nd it
> is defined by the bus the device is sitting on.
>=20
> There are specific cases in current SoCs though where resources belonging=
 to
> a slave device should be linked to a master in the SoC system hierarchy.
>=20
> To the best of my knowledge, the mechanism used to implement this linkage=
 is
> not defined by any device tree binding; it probably can be a phandle in t=
he
> device tree syntax, but this has some implications that will be described=
 as
> follows.
>=20
> A programmable device, let's call it "foo" for the sake of this discussio=
n,
> has several resources (ie memory spaces) that should be mapped to bus mas=
ters
> in a SoC hierarchy (each resource "belongs" to a master). The only way th=
is
> can be currently done through a device tree is by linking the resource in
> question to a device representing the master node through a phandle (keep=
ing
> in mind that the concept of master node does not exist in current DT
> bindings).
>=20
> An example is worth a thousand words (pseudo dts file):
>=20
> / {
> 	#address-cells =3D 1;
> 	#size-cells =3D 1;
>=20
> 	acme1: acme@4000000 {
> 		reg =3D <0x4000000 0x1000>;
> 	};
>=20
> 	acme2: acme@5000000 {
> 		reg =3D <0x5000000 0x1000>;
> 	};
>=20
> 	foo@2000000 {
> 		reg =3D <0x2000000 0x1000
> 		       0x2001000 0x1000>;
> 		affinity =3D <&acme1 &acme2>;
> 	};
> };
>=20
> where the "affinity" property contains a number of phandles equal to the =
number
> of resources (ie reg properties) in the foo@2000000 node. The "affinity"
> property maps a reg property to a device tree node, one phandle per "reg"
> property.
>=20
> acme1 and acme2 are two bus masters in the system (eg a DMA and a GPU).
>=20
> Each foo@2000000 reg property maps to a device that represents a bus mast=
er
> (to make it clearer, a foo@2000000 reg property defines an address space =
that
> belongs to a bus master, ie the address space represents a programming
> interface specific to that master; in the bindings above address 0x200000=
0 is
> the address at which acme1 device can programme its "foo" interface, addr=
ess
> 0x2001000 is the address at which acme2 device can programme its "foo"
> interface).

Ok.  I think annotating the existing reg property like this is a very
bad idea.  I haven't seen all the previous discussion, so I'm not
totally clean on what this affinity concept is about.  But as I
understand it, these "slave" resources cannot be treated like an
ordinary resource in in the reg property.  That means an older client
will potentially misinterpret "reg" because it doesn't know about
"affinity".

Worse, again, if I've understood correctly, resources with different
"masters" are essentially in different logical address spaces.  "reg"
properties should always sit in the logical address space representing
the parent node's bus.  Different address spaces could also have
different address sizes, which would really complicate parsing "reg".

Now, a device tree extension I've considered before for other reasons
might also be relevant to your case.  That is to add a new "bus-reg"
property that has a meaning similar to "reg" but contains (phandle,
address, size) tuples instead of just (address, size) tuples.  The
phandle in each case would represent the node in whose address space
this resource appears.  This would generalize the "dcr-reg" and
"scom-reg" properties we've sometimes used on ppc.

It's not clear if this essentially incompatible extension would be
worth it, though.  The other way to represent these structures is to
just split the node for this logical device into different pieces
under each address space it has resources on.  These pieces are then
linked together with (binding specific) phandle pointers to each
other.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlE3u7oACgkQaILKxv3ab8bZcgCaApK0qjI+oB0qgEVeWJRO2Slw
WM0An2QNsUAA99OFdfD7QamjIeiz3tDh
=VB6S
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--

--===============3873370625667465141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3873370625667465141==--
