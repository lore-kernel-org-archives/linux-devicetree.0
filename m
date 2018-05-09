From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: gadget: composite: fill bcdUSB as 0x0320 for SuperSpeed or higher speeds
Date: Wed, 09 May 2018 14:33:13 +0300
Message-ID: <8736z1kqrq.fsf@linux.intel.com>
References: <69cc710fa8b7d18c494c9f482fd2b8e6fb7c0c94.1525865206.git.chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <69cc710fa8b7d18c494c9f482fd2b8e6fb7c0c94.1525865206.git.chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> The USB3CV version 2.1.80 (March 26, 2018) requires all devices
> ( gen1, gen2, single lane, dual lane) to return the value of 0x0320
> in the bcdUSB field

this sounds really odd. What happens when I get a USB 3.1 compliant
device off-the-shelf and run it through USB3CV? will it fail now?

Care to share a screenshot or the raw html of the test result?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlry3HkACgkQzL64meEa
mQZVhw//c8t4VTHKlwox/tPXPbndtR4FkwXphjHcAuuOELFYCjxYaP9aG+7WTqYr
7GdOsC+FkGagg0qJ6XQ1thV1pAZ9y/onGmCYnCpEyOXHFO0UVBz60/ooRt2eeLqc
Akk/Obl92v5vGG2Nh5u3cNOIgMovp6g56K4it2Gu3kTuuORQIqcx6bwNqwahKf4R
7X3gZ+pSVWvq0s0TpYeAYrDIzHKoIuXnCJJlVBaqDpf8gNUbzAg1nw9kKuNkVupy
cGSHfgTDIhnd3/cHwNluHbyGRAwPDMUs1ERqUAyoUVweFoKM1Y8zd0NzXIkhPzgP
J3cXHCIKrtdy4RsbwpVkTZRlFN7UjNaTRCUDQHENfmwzIHR3pn9tOnkLTp6cjClI
Pwj+Ni6G+CWGA6+KCwpI/8aUakyTd2fsue+X64bSslI+mjc24nTtii3rLD+oNevF
MLETaiAlU6Xn4YhCAfv/A/LzxxTUHqQnEJlBlqAnZO+9hVBQ+jL1DuM2BqgrNUoL
mb1m9yLHYasbQ6iJPjDegqO4M+A/nLNS6SY/2e4wc0uwI7CXP5P3eQGp6H57GxF2
XtGUYQhSTjyj6qs89uicNRsy70v52E3BzFBWw2lmVikqrU9HiD3VC7cJCK5/n3ZN
IaxwIsiIpRKpWxoSvl/Vd6B3+FDIeiu6tfJTHcGirDdRFlS1E6M=
=yC5H
-----END PGP SIGNATURE-----
--=-=-=--
