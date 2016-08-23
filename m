From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/5] clk: sunxi-ng: mux: support fixed pre-dividers on
 multiple parents
Date: Tue, 23 Aug 2016 11:57:32 +0200
Message-ID: <20160823095732.GH2598@lukather>
References: <1471248795-17951-1-git-send-email-wens@csie.org>
 <1471248795-17951-3-git-send-email-wens@csie.org>
 <20160823085534.GC2598@lukather>
 <CAGb2v67gaQX_CEtysfDh+8sgo7L=zeRw2TSDbXnPnHA1awZF3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8313878036487425173=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGb2v67gaQX_CEtysfDh+8sgo7L=zeRw2TSDbXnPnHA1awZF3w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============8313878036487425173==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
Content-Disposition: inline


--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 05:52:59PM +0800, Chen-Yu Tsai wrote:
> >>  static const char * const ahb2_parents[] =3D { "ahb1" , "pll-periph0"=
 };
> >> +static const struct ccu_mux_fixed_prediv ahb2_fixed_predivs[] =3D {
> >> +     { .index =3D 1, .div =3D 2 },
> >> +     { },
> >> +};
> >>
> >> [...]
> >>
> >> --- a/drivers/clk/sunxi-ng/ccu_mux.h
> >> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
> >> @@ -5,15 +5,18 @@
> >>
> >>  #include "ccu_common.h"
> >>
> >> +struct ccu_mux_fixed_prediv {
> >> +     u8      index;
> >> +     u16     div;
> >> +};
> >> +
> >>  struct ccu_mux_internal {
> >>       u8              shift;
> >>       u8              width;
> >>       const u8        *table;
> >>
> >> -     struct {
> >> -             u8      index;
> >> -             u16     div;
> >> -     } fixed_prediv;
> >> +     const struct ccu_mux_fixed_prediv       *fixed_predivs;
> >> +     u8              n_predivs;
> >
> > I don't think you're using it anywhere (at least you don't define it
> > in ahb2_clk, and the extra item in the array will introduce an
> > off-by-one error.
>=20
> The truth is I forgot to update the change in ccu-sun8i-h3.c
> It is used correctly in the subsequent a31 patch. Sorry.
>=20
> I'm not sure what you mean by the off-by-one error though. IIRC
> we initialize the structure using named fields.

What I meant was that remember to also remove the second empty field
in ahb2_fixed_predivs.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvB4MAAoJEBx+YmzsjxAgmgoP/0vN5QQChUC9PnbMB+IUiY+U
9nujslymACLTjj3u08QT+RTfbo4iB+TMmaVc7q+J8oqGzcndXpE880BBg4/1Rv3H
gz09aLf33hPmQcHL+gFlGNaIGyicIh4gIxe9CvvwRYsBbLfuEH3HQ0uJYr/g9ORV
1Wt23ve4ffgzi5i6iHAK9VzXQCPfm7dyt411EWasLL6drJJ7dyKeK8d9/JUts+bP
6V8otob4pOsSOfPQ60InWP2VUbpazWSlncWNTAr7Cn9IO9yTzfLbgkRjFJKL299N
AtLjSpK/Xxg+V4R9qaBewP9InmzHekFM3Ukmw5bmHBeOvLAMOYog0AVy+DaWMUvJ
ANeD6Ic4lx7lSwEG94RxC60NIdW6432niOwvwA9OnzOX1dziD2OKIuOA/Eevi+gM
UIvOcNRb2oQ8Ub4ancphp9VuEX5Wxc3RwUdKrmQUpFv2Ugiic27NmPvzDQik034E
VR+UBXBty2l7RwMJHy0KAspZHCh8P89BtJOInvFCqqH72lRnXZdbKzbMjyw3AN14
4g3FZxu+8pMSC2fjM+6tydZbbppM8UUJAmO9KSO3ftG/dZQRFUDI7sV/o9yr76fO
UVYP5EZFd6stJfQ9bb72X9MDaAVlnOdbRJNmMhxrlgp/VN/3m9m7pPx4M9m94V0a
MdToNSgJfNfr2IgO5pPj
=o57N
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--


--===============8313878036487425173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8313878036487425173==--
