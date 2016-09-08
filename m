From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 4/8] dts: sun8i-h3: move uart1 pinmux/peripheral
 assocation to DSTI
Date: Thu, 8 Sep 2016 11:01:53 +0200
Message-ID: <20160908090153.GL8913@lukather>
References: <1473235141-12768-1-git-send-email-jorik@kippendief.biz>
 <1473235141-12768-5-git-send-email-jorik@kippendief.biz>
 <20160908062317.GD8913@lukather>
 <20160908080213.GA32547@carbon.kippendief.biz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EEx6GiKZGZ1wKUra"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160908080213.GA32547@carbon.kippendief.biz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorik Jonker <jorik@kippendief.biz>
Cc: wens@csie.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--EEx6GiKZGZ1wKUra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 10:02:13AM +0200, Jorik Jonker wrote:
> Maxime, Chen-Yu: thanks for taking the effort to go through my patches
> again!
>=20
> On Thu, Sep 08, 2016 at 08:23:17AM +0200, Maxime Ripard wrote:
> >On Wed, Sep 07, 2016 at 09:58:57AM +0200, jorik@kippendief.biz wrote:
> >>From: Jorik Jonker <jorik@kippendief.biz>
> >>
> >>Users using this UART without RTS/CTS should override the association in
> >>their board specific DTS. All (1) board using this UART uses RTS/CTS, so
> >>this breaks nothing.
> >
> >Using RTS / CTS is very rare among the boards. Forcing it down the
> >throat of every user doesn't seem like the right thing to do.
>=20
> So, I'm going for a v5, with these changes:
> - rename uart0_pins to uart0_pa_pins (as there could be a pf)
> - associate uart0_pa_pins with uart0 on all H3 board DTS files

Please don't. We use that naming scheme everywhere else. Plus, nothing
prevents any one from using one PF pin and one PA pin.

> - put rts/cts in seperate pinmux sets for uart1 (2,3: see below)
> - associate rx/tx for uart1-3 in H3 DTSI (this is the only option)

I'm still a bit skeptical about this. This wouldn't be in any way
consistant. I prefer to have something consistant and a bit duplicated
over something without any duplication but that confuses everyone
about what should be placed where.

> - associate UART1 rts/cts as pinctrl-1 in sun8i-h3-bananapi-m2-plus
>  (to prevent breakage for existing users)

You can also set it in pinctrl-0.

> I am a bit in doubt if I should include pinmux definitions for the follow=
ing
> things, as Chen-Yu said to only include stuff that is actually used in a
> board:
>=20
> - uart0_pf_pins, since there is no board using it
> - uart{2,3}_rts_cts, as I agree RTS/CTS is a bit exotic

Don't

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--EEx6GiKZGZ1wKUra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0SkBAAoJEBx+YmzsjxAgrncQAJLCBm9g2ki2EPiMYBftW4O1
fngvw0VWgi8ht3LJW3qG6sM+q9M/+HIjjsueI7wP4ahRVQy+E+nB9ql8hP0PLxJn
oicGk6BsLi6tO7qsjDYVkn6E8ZgmBRJz6K9EXwDyo/FCe7PTIH5Fj8IjUvm4nWbQ
BUgrKgkKtkVsbJSR47F12oEv+LVZ+HVRUxsR8QwUxhSR+zuEaYeOk//5vtQPDRiy
uonA41+M37JrureZetZB6yfYATdVrxd+4/teqAvT/ZP/ukZb3RUSqn9DHUI63nwz
t+C4sukSoeIllLhV4GIz1nb5peGmU+DOpLTti+G5J+hrWop6hoUhFXyWvs9IvpUw
U2CVfbOLCZtqY936TzlvkHcbxBIsTYP05/p4mFkDxKSiFM7ja1NhoJ2SpGzj7lNZ
gd6wE9ICYyANIPamPJ6rvXcdJJAiACUueB5Gipg9flPI7yGM1mwuv6huIlSqoSMZ
W6kdIz41dSei1Zhcyy1ORfFs5X8SuIh5J0SbZbfeO2YX8YWI1kcg2pbQHHBSlvUo
QklcCZ7tqNHVw5KE5YTO1kF+HSf/gcB1qtennygGQBwemRw32/g/5UDtBxeo0T7u
hf0VghxOK6SvbZDv14u+3bYkiBtjMRZHMRG122pdn4tihgvlGM7LQSTqM5AeCID7
ENR9DjdvuDD2WA2ualnC
=732B
-----END PGP SIGNATURE-----

--EEx6GiKZGZ1wKUra--
