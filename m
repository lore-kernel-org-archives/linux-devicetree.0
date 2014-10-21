From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v2 00/11] ARM: dts: zynq: Prepare Parallella
Date: Tue, 21 Oct 2014 22:52:05 +0200
Message-ID: <5446C775.3030707@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <CAOesGMjAb5oXjauhbqjDhJXWct7qoXxy3XpA1=DioK7vPTwetA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="38a95uWk7UeRm39nJBISx0pJrOj6Wl3Et"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMjAb5oXjauhbqjDhJXWct7qoXxy3XpA1=DioK7vPTwetA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--38a95uWk7UeRm39nJBISx0pJrOj6Wl3Et
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Olof and S=C3=B6ren,

Am 18.10.2014 um 06:28 schrieb Olof Johansson:
> On Thu, Jul 24, 2014 at 4:00 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
>> Hello,
>>
>> This patch series adds an initial device tree for the Parallella board=
=2E
>> UART, SD card, Ethernet are enabled.
>> Not yet enabled are HDMI, QSPI flash and 2x USB.
>=20
> Andreas (Olofsson) kindly sent me a board, and I added it to the boot
> farm today, it'll be included in boot reports from here on.

Good to hear.

> I did a test run with yesterday's -next It looks like networking isn't
> working there at the moment, clock related. Same happens with 3.17 and
> latest mainline, config multi_v7_defconfig:
>=20
> [WARN] [    7.943648] macb e000b000.ethernet eth0: unable to generate
> target frequency: 125000000 Hz
> [WARN] [   10.948681] macb e000b000.ethernet eth0: unable to generate
> target frequency: 125000000 Hz

I am unable to reproduce this in my setup - at Linus' tip
c2661b806092d8ea2dccb7b02b65776555e0ee47 (v3.18-rc1-68-gc2661b8), make
oldconfig'ing my /proc/config.gz.

S=C3=B6ren, in light of your explanations, should I be expecting problems=

with 1GbE or with 100MbE? My board is connected to a 1GbE switch.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg


--38a95uWk7UeRm39nJBISx0pJrOj6Wl3Et
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJURsd1AAoJEPou0S0+fgE/j8wP/RKXZbzkRfZ3C++PFBHPMcmi
Jx7O9lyuOizlCWjPkYZEapXWqEJGRRLJN4qpwrasESOt5mVPQOB2zLH48RqcOOKw
KKboTy2BpSHGfgtBUBMtI2EOcpxinljrhjMYpKhboueeTPMtGYuWwWIfCUWvL+XI
ABwIoSAFioRgDIV1Lju2iPQCTfSIhBBDybqR72cbivVS5FsyFwxNiMNtJKHzKyr2
0hWZeNceI2mMIG089iPvJ5EOfGkW+38udMQch5NsexDCi7Gp/y18SnTQdcQ+WA5m
mys6OBwmsiZlQ0sD98/rT9FNURnGX45oMYGDQJZz8+a1jC4GvS0B8CvcH16X51XS
4m3UWqiBaEJpcW0tcAOglF38k2lhkAMCmA2J8FDq2HFvVJ2ZviDHZScEpJS4hn+w
IxrfVkSgfKCUcb4SZ0BUR/QP9DqJx4pm5UpXl0HS9QewsKXWQNPjDH2ogfBPsBKc
Pfpwja9xITgvHPp2XHWNPx/1V5ZLFnzaUTiwhsM+S9EZPvq/J0pVkz3PfikzGcqm
iLlfiCfyqfyFjBr70bxMSeRNIfbTUrcmrk87sFxImpr4bSAszRNDooJNDIK4xfVM
WIV3SlDspOzv5rAqToZgoz+344PnGW73z5u3itCpmX9NavUc2Ysgfxt9Nko9AK6Y
2ySfRV9q4LXZmzrtaFRU
=r10C
-----END PGP SIGNATURE-----

--38a95uWk7UeRm39nJBISx0pJrOj6Wl3Et--
