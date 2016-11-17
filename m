From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: Add ti-tfp410 DVI transmitter driver
Date: Thu, 17 Nov 2016 09:07:13 +0200
Message-ID: <4c6595d2-9cc3-4c80-fbb7-b405d42170e4@ti.com>
References: <cover.1479142062.git.jsarha@ti.com>
 <b4589c6a3275c0c7c8e3c379faedba3ce1423c5a.1479142062.git.jsarha@ti.com>
 <20161116133331.miem6us563uu62t7@rob-hp-laptop>
 <506ba969-d753-d026-5357-3329a750ceaf@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0439283505=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <506ba969-d753-d026-5357-3329a750ceaf@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jyri Sarha <jsarha@ti.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, bcousson@baylibre.com, khilman@baylibre.com, dri-devel@lists.freedesktop.org, bgolaszewski@baylibre.com, laurent.pinchart@ideasonboard.com
List-Id: devicetree@vger.kernel.org

--===============0439283505==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="mxtKlPxNUKmTfptTsxHxineu2nq7xocau"

--mxtKlPxNUKmTfptTsxHxineu2nq7xocau
Content-Type: multipart/mixed; boundary="omqFqN0bqRXcGv6ufgTFuxe3SA91F9c3p";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Jyri Sarha <jsarha@ti.com>, Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 robdclark@gmail.com, bgolaszewski@baylibre.com, khilman@baylibre.com,
 bcousson@baylibre.com
Message-ID: <4c6595d2-9cc3-4c80-fbb7-b405d42170e4@ti.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: Add ti-tfp410 DVI transmitter driver
References: <cover.1479142062.git.jsarha@ti.com>
 <b4589c6a3275c0c7c8e3c379faedba3ce1423c5a.1479142062.git.jsarha@ti.com>
 <20161116133331.miem6us563uu62t7@rob-hp-laptop>
 <506ba969-d753-d026-5357-3329a750ceaf@ti.com>
In-Reply-To: <506ba969-d753-d026-5357-3329a750ceaf@ti.com>

--omqFqN0bqRXcGv6ufgTFuxe3SA91F9c3p
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 16/11/16 16:39, Jyri Sarha wrote:
> On 11/16/16 15:33, Rob Herring wrote:
>>> +Optional properties
>>>> +	- reg: I2C address. If and only if present the driver node
>>>> +	  should be placed into the i2c controller node where the
>>>> +	  tfp410 i2c is connected to (the current implementation does
>>>> +	  not yet support this).
>> So this chip can work without programming I guess?
>>
>=20
> Yes. Just powering it up is enough for most application.

Right, and not only that, but in all the TI boards I have seen TFP410's
i2c pins are not even connected. The data sheet says "[TFP410] can be
controlled in two ways: 1) configuration and state pins or 2) the
programmable I2C serial interface".

 Tomi


--omqFqN0bqRXcGv6ufgTFuxe3SA91F9c3p--

--mxtKlPxNUKmTfptTsxHxineu2nq7xocau
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYLVchAAoJEPo9qoy8lh716rIP/2toOnZ9jgqBNRrC5Wet8BeW
kU+WAZJNz41UYR/49A00t1xcvArOq4/XdUat81kl6YfA2/xSnpHBg2dQcya0ZjxC
YvhqU9qy3eO3SsyO62oRQEYXXgGUvk9g0hlWrcFvTC5ejwyWR3c46IsCD3rZamQU
QIY1TbBENyE3xiY5EERsDs27kcYbdHNwfDCttiOzWgOVfPjxvC1CfHBpkt33TEbE
xZsIQExnKsFm1UeVkkIY0xLjtqZ+Eed9UTLG0t3pHfjaCSjfD/WuiywPK9N9SEFM
e+3viPG2UFISTbIQcgGSw4ZgnoSNZFXR8Au5z2vtTp3JF/88/Kq6kA/Idkf3JcMq
MLHO57Fbk1fyBd/uGw59SpZuctbBu0ox/vSaFC3LRlYlkJPjy4Ky3QJ15kbF6uKd
YEnjOgHeB3Woam+37ro4U96yPEHPgoxFZb8Dk6B+g3/jz3HUTi4NxuwLoi8+W3St
w+tHnHoikD5gGtCaHOJff0Fx3Jx4Q40zwbrLSPRjaqKBz5VIi6aGN1Gk4T06F5ve
zU+wU1Xdfl1WIOcxQQqho5HToiLVJYmV6xWETdLmTfqjrRiYkIlXPjwBCz0TBja0
QWmokoV7H6y2FPoTd+nEttCMIYfWRJz0V2U7lSM4yo+7lq7SYBD0GZs6HauZF92Z
FkAWe5j+wWcdA7tTVwEJ
=XNLU
-----END PGP SIGNATURE-----

--mxtKlPxNUKmTfptTsxHxineu2nq7xocau--

--===============0439283505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0439283505==--
