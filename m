From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v7 4/5] ARM: dts: da850-lcdk: add the vga-bridge node
Date: Wed, 14 Dec 2016 11:54:28 +0200
Message-ID: <0ad07b84-7f5a-6467-e310-52c3efc66d3d@ti.com>
References: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
 <1481623759-12786-5-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1664783192=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1481623759-12786-5-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jyri Sarha <jsarha@ti.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-devicetree <devicetree@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============1664783192==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="niInBlBSvM7J14CFtCaBnS3LvGIf477KA"

--niInBlBSvM7J14CFtCaBnS3LvGIf477KA
Content-Type: multipart/mixed; boundary="XfTbmt9bTWBDmel5aGqtePpHpJJu4cp3p";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jyri Sarha <jsarha@ti.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King
 <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>
Message-ID: <0ad07b84-7f5a-6467-e310-52c3efc66d3d@ti.com>
Subject: Re: [PATCH v7 4/5] ARM: dts: da850-lcdk: add the vga-bridge node
References: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
 <1481623759-12786-5-git-send-email-bgolaszewski@baylibre.com>
In-Reply-To: <1481623759-12786-5-git-send-email-bgolaszewski@baylibre.com>

--XfTbmt9bTWBDmel5aGqtePpHpJJu4cp3p
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13/12/16 12:09, Bartosz Golaszewski wrote:
> Add the vga-bridge node to the board DT together with corresponding
> ports and vga connector. This allows to retrieve the edid info from
> the display automatically.
>=20
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/da850-lcdk.dts | 51 ++++++++++++++++++++++++++++++++=
++++++++
>  1 file changed, 51 insertions(+)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi


--XfTbmt9bTWBDmel5aGqtePpHpJJu4cp3p--

--niInBlBSvM7J14CFtCaBnS3LvGIf477KA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYURbUAAoJEPo9qoy8lh71hTEP/jepqoFAEghVDYtVFbjvWAlo
Tw9UXf2muaykrIyVF+idJh3RS4eYWkyge+Wa5DP6O1z/PEJJH1RWazDYELIlKk+M
GgEri6d4KxwtHmgTGVvqThJamqlQAazYWzYmu409p01UW1bFb8BFqQwdegLTX5s+
GofU8Bkj1zbrS1YCzBtIToHIaJvBPMQJzJ/uvNNvEybwurpgFESDvAhvCJ1um4oO
k0W0LsDdGhe8XJT18wmH1jLc4i1rTwXl32Bxo8rJ+41HKcnfhysHzzLS3xO7x+22
7Jr/RUZroSxiaJ8iHwenLBsyDA9lnrEA5Qk/QzxWINdUuNGk69TPcrxLHHoI+3b4
gWVLLQqEYtJ4IoVCM6V6ygwywNMCU9ZowJdfVk1maqChNHvq7a5TWMmLyaL/PrkI
diFcSVKtAQfy4VfzX05VPftV5Emh/4XJve/it3TVl5zTQRhsQxUi3CUSZTA2KvvI
EiSmiPWEC6KqjoRiXphmlGosIJJIJuwkt73nu0IZ/K8gx5eiezfF1tvYYOPuXx9m
tAAwwAwUpPK4+nfZWZNCR+87CPniPjSIjDVjntpixIXNgBUfx4wYV09KipsGN2mr
zS/ZQfwM4Sa9b+3g9NNuLjJgL1tJ9qOAIVDZk3P65o8IAE8G1+woQnL1z9afiMBs
eMDLW0U/Y1L8MExRQ/wQ
=/DA5
-----END PGP SIGNATURE-----

--niInBlBSvM7J14CFtCaBnS3LvGIf477KA--

--===============1664783192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1664783192==--
