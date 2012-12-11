From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: Re: Re: [PATCH v3 1/4] leds: leds-pwm: Convert to use
 devm_get_pwm
Date: Tue, 11 Dec 2012 10:31:00 +0100
Message-ID: <20121211093100.GA8437@avionic-0098.adnet.avionic-design.de>
References: <1355133637-2784-1-git-send-email-peter.ujfalusi@ti.com>
 <3193669.Hv54bBklsP@barack>
 <20121211083632.GC27084@avionic-0098.adnet.avionic-design.de>
 <1406670.ryvqfkiNXS@barack>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1406670.ryvqfkiNXS@barack>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2012 at 09:57:51AM +0100, Peter Ujfalusi wrote:
> On Tuesday 11 December 2012 09:36:35 Thierry Reding wrote:
> > > > The commit message says that legacy mode is used as fallback if
> > > > devm_get_pwm() (that should really be devm_pwm_get() btw) fails but=
 I
> > > > don't see where pwm_request() is called.
> > >=20
> > > Oh, true. The fallback has been removed based on earlier comment from
> > > Bryan
> > > Wu. I will correct the commit message.
> >=20
> > I'm not so sure that's a good idea. After all there may still be users
> > who rely on the legacy behaviour.
>=20
> The only user of leds_pwm is arch/arm/mach-omap2/board-4430sdp.c. Even th=
at is=20
> not working because it uses wrong ID number to request the pwm.
> The legacy request type needs the id number of the PWM it want to use. Bu=
t if=20
> you have multiple PWM devices there is not way to guess the ID for the PW=
M.=20
> Using the pwm_get() along with pwm_lookup is the only way to get thing=20
> working.
> For example with twl4030 we have 2 PWM chips, both provides 2 PWMs. The I=
D=20
> number of the PWMs will depend on the load order of the drivers. If they =
are=20
> built in they are going to be in the same order most of the time, but if =
they=20
> are modules they can be loaded in different order.
>=20
> I think we should not use fallback in leds-pwm to avoid new boards to use=
 the=20
> legacy API.

Okay, if there are no intree users that may be broken, then it should be
fine to remove it. In that case you might want to remove the pwm_id
field as well instead of deprecating it in this patch.

Thierry

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQxv1UAAoJEN0jrNd/PrOhGT0P/0n5z88euHjCi/LqHQ8V6iKC
ScHfygum4ETxbEOtOcOZ/mWyV4RGU7mgSivY7VZItLP5wzFIDCwcM8qlHk7aP2Qb
nq+2u71hzieku2WJX11zKHVhb/9/OnCJvDxJ6EBcA1CX7vTgL+tqMG5bJojkrc+Q
Ww/G6pIBU9oHDel8mQ4fJYIvbNa+vzZKC4iZlUIkwOKb/tBciYbhs2TKEzljtFv1
360b/fJ5Tdwx6yGFnDsJMko2PPkIVRW9/5hgriQlxml9D1WXVRwjMrx2KWZFGOvB
wQBmfyEQaRoYFrZ2kiZRQ62vRqC8UU2cuDn6NNrqn3ugseebPisTFdkftxHSCl2D
upXtaIoPoVLv1+i404JQ98kmX0/Y8Jph46WNZ+obVg0UIEBiHrvr4Kqt5raVTfnX
wXtG2FRPAtxNWK0U7n6pYL1GQ4yU18nIH2jdk8QwVuuSWP4atp/fKlufmtdu3uaj
yEMgHFMmJgpo4v5w7JUXbqMAqEtr2hAsMVVwVOIpPHpVjVxBXBhOMalkFkhamVy4
VSmlfXLkkBnr6ZSV4iytsLPnTL0VeCIbVhFik92RmD9DCQFd9NvygXAMNp2D+JyK
s/WT3kMLBl0Jbzr5c1nKV/tejuybK/xVKgyT1BqXf4FrtSpAcncL1NSEeHoXQchm
s9ThuEUNmau27zpVPslE
=ylkN
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
