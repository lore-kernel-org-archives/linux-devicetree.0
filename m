From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC 1/3] checks: Add infrastructure for setting bus type of
 nodes
Date: Fri, 1 Apr 2016 13:23:35 +1100
Message-ID: <20160401022335.GI416@voom.redhat.com>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
 <20160331052247.GD416@voom.redhat.com>
 <CAL_JsqKTarcy2UHKD5m2F7TNP3stNnpCdxTrptGeiTXJJHiGaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hABqaeELJqnDDeDE"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKTarcy2UHKD5m2F7TNP3stNnpCdxTrptGeiTXJJHiGaA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--hABqaeELJqnDDeDE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 10:17:46AM -0500, Rob Herring wrote:
> On Thu, Mar 31, 2016 at 12:22 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Mar 23, 2016 at 07:40:19PM -0500, Rob Herring wrote:
> >> In preparation to support bus specific checks, add the necessary
> >> infrastructure to determine the bus type for nodes. Initially, PCI and
> >> simple bus are supported.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >> David,
> >
> > Sorry it's taken me a while to look at this.  I've been a mixture of
> > busy and sick :/
>=20
> No problem.
>=20
> [...]
>=20
> >> +static bool is_pci_bridge(struct node *node)
> >> +{
> >> +     struct property *prop;
> >> +
> >> +     if (!node)
> >> +             return false;
> >> +
> >> +     prop =3D get_property(node, "device_type");
> >> +     if (!prop)
> >> +             return false;
> >> +
> >> +     if (strcmp(prop->val.val, "pci") =3D=3D 0)
> >> +             return true;
> >> +
> >> +     return false;
> >> +}
> >
> > So, I don't love using device_type here, since that's generally
> > discouraged in modern flat trees, but I don't know of a better way to
> > detect a pci bridge, so I guess it's ok.
>=20
> True, but pci, cpu, and memory remain as accepted uses. We'd have to
> define a "pci-bridge" or "pci-bus" compatible to replace it.

Right, that was the conclusion I was coming around to.

> >> +struct bus_type pci_bus_type =3D {
> >> +        .expected_addr_cells =3D 3,
> >> +        .expected_size_cells =3D 2,
> >
> > I'm a bit torn here.  Part of me wants to suggest a 'check_bridge'
> > function which handles this and can also make more subtle checks, but
> > then just the expected cells values will handle nearly all real cases
> > more succinctly.
>=20
> I left them as you had them, but I'm not so sure these are all that
> useful. It works for PCI as the sizes are fixed, but then we could
> just check against fixed values. For simple-bus, we need more
> flexibility because the size could be 1 or 2. For other cases like I2C
> or SPI buses, we know the sizes, but we can't really detect those
> buses.

Hm, ok.  Well how about instead of the expected cells values, we have
two callbacks:  check_bridge() and check_device().   The
check_bridge() callback can check the cells parameters along with
anything else that makes sense.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hABqaeELJqnDDeDE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW/dunAAoJEGw4ysog2bOShJwP/jU5B9M5SXgXbMesp5O2k8Ha
NKBet0kPuTomTN+NIOVOSBrKIyFV/N4ToQ/oKPwTr72giGsfCDrWCtM1ruKfpOid
Ay2xJlJNnhSXiF3MX/thlZ4k3sz5cR8RMPm0julSbbcaqLo8ykWGFVMkKWKZlG9l
MogImc2LoVbQ6XfFbUZY+Ih+Kb6EuFF3nDS5uq4ClX+ATcLroJ7s/TLTxYmbp+Ki
v4aLNMibAAZKXmVR2tv2tRwtM4OuECb5GItT6+NM3V1PQ50nhk+Ji5h+vzPFDxQf
wKrKBOBRf+Ydi7Sc27op78paQzZnCZk7ZLSY/ZHLNe55H/ny+/vGFJNYpnCvcrCR
tWuRGBJ6BIJxZD5zT2G8iHSSAh79CL90ztH6nOaxMl6r8mcWGp/Dl+bJNdlpdaJV
A1LmEZOKRZmYJnVFP53IeU0N9MMgqxlY57izj+E4NptNGC8iSLVHHawGzoC8KHir
9TDXWIjautk73BUD+6gvEBkDuU7jK/jvqssyIQF88/8EaghTRPBqcVRuRVC2rFa3
TbFfkSkiAWE2XyPV01DnP56gnmxeFfTWYxBQ/WJnQ0Naw3y/es7tZ0qSuNI2ET7F
N8Ot4NGbX+8T5/1vRwJ4sS3XHsDZW9gZx+rGOpEAVxfMKY6Enn00q7qXk7OKdo71
JdPuTX9XUG3eipYtDfct
=g4lo
-----END PGP SIGNATURE-----

--hABqaeELJqnDDeDE--
