From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: pinctrl: Deprecate sunxi pinctrl
 bindings
Date: Tue, 25 Oct 2016 15:41:50 +0200
Message-ID: <20161025134150.dct42swdbwxzgbgb@lukather>
References: <cover.f893b02a9f816dad8fad3986672b05c4b211e2b1.1476971126.git-series.maxime.ripard@free-electrons.com>
 <6aec73cd3b9d3dbf1085d042ec6c23f385a300de.1476971126.git-series.maxime.ripard@free-electrons.com>
 <CACRpkdb7zs7Nhs3i1o=WUt787vJCuePre3Tj3wLu++qwpO0atQ@mail.gmail.com>
 <20161024194917.g5oezqc4uacsyt24@lukather>
 <CACRpkdYGYPhPZQmgeLA-K-RQKZMLy1qHY6P7LS6SKsFC=d=MHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="apd5djy6lqcuh5bx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYGYPhPZQmgeLA-K-RQKZMLy1qHY6P7LS6SKsFC=d=MHg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--apd5djy6lqcuh5bx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Oct 25, 2016 at 02:07:27PM +0200, Linus Walleij wrote:
> On Mon, Oct 24, 2016 at 9:49 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>=20
> > However, it looks like the first patch from this serie is missing from
> > your tree, is there a reason for that?
>=20
> No can you point it out?

Sure:
http://lists.infradead.org/pipermail/linux-arm-kernel/2016-October/462500.h=
tml

> > Also, in order to preserve bisectability, could you create an
> > immutable branch for those sunxi patches so that I can merge the DT
> > bits?
>=20
> It's too late because they are already in the devel branch
> and mixed up with merged of *other* immutable stuff.

Hmmmm, ok.

> However I think it is plain wrong to try to keep any bisectability
> between the kernel at large and arch/*/boot/dts/*, because
> the DTS stuff is supposed to at some point be maintained outside
> of the kernel and for all OSes, they simply shouldn't be sync:ed.

Yes, in the case of a new driver that needs to be introduced, I
definitely get your point.

However, during a conversion like we're doing here, this is not ideal,
because it essentially means that you will not have a branch that
works, at all.

I'll hold off on those patches until 4.11 then.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--apd5djy6lqcuh5bx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYD2EaAAoJEBx+YmzsjxAg3WAP/RWb5dtZ07Ab4xYAnD+NZpPb
jDGCoEvYjFE0oR+vpY02wtv+ldNN3YKhMCPz4gKKyCqx+7JwVuGkDOKePrguAk4O
7NLR2knB/Tg1HqI9KrKiiZByPJdNL8A6uwhoZgobGY3OMkAq83EtRL53aB7negmT
P3Dn5m3rd8LVY1NvLEiSDdTiZ0gM6jRmmO4abgXEioBjLfp0wa87mHx/JIKDyl6I
RLMRvoUj9dvy5DLCWEFJ6fgrg0sL5NRMdPotWgIZJS0LygSwBAlnsAhdV/37+o+N
XmHQTIoj+KR/v/5hyMTRbAYUXyi5HWK5JF5hi0jdtSviZ6MpxpJjyz2jUTq9Z4Jw
y+EBGd6DsA+hK5+HtOMCqP71rofFzl/orumcpqeY9iw66WLNFj0pM1yf0Wq7nf0j
s+pg4xhxp/FsfhVCSCK16alz/fxWMxfgtT5WcOBHi6Yx40fcGefQtsBxC+6eky5q
iaA0EQjxIDILA+CIxRBYZQ2jp6JJ1cjpgvWX9B3DdzBWH4YbCIRdz+P1pGQLsB/t
s3x7XaekPa7AQ30MapPUX5Cc0qyo7L0KPW43P8+joZDBIqH/CSJCr1egiJKNbhmJ
sqnQjf6k0r5kr4pVwXEzcfuZ08lrHhSjngaEGNfatbXUYyqsDR+/IqZeWuqA4x7z
aoBniwskIRr2Nb+ePBKd
=i9KZ
-----END PGP SIGNATURE-----

--apd5djy6lqcuh5bx--
