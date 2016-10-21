From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/3] ARM: bus: da8xx-syscfg: new driver
Date: Fri, 21 Oct 2016 12:25:14 +0300
Message-ID: <f6a0f61e-9d78-3df1-8e41-435eb47a1f00@ti.com>
References: <1476721850-454-1-git-send-email-bgolaszewski@baylibre.com>
 <2278105.geKhb8xoNC@avalon> <7h8ttj6jqo.fsf@baylibre.com>
 <1867292.F3aGJTmS2t@avalon> <7h8tti6c95.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1747105353=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <7h8tti6c95.fsf@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kevin Hilman <khilman@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============1747105353==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="sSxT0VGb61cRknTR0VKCgpCdpiTqhxbpf"

--sSxT0VGb61cRknTR0VKCgpCdpiTqhxbpf
Content-Type: multipart/mixed; boundary="kgAGrmGAHd3c8WqA1N4wqG3KTH8UGvviR";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Message-ID: <f6a0f61e-9d78-3df1-8e41-435eb47a1f00@ti.com>
Subject: Re: [PATCH 2/3] ARM: bus: da8xx-syscfg: new driver
References: <1476721850-454-1-git-send-email-bgolaszewski@baylibre.com>
 <2278105.geKhb8xoNC@avalon> <7h8ttj6jqo.fsf@baylibre.com>
 <1867292.F3aGJTmS2t@avalon> <7h8tti6c95.fsf@baylibre.com>
In-Reply-To: <7h8tti6c95.fsf@baylibre.com>

--kgAGrmGAHd3c8WqA1N4wqG3KTH8UGvviR
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20/10/16 22:39, Kevin Hilman wrote:

> However, after our discussion on IRC, we'll respin this without the DT
> bindings at all.  Next version will just use static configuration data
> in the drivers/bus driver based on SoC compatible string, since for the=

> use-cases I'm aware of, the settings are boot-time only.

If it's static boot time config, why not do it in the u-boot?

I'm fine either way, but this sounds like quite low level memory bus conf=
ig.

 Tomi


--kgAGrmGAHd3c8WqA1N4wqG3KTH8UGvviR--

--sSxT0VGb61cRknTR0VKCgpCdpiTqhxbpf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYCd76AAoJEPo9qoy8lh71Yc0P/iOi36MUuESI+lkbyW2J2Cev
q0FkOEyKZIj9RiUssIxL46argYh+4FUdZtRRBkj5VEe+CpMJ1n6cR6/OhPa64i3z
sgQtAwbg0dpge/nQSwKbSEzWqbrR5L66EgaOWNKiI1rm5T5y0+b01SiXn3kCUGyP
D++Z1HmZMgu5qt8r5Y1tYG+X+cuvwRiYRlVwnCpwimJBrshKGSi7kBNsVGOpoQdA
uDQYbjrsQfBKMXj0d33sg3Mm94dds/OwFGzgwNPg1/05kpMkX+u9hLifSBkS3SMW
+NVyapKEaCaQkoFa6i+StoKIyk67Hfqb7vYXIwhvuBPr/fTu48UXyJE2qqhCjqCh
uF4oH5yfVM9wyUD9jNyvge/FiHzUCbuU4gwP2HL9fh3nvailGNurxPPyp5NzHh+w
52MInK9b83htN6kHdlNfurOh2Mbc3ozyz4H5AzFxc+HAh+IQvyHTDYTMYrIywHA1
P0L6f8R44K5HFAiEL51bc8x/hj0aG78abrtXTearfQz1BOJcmGA6dmmoSiNAx1iM
AY4/ymP878SVilIPUNEICQe72oFPOritZowWtjT16uw6gk2fexkI8esOjqU19Hfe
Ood9jadiKjNu4jA9wKxCJhSqWe64gdSU3ylb2TI/cgkzQVnbcKHhcIvmvvr5nh1B
NV2W266iKFik17wDxSHn
=YBiu
-----END PGP SIGNATURE-----

--sSxT0VGb61cRknTR0VKCgpCdpiTqhxbpf--

--===============1747105353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1747105353==--
