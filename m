From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATVH v2 0/4] arm64: dts: allwinner: h6: Enable CPU
Date: Mon, 18 Feb 2019 09:46:24 +0100
Message-ID: <20190218084624.qmv4wavag4uymvrf@flea>
References: <20190215134937.10259-1-tiny.windzz@gmail.com>
 <20190215151357.noovkx3r6ia4boag@flea>
 <CAEExFWs2VuOpZu=Mw221Gp3RDbw=Q24eh8Y=pWdfh-c+mPvwuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vd75snmr6a42d2ox"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEExFWs2VuOpZu=Mw221Gp3RDbw=Q24eh8Y=pWdfh-c+mPvwuw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Lee <tiny.windzz@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, robh+dt@kernel.org, mark.rutland@arm.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--vd75snmr6a42d2ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 15, 2019 at 11:35:20PM +0800, Frank Lee wrote:
> On Fri, Feb 15, 2019 at 11:13 PM Maxime Ripard
> <maxime.ripard@bootlin.com> wrote:
> >
> > On Fri, Feb 15, 2019 at 08:49:33AM -0500, Yangtao Li wrote:
> > > Add the cpufreq support of h6, source of information is as follows.
> > >
> > > h6 cpu opp info:
> > > https://github.com/Allwinner-Homlet/H6-BSP4.9-linux/blob/master/arch/=
arm64/boot/dts/sunxi/sun50iw6p1.dtsi
> > >
> > > axp805 spec:
> > > http://linux-sunxi.org/images/b/bc/AXP805_Datasheet_V1.0_en.pdf
> >
> > Was that tested on the two H6 boards this time?
>
> I tested two boards for about two hours.

How did you test it?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--vd75snmr6a42d2ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXGpw4AAKCRDj7w1vZxhR
xbwFAQCJqNtKoCeGw9tRc81u7tcH5VqkkQkk0iVMDl1/nfnXxwD/f5a37BMO/YWd
UG1fZ+OOS0sBayfIjZQoG/Yo/8dl2gM=
=G4JI
-----END PGP SIGNATURE-----

--vd75snmr6a42d2ox--
