From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 13/18] dt-bindings: vendor: Add Huarui Lighting
Date: Thu, 20 Jul 2017 15:37:14 +0200
Message-ID: <20170720133714.nffdm5y5cxzvz65c@flea>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <5b7ae43738fb5ea2fb1ebebddfc75d401da94677.1499955058.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v66hWsuQQQQXJwKD-1aub_1aysQ_A9Kn2Ka5WSFMDYHN0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2isstvrkuogruyrk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66hWsuQQQQXJwKD-1aub_1aysQ_A9Kn2Ka5WSFMDYHN0Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org


--2isstvrkuogruyrk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Fri, Jul 14, 2017 at 03:53:40PM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 13, 2017 at 10:13 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Huarui Lighting makes display panel, add it to the list of panels.
>=20
> I could not find any information on "Huarui Lighting" within the
> context of LCD panels. The company I found makes LED lighting
> fixtures, floodlights, and high power LED drivers.
>=20
> This might not be a legitimate branding?

The references are sparse, but the only time I could find a vendor for
that part was here, page 51:
https://www.codico.com/shop/media/datasheets/Quectel_SC20_Hardware_Design_V=
1.2.pdf

But maybe it's wrong. And since it has a BPi logo on it, maybe we
should just use sinovoip as the vendor.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2isstvrkuogruyrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZcLIKAAoJEBx+YmzsjxAgxMAP/jxU7CBWNMp2OCzmPc6haiR/
YfE+nxhiPedbODEZQrMqLdpHK9NGRPyAgP2a6Jn4gT0oGt2uyr/jg0bMsqrV4GJn
5N19WOo8E+wJuw7aPTH1QNucqMzFsX/6S+GLz28IdQNB2Vy2Mv1D7Vm4qF/2oc5X
jD2/vBekhgXsIRTTS6xGK+rOKnJXxTK9riY9pBWifsWJo/O+nNEG7tfvD0dB/4Hq
mpSuxOUqZ8bPTlz8MTsKO+j6kdgKLz5nasRAscLSggUZ8ZYFD9eL9wy4+AnCb6AH
rg66fwBo4WAsv3lhQTpW3hRSzyBKF0KPyDJzMB52AIMkFuJneoqHlPV/EMJ0yRuR
ZUw44KtwNFiArVsX6O0obwLs+q4vyA7Y9zPle+IvNZTvvV4En5V5JLp97uTUju5S
0du4ghPjKXC+WEnHgSFvAzOSS/ZXS5WDY8lb5WtHRNW2C62H3k02vCYyCMiFekEz
3pIpfd/R2Vz+9bLghs3qvt5Z3Dzd3ffk+AGIX29cLQemNDwaRq/4qAtV1S378Ox4
YV7UTmPj5Nk8W9CvUoKvo0gdKJz+iGUvf6zk4yrb9mkTkGsLSNODKwnt+J6tKY6Y
zBqvt4n3p6lEpf/BoQa36ASZVkkzLgJeAD0KB84yAk24XH+yFol9jvoL8DR4RP96
AlJfAnjSW7onod89ZJBZ
=cjH0
-----END PGP SIGNATURE-----

--2isstvrkuogruyrk--
