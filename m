From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add URT UMSH-8596MD-xT panels
 support
Date: Wed, 2 Mar 2016 17:17:52 +0100
Message-ID: <20160302161752.GF23204@ulmo.nvidia.com>
References: <5615885C.5050505@maciej.szmigiero.name>
 <20151008082444.GC3820@ulmo>
 <56BFA583.4040902@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0673422793=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <56BFA583.4040902@maciej.szmigiero.name>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============0673422793==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline


--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 13, 2016 at 10:52:03PM +0100, Maciej S. Szmigiero wrote:
> Add support for United Radiant Technology UMSH-8596MD-xT
> 7.0" WVGA TFT LCD panels in DRM panel-simple driver.
>=20
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> ---
> This replaces "drm: panel-simple: implement URT UMSH-8596MD-xT panel supp=
ort"
> submission.
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 54 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 54 insertions(+)

Applied, thanks.

Thierry

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW1xIvAAoJEN0jrNd/PrOhBxcQAIC7BQDqhOSsp7io0CHM1/h2
I9wDrdbMXWzp/N9qvM08FmOxxSEmeU4kX7hpPCBbhQApDeRQPAy+OmWTBwn8DNU5
jYW6CiEEqTJihhezsJaOfNRfq62bVTSH+Cj4PGdoIbkcklWA8twPMs56HoXxT83L
+/xFt03Vodomf7/JLppROxCU+Baip/fccnIuHGxv0GMYU0meBpj1FdjFNvU8t6aw
zcGZCzZ04kK3ZmTS2Hmq7Orfn8zWn4+kW7ZH/uNRujm+YJtWkQQC+Zt6BnoSHWqi
kyQSKnwOfjhFrsNXLw0pzSCFeLFjMZy+eph1HldY5heVAN1USBXQ9Tv0Wj9zvp97
ABMYSnVKUEI0iKIqZlHNiZ+GbIYNVqAg+cLFBZlCCtdSXHRs8VlKeniERk1ZXyl9
tD+72H2YiHK1gYl5xanckZRt4dDe2cuS5uO87soNgp6wzfLkKO9E4JUf6Q7ZNidr
2ssTrgA8YKka9eNdXwY1e/6D2qWpPCa02GzNHu1swsa8D+eadjbin8XYVid8aRhw
HWesZ1O17eRooKujc1Nmcn+SKLsCddWkc0xRnkuzY8mkX/Q5/hD9TCshp+Y9cEoS
Z24Rekr0JSzbgGg+d4FacV41t+SzJTKxRAAC/GiIY7hsk14SqJKhGDCCw8hMP1gU
SxInaQvoljUwA7AeUeB2
=J9OY
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--

--===============0673422793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0673422793==--
