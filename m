From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/5] Add CDTech 4.3" and 7" to panel-simple
Date: Thu, 27 Sep 2018 13:59:38 +0200
Message-ID: <20180927115938.GD29102@ulmo>
References: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0329529307=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180730231117.5631-1-giulio.benetti@micronovasrl.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Giulio Benetti <giulio.benetti@micronovasrl.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org


--===============0329529307==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline


--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2018 at 01:11:12AM +0200, Giulio Benetti wrote:
> Add CDTech 4.3" S043WQ26H-CT7 support
> Add CDTech 7" S070WV95-CT16 support
>=20
> Giulio Benetti (5):
>   dt-bindings: Add vendor prefix for CDTech(H.K.) Electronics Limited
>   drm/panel: add panel CDTech S070WV95-CT16 to panel-simple
>   dt-bindings: Add CDTech S070WV95-CT16 panel bindings
>   drm/panel: add panel CDTech S043WQ26H-CT7 to panel-simple
>   dt-bindings: Add CDTech S043WQ26H-CT7 panel bindings
>=20
>  .../display/panel/cdtech,s043wq26h-ct7.txt    | 12 ++++
>  .../display/panel/cdtech,s070wv95-ct16.txt    | 12 ++++
>  .../devicetree/bindings/vendor-prefixes.txt   |  1 +
>  drivers/gpu/drm/panel/panel-simple.c          | 55 +++++++++++++++++++
>  4 files changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/cdtec=
h,s043wq26h-ct7.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/cdtec=
h,s070wv95-ct16.txt

All applied, thanks. One small note, though: in the future please send
DT bindings patches before the driver patches. This is important because
checkpatch, which is run as pre-commit script, warns about undocumented
compatible strings if you send driver changes before the bindings.

Thierry

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlusxioACgkQ3SOs138+
s6G+3A//Rv1xogsu+FndDFsCZnsmRV87aTiT4UtqNC3Ms+u+7dmEsGAsyzo/SE6r
zz4iLR4zuxVC4v7I++AEQYjRC2TFyn00AiE0cnXIxmimr89IfZ4VDD6r/Z4Urqgm
eQwWKnjLsmf2/zswtJjha8ir73HC+JFUotSHs6JP3cUdtYFk+Dj8PNdFS7j4yPXt
qtNG6YCwVvhYl7hCEUTKEIHxsNsifKilYQEUyuN4YIu16/cfUiXzWorJ8eOV0D17
NoZepmaBIJfwgUdi/veaFuOMJJAmYHiUVVyFQFYaE9ZGsormcUG/0PMdOuikgUtI
gK6I0uNxOmS9kGoS9qNFvby1rS6FB/ovOymMj3oGOp2b79q+62nZdQHGzQqgiW16
JuVH+/qtBTxMc7CkS1wtdOqw0GEhN5JCF+vE6we9Fhi2YQTw2flANYC5S9UpVDYB
oG5iDyMARg0LbHK+oTe/JD5SbQi53ANRFPHHKz/KheR3fiev6OcNHvDChl4mClfX
jnmCuhcziQOAilrRDqG1DbwRteIHuva5ey8o3dNAn76V4tYkxZJFd7HZVJHKYAeL
KD6kmAqOt8UilFtdz5U08VlEHYT897koBp5iDVm0J//ko+g+W1a1HA9zOgBFL2yZ
TVtXcHq0EiNsxahpvi9WwuteRt9GQZqBLtik8ugxYRm6wq7FGIo=
=zW8W
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--

--===============0329529307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0329529307==--
