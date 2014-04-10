From: Michal Simek <monstr@monstr.eu>
Subject: Re: [RFC PATCH] edac: add support for ARM PL310 L2 cache parity
Date: Thu, 10 Apr 2014 08:12:17 +0200
Message-ID: <53463641.1030800@monstr.eu>
References: <1393770760-32550-1-git-send-email-punnaia@xilinx.com> <a1a9e47a-069c-4285-9899-d5a58cf532c2@CO9EHSMHS003.ehs.local> <20140409113246.GA8778@pd.tnic> <CAL_Jsq+gszc+R_BrLtHKEBGYd=3T+sE1d+-HoF9aYZt6C2k5-g@mail.gmail.com> <20140409151932.GK6529@pd.tnic> <CAHLkNHJTA5bGD1zAfzE2JrDFAWvmgYyYjir+4vR-d9Fe2-E48g@mail.gmail.com> <20140409174701.GO6529@pd.tnic>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="ME3xMGXB0ilkieRoxEIfFGdTbD860ewG6"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140409174701.GO6529@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: Punnaiah Choudary <kpc528@gmail.com>, Rob Herring <robherring2@gmail.com>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Doug Thompson <dougthompson@xmission.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, punnaiah choudary kalluri <kalluripunnaiahchoudary@gmail.com>, punnaiah choudary kalluri <punnaia@xilinx.com>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ME3xMGXB0ilkieRoxEIfFGdTbD860ewG6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/09/2014 07:47 PM, Borislav Petkov wrote:
> On Wed, Apr 09, 2014 at 10:59:49PM +0530, Punnaiah Choudary wrote:
>> There is a driver file cache-l2x0.c under arch/arm/mm for pl310 cache
>> configuration and management. Russel king had suggested to use
>> single driver file for both pl310 edac implementation and cache-l2x0.c=

>> Here is the thread
>> http://www.spinics.net/lists/arm-kernel/msg320407.html
>>
>> please provide your inputs
>=20
> Well, it is very simple - you don't really need an EDAC compilation uni=
t
> just so that you can report errors - you can very well do that in your
> cache-l2x0.c and boom, problem solved.
>=20
> Simply move the irq handler and the parity error checker to that file.

I am just curious about this recommendation. Does it mean that we shouldn=
't
use edac interface just for reporting problems?

I didn't play with it but I guess that there is a record about edac drive=
r
via sysfs, etc. You could read some useful information that you know
what it is protected and I hope that edac interface bring any value
to reporting errors comparing to just printk message from IRQ handler.

My question is if using printk in IRQ handler and report problem is equal=
 to
reporting this via edac interface. Or it is just easy way to do but
using edac interface is right solution and how to do it properly
is different question.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--ME3xMGXB0ilkieRoxEIfFGdTbD860ewG6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlNGNkEACgkQykllyylKDCFcdwCfWd+zLKLdg7fKhj2az7pGDH2u
6eEAn14us5SrSATJ2vm0EKz1wf7BtV8B
=Jujl
-----END PGP SIGNATURE-----

--ME3xMGXB0ilkieRoxEIfFGdTbD860ewG6--
