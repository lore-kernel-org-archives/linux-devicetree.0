From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
Date: Thu, 20 Oct 2016 13:21:47 +0300
Message-ID: <bb7bac91-8eb1-fe23-ca9c-857e0fda6ecd@ti.com>
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
 <7a2ffcd0-fe1d-c887-53b7-7cb5e1e61222@ti.com> <4975084.EGQPv58AK6@avalon>
 <daf49046-ad0a-d9e2-d744-1e06085c6585@ti.com>
 <CAMpxmJXT8hcSc0-svbwAq5r_JOFsYV852gtE0vuXL8hHykXnRQ@mail.gmail.com>
 <6c6fcceb-c6f2-219d-492a-a8b38fd83093@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0130072021=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <6c6fcceb-c6f2-219d-492a-a8b38fd83093@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Karl Beldan <karl.beldan@gmail.com>, linux-devicetree <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Jyri Sarha <jsarha@ti.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Karl Beldan <kbeldan@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============0130072021==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="e8eufdJ916Lqei41WJcklLmckPut3tt7O"

--e8eufdJ916Lqei41WJcklLmckPut3tt7O
Content-Type: multipart/mixed; boundary="bAQc3IKvMW23rFA7e6CEFmCFKLiXId4b8";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Russell King <linux@armlinux.org.uk>, Karl Beldan <karl.beldan@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Karl Beldan <kbeldan@baylibre.com>
Message-ID: <bb7bac91-8eb1-fe23-ca9c-857e0fda6ecd@ti.com>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
 <7a2ffcd0-fe1d-c887-53b7-7cb5e1e61222@ti.com> <4975084.EGQPv58AK6@avalon>
 <daf49046-ad0a-d9e2-d744-1e06085c6585@ti.com>
 <CAMpxmJXT8hcSc0-svbwAq5r_JOFsYV852gtE0vuXL8hHykXnRQ@mail.gmail.com>
 <6c6fcceb-c6f2-219d-492a-a8b38fd83093@ti.com>
In-Reply-To: <6c6fcceb-c6f2-219d-492a-a8b38fd83093@ti.com>

--bAQc3IKvMW23rFA7e6CEFmCFKLiXId4b8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20/10/16 13:07, Sekhar Nori wrote:

> Per me, compatible property is an ordered list precisely for the reason=

> that things should continue to "work" with as closely matched driver as=

> possible. So even if someone is running a kernel which does not
> recognize "ti,da850-tilcdc", it should still be able to probe the drive=
r
> based on "ti,am33xx-tilcdc" and provide as close to full functionality
> as possible.
>=20
> That said, I will not insist on keeping it around if Tomi is
> uncomfortable. And having read the binding documentation accepted by
> Jyri, it actually says the compatible property should be __one of__
> "ti,am33xx-tilcdc" or "ti,da850-tilcdc".

Well, they are just not compatible as far as I know. If the LCDC on
DA850 would be identified as AM335x LCDC, and used as such, it would not
work at all. They have different registers, AM335x LCDC has registers
that do not exist on DA850.

With our driver it happens to work, because the driver looks at the IP
revision in the registers, and then decides that this IP is not AM335x
LCDC even if the dts says so. But I see that as a driver "feature",
nothing that the .dts can depend on.

Perhaps it might work the other way around, using DA850 driver on
AM335x, as DA850 LCDC is a kind of subset of AM335x LCDC. But I'm not
sure even about that.

 Tomi


--bAQc3IKvMW23rFA7e6CEFmCFKLiXId4b8--

--e8eufdJ916Lqei41WJcklLmckPut3tt7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYCJq7AAoJEPo9qoy8lh71POQP/jlaeC0j1O9fbewFkCU3/QXW
6Si5P81GkRed7RYPxWs0oauXwxKdk5PaeUPeIDKhox6jXwFETe/d6VfxiE650W91
yEMxl9ji91Kt3vIru+68OwbglTv27DVQTniLOzg28niUxWcBaZZ3Ib33MoWMK7Ar
PmD5pjax76datyvVC+h5CfmBWKnDRoJYoSZXaZIWtzkXLyUUMRRERykUtoata2b+
7Btdi1z1yCZ7TGM4J15mu5pmyxB+1e7tzq/rnEQaBCFGj0VtU4ZubvK0vpsmQ6Li
KOju4saSo4uTtrSZPsOo/jE5qk4l8JQjIZwwaIcRPnfLXz2I1XjWmrW/mmu5JjW3
qBuJQA0TIKyCOc4OePwtCS0adceZGX0lNGwln1O0vqSgGFskiUkVWAKrZktjX8Db
F7EpWw/Y8OfBBQLTpH9M4JIqXZUt+LAqnFwZyO3kviHyPSg5S7T5/cZQlnaKqls/
Xj+u0eQ2CHOg9fdITPVwFQ+JG/Bi62GgP3D3rbN6ORWnOseFX0OsMg5AUP+zEJYM
HyRj5MycHbO+pisVPuG71ssKv/tMmRY4V1jhy0+1/jLX/QQ4k6GAC8LToV0KZ4dg
kPNAKYc8f0NFEUpXmg+OOebkgeUpHly3U3HCNKxVdYOMb23T7MN7cgGduB6QZbzu
CqoCcmHO1zOKhvWY2J2r
=p1Yo
-----END PGP SIGNATURE-----

--e8eufdJ916Lqei41WJcklLmckPut3tt7O--

--===============0130072021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0130072021==--
