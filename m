From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 0/2] drm/omap: panel-tpo-td028ttec1: add backlight
 support
Date: Fri, 1 Feb 2019 12:33:40 +0100
Message-ID: <20190201123340.05cd385c@kemnade.info>
References: <20190119182131.9341-1-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TK.FMOv4Uh3fx1=dIZnmILX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119182131.9341-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, sre@kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

--Sig_/TK.FMOv4Uh3fx1=dIZnmILX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

ping

On Sat, 19 Jan 2019 19:21:29 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> This panel has a backlight, so add a property describing that and
> add the code to use that.
> This makes things like xset dpms force off
> also turn off the backlight, so we do not need to rely on additional
> userspace programs to do that.
>=20
> Andreas Kemnade (2):
>   drm/omap: panel-tpo-td028ttec1: add backlight support
>   dt-bindings: panel: td028ttec1: add backlight property
>=20
>  .../bindings/display/panel/tpo,td028ttec1.txt          |  2 ++
>  .../gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c    | 18 ++++++++++++=
+++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
>=20
> --=20
> 2.11.0
>=20
>=20

--Sig_/TK.FMOv4Uh3fx1=dIZnmILX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAlxULpQACgkQl4jFM1s/
ye+p3Q/+KX4oNY/BOMP8qZPMRZNNpS0XMyxHBLEsippvX+FHxArZyNUNoddq6L9K
2RMLFkZfSKUwjZprXh2U/6H+qqkmyvrZPR74XMx5ZzEN/h8MQPHko9aYXAYYg6Oe
hxkMNhSKHlFRowOk4h4rd65JCjYxDIQwrfDyHcDxeushjgsRFFugGsly1zXnAXCj
LttvHwFpKe8tECx5DkwVEGH0tXUhBG78xH/GNK77/Wyqm000U9qZbnRkp/hBg8d+
Iz3BvA838TpfPPEW99eoTqjJjkHDZeiGejFX2979vgGvF+o1F44Atk5PMqAeXbAz
sP7sbxhHYbZqJNqbBwBuFqREQjLzBDXATNjY71iyYFbR9j3N5hqFxeV+KaWPqC64
fpe44CEiO0jEwCleDyrpHA6YzYx0FjphNlFW7LymfoY8sMfOwg5LCXesMtpvXNFk
ny9JnR7GvTtvpMlMO5vvSO9p3jv/p+AQuSUbZuQ9R0fNfbukM79u5x4BBo8MmtOW
fpy/ags2TSLnr8hxBWLAMuAVb3G/qL16QwMwKYdw0RLsopQTSoSxspzvU9H6OWHs
wLsMoVrU5JP9NmVTc6hde7cjih1nW6wEZ1nT7wPbVvDcS0m214Fz97LKmkIFHIdA
oP85NiQrvwb62gxumGpaTZdk4UssesUoDVb7KSiaW6+xsdmZ/vw=
=duFK
-----END PGP SIGNATURE-----

--Sig_/TK.FMOv4Uh3fx1=dIZnmILX--
