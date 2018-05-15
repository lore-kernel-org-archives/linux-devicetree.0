From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: gadget: composite: fill bcdUSB as 0x0320 for SuperSpeed or higher speeds
Date: Tue, 15 May 2018 10:22:03 +0300
Message-ID: <87efid9yec.fsf@linux.intel.com>
References: <69cc710fa8b7d18c494c9f482fd2b8e6fb7c0c94.1525865206.git.chunfeng.yun@mediatek.com> <8736z1kqrq.fsf@linux.intel.com> <1525913200.32173.3.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525913200.32173.3.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> On Wed, 2018-05-09 at 14:33 +0300, Felipe Balbi wrote:
>> Hi,
>>=20
>> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
>> > The USB3CV version 2.1.80 (March 26, 2018) requires all devices
>> > ( gen1, gen2, single lane, dual lane) to return the value of 0x0320
>> > in the bcdUSB field
>>=20
>> this sounds really odd. What happens when I get a USB 3.1 compliant
>> device off-the-shelf and run it through USB3CV? will it fail now?
> Yes, it will fail, the last version requires it 0x0310
>>=20
>> Care to share a screenshot or the raw html of the test result?
> A screenshot is attached

really odd. But I'll apply the patch.

thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlr6ipsACgkQzL64meEa
mQYO6xAAhtcb9jjMwlbve2ite49+UwfbMIQ0QNcFsueR9owX9yE63gZy/5F0zmPO
0cm7ejdZuApKRuzAaZf2yjiQyMEpNtlc0u5Xrfozka+jeEJkQoh5O527HzZcwlEf
pz09dD/qMXo1m0jGsHhMJTKRlPW+6ix8JemN5Po0eGQEoezonnAuYcTS1/EtJS/H
G6WxrT9phd3h/uqsoZk7D0cl/RyUpAuW9WBp1KS1HEB4xNdENBqm9QJ/rxMN1GNN
QSbLbXfF2HPSCLPmPEniUtHNhHCrH5DteJjsf5B/oGFI4EDoOYec3umMONuQh5tX
zog8HEF8qO9vQC9k5y9Abqc35Xo+9UCqNO5EG05ifk+MmOTPe4258zeRw6wUnDx3
iREmWilxtHatef+af67W0pYnWu+XN38SFKlg+qXA85hb1hlFr1r6teXC07bZplLu
z7kY68v0xt1PAMsP5JuFP50G0qvP4Wp7hsBNup66KEIBNlUda28Ihu/+5wgb1B8Y
POucrJ7N5vfjG1HqJoHlTX1/sKcnrtuWsaoVO+hMVzf5RuzXpeddPh/vvXHT6hDy
YKhJhbiGlJLkgFlwyeQxrBXZ4nfO3UeHma/uoa6eouB2sDNqm1Jo0PGoZCwubVc3
R/wst0nOiV8bv+86VxpU4wSKiL/U2qmapvskVvTEa4p9FtKmtYw=
=g+N+
-----END PGP SIGNATURE-----
--=-=-=--
