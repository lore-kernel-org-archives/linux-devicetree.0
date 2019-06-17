From: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Subject: Re: [PATCH v2 0/2] Add macb support for SiFive FU540-C000
Date: Mon, 17 Jun 2019 09:14:25 -0500
Message-ID: <F48A4F7F-0B0D-4191-91AD-DC51686D1E78@sifive.com>
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
 <mvmtvco62k9.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170252410.19994@viisi.sifive.com>
 <mvmpnnc5y49.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170305020.19994@viisi.sifive.com>
 <mvmh88o5xi5.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170419010.19994@viisi.sifive.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1906170419010.19994@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Andreas Schwab <schwab@suse.de>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nicolas.ferre@microchip.com, Sachin Ghadi <sachin.ghadi@sifive.com>, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, ynezz@true.cz, linux-riscv@lists.infradead.org, davem@davemloft.net, Jim Jacobsen <jamez@wit.com>
List-Id: devicetree@vger.kernel.org



> On Jun 17, 2019, at 6:34 AM, Paul Walmsley <paul.walmsley@sifive.com> =
wrote:
>=20
> On Mon, 17 Jun 2019, Andreas Schwab wrote:
>=20
>> On Jun 17 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
>>=20
>>> On Mon, 17 Jun 2019, Andreas Schwab wrote:
>>>=20
>>>> On Jun 17 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
>>>>=20
>>>>> Looks to me that it shouldn't have an impact unless the DT string =
is=20
>>>>> present, and even then, the impact might simply be that the MACB =
driver=20
>>>>> may not work?
>>>>=20
>>>> If the macb driver doesn't work you have an unusable system, of =
course.
>>>=20
>>> Why?
>>=20
>> Because a system is useless without network.
>=20
> =46rom an upstream Linux point of view, Yash's patches should be an=20
> improvement over the current mainline kernel situation, since there's=20=

> currently no upstream support for the (SiFive-specific) TX clock =
switch=20
> register.  With the right DT data, and a bootloader that handles the =
PHY=20
> reset, I think networking should work after his patches are upstream =
--=20
> although I myself haven't tried this yet.
>=20

Have we documented this tx clock switch register in something with a
direct URL link (rather than a PDF)?

I=E2=80=99d like to update freedom-u-sdk (or yocto) to create bootable =
images
with a working U-boot (upstream or not, I don=E2=80=99t care, as long as =
it works),
and what I have right now is the old legacy HiFive U-boot[1] and a 4.19
kernel with a bunch of extra patches.

The legacy M-mode U-boot handles the phy reset already, and I=E2=80=99ve =
been
able to load upstream S-mode uboot as a payload via TFTP, and then=20
load and boot a 4.19 kernel.=20

It would be nice to get this all working with 5.x, however there are =
still
several missing pieces to really have it work well.


[1] https://github.com/sifive/HiFive_U-Boot=
