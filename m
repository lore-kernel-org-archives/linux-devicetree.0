From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 10/26] ARM: sun5i: a13: Add display and TCON clocks
Date: Wed, 3 Feb 2016 21:31:20 +0100
Message-ID: <20160203203120.GF3327@lukather>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
 <1452785109-6172-11-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v67fqMUQsG-+zVxfgE3UzY7uyomBkwxgNHeXbqA1pwM8pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ChQOR20MqfxkMJg9"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67fqMUQsG-+zVxfgE3UzY7uyomBkwxgNHeXbqA1pwM8pA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>, Wynter Woods <wynter@nextthing.co>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org


--ChQOR20MqfxkMJg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 17, 2016 at 01:06:07AM +0800, Chen-Yu Tsai wrote:
> > +                       compatible =3D "allwinner,sun4i-a10-tcon-ch0-cl=
k";
> > +                       reg =3D <0x01c20118 0x4>;
> > +                       clocks =3D <&pll3>, <&pll7>, <&pll3x2>, <&pll7x=
2>;
> > +                       clock-output-names =3D "tcon-ch0-sclk";
> > +               };
> > +
> > +               tcon_ch1_clk: clk@01c2012c {
> > +                       #clock-cells =3D <0>;
> > +                       compatible =3D "allwinner,sun4i-a10-tcon-ch1-cl=
k";
> > +                       reg =3D <0x01c2012c 0x4>;
> > +                       clocks =3D <&pll3>, <&pll7>, <&pll3x2>, <&pll7x=
2>;
> > +                       clock-output-names =3D "tcon-ch1-sclk";
> > +               };
>=20
> I suggest moving these to sun5i.dtsi, as they are shared amongst them.

Eventually, yes, but I don't have an a10s board handy, and I couldn't
test the clocks that needs to be taken by simplefb.

Once properly tested, they can definitely be moved to sun5i.dtsi.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ChQOR20MqfxkMJg9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsmOYAAoJEBx+YmzsjxAg25kQAKCuZotA9sUlVFBpqu2I0qfY
w5O4SBjjVKadcN9I9hBIDZJ2/RfJWsxeuzWOvbxIxIGauENQphF46dY2bxcG4ECD
XJAjlqcc7xfKRTDm0vGSZlA3h8RZTNxxhZ05FIVtLyQmmqHzycb09bMuJdp01CfW
7SEOTshQs17nuSupmb9VnHFXgd/5CL+dLoy3mBTU2y0RxGH+raHvi4UHafT+x+fK
PtgWxbKRDKqcVoQml5Zyt+55VmWfulPCCYi0IeVuKyxnh0MZshrjWaUReqWk8DMr
XKZ7g8lJxFc7vvRx7Ht4CPQ3135n7Uvc1poOhitvZ/1uOCz5egpAEzFGX/X77oL8
64HxIiswX+MRj4bWWsnzzb2s5X59RL3G0cQhhNFHWXEnnSzwbI+Wp9WD8vtpFtRi
cEdCw8WpSPQollkaPCn5Q4ITfJoV3y0Qu9dijotpOnEa6jmKo7S+oMiaqUGhTSI9
MZ30W5OK2cvdVZBqp420M3OSu+IzkdSe6ocNfWmCcCgT/ueH7K/FWAXTfrIgHhUV
jV+yuJOFeyVHEESbDJZcC10ybatAnzQMJb3OU3AB6+B31ETJxqnESVLicfLwHUOx
N8ogqdLYwEEc+aS3BLhZ1boKgEcKsc99sUGVP/azW1y0uss9vaSPVVZvKV4kjhvm
7KqKmci+3WQsmYOe33zy
=PYIp
-----END PGP SIGNATURE-----

--ChQOR20MqfxkMJg9--
