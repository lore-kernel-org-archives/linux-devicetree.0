From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 6/7] clk: sunxi-ng: Add A23 CCU
Date: Thu, 8 Sep 2016 11:20:24 +0200
Message-ID: <20160908092024.GM8913@lukather>
References: <20160906121837.7517-1-maxime.ripard@free-electrons.com>
 <20160906121837.7517-7-maxime.ripard@free-electrons.com>
 <CAGb2v64jDTWB4faaBdCBCcFrt1WNf=PYwc16kpgsUhaMRudHnQ@mail.gmail.com>
 <20160908082939.GJ8913@lukather>
 <CAGb2v64JhY7KoaxGkpeGinLZ2GoYWyDj+UjE_JwLW_4sVYd_9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zROEGoKAXsG5UqGB"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64JhY7KoaxGkpeGinLZ2GoYWyDj+UjE_JwLW_4sVYd_9w@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org


--zROEGoKAXsG5UqGB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 04:32:25PM +0800, Chen-Yu Tsai wrote:
> On Thu, Sep 8, 2016 at 4:29 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Wed, Sep 07, 2016 at 03:24:11PM +0800, Chen-Yu Tsai wrote:
> >> > +               [CLK_BUS_MSGBOX]        =3D &bus_msgbox_clk.common.h=
w,
> >>
> >> A23 manual and Allwinner sources say there is a bus gate for SPINLOCK.
> >> Tested it myself, and it indeed exists.
> >
> > Yes, sorry. It was supposed to be spinlock instead of msgbox.
> >
> >> > +       [RST_BUS_SPINLOCK]      =3D  { 0x2c4, BIT(22) },
> >>
> >> Allwinner sources say there is a reset control for MSGBOX.
> >> Tested it myself, and it indeed exists.
> >
> > However, the msgbox is mentionned nowhere in the datasheet.
> >
> > I'd prefer to be able to test that it actually works before adding it
> > to the clock driver.
>=20
> I did in fact test it. With reset asserted, writes get ignored,
> and reads produce all 0s. With the reset deasserted and clock
> enabled, reads give the default value and writes stick. Afterwards
> when I toggle the reset, the values revert to the default.

Ok.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zROEGoKAXsG5UqGB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0S1YAAoJEBx+YmzsjxAgXAYP/jzUSAfOuCqc41/KtxjhF4x+
LJRqSqzyo4dRaEA74kOIFh7nCy3v9J+RBztCO01EHvxWPMS6hVmYUD2swoZU67zU
wpmKLDneaBSvHWX+nc43Vfdl6IAsuymIkEZTyLt6Z82blPRJC1yD3WfgzuUmynDi
s4lhBVUSNye8xOWTYyRpsNZaD1oXky1L110kR75O4SHdIFReB4ypUy4qhqhSuq6P
Dl6ABIJOTsDlGiMirraKa96QjzPDw6ukv6PTkjZjmHaXnpVhsUVY76OSSbcw++an
RYpnXyTQoRpTbiB/dWPcLVoNw34VjouUfHaR0vSFAbAKfdeGV3v0yrH4bencOA+Q
52/mS1jj/6ecBsMrHpKNBaCu4x2lhfbwy/Gnur6XV1Cb+n/wFwIYPQ2PmJzdeSxK
Sluz3jeWqyZ9FqY5uz0b1l+IP9DzmtabGo88SIO7sZyIhlEKr5fjr0Xz0s3e5uZr
2NecoNRELN7E/kShE+xir80Gdh/qFQLL9VyHph7aSxfG3geZ+ZDR67W9VxlGXqgv
/eODUWWwrLmrID0bg2oceGE1T+EclyPweDTfdSyxzPNJhb78HuU17HE+7134/p4M
Jf5Hm+ou27Kyyf42pk/jejrSPfmzXOAB1ZryL302nQvztxvq0AOz4ivxT+pXgyE9
LiMOdGTZfCX+OMT42Rdi
=qHX/
-----END PGP SIGNATURE-----

--zROEGoKAXsG5UqGB--
