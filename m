From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Date: Mon, 9 Mar 2015 10:59:38 -0700
Message-ID: <20150309175938.GV18140@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <CACna6rykQTjtfL8mqHJ4ZSY9Ci+kVhjDfDkjRpsFvg4YatNATw@mail.gmail.com>
 <20150308005720.GF12966@brian-ubuntu>
 <CACna6rz_iya8UMdDvsOSA0NSvc2YxNJ1GObqBLtr8Xd2-9enCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rz_iya8UMdDvsOSA0NSvc2YxNJ1GObqBLtr8Xd2-9enCQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Cernekee <cernekee@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 08, 2015 at 12:18:39PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> On 8 March 2015 at 01:57, Brian Norris <computersforpeace@gmail.com> =
wrote:
> > 3. I was told that there were only 2 or 3 chips that were released =
with
> > a v6.1 NAND controller, and BCM4708 wasn't one of them. Apparently =
I was
> > told wrong... I'll have to see if there are any other quirks we sho=
uld
> > be accounting for.
>=20
> Please note I'm speaking about 6.01, not 6.10. Maybe it make a differ=
ence?
>=20
> Buffalo WZR-600DHP2 (BCM47081)
> [    0.325732] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
> [    4.838105] bcma: bus0: Found chip with id 53010, rev 0x00 and pac=
kage 0x02
>=20
> Buffalo WZR-1750DHP (BCM4708)
> [    0.326823] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
> [    6.674288] bcma: bus0: Found chip with id 53010, rev 0x00 and pac=
kage 0x02
>=20
> Netgear R6250 V1 (BCM4708)
> [    0.326248] [brcmnand_revision_init:371] ctrl->nand_version:0x0601
> [    8.721335] bcma: bus0: Found chip with id 53010, rev 0x00 and pac=
kage 0x02
>=20
> Netgear R8000 (BCM4709)
> [    0.241961] bcma: bus0: Found chip with id 53010, rev 0x00 and pac=
kage 0x00
> [    1.990330] bcm_nand bcma0:18: NAND Controller rev 6.01

We've never had a MINOR number larger than 4 or 5, I think, so I haven'=
t
actually bothered with two digits past the decimal. It's 8 bits of MAJO=
R
and 8 bits of MINOR, but we just call it 6.1 in all our documentation.

0x0601 =3D=3D v6.1
0x0701 =3D=3D v7.1

I suppose if we ever have to care (e.g., we get past 7.9), we'd probabl=
y
call it 7.10 (0x070a). Kinda like kernel versioning (and not like Ubunt=
u
versioning).

Brian
