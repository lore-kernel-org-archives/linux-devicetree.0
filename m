From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 03/20] clk: sunxi: tcon-ch1: Do not return a negative
 error in get_parent
Date: Fri, 10 Jun 2016 11:50:15 +0200
Message-ID: <20160610095015.GS5242@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-4-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64GxTFnnx40Jy9Cz9e+c+T2j2QcbFznZ4-Lm-tdHFgcXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mW9eGbZzDIYYWqGs"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64GxTFnnx40Jy9Cz9e+c+T2j2QcbFznZ4-Lm-tdHFgcXg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--mW9eGbZzDIYYWqGs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2016 at 12:05:18AM +0800, Chen-Yu Tsai wrote:
> On Mon, May 16, 2016 at 8:47 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > get_parent is supposed to return an unsigned 8 bit integer, so returning
> > -EINVAL is a bad idea.
> >
> > Remove it.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied,

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--mW9eGbZzDIYYWqGs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWo1XAAoJEBx+YmzsjxAgHpQQAKdgIoBaRhkQeB9CLb+p1f9Y
L4X5VcWtUXuCgECawBNs03aTkoWmE4yR12d+4VHqW5UYvAe5852o8Yqm/L7ejp+h
HhnGRmX3cEzWtN9nTOWIiU+aK4j3iPxQISLxjl0fetmYUQRvSmLiSgUx8eI2gcg0
5SrbbJkhiRrHfeLASeBJk1nxo88KWgEm/SYwf+DB4+D6JFGo83HcXbw9NriJJFBR
aFE3z7BDgW2Ur3/N9ku7wdZcVPijWi0YQa5FWiIsNO2WtTv/eraW6dD5KtlhY0aq
HyUuBBdem76npz3y23PmZf23DgzoMdJRegju3kgso8QFK+uQd3ryumZVMt8htk8Q
88EqSJfoyZhbV5swMdmBYzuvAkhtBYtTjHl7ZixQegGOB52Vw6Z5zKFSloq4Kav2
D+tO7TiwR9zi/sA3p/2ZLngr/W78z1ZZ9wkNrXxj9NE631Q472cPyKoEySuuoU5z
QmgOntgDjI5AEdDFJIMZZALcTSCcDfBpMaHKMdAAqBJdqU5/AFD+4bbtvieCqXHX
mndIws/3mgbo4D7qqBL0hV0p2eJZ+iFLvR5KEnkXYv5fvSkHT5W2ZmS1gCaKzzHG
Vr+/EOW8t5jLoCt5awKVgwEArlFo8heGfZaDlhU1zxiXGBm4FzGBsP8L/QKxy5Fw
SL6eTDJTfgCBF5BoP4EO
=SRsv
-----END PGP SIGNATURE-----

--mW9eGbZzDIYYWqGs--
