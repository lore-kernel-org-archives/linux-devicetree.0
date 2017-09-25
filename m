From: Moritz Fischer <mdf@kernel.org>
Subject: Re: [PATCH 1/2] arm: dts: Add support for National Instruments
 Project Sulfur SDRs
Date: Mon, 25 Sep 2017 09:11:36 -0700
Message-ID: <20170925161136.GA12943@tyrael.ni.corp.natinst.com>
References: <20170911232223.91894-1-mdf@kernel.org>
 <314acb1f-1f0f-7893-70a8-9379c01112ac@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <314acb1f-1f0f-7893-70a8-9379c01112ac@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Moritz Fischer <mdf@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, gregkh@linuxfoundation.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Mon, Sep 25, 2017 at 10:19:44AM +0200, Michal Simek wrote:
> Hi Moritz
>=20
> sorry for delay.

No problem.

>=20
> On 12.9.2017 01:22, Moritz Fischer wrote:
> > Add support for the National Instruments Project Sulfur SDR
> > motherboards Rev 2,3 and 4.
> >=20
> > Signed-off-by: Moritz Fischer <mdf@kernel.org>
> > ---
> >  arch/arm/boot/dts/Makefile                |   3 +
> >  arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts |  84 +++++++++++++++++++
> >  arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts | 118 ++++++++++++++++++++++=
++++
> >  arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts |  26 ++++++
> >  arch/arm/boot/dts/zynq-ni-sulfur.dtsi     | 133 ++++++++++++++++++++++=
++++++++
> >  5 files changed, 364 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts
> >  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts
> >  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts
> >  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur.dtsi
>=20
> Is this publicly available board?

Will be in Q1 2018 was announced at GRCon'17 ([1]).
Some of the Rev3s are currently deployed in Norway as part of a radar
system.

> I am not quite sure we should apply these dts files. There are a lot of
> boards with zynq and there must be any strong argument for applying this
> to the tree. For arm32 with even flat tree structure.

What's the issue with merging them, except for having 3 more files?=20

> Arnd: Do you have any policy about it?
>=20
> Thanks,
> Michal

Thanks,

Moritz

[1] https://drive.google.com/file/d/0B-CV_07uSBIuODc5bmV2QXhnODA/view

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWcxjJBP2M15CncZ7vkIQd6kWqi8FAlnJKrQACgkQvkIQd6kW
qi+InQgAyzdK63z7KCX7H8xuUxEuuK9PKzqSjsnfwJAUcR3nOKJegeBxqGduTsxp
dqJ7EQF31V+x+m4eMzUCxNpVXPoAFrgQI7cQ33cYfgYq4B+cXA6o3G3h9zfXHeIV
058t+Yak1R0isucahoJ3IOTki8PT70kjoVyG2H5rfzZJa39Pnd5XmO5zmXjTchfC
A2JX7QK8hYlqLajIZEsTd9v4wPiU5C7KmuyyR2G9joytW01RAWoKfLK1r9hRhuZN
2l1m+C5tDRPgvT5FOftxiYcNqQizE1/zo8stQ1YJhfU5ukDDANHFeV2UPRJIbdlw
YAxrYZ5KraNKijh3BggBafj6Vqkz6w==
=ghr7
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
