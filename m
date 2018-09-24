From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] arm64: amd: seattle: Use "spi" as name for SPI controllers
Date: Mon, 24 Sep 2018 15:26:05 +0200
Message-ID: <20180924132605.GB23547@ulmo>
References: <20180924094648.20797-1-thierry.reding@gmail.com>
 <b0721afb-ff52-f348-a481-bc4e8ee0f4a7@amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1193086283667341976=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b0721afb-ff52-f348-a481-bc4e8ee0f4a7@amd.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Singh,
 Brijesh" <brijesh.singh@amd.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
List-Id: devicetree@vger.kernel.org


--===============1193086283667341976==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 01:09:16PM +0000, Lendacky, Thomas wrote:
> On 09/24/2018 04:46 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Recent versions of DTC contain additional checks for SPI busses and warn
> > about certain common mistakes, such as when an SPI controller has a name
> > other than "spi".
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Looks like the same patch was already submitted:
>=20
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-September/6017=
06.html

Indeed. I had done a quick search and not seen these submitted in recent
days and since the DTC change that causes these had only landed in -next
on Friday I had assumed that they must not have been fixed yet.

I wouldn't have thought that Rob had preemptively sent out the fixes.
But it being Rob, maybe I should have. =3D)

Sorry for the noise,
Thierry

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluo5esACgkQ3SOs138+
s6HwmBAAk39oXnIXF6nmywUvTFjXEcnHVYZ8AxRl6/ApW3phltMGvA2yKsc5+LnZ
aPlyQtJ6JmlWC9RMKgD8ajengdd9fQdMxUdKigZrj+DYyuQ/f9ujEDDQkR9h2720
4PDi3H+xoVDOq0tQfcoidIPGKvvstA3y/NN5d/IPQkrWZLqFwSQf6UynqSGYJxI8
0VUbHkjVu3u6tm7tcwxIrMdhm29DcTL31CJfI4pmhICs1Q8Q8fL7hsYS2HyBSXSY
mbKfzqikg2LU2jwPqIdqTQC11IzrVhR2VU0CcthA1//zz0H9H6+4uKPWKvck687h
Y5bQfWrkDLq1YmVHXvypP3EHyrte2+wXfjnPaloldADP5Bp32zafKR76k4YpqA+y
3s3Rj5HHQBPImHjzzzkVuM5icqhqKadEa5yTcfwzV0R5/4ARx+ANF2x01n7cGVNQ
uJsF9bIrUrNGNOoV9s3cRzgzL9kFpWaZNbjDpyQB6qPJyLbO8u89PiER7BvOvqLT
tZejgY9GZ15y7Lvp0BoRxYWU0yN7X+Hdxh5nWCzWbCY4/tpFaJWpFL8lmduCi8a6
mNnGWr1meBVlMx9dcTvHgYTc4fpEJDOp6fYtYHRxp9nNqHgnMtNvCASFMcC5H96n
uUK5dNoIqAyyq/Y++D+QwMCpD15DE/czwZ6XtpJ2GyXiRtjtUf4=
=gWpa
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--


--===============1193086283667341976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1193086283667341976==--
