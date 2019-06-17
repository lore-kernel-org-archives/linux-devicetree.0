Return-Path: <SRS0=JAT3=UQ=gmail.com=thierry.reding@kernel.org>
Date: Mon, 17 Jun 2019 13:29:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 27/28] PCI: tegra: Add support for GPIO based PERST#
Message-ID: <20190617112915.GJ508@ulmo>
References: <20190613152404.GB30445@e121166-lin.cambridge.arm.com>
 <cb2dd446-1275-7179-33ac-e5c237d81da6@nvidia.com>
 <20190614143222.GB23116@e121166-lin.cambridge.arm.com>
 <1508173d-0ecc-f498-6ab2-78a718086b35@nvidia.com>
 <20190614145023.GA24588@e121166-lin.cambridge.arm.com>
 <20190614152304.GK15526@ulmo>
 <20190614155934.GA28253@e121166-lin.cambridge.arm.com>
 <51e4ae62-f842-1d2f-fbca-0b2063dd53a6@nvidia.com>
 <20190614165353.GB30511@e121166-lin.cambridge.arm.com>
 <1c662f82-8329-5e1b-58bf-b2fe1643adb0@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oplxJGu+Ee5xywIT"
Content-Disposition: inline
In-Reply-To: <1c662f82-8329-5e1b-58bf-b2fe1643adb0@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--oplxJGu+Ee5xywIT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 10:53:13PM +0530, Manikanta Maddireddy wrote:
>=20
>=20
> On 14-Jun-19 10:23 PM, Lorenzo Pieralisi wrote:
> > On Fri, Jun 14, 2019 at 10:00:49PM +0530, Manikanta Maddireddy wrote:
> >
> > [...]
> >
> >> GPIO based PERST# is per-platform requirement.
> >> If DT prop is not present, then devm_gpiod_get_from_of_node() returns
> >> NULL gpio_desc.
> >>
> >> struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
> >>                                          const char *propname, int ind=
ex,
> >>                                          enum gpiod_flags dflags,
> >>                                          const char *label)
> >> {
> >>         struct gpio_desc *desc;
> >>         unsigned long lflags =3D 0;
> >>         enum of_gpio_flags flags;
> >>         bool active_low =3D false;
> >>         bool single_ended =3D false;
> >>         bool open_drain =3D false;
> >>         bool transitory =3D false;
> >>         int ret;
> >>
> >>         desc =3D of_get_named_gpiod_flags(node, propname,
> >>                                         index, &flags);
> >>
> >>         if (!desc || IS_ERR(desc)) {
> >> */* If it is not there, just return NULL */****if (PTR_ERR(desc) =3D=
=3D -ENOENT)****return NULL;*
> >>                 return desc;
> >>         }
> >> 	...
> >>
> >> }
> > Ok. My point then is that you have no way to enforce this requirement on
> > platforms that actually need it, I do not even know if there is a
> > way you can do it (I was thinking along the lines of using a
> > compatible string to detect whether the GPIO #PERST reset is mandatory)
> > but maybe this is not even a SOC property.
> >
> > Maybe what I am asking is overkill, I just wanted to understand.
> >
> > I was just asking a question to understand how you handle the case
> > where a GPIO pin definition is missing in DT for a platform that
> > actually needs it, the driver will probe but nothing will work.
> >
> > It would be good to describe this and capture it in the commit log.
> >
> > Thanks,
> > Lorenzo
>=20
> I can't think of a easy way to enforce this requirement. As you said
> compatible string is per SOC, so we can't use it for a platform.
> This issue is present on only one platform, so it is hard to miss the
> DT property. That is the reason for publishing this patch with out this
> enforcement in driver.
>=20
> I thought for changing PERST# to GPIO for all platform, but testing is
> a tedious job. Also I don't have Tegra20 and Tegra30 platforms.

Yeah, let's not go that way. The standard way to do this is to use the
SFIO and let the PCIe controller and driver handle this. It's working
just fine on all platforms currently supported upstream. Using direct
GPIO for PERST# is a workaround, so let's not proliferate unless it is
absolutely necessary.

With an updated commit message, this is:

Acked-by: Thierry Reding <treding@nvidia.com>

--oplxJGu+Ee5xywIT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HeYoACgkQ3SOs138+
s6G0nRAAgKnFuXyJDoo/u5v4QZYdt2+LjR6wTQy8xKnpzWKMfreKOPGz9QR1IdUa
StL8QnOskvVuh1O/4B6ZFwvvMRiUQoq6mte3+4IpWi3MaU6a/epy0N+735ZVDPgZ
fKWYwOoD3o5JopBYFebaV5IhoHH7/6q2tBNpJkucCqfCcqPpqYRzdEWKG+i37ziX
WFyN36SUZUfgqsZWXVRoB5phzhR5VphAtbKLWCTI+ArfZoWm6q3nBxohR9JqkgA4
xfPdH462j7X7hR8TSYaCD4f0jNBoTy57DWqKJJIiSHsGLVCRgQZRKsmNUq+PvPrY
2hb/XwV3HBnv/FkVAWg/ucfUbqHiBwLXQIURyy356myw9A7odL0eT1MaDLgBAL2s
DtNwScb89tURkjOtqVxmsA6Er+WKMY3JkZVmstHbC5721x8aXBIKg5aORa6C7qLb
yiX93VVaXn3rdBJrFY7yJFf6AO5WsALLCaNJA7pPXl09El9Ot8SpgtkzZL2pE1va
iCy4xvpksM0U3RXqWr7w+WJ1GEoFiYZ5CBiixrW1hjOr9wX7bDzbd4msKpN8ZEVZ
dHP8spkCroHrV2Aqi4JxXsLGZkWFL4Blb+Bo0pqMEFquqm4gbC6KuHR6mxOdUp4v
399gKcAandmaSpmH5Dj2T2AmKzHdtIga+lgCIAjZ+swD8ti69aU=
=7qvv
-----END PGP SIGNATURE-----

--oplxJGu+Ee5xywIT--
