From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] dt-bindings: pinctrl: Fix spelling of bias-pull-up
Date: Thu, 16 May 2019 15:15:15 +0200
Message-ID: <20190516131515.GB2000@latitude>
References: <20190428150822.13935-1-j.neuschaefer@gmx.net>
 <CACRpkdZcP3gEsudT0rpzNuBe=4Mz0s=KLPd_y-38E4oxVeQD0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZcP3gEsudT0rpzNuBe=4Mz0s=KLPd_y-38E4oxVeQD0A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, MSM <linux-arm-msm@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 02:44:30PM +0200, Linus Walleij wrote:
> On Sun, Apr 28, 2019 at 5:08 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
>=20
> > The property is spelled 'bias-pull-up', as documented in
> > pinctrl-bindings.txt.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> It appears from Rob's comment that he's applying it,
> tell me if I need to apply it to the pinctrl tree.

Yes, Rob applied Christian's version to dt/next:
https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=3D=
dt/next&id=3Dc50495aa4cfcaace5f61174ab3069d5047d14f17

So there's no need to apply my version.


Thanks,
Jonathan Neusch=C3=A4fer

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAlzdYl0ACgkQCDBEmo7z
X9vDaBAArHDvJllzymlUcI+Bs9d6A5YfI4V3wR7SI7nvjkCSa+ctj11a0qOLsLqw
4+QoXkCETu5Qrwz4utAi8emKVpSjWaEkkickLtpjNDZacjF8kt8QA28uzn8WScoe
7gs+bd0DZ2Q+doK/QRoGAIZvY/SPSTacaNwec2wKc0d63dn8tKoqrz29r9fNOW3Z
MvS03f9PF2JFgHCPJkQPDbfmaMXl+57S4N7F9USDhFZmiF2hZNAwL4/p8whw8fLq
1aRjIpqLw9otvivF4LpK5WUj5XZoSGxbIfAQ2pS2Uj8K+MUp95fB8TqXCGG9hQHw
dstusnYe8NrcwCBYkedHoNAy2cmj3l73JTe9bSZkeSpSo/dFO9GEvILvS9BaYhJZ
9bTydEkP1YmAUeC0R962HGD1Yx1t6izL0WNzX/cawg4iQUC1uJPPLWu1p2y2FajO
FX+nUz3/z8CtGu49Wl8gezj+eI1L3joUuRAMypw7MfQzDsFv0G39wNzjcsfllhZg
8w71tQx7yA7M4tUGFBWip1tj30d1M8HghAn7psNN8FOKxZbb5NUyDT8l1v+wt1Xl
VcIfIfT9P2p9//etRlY3gdiTVj7rkZedJttSPq4LUWxENMUVnBf8BYF49hruMat8
w6L9nhPmq1qQMjZStJBQQupKADwnt6Yce6xhk4f6BYeNbuHAtZY=
=BpWe
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
