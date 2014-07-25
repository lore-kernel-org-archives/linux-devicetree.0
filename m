From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 09/11] Documentation: devicetree: Fix ADI AXI SPDIF
 specification
Date: Fri, 25 Jul 2014 12:32:43 +0200
Message-ID: <53D2324B.4070602@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <1406242820-20140-10-git-send-email-afaerber@suse.de> <53D20A61.1050506@metafoo.de> <53D21066.8000905@monstr.eu> <20140725101815.GO17528@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140725101815.GO17528@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>, Lars-Peter Clausen <lars@metafoo.de>, Michal Simek <michal.simek@xilinx.com>, Andreas Olofsson <andreas@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am 25.07.2014 12:18, schrieb Mark Brown:
> On Fri, Jul 25, 2014 at 10:08:06AM +0200, Michal Simek wrote:
>=20
>> All these patches have been added through your tree that's why I
>> think you should take this fix through his tree.
>=20
> If someone could send me patches I'll take a look at them.

I used scripts/get_maintainer.pl --nogit-fallback. If you were not
CC'ed and need to be, please submit a MAINTAINERS patch. :)

Maybe this works for you?
https://patchwork.kernel.org/patch/4620191/

Otherwise I can resend with Ab/Rb.

Andreas

- --=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT0jJLAAoJEPou0S0+fgE/od0QAItNVBWohkpacvB5M+Oh0x5H
40aYXWOPVrAHRfXlh5SsSQyba/2P6q719meJL3FseU7Jj+rbkPnICf3q5KWgN3Vb
iXoO+UQPn/gvredRql9g5eUj0xeh6j3bIAmEYmmme3opg0siKV1Gd6D9vEezjL8x
M3xroJ05EbhjAd1UrgW/xEINAfDExLXbUQhsbls1tzL7WL9Cx4Obi7/KWiAVATMU
RPNQiz8zyVXoJq0i596fAKX+EPaID2ztr26IQtpH+vOJOpRhtQeX+B+HBxTm89yO
mg7ZnklhXFFaAYhXKEm1itMbi8OnCUzDuk5hPklCJF+WgzBbyq29erx53VaRQAij
jrebNU4UB0/si7Gnl/XwvRMDUaVDkF6OaeeSjwKZvk0R6o02lperM51gKOgsDdC9
G9VPb9AoNvbebEaNvonU22gB81RWg1MFkW7XF1Enj0C+xINePG86TXpWNiNUPfdV
QAyYhwrAlePV4tKYqnyDd1d8orPs5TySVt3tuloUTB17IpYXM7OWj7db5so5V6O2
99m2rrcMCP5SxDiuB0LUbKxrBoIhGH2kZ0k476Xb/YOYgpBskOxFLqZ+ptzZDW7K
a3frjJ98QKjb5z9fZ1qZBzbegggAEvXlhpIgcaWAkT1wV3vmZhQjycpDHNWuahsu
ybMjvgNj/YiougCN+7bf
=3Dzr8g
-----END PGP SIGNATURE-----
