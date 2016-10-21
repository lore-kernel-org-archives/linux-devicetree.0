From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/3] ARM: bus: da8xx-syscfg: new driver
Date: Fri, 21 Oct 2016 12:56:13 +0300
Message-ID: <02b2126b-0348-0b9e-ac91-79fa18657971@ti.com>
References: <1476721850-454-1-git-send-email-bgolaszewski@baylibre.com>
 <2278105.geKhb8xoNC@avalon> <7h8ttj6jqo.fsf@baylibre.com>
 <1867292.F3aGJTmS2t@avalon> <7h8tti6c95.fsf@baylibre.com>
 <f6a0f61e-9d78-3df1-8e41-435eb47a1f00@ti.com>
 <278cac52-020f-da2f-54d7-e68d3b71eb65@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0237917812=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <278cac52-020f-da2f-54d7-e68d3b71eb65@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============0237917812==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="BKC5F9vh6Cp3Fw90haK7TlxNVMUSCOkuu"

--BKC5F9vh6Cp3Fw90haK7TlxNVMUSCOkuu
Content-Type: multipart/mixed; boundary="AGcsJWfLtNKfl48BcNc6vblKrs2bPn1oP";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Message-ID: <02b2126b-0348-0b9e-ac91-79fa18657971@ti.com>
Subject: Re: [PATCH 2/3] ARM: bus: da8xx-syscfg: new driver
References: <1476721850-454-1-git-send-email-bgolaszewski@baylibre.com>
 <2278105.geKhb8xoNC@avalon> <7h8ttj6jqo.fsf@baylibre.com>
 <1867292.F3aGJTmS2t@avalon> <7h8tti6c95.fsf@baylibre.com>
 <f6a0f61e-9d78-3df1-8e41-435eb47a1f00@ti.com>
 <278cac52-020f-da2f-54d7-e68d3b71eb65@ti.com>
In-Reply-To: <278cac52-020f-da2f-54d7-e68d3b71eb65@ti.com>

--AGcsJWfLtNKfl48BcNc6vblKrs2bPn1oP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 21/10/16 12:53, Sekhar Nori wrote:
> On Friday 21 October 2016 02:55 PM, Tomi Valkeinen wrote:
>> On 20/10/16 22:39, Kevin Hilman wrote:
>>
>>> However, after our discussion on IRC, we'll respin this without the D=
T
>>> bindings at all.  Next version will just use static configuration dat=
a
>>> in the drivers/bus driver based on SoC compatible string, since for t=
he
>>> use-cases I'm aware of, the settings are boot-time only.
>>
>> If it's static boot time config, why not do it in the u-boot?
>=20
> Hardware initialization dependencies with boot-loader are tough to trac=
k
> and debug. The bootloader thats currently ships with the board may not
> have these settings, for example. This forces everyone to update their
> bootloader when shifting to mainline kernel.

Yep, true... We need something similar for AM335x too. And perhaps for
other SoCs too (AM4 comes to my mind).

 Tomi


--AGcsJWfLtNKfl48BcNc6vblKrs2bPn1oP--

--BKC5F9vh6Cp3Fw90haK7TlxNVMUSCOkuu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYCeY9AAoJEPo9qoy8lh71x8QQAKE+4444DHvjyLgvzg8KNCaw
/bies+uOLqNCWqYlAwSPUI392ys/gI63DjPP+nF3skovu2QEm3znd2HyavQgEvo2
grAMjI+Ssdbu3olqCQxaJp3D7ilBYyjuN+qIRQJjW9pGKJU4SIQlKSCaQEECO605
ij4mxQmxtEYDmgqjZO8qZsKYokNDO8381MoEI7JeNw4p/u4YFplyuvuBkQIE0b7g
hH4Yua6UV7qDIhDctsKwmzT/WtrYtzQVAavWWLBU9AuTFUPgbSYFty75ZhYjkWT/
t1gVW/LbomRCCs52UHx+zQkPNB7Uj33AeofbTRuD4zaE71HJQ+Cb58iD3+TRZYm8
+AToVv2XFNqI7+hWmziX0rBNeQ+bZRALWv/R47iLm4rFeUYy+rroBrslTv653h0A
mCPzTG6HNSG/lv71505FJyzgPWZ2SH1tGfSweerMKd7DS2SdW6or88hjFNscipF3
5UttLV7yDeQMh5SYc/cmg+5SYcqguhM3/3e3ms1WPqyXmC1qq51OKXfgWauC2Ny6
lR57BL7QNXcJNmSeJz3VPW3BlRezL7XHHz6/7qeZWUrC7pNsv0dYlD6FBHkUwsgq
RXM22laiFqgTRHYkRjmv2CFPd59BPVJ5PeKM0EKCh61DtTASj24GTHL/uD3yBO2N
0HIRrvCweYBA4eMRRb/n
=A7X6
-----END PGP SIGNATURE-----

--BKC5F9vh6Cp3Fw90haK7TlxNVMUSCOkuu--

--===============0237917812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0237917812==--
