Return-Path: <SRS0=JAT3=UQ=gmail.com=thierry.reding@kernel.org>
Date: Mon, 17 Jun 2019 13:26:46 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 27/28] PCI: tegra: Add support for GPIO based PERST#
Message-ID: <20190617112646.GI508@ulmo>
References: <20190604132233.GT16519@ulmo>
 <20190613152404.GB30445@e121166-lin.cambridge.arm.com>
 <cb2dd446-1275-7179-33ac-e5c237d81da6@nvidia.com>
 <20190614143222.GB23116@e121166-lin.cambridge.arm.com>
 <1508173d-0ecc-f498-6ab2-78a718086b35@nvidia.com>
 <20190614145023.GA24588@e121166-lin.cambridge.arm.com>
 <20190614152304.GK15526@ulmo>
 <20190614155934.GA28253@e121166-lin.cambridge.arm.com>
 <51e4ae62-f842-1d2f-fbca-0b2063dd53a6@nvidia.com>
 <20190614165353.GB30511@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tSiBuZsJmMXpnp7T"
Content-Disposition: inline
In-Reply-To: <20190614165353.GB30511@e121166-lin.cambridge.arm.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--tSiBuZsJmMXpnp7T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2019 at 05:53:53PM +0100, Lorenzo Pieralisi wrote:
> On Fri, Jun 14, 2019 at 10:00:49PM +0530, Manikanta Maddireddy wrote:
>=20
> [...]
>=20
> > GPIO based PERST# is per-platform requirement.
> > If DT prop is not present, then devm_gpiod_get_from_of_node() returns
> > NULL gpio_desc.
> >=20
> > struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
> >                                          const char *propname, int inde=
x,
> >                                          enum gpiod_flags dflags,
> >                                          const char *label)
> > {
> >         struct gpio_desc *desc;
> >         unsigned long lflags =3D 0;
> >         enum of_gpio_flags flags;
> >         bool active_low =3D false;
> >         bool single_ended =3D false;
> >         bool open_drain =3D false;
> >         bool transitory =3D false;
> >         int ret;
> >=20
> >         desc =3D of_get_named_gpiod_flags(node, propname,
> >                                         index, &flags);
> >=20
> >         if (!desc || IS_ERR(desc)) {
> > */* If it is not there, just return NULL */****if (PTR_ERR(desc) =3D=3D=
 -ENOENT)****return NULL;*
> >                 return desc;
> >         }
> > 	...
> >=20
> > }
>=20
> Ok. My point then is that you have no way to enforce this requirement on
> platforms that actually need it, I do not even know if there is a
> way you can do it (I was thinking along the lines of using a
> compatible string to detect whether the GPIO #PERST reset is mandatory)
> but maybe this is not even a SOC property.

So this is definitely not an SoC property. From what Manikanta said, the
only reason why we need this is because on one particular design (that
we know of), the PCIe #PERST signal was connected to a pin that does not
originate from the PCIe controller. This happened by accident.

> Maybe what I am asking is overkill, I just wanted to understand.
>=20
> I was just asking a question to understand how you handle the case
> where a GPIO pin definition is missing in DT for a platform that
> actually needs it, the driver will probe but nothing will work.

I think we should handle this the way we handle other GPIOs as well. If
some device requires a GPIO to be toggled to put it into or take it out
of reset, then that's something that needs to be described in DT. In
this case it just so happens that typically we don't need to worry about
it because the signals are properly connected and then the PCIe
controller will do the right with the reset. For the one design where
it doesn't work the reset GPIO is a workaround and it's board-specific
knowledge that the engineer writing the DT will have to know. I suspect
that if the same accident happened on another board, then as part of
writing the DT somebody would have noticed that we need an external pin
to be hooked up because the SFIO doesn't work.

> It would be good to describe this and capture it in the commit log.

Agreed. Let's be more verbose about the situation where this is required
and make it very clear that this is a workaround for a board design
mistake that shouldn't be necessary if best practices are followed.

Maybe add that to both the commit message and the device tree bindings
to make it difficult for people to miss.

Thierry

--tSiBuZsJmMXpnp7T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HePQACgkQ3SOs138+
s6GyRw/+KiNbYezQti1sbqNBOr3ufw6pfbPk7zkFmFTzXPc/OTnSjYc5P1gdCN32
2OuGcnVhkFBRtMl2EIz33HMQN/v/PzbwKZB5qbx4C/jaskFfI9zPpqvrHUVWqq4I
WaIYm/ZHgwb+6pivz0/LFKtXIss11qrf/d/TWKtsgcAhuaTDW96lXjnzhrsZLHg+
16so4UgVtQqMpN6ICm4OZVcRxivJSNkJA2YwwOTCaz1/3KClMWncamM8apY31M4A
DAZReYxAubdOvwFM3UCOAHetsESlgqX1j3uGlxw/UPmwUpAXfoF0SIRVyG6k4AOF
hvAFxzs/WDVZtM+gVsQf6F3rA0nbRSJvLj72QmBEMnPBE+6CdQo3RC41C20ls6zK
CBRPlswy69oUywjWOL+8LqTZl7WPJHDWZFKempXLfG+M3bWYPwgelSnt7CcVgWM5
PbFel61c7nWT2lxzQflgrhp0DZ3dhSYjXUGND54C2A/079gFMpvbRy6WQKhW/soA
uFEHk/C56c4PAy+a5qtVc+CcPLwBsSKq3AHWslrm7h3zSnaUgtAg2+RNfDlc5XYp
M/hEtnrlglnImxm0B69dwEMEfMsWRKLCoRMhqIv2GrT4azyPAWubY9Bhloq5ghc0
mUpQ+oHNScI1yiVt6Of/qo4GJDFtkew0OeF95UugdRj8DltZHCQ=
=EYXc
-----END PGP SIGNATURE-----

--tSiBuZsJmMXpnp7T--
