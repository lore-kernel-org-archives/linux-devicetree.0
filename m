From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/2] Add support for Tianma TM070JDHG30 display
Date: Thu, 26 Jan 2017 10:41:44 +0100
Message-ID: <20170126094144.GC3613@ulmo.ba.sec>
References: <20161202085208.19459-1-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0792071465=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161202085208.19459-1-gary.bisson@boundarydevices.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0792071465==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Content-Disposition: inline


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2016 at 09:52:06AM +0100, Gary Bisson wrote:
> Hi all,
>=20
> This series adds support for the Tianma TM070JDHG30 7" display (1280x800).
> http://usa.tianma.com/products-technology/product/tm070jdhg30-00
> https://boundarydevices.com/product/bd070lic2/
>=20
> The first patch adds Tianma as a new vendor prefix whereas the second pat=
ch
> adds the display to the simple panel driver.
>=20
> Regards,
> Gary
>=20
> Gary Bisson (2):
>   of: Add vendor prefix for Tianma Micro-electronics
>   drm/panel: simple: Add support for Tianma TM070JDHG30
>=20
>  .../bindings/display/panel/tianma,tm070jdhg30.txt  |  7 ++++++
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++=
++++++
>  3 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/tianm=
a,tm070jdhg30.txt

Both patches applied, thanks.

Thierry

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliJxFgACgkQ3SOs138+
s6GfQA/8DjAMAJ30FR+xGoRJT2Kr1rPRLqb4YLNTCSSvAugujA01wBugFWR0cBBs
GJqcOTFt20x59AhlTq6VOUXAi3TGGyvybR1sH1XBo7poJP87JIqOvi7XDUiIECb5
3tgHiqdmoYq3MVoJyIVKee60eTaxrfI/tpQlorLEUiELHKPXEuxG8/71qtvlNJpX
B+YC92VhvjE+edPG3x3vpzeoc2tGgCn/HfqDyNN22ngknmjebFAzAZ7nCgmBH5rR
/Jp9Z3NwrgA2UF8iQNUVZ6HaxVz3OOYkPIgP0EammjWKm234YBCeDRPo3DKj1edQ
WbZtjUws/R2a6Y+jTghpKbvsOmoWCgXpudOtptea0ZVilYVLP6RBFO12byD1FY0c
ZiyRf09B3hF+6NzhtaLSwLDo/z7DCtgOIXWsWG7v0VFXY18HcZigeDyd9qMv3TuV
meu40Rp8FnpI8MzXfxEXK3muuLnQXxoWm54NBcAGQEJ2S65zqJat400+YZ22673f
HP6HkImYWvKDdaJU59NzWcPLSCGXLeKiFYqPWC4N20OkndAxtvScS0cOc0Ho7dhY
JSdClV7Ckki42ZBmuCBNlQsxzCRIqQXOEPcTR8cF/l0J2B85BKR5bckTv/PyQRXH
2iOZjDnqBih9C1vWUxsbe1yPS90/FPjTzMI5GxCH34cCq6ABPjQ=
=SG+M
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--

--===============0792071465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0792071465==--
