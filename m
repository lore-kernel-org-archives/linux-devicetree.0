From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 2/7] clk: sunxi-ng: div: Allow to set a maximum
Date: Thu, 8 Sep 2016 10:53:47 +0200
Message-ID: <20160908085347.GK8913@lukather>
References: <20160906121837.7517-1-maxime.ripard@free-electrons.com>
 <20160906121837.7517-3-maxime.ripard@free-electrons.com>
 <CAGb2v66C9GJ5Svm+7NE2cStc5KiNgoriB329K4fhZJMTSbZ8Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XjbSsFHOHxvQpKib"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66C9GJ5Svm+7NE2cStc5KiNgoriB329K4fhZJMTSbZ8Kw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Mylene Josserand <mylene.josserand@free-electrons.com>, linux-clk <linux-clk@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org


--XjbSsFHOHxvQpKib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2016 at 12:20:10AM +0800, Chen-Yu Tsai wrote:
> On Tue, Sep 6, 2016 at 8:18 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Some dividers might have a maximum value that is lower than the width of
> > the register.
> >
> > Add a field to _ccu_div to handle those case properly. If the field is =
set
> > to 0, the code will assume that the maximum value is the maximum one th=
at
> > can be used with the field register width.
>=20
> This is a bit confusing. What is the maximum referring to? The raw value
> in the register? Or the actual divider?

The maximum divider, not the value in the register.

> Personally I'd go with the maximum valid value of the register. You
> could get rid of the special power-of-2 handling code you added.

I think I prefer to have the actual divider value. This is what is
documented in the datasheet, and it's entirely independant of the
actual factor being used, or the offset (is it register + 1, or simply
register)

I have the feeling that it's something we want to be abstracted away
=66rom the data side of things.

> Either way I think the message and the field name should be more explicit.

Understood.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--XjbSsFHOHxvQpKib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0ScbAAoJEBx+YmzsjxAguGAQAJ22w2VG5Sf13X8lLYH0AXdg
g31ySEnFzDI9iJRlN7roRm5cMn8rctK/nKB1lxkcjRHQMgyl1AS6uW6yz/UtQNw/
qe7rL62eOhocIwMVdMqyLf2v7w2ULCfnFJsz9RKCC9ndHSaXAtnH8Ou+c0wNtbvR
uqE9Vbv3R25QNSkhifgoK4DPs5NJrxAvKtxMixCfAH0dOq963iinWTxkE/+AQlR8
r3CjThUE2mZsxpBTtI9OLXXK6SGAJyqs5Vww9ktY/d1577wzGh1gA/0nGY954Tl3
mtcZRT9kfIAVT3CawqfextufMPC380y7pBE2NwU1ghB+9Oykl33cLcoYoAVpvOLv
52Q6n+g/y6qihecW+9ZN0+xCd0p9zA8GJzY6MVBaBVnM3+T+T0lZKze5kPCHZbmo
4sXWpz1+NZkCpyzzcz8P3Oe1yTeGyDU08ErumPSR/bF2SCQGlWFrfBM6z9CgIC4f
F8xmt58DUsGKqKM4969RgT6aN3gGbUsMpmuadtJEaonJ1wMuVvpVF57sqBj7uOwL
tCqV3OghEHu+pVxIXwRazOiT09nY5TOmxlnQSUML01qFcNyvIuwxBr0bdwLnBzvH
4hr3eXxADa2dq0plwooTbOdJCIrg+gTj1U7LXf0mWrAfSZUmdgsUBG/79C/4BlLw
OMmpGiEgl/J5abWon6LB
=VcDc
-----END PGP SIGNATURE-----

--XjbSsFHOHxvQpKib--
