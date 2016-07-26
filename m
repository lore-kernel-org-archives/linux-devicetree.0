From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate
 application method
Date: Tue, 26 Jul 2016 08:32:53 +0200
Message-ID: <20160726063253.GW7419@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com>
 <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160721094852.GI5993@lukather>
 <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5FFaGRZUwcpbKFrw"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Cc: dev@linux-sunxi.org, linux-arm-kernel@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--5FFaGRZUwcpbKFrw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2016 at 11:52:15AM +0200, Ond=C5=99ej Jirman wrote:
> >>> If so, then yes, trying to switch to the 24MHz oscillator before
> >>> applying the factors, and then switching back when the PLL is stable
> >>> would be a nice solution.
> >>>
> >>> I just checked, and all the SoCs we've had so far have that
> >>> possibility, so if it works, for now, I'd like to stick to that.
> >>
> >> It would need to be tested. U-boot does the change only once, while the
> >> kernel would be doing it all the time and between various frequencies
> >> and PLL settings. So the issues may show up with this solution too.
> >=20
> > That would have the benefit of being quite easy to document, not be a
> > huge amount of code and it would work on all the CPUs PLLs we have so
> > far, so still, a pretty big win. If it doesn't, of course, we don't
> > really have the choice.
>=20
> It's probably more code though. It has to access different register from
> the one that is already defined in dts, which would add a lot of code
> and require dts changes. The original patch I sent is simpler than that.

Why?

You can use container_of to retrieve the parent structure of the clock
notifier, and then you get a ccu_common structure pointer, with the
CCU base address, the clock register, its lock, etc.

Look at what is done in drivers/clk/meson/clk-cpu.c. It's like 20 LoC.

I don't really get why anything should be changed in the DT, or why it
would add a lot of code. Or maybe we're not talking about the same
thing?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--5FFaGRZUwcpbKFrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXlwQVAAoJEBx+YmzsjxAg/8EP/ipA+WJ9Z8ChTI5DhyyqF2j9
0kaCZyc/mpfHUpzm2FM01UpHXkYt2+vaMPWpPJcjInkAxS/hhRb2yoZW1pOpRWQD
3z8cpYZTUkT5kCLWRiLdocvlh+KlWiw1Qq82KpsgWuFYmWR1W8nKgKfhlTPM4+lv
7x1b5zzbcRO244xkgAEM0YzrmM0Vi5aZNaByhP8MwDqWOB7BHYEJ5+S6iqC9sruX
i8uT0pX+cYEhCs9leiG4UNgHW0v17YVqQiBCS4SJ5vYfdGi36K/0WU+IjRTiMHAb
jDIt+pcCL74De83B/onoWjOUN7HYB9rxm5dzH7b0Ny8vE7ZS0AX9X8+wQW8+J9SH
7d97BQssv+FwnTLgv4/1s/qMi1CR9QnxuaC9dzQIFstbd6WYkFhrOZUcIfMs+nRY
dAX8r6YdW2GUU9s6A1DQEik8U7N5gVLCShImUi7OETgtBH+dh5bT4syhRFoZhsgX
3jdVC1wl7FqZaj9F/DVd8HWYI19vlNNSM9bmHjdyn2AOaa27rLVXN3BHStVUqeuL
Gkh3/oSBA2132r7RYR6gj1x+6bvthkGQWGyUMgrl+DvZICmklZGN6CiShLfJ0Piz
5zYB1N+6u1sScfrr+EE4L9dEazXAeY0qNEmSLkCdwUfqqte/5Shkx3jOCzM9JelN
z8umqeIqAZMEG8P8h5fY
=Spuj
-----END PGP SIGNATURE-----

--5FFaGRZUwcpbKFrw--
