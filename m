From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] arm: dts: Add support for National Instruments
 Project Sulfur SDRs
Date: Tue, 26 Sep 2017 10:50:18 -0700
Message-ID: <20170926175018.GA14962@tyrael.ni.corp.natinst.com>
References: <20170911232223.91894-1-mdf@kernel.org>
 <314acb1f-1f0f-7893-70a8-9379c01112ac@xilinx.com>
 <20170925161136.GA12943@tyrael.ni.corp.natinst.com>
 <6b87e902-3201-6710-4921-d465dea19dcd@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6b87e902-3201-6710-4921-d465dea19dcd-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Michal,

On Tue, Sep 26, 2017 at 02:54:48PM +0200, Michal Simek wrote:
> Hi,
>=20
> On 25.9.2017 18:11, Moritz Fischer wrote:
> > Hi Michal,
> >=20
> > On Mon, Sep 25, 2017 at 10:19:44AM +0200, Michal Simek wrote:
> >> Hi Moritz
> >>
> >> sorry for delay.
> >=20
> > No problem.
> >=20
> >>
> >> On 12.9.2017 01:22, Moritz Fischer wrote:
> >>> Add support for the National Instruments Project Sulfur SDR
> >>> motherboards Rev 2,3 and 4.
> >>>
> >>> Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>> ---
> >>>  arch/arm/boot/dts/Makefile                |   3 +
> >>>  arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts |  84 +++++++++++++++++++
> >>>  arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts | 118 ++++++++++++++++++++=
++++++
> >>>  arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts |  26 ++++++
> >>>  arch/arm/boot/dts/zynq-ni-sulfur.dtsi     | 133 ++++++++++++++++++++=
++++++++++
> >>>  5 files changed, 364 insertions(+)
> >>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts
> >>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts
> >>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts
> >>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur.dtsi
> >>
> >> Is this publicly available board?
> >=20
> > Will be in Q1 2018 was announced at GRCon'17 ([1]).
> > Some of the Rev3s are currently deployed in Norway as part of a radar
> > system.
> >=20
> >> I am not quite sure we should apply these dts files. There are a lot of
> >> boards with zynq and there must be any strong argument for applying th=
is
> >> to the tree. For arm32 with even flat tree structure.
> >=20
> > What's the issue with merging them, except for having 3 more files?=20
>=20
> For me this is not a problem because on Linux side it is not increasing
> build time.
> I want to see the value for community. All xilinx platforms are
> evaluation generic purpose boards which are showing how to connect stuff
> together.
> On the other hand this is real product.

Uh.

> I would let arm-soc maintainer to decide if this is fine or not. I
> definitely don't want to end up in situation that we will have dts for
> real products which are not bringing any value for others.

Sure, it's the maintainers call.

I do intend to have my customers run mainline on it eventually, currently
I'm a handful of patches away from making that happen. So yes, running
mainline is a usecase that matters to me.

It is one thing to keep bitching about vendor kernels as a community
continuously, but then if someone goes through the effort and actually
tries to run mainline, you give them crap like that above.

Our products usually come with full schematics [1], firmware, fpga code and=
 all
available, I don't know what makes them less useful to the community as a
platform to experiment and develop on than Xilinx eval boards.

There's several people that I know of both hobbyists and companies that
build systems around these platforms, so I don't know ...

- Moritz

[1] http://files.ettus.com/schematics/

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWcxjJBP2M15CncZ7vkIQd6kWqi8FAlnKk1cACgkQvkIQd6kW
qi+8tAf/WCqjgq7ElgkNpVylADcX0h5tTWzu3b08DJ/wN/SLRzKWkkxykgSpAHUD
OaU1RCRxK1rQdeuJQ6dxuVy2uChN/GjX1JL1k7Frs22VD9LAxfsoefToLixD58tg
HYzagirBdo4xlq6zq+ji8Li+ci3e43QbR2hzw6w+Stvzsf125I6nHvEwnSq7VvPR
pg5xTVxmZHzuOWHL0qFyiZ3ZvHLLG1D5YUySktlG8ezIx4kbo8GwHgOnWrVgDG2R
XqRZ5z3x2qz7o5aearDz9LjxdNLkyQVJmliyrqarKDqI/xYi+9zFYJGTf2F89pw+
c7hzZVlYLswfYB4ON9/EN5t6HKtW/Q==
=wHWc
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
