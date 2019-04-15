Return-Path: <SRS0=lIuD=SR=gmail.com=thierry.reding@kernel.org>
Date: Mon, 15 Apr 2019 13:41:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 12/30] PCI: tegra: Add SW fixup for RAW violations
Message-ID: <20190415114158.GM29254@ulmo>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-13-mmaddireddy@nvidia.com>
 <20190411200121.GQ256045@google.com>
 <f0f02fbd-0217-9c6d-437f-e5212b67bc24@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dp9QYJgVRVEW2bsm"
Content-Disposition: inline
In-Reply-To: <f0f02fbd-0217-9c6d-437f-e5212b67bc24@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--dp9QYJgVRVEW2bsm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2019 at 11:29:35AM +0530, Manikanta Maddireddy wrote:
>=20
> On 12-Apr-19 1:31 AM, Bjorn Helgaas wrote:
> > On Thu, Apr 11, 2019 at 10:33:37PM +0530, Manikanta Maddireddy wrote:
> >> The logic which blocks read requests till AFI gets ACK for all outstan=
ding
> >> MC writes does not behave correctly when number of outstanding write
> >> becomes more than 32 in Tegra124 and 132.
> >>
> >> SW fixup to prevent this issue is to limit outstanding posted writes a=
nd
> >> tweak updateFC timer threshold.
> >>
> >> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> >>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
> >> @@ -2381,6 +2408,7 @@ static const struct tegra_pcie_soc tegra20_pcie =
=3D {
> >>  	.program_uphy =3D true,
> >>  	.update_clamp_threshold =3D false,
> >>  	.program_deskew_time =3D false,
> >> +	.raw_violation_fixup =3D false,
> >>  	.ectl.enable =3D false,
> > It doesn't really matter either way, but you don't *have* to
> > initialize all these flags to "false" since that's the default for
> > uninitialized fields in static structs like these.  If you left them
> > out, the structs would only contain the "true" items, and it'd be
> > easier to see what's special about each SoC.
>=20
> SoC flags are explicitly set false if not supported, I am following
> same existing coding style in this driver. Maybe the intention here is
> to convey what is not supported by a particular SoC without going
> through soc struct definition.

Yes, this was originally done on purpose. I think it's good to follow
the existing convention, unless Bjorn feels strongly about it.

Thierry

--dp9QYJgVRVEW2bsm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0bgYACgkQ3SOs138+
s6EuxA/8CElhyVIEEYlUr3ygK9jLIkAtJAYz4cO+zezAtUJy/lIReo+vtatEBQd5
3mZMJwBBZCGj9C5i9uliWYfpOwgznw9qEZ+l3wQo5usk9AaU8S9WJiziM4QlZNXM
Rs4lHZJjd1dT9xtE1Po5vftawZXBpk4OWCDIM4dRUqcYMBWD8EqymDrrX1KnUdF/
u8o//U3tOc+NnakhsAZLXg+Y9hzqUqXZv49/gUvvXHJ6pdIEa0LKRTqs2c9HdtGS
KgF/65ik6Fjc/KKUcLNNKM4tugqvg3i8cUupx5Snu9RRcGOIAJLPd6JGMdBXvWVU
e38ADSBAw3TEkolaexRIl40RZ84RU/SDpfYyWSNzrvWw0gjricz1nrX1QCeyMdno
qek07jTZc3CJo+ExmHWH55mRBy25JeuxHbcUv+vNKKOxu7fQVaxhkR+dQDDTDjiq
zgKgN73uGUmUmDiXKJ2hQOtpgfrjkkWHrpZ2lz0Wa0vL/7qGqTI9KOj4f3J72zSt
MXurG2ZZB0KJaQf39E5ngVLVeDgFgZB7KQeX5x8uD8Flyhdu2a/VTYe2AZR4FV1w
RQJRpb/rB7RDi7KJv+plN9O34gbdoLq6byyEWt6DVi8dHMybzPAFcuElSsTTuygt
ZMi90WZjkHUh4Q0Zdap/mvFFlvFyQOltov/9psEvAYdfkSDxPVs=
=fWHS
-----END PGP SIGNATURE-----

--dp9QYJgVRVEW2bsm--
