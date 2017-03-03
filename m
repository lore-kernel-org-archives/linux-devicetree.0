From: "maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH 2/3] clk: sunxi-ng: add support for PRCM CCUs
Date: Fri, 3 Mar 2017 15:51:01 +0100
Message-ID: <20170303145101.ynv6vmmy4fyrgezw@lukather>
References: <20170301152236.MUXmRgOe@smtp1m.mail.yandex.net>
 <20170302140931.tq3vpncln6giyjpr@lukather>
 <2899221488467633@web38j.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4gigtnz6xr37pscm"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBX4F43CQKGQEBWEHGPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <2899221488467633-+LZv1VrpgWBxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4gigtnz6xr37pscm
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 11:13:53PM +0800, Icenowy Zheng wrote:
>=20
>=20
> 02.03.2017, 22:09, "Maxime Ripard" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> > On Wed, Mar 01, 2017 at 08:22:13PM +0800, Icenowy Zheng wrote:
> >> =C2=A0> I'm a bit worried by that to be honest. You claim to support t=
he A31,
> >> =C2=A0> yet jugdging by the current state of that code you never actua=
lly
> >> =C2=A0> tested it on that SoC.
> >> =C2=A0>
> >> =C2=A0> What makes you say that the PRCM clocks are the same for the H=
3 and
> >> =C2=A0> A64? We have to be sure, otherwise we might not be able to get=
 the DT
> >> =C2=A0> binding right from the very beginning, and we might not be abl=
e to fix
> >> =C2=A0> it later.
> >>
> >> =C2=A0In fact, if we worry about this, we shouldn't make r-ccu, as
> >> =C2=A0dedicated clocks are more easy to fix.
> >>
> >> =C2=A0For newer SoCs' PRCM, we never have enough documents, and Allwin=
ner
> >> =C2=A0have said that they cannot provide it. (I asked them for this.)
> >>
> >> =C2=A0The best solution is to implement mature enough dedicated clocks
> >> =C2=A0before we convert to ccu.
> >
> > What do you mean by dedicated clocks?
>=20
> The legacy form of clocks.

Which itself creates another form of issues. What happens if we get
something wrong on those clocks (as it is likely to happen)?

We potentially can't fix it at all, that's what happens.

And that's leaving aside the DT and clocks maintainers regular
complaints that we should get away from those.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--4gigtnz6xr37pscm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYuYLUAAoJEBx+YmzsjxAg2boP/jRp+PhB10cbAfLy3OfaTsp+
/6G/n20IVUiEi3ldTj15PHnj/QSm6TI+WO63iVkGGprdsf6CPgF+05IkhDSdWqCk
hn8cy2yJYM74RWBdXh7kwwTI5uXWNXX1NEwN0nAZV9ctrPmeCjbRcF6V5w9f1b4F
PJc1u67/Q9nU7rqnlCEntujraj+AWB2PN8RCzlWl8LkF4SdBesgsB8Oth7u7xf01
K13BqJIzFo4H7nO8Av3MMFeg5Z2ErbCAV1s9q6VhZlDHyc+TRfLLW9ppsGyAY384
FQLNOO9vh1E8/d6vp9MGSGIQf6By6ZkD3kze+0gMrxzTNv9Ee7uKX02p6FAZCedJ
kSWaWH94KKYKhh0T/i3vXryoG7BdLxz6jPgakQoANMFO6EHKD0ngnznHFsS7MGs3
4BBry+6Ufmks1SbwMr3jHZas5v5w38v8SMonBT6hZUjf6yQYBPM6MKGXSFK4gONp
y68x9sAowJ4zKaRA/LF0y5vR5gWjPgCiWaN/ILsGRsIEs2ojln2aCzm6E+PU52DP
MMvVKH9ughA4AaxHzcF383D1q6OYCTuRpfrWp3frsbigQJxa3bfN9bl54c7OStwg
sV4B1qEFmCU4/C+YcVWqQ1SgjEHOuESz2yhggWqHS1C7bCo2zfx9R4j4Zsx0TD+B
1Gn9mHgOVNYomaG/Zbox
=3D9K
-----END PGP SIGNATURE-----

--4gigtnz6xr37pscm--
