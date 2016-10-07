From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 7/9] ARM: sunxi: Remove useless allwinner,drive property
Date: Fri, 7 Oct 2016 11:11:22 +0200
Message-ID: <20161007091122.GN4684@lukather>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
 <01cd77ccced851276fcb3625b3d7805f5260fb59.1475489558.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65SmZqR-MJgNxa0RGUYyWgeLHQcQfa0b8U0XiEtp+RfBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XBg9NAhDNArbJUtw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65SmZqR-MJgNxa0RGUYyWgeLHQcQfa0b8U0XiEtp+RfBg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--XBg9NAhDNArbJUtw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2016 at 10:34:39AM +0800, Chen-Yu Tsai wrote:
> On Mon, Oct 3, 2016 at 6:21 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The allwinner,drive property set to 10mA was really considered as our
> > default. Remove all those properties entirely to make that obvious.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Did you use sed or some other scripting tool to do this patch?
> Including the command should make it easier to verify the result,
> instead of having to go through the 93 files here.

Yeah, I used some dumb sed commands.

Unfortunately, it disappeared from my history, but given my sed-fu, it
was pretty trivial, just a succession of
sed -i 'd/SUN4I_PINCTRL_10_MA' *.dtsi

Something along those lines, and pretty much the same thing for the
next patches.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--XBg9NAhDNArbJUtw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX92a6AAoJEBx+YmzsjxAgolAQAJ+jqMxPxUQNBwhMh+fvR6wg
SYrKRL1FVm4oo26apN8GkC9lG/4KEljco3LZSIIUOgLCxZeQV/ZCOtDIaG4Co+K1
/Ar4fGgonzIzPvliCsIERvEzRrYh2+jUOag8+rJGAXu6g8lZb+N40YKrRHyAtmsS
Xe+SmSklrjlplnqjPqcwt/6DDHq64x/7n6PFqFqc81EFzHjgsZLqcVWXVE7cIJ9g
ullUohwPh3EyC+SZa3gUtyTA+iyURU5htahDMZhwk8tNJLfbkvQml/YaORiVXcPW
yK+TcRllmtD4xKkPGdzdRlTMZeykoYmAG6HMNIpqcydSqoCN/ERDcqhbo0ZpPUZo
8v8j8wG+cgH/4plD5QSWQq0bDhZ0xCW5HN5GcsQ2XI/k7mDlRgPyBp4JfNmxWUXJ
CtxwXb+W1oCEPwonrwAk+1W6zx/G3RRd3W0bQ8mUMfPTK7heuidiJk8vT0mahRo5
G/gKJsvKebjbpB9xj/eB+4Wq8MZT0GYTONQ4ujTNmG/KkcCkFNxXP0Pw19B0fllj
tGQDkexmfDftBsVCnkAxAD57o7u57eUIBBmTXyHPCMgAUxN4+NPSVGmmlz8/J9Xx
Bm3qLFy/sqL5RvNHfWc4ZkpvBIwA8YXItt/aNK+gs50Qmtz9fbZBmxxJDXqXxW2t
E918utc8M4BEy2OIFhxK
=+rJa
-----END PGP SIGNATURE-----

--XBg9NAhDNArbJUtw--
