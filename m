From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] arm: dts: Add support for National Instruments
 Project Sulfur SDRs
Date: Fri, 6 Oct 2017 09:18:08 -0700
Message-ID: <20171006161808.GA14871@tyrael.ni.corp.natinst.com>
References: <20170911232223.91894-1-mdf@kernel.org>
 <314acb1f-1f0f-7893-70a8-9379c01112ac@xilinx.com>
 <20170925161136.GA12943@tyrael.ni.corp.natinst.com>
 <6b87e902-3201-6710-4921-d465dea19dcd@xilinx.com>
 <20170926175018.GA14962@tyrael.ni.corp.natinst.com>
 <dfb517fe-8584-2a1a-22e5-946980cc9644@balister.org>
 <a606ab17-6fb9-2ce1-3b3b-5a2e72d3fc7c@xilinx.com>
 <3b41cfc0-08b7-853d-3439-7f9848d04d3c@balister.org>
 <58fe4e6c-8765-bd9a-0698-8f8326f95e40@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <58fe4e6c-8765-bd9a-0698-8f8326f95e40-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Philip Balister <philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2017 at 01:49:44PM +0200, Michal Simek wrote:
> On 26.9.2017 20:15, Philip Balister wrote:
> > On 09/26/2017 02:06 PM, Michal Simek wrote:
> >> On 26.9.2017 19:58, Philip Balister wrote:
> >>> On 09/26/2017 01:50 PM, Moritz Fischer wrote:
> >>>> Michal,
> >>>>
> >>>> On Tue, Sep 26, 2017 at 02:54:48PM +0200, Michal Simek wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On 25.9.2017 18:11, Moritz Fischer wrote:
> >>>>>> Hi Michal,
> >>>>>>
> >>>>>> On Mon, Sep 25, 2017 at 10:19:44AM +0200, Michal Simek wrote:
> >>>>>>> Hi Moritz
> >>>>>>>
> >>>>>>> sorry for delay.
> >>>>>>
> >>>>>> No problem.
> >>>>>>
> >>>>>>>
> >>>>>>> On 12.9.2017 01:22, Moritz Fischer wrote:
> >>>>>>>> Add support for the National Instruments Project Sulfur SDR
> >>>>>>>> motherboards Rev 2,3 and 4.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>>>>>>> ---
> >>>>>>>>  arch/arm/boot/dts/Makefile                |   3 +
> >>>>>>>>  arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts |  84 +++++++++++++++=
++++
> >>>>>>>>  arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts | 118 +++++++++++++++=
+++++++++++
> >>>>>>>>  arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts |  26 ++++++
> >>>>>>>>  arch/arm/boot/dts/zynq-ni-sulfur.dtsi     | 133 +++++++++++++++=
+++++++++++++++
> >>>>>>>>  5 files changed, 364 insertions(+)
> >>>>>>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev2.dts
> >>>>>>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev3.dts
> >>>>>>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur-rev4.dts
> >>>>>>>>  create mode 100644 arch/arm/boot/dts/zynq-ni-sulfur.dtsi
> >>>>>>>
> >>>>>>> Is this publicly available board?
> >>>>>>
> >>>>>> Will be in Q1 2018 was announced at GRCon'17 ([1]).
> >>>>>> Some of the Rev3s are currently deployed in Norway as part of a ra=
dar
> >>>>>> system.
> >>>>>>
> >>>>>>> I am not quite sure we should apply these dts files. There are a =
lot of
> >>>>>>> boards with zynq and there must be any strong argument for applyi=
ng this
> >>>>>>> to the tree. For arm32 with even flat tree structure.
> >>>>>>
> >>>>>> What's the issue with merging them, except for having 3 more files=
?=20
> >>>>>
> >>>>> For me this is not a problem because on Linux side it is not increa=
sing
> >>>>> build time.
> >>>>> I want to see the value for community. All xilinx platforms are
> >>>>> evaluation generic purpose boards which are showing how to connect =
stuff
> >>>>> together.
> >>>>> On the other hand this is real product.
> >>>>
> >>>> Uh.
> >>>>
> >>>>> I would let arm-soc maintainer to decide if this is fine or not. I
> >>>>> definitely don't want to end up in situation that we will have dts =
for
> >>>>> real products which are not bringing any value for others.
> >>>>
> >>>> Sure, it's the maintainers call.
> >>>>
> >>>> I do intend to have my customers run mainline on it eventually, curr=
ently
> >>>> I'm a handful of patches away from making that happen. So yes, runni=
ng
> >>>> mainline is a usecase that matters to me.
> >>>>
> >>>> It is one thing to keep bitching about vendor kernels as a community
> >>>> continuously, but then if someone goes through the effort and actual=
ly
> >>>> tries to run mainline, you give them crap like that above.
> >>>>
> >>>> Our products usually come with full schematics [1], firmware, fpga c=
ode and all
> >>>> available, I don't know what makes them less useful to the community=
 as a
> >>>> platform to experiment and develop on than Xilinx eval boards.
> >>>>
> >>>> There's several people that I know of both hobbyists and companies t=
hat
> >>>> build systems around these platforms, so I don't know ...
> >>>
> >>> I expect this product to be delivered with full source and a mainline
> >>> kernel, so lets make it easy for Moritz to do the right thing here. T=
his
> >>> makes long term support of this product much easier.
> >>>
> >>> Acked-by: Philip Balister <philip-7I+KllWURj5BDgjK7y7TUQ@public.gmane.org>
> >>
> >> I think this is the right way to go. Get ACK from Arnd or Olof or Kevin
> >> and I will merge this.
> >> I am simply just afraid that if a lot of zynq customers will ask for it
> >> we can will end up with a lot of zynq/zynqmp based dts files in the
> >> kernel and arm-soc guys will stop this that it is simply too much and
> >> won't accept +1 case.
> >=20
> > I share the same concerns. Unfortunately, there doesn't seem like any
> > other structured way to manage dts files.
> >=20
> > As an OpenEmbedded guy, I know I can carry them with BSP's, but not
> > everyone uses OpenEmbedded. I'd love to see a long term scalable
> > solution for tracking dts files, but that is outside the scope of
> > Moritz's request.
>=20
> Are you guys coming to ELCE? There will be Devicetree Workshop which
> will be good place to talk about this.

Yeah, it's on Thursday, right?

- Moritz

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEWcxjJBP2M15CncZ7vkIQd6kWqi8FAlnXrLwACgkQvkIQd6kW
qi8jMwgA2DDlgoejKzJfTCUor73DQR7gaM6UKfPWS08w2znBWMTLTO6e3B0+/QAL
9EESyQXjYM0HCDBOFRSmNigl0V4n/SaGLwVValoM3DdPX+udCsBQQD4Prp3U704l
meXrTG0YQeDbLKPG41wzlP0eo6a/3elbXKw7L3Ah8PoH1e3kbtOQ8Rj1Cdbp+GAQ
5eYmwXXZVHhurAQHulC5dg1ZTLnqFWt61G5FbU0wBGRKxPhZUic8z0XgpXxEt3XL
0qAMMEvs6HefcWiH+4aJtXYnUSgNWHI/BT0H7XgCR4wscQ7PJrf7R09P3gZTK3lJ
+h8DEuDwbJn4cKz1Q0tWdr14Yb6/Jg==
=ls8O
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
