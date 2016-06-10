From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: Add MediaTek USB3 DRD Driver
Date: Fri, 10 Jun 2016 12:27:11 +0300
Message-ID: <8760th75sg.fsf@linux.intel.com>
References: <1465543962-11678-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465543962-11678-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Pawel Moll <pawel.moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Sascha Hauer <s.hauer@pengutronix.de>, Alan Cooper <alcooperx@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> From 8fdc924cecf0ca14da6e8aba360501e53437e548 Mon Sep 17 00:00:00 2001
> From: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Date: Fri, 10 Jun 2016 15:20:20 +0800
> Subject: [PATCH 0/5] Add MediaTek USB3 DRD Driver
>
> These patches introduce the MediaTek USB3 dual-role controller
> driver.
>
> The driver can be configured as Dual-Role Device (DRD),
> Peripheral Only and Host Only (xHCI) modes. It works well
> with Mass Storage, RNDIS and g_zero on FS/HS and SS. And it is
> tested on MT8173 platform which only contains USB2.0 device IP,
> and on MT6290 platform which contains USB3.0 device IP.
>
> Change in v3:
> 1. fix some typo error
> 2. rename mtu3.txt to mt8173-mtu3.txt
>
> Change in v2:
> 1. modify binding docs according to suggestions
> 2. modify some comments and remove some dummy blank lines
> 3. fix memory leakage

I don't see anything inherently wrong with this series. But keep in mind
I don't have HW to test. I can take the peripheral driver in a few days.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXWofvAAoJEIaOsuA1yqREjfMP/jHqr0YYEw25bawj6Sd0VNSV
foC62fuiGDyOY508ES04EQjV7Q9lMa2hWfel/l2SMOV+v8bcNrv7qnySAoxt8HN7
+9OCiFN68r3wAqZ6H01YsbOWtSC6b6vIRnTB723AJ20vw2IL+WGhZ3AL+5GzWwtU
cBWRcuFOh3hNzkI8EGcnNxpCuRZLFHSb4g+Pc010m7oEm9GdnywsHoRYd7XzHwhK
ALlkjv1wUypHNep1sAOXx9hZL8FxTaov29+a9miu9WWnCM7b90yEJvCd31pxm+zC
ZjzgJoD8MAEl7lKwNeHBR83km4ZznoLa2PV8Yedu4oTqvWEAVUeL876S1JkxzmMo
LjrEoIKW7WZYsEGvXlUOu9Kr5XwegkstSFbo47clvxs2WbKyZsRglcsKq8AM3JKW
mEXhkjgY10I5//Ql0OjGBy8jV1TuPSguROXK3GU9M5F0/+pYGLqmgfjqbuK/3eRq
kQaiyYmIUA/k5/jEWAHelyAjf6QnPX523TLsfDZsno59+eP4+3aXEXdX8hoKQtvC
H006W8Apwy4uDdoWG7QVQtinPYpe0mywLLIBC6trjktl1/R2wrqYEyHlk9sCG1Yv
hYi2Fv2szDH38MiZACCOO+Osu1hAqayjQ5VXCSckraMH0OfYDfzuRWZknAkrCNjg
GHcg6XeJtQ4pt6etVuXu
=12Xo
-----END PGP SIGNATURE-----
--=-=-=--
