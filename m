From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 5/5] ARM: dts: da850-lcdk: add tilcdc panel node
Date: Tue, 1 Nov 2016 12:38:36 +0200
Message-ID: <b7ab6df6-a2ff-a0a6-576e-b1f6821a51d5@ti.com>
References: <1477925138-23457-1-git-send-email-bgolaszewski@baylibre.com>
 <1477925138-23457-6-git-send-email-bgolaszewski@baylibre.com>
 <3e8671aa-e59d-4595-c323-af9e6a0ad615@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0853298470=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3e8671aa-e59d-4595-c323-af9e6a0ad615@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

--===============0853298470==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="mhoKpUvNsi0AtVR8x4xu00c2HlI71edDf"

--mhoKpUvNsi0AtVR8x4xu00c2HlI71edDf
Content-Type: multipart/mixed; boundary="s83C8Jpr0mAi6lPJVgPQ31bhmw60Qjte2";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <b7ab6df6-a2ff-a0a6-576e-b1f6821a51d5@ti.com>
Subject: Re: [PATCH v2 5/5] ARM: dts: da850-lcdk: add tilcdc panel node
References: <1477925138-23457-1-git-send-email-bgolaszewski@baylibre.com>
 <1477925138-23457-6-git-send-email-bgolaszewski@baylibre.com>
 <3e8671aa-e59d-4595-c323-af9e6a0ad615@ti.com>
In-Reply-To: <3e8671aa-e59d-4595-c323-af9e6a0ad615@ti.com>

--s83C8Jpr0mAi6lPJVgPQ31bhmw60Qjte2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/11/16 12:26, Sekhar Nori wrote:
> On Monday 31 October 2016 08:15 PM, Bartosz Golaszewski wrote:
>> The tilcdc driver is not yet ready for working together with the
>> dumb-vga-dac drm bridge. While the work on enabling drm_bridge
>> support in tilcdc continues, enable the VGA connector on da850-lcdk
>> with the following workaround: use the tilcdc-panel driver with
>> a set of common (and tested) resolutions.
>>
>> Once the drm bridge support is complete, we'll remove the node added
>> by this patch and use the correct solution. This change will be
>> transparent for the user.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> I dont think this can be applied. If this goes in v4.10, then the DT
> blob becomes an ABI and driver will have to support tilcdc-panel driver=

> for DA850 forever.
>=20
> Its probably better to wait for the proper driver support to arrive.

Agreed, NAK for this.

 Tomi


--s83C8Jpr0mAi6lPJVgPQ31bhmw60Qjte2--

--mhoKpUvNsi0AtVR8x4xu00c2HlI71edDf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYGHCsAAoJEPo9qoy8lh719I0QAK55gM2pEyC3R4Icx8aKm7xV
hwKjcesoh57geoZE3lxomM1drR79A+0pu0Aoq6nY9tnLvGrSZDWwpjJPKpg1nalw
Qp3D2USZDVnh2O6vYKUEku/RhLfAxN8zdjqlpauxcZq4yQIp70cy8t7WehLimW1/
coeT70Nqr8NRujTLngysF2cmbUiUy63orntrwsXuFKsjGNssqU1+ZQsbmmDMcDyI
Fkn9xShKnTvIoUyB9oESxi2EZnieI1och7LgdWsBXIHjuUYr1Ssu7c2lyCgHAWJr
65ILC+XZ90Cif/uDQiuFYSgKuk6VKAOo6ykqk30OGyYOV9TyHCX9ZtjcCDEq+Kj4
hnojnF/2h1lMrsgGyuZDdGbk60fTHatDIU2o8jyR8ohjAVj+NRVt7dUfL/Ftf35/
ByDfLm8BSJnpNKosv91HmeTpg369lPIx3/CYV3BcjF8fV3/4Z+80YexNnotuQOEY
C22zPHE6MSGXw5qJoaE0k8eg+t3iNOoTi8luAjID2YB6aiA5euAo6qEKVg3zOKhd
CfY4c3skKVkOb2RqFyyqbpTGlZRYq5nONz50JQpnFvpgE9I+m5pVBLGf4kZmyNh6
XWyxh3WfFzr4TcR9MJzlsw4FMYMrENoltqieiIAucvm6Y8oR0PeUTwEth/w8/eFt
xC7Hk5J/w3xUT3dkxhIq
=ayJR
-----END PGP SIGNATURE-----

--mhoKpUvNsi0AtVR8x4xu00c2HlI71edDf--

--===============0853298470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0853298470==--
