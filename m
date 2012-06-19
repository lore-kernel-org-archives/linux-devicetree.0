From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH] leds: Add DT support for leds-pca9532
Date: Tue, 19 Jun 2012 08:16:06 +0200
Message-ID: <20120619061606.GA32193@avionic-0098.mockup.avionic-design.de>
References: <1339855851-9171-1-git-send-email-stigge@antcom.de>
 <4FDCA0FC.5000409@wwwdotorg.org>
 <4FDDC4A9.1040706@antcom.de>
 <4FDE1BCF.60109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FDE1BCF.60109@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Roland Stigge <stigge@antcom.de>, riku.voipio@iki.fi, bryan.wu@canonical.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, aletes.xgr@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 17, 2012 at 12:02:55PM -0600, Stephen Warren wrote:
> On 06/17/2012 05:51 AM, Roland Stigge wrote:
> > Hi,
> >=20
> > On 16/06/12 17:06, Stephen Warren wrote:
> >>> +- nxp,typecodes: groups of 2 bits for each of the 16 pins:
> >>> +  0: None
> >>> +  1: LED
> >>> +  2: Beep
> >>> +  3: GPIO
> >>> +- nxp,statecodes: groups of 2 bits for each of the 16 pins:
> >>> +  0: off
> >>> +  1: on
> >>> +  2: pwm0
> >>> +  3: pwm1
> >>> +
> >>> +Optional properties:
> >>> +- nxp,psc: array of 2 numbers: PSC values for the two PWM channels (=
see datasheet)
> >>> +- nxp,pwm: array of 2 numbers: PWM values for the two PWM channels (=
see datasheet)
> >>
> >> Shouldn't that all be exposed using a combination of the pinctrl
> >> bindings that are in 3.5, and the PWM bindings that should be coming i=
n 3.6?
> >=20
> > Thanks for the note! I found a pwm tree that should have this at
> >=20
> > http://gitorious.org/linux-pwm/linux-pwm
> >=20
> > but it gives me server errors. Is there a place where I can have a look?
>=20
> That URL (with http:// replace with git://) did work for me. It seemed a
> little slow at first, but did work without issue. I Cc'd Thierry in case
> there's any other location available.

There isn't. IIRC, back when I finalized the PWM subsystem during the last
cycle, Arnd Bergmann suggested that I request an account and repository on
kernel.org back when the subsystem was ready. At the time I didn't think
it necessary, but reading this, perhaps it wouldn't be such a bad idea.
kernel.org should have better availability than gitorious.

Thierry

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/gGSYACgkQZ+BJyKLjJp9VdgCfSGX+hZg+s6/mvrGolU1Y6Ero
ij8AoKJMlCIBUDPmt54EyZg6fI8OsLze
=3irR
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
