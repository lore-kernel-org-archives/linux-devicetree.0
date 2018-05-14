From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH RESEND net-next v2 1/8] dt-bindings: net: dwmac-sun8i:
 Clean up clock delay chain descriptions
Date: Mon, 14 May 2018 09:21:13 +0200
Message-ID: <20180514072113.yts3shbojvbxj4tq@flea>
References: <20180513191425.9801-1-wens@csie.org>
 <20180513191425.9801-2-wens@csie.org>
 <20180513194919.GE12738@lunn.ch>
 <CAGb2v66nqWnioS1pwfWFtMZFZSWvf4SwXr_ExnnGvYsK9RU_LA@mail.gmail.com>
 <20180513200529.GF12738@lunn.ch>
 <CAGb2v64ACc1tQRhy4LhnvCC7VJ3nVM-wMbgUgzviGMWKPFsSuQ@mail.gmail.com>
 <20180513202938.GH12738@lunn.ch>
 <CAGb2v66F_Ho2OZdrF3p6xe9mQ=zJZ_KjE9MnW1VmWs9jw65eEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xneyxwlxyyg7upwe"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66F_Ho2OZdrF3p6xe9mQ=zJZ_KjE9MnW1VmWs9jw65eEg@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--xneyxwlxyyg7upwe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 13, 2018 at 09:59:22PM -0700, Chen-Yu Tsai wrote:
> On Sun, May 13, 2018 at 1:29 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> > On Sun, May 13, 2018 at 01:11:08PM -0700, Chen-Yu Tsai wrote:
> >> On Sun, May 13, 2018 at 1:05 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> >> >> > Hi Chen-Yu
> >> >> >
> >> >> > Are these delays the MAC applies? Not the PHY. It would be good to
> >> >> > make it clear here these are MAC imposed delays.
> >> >>
> >> >> Yes these are applied on the MAC side. Being described in the device
> >> >> tree bindings for the MAC, I thought this was implied to be the cas=
e?
> >> >> Are there known exceptions?
> >> >
> >> > There is frequent confusion with this. Most of the time, the PHY does
> >> > the delay, not the MAC, based on the phy-mode. So the MAC doing it is
> >> > an exception in itself.
> >> >
> >> > Do you actually need these delays for the board you adding support
> >> > for? Does the PHY not support adding the needed delays? If you don't
> >> > need the delays, i would not even implement them.
> >>
> >> Yes this is already used on the Bananapi M3. This patch merely reforma=
ts
> >> the description and adds a note saying this only applies to RGMII mode.
> >
> > Yes, the current code is needed for the Bananapi M3. But you have
> > another patch which extends the code to support a smaller range. Do
> > you have a board which actually needs this? If not, i would not add
> > that new code.
>=20
> IIRC the delay on the PHY side is either 2ns or none. The delay on the
> MAC side here is an order smaller, likely fine tuning to cope with board
> design deficiencies.
>=20
> Currently no other board requires this, but this is already part of the
> binding. The new stuff limits the range for a specific SoC, simply because
> that is the range supported by the control register. Not implementing, i.=
e.
> supporting the whole range from the property, which might get truncated,
> doesn't make much sense to me.

With that driver we don't, but the previous design had the same
feature and it was used on more boards. It was simply initialized
statically in U-Boot, and not in Linux through the DT like it is done
here.

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--xneyxwlxyyg7upwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlr5OOgACgkQ0rTAlCFN
r3QcpA//cbofU0lucdkRj8N+SeXfwuoUDPTHmHSbEErX9LHdG0vYfXa/ApSH0yhX
b59LqWWH2cJP1HM448T0UDsi8JOVSWaGlr0Br1NA21xP2cPs3MQH9TFvEoovWIHo
QUzg/gINoHwMTtkFC0jQXPf8nf+zxlj4kIaK65WEQk/VhXtDGMZsQqpMyk9i+qK8
wQ95pbMDspd4MafQXx3EF2idyW160Z//AijrdgsE6vu6hJgD2jKFthxZGR1ppOFt
ogsJ8uVLy1hZOcMZ1TpSDnXrwvpWyV4v539l0QlNQ/zAJpvaYxuc9VYnLP4D5Ghe
9jv/GsIn9j8zPEAGJBqLn6vWDfoBrVv9OM1oK6EgtQQwffyTx17WO+NPOr7fDN+b
MCXWMAokxT2A8ATHfY5YzENCiHRK0I5kFBZj9Bs1JKW7RytTtDFcF49a/9zbWtQ5
bi0kc5Y3x21vE7Hw3klGqsRdO39EVIyiBZcXxwh8RCXPJD/ukeuo1VefN9wGYddO
ERdASdpPnWbN0Oyj+tSaJtkarScRNVGPpYNkV0HuE6yBqW3wNPiHMsGV/YEk/+iM
g1M2izznPBgubb1FzG2d/TQDUXPX5I2gcoil2az+MrBqTpKkLvHyhOk+CKVxSZlJ
rg6D3ME37+GyuooU6OL5qlwRm98CToP0yAHMglXTGTT9hypjLYc=
=AhnW
-----END PGP SIGNATURE-----

--xneyxwlxyyg7upwe--
