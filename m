From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: nand: Add support for reading ooblayout from device
 tree
Date: Sat, 12 May 2018 11:38:26 -0300
Message-ID: <1526135906.4971.0@smtp.crapouillou.net>
References: <20180512115551.56C6E20787@mail.bootlin.com>
        <20180512154223.3b81c7f7@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180512154223.3b81c7f7@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Boris Brezillon <boris.brezillon@bolin.com>, Marek Vasut <marek.vasut@gmail.com>
List-Id: devicetree@vger.kernel.org



Le sam. 12 mai 2018 =E0 10:42, Boris Brezillon=20
<boris.brezillon@bootlin.com> a =E9crit :
> On Sat, 12 May 2018 08:55:40 -0300
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  Hi Boris,
>>=20
>>  Le 12 mai 2018 02:55, Boris Brezillon <boris.brezillon@bootlin.com>=20
>> a =E9crit :
>>  >
>>  > Hi Paul,
>>  >
>>  > On Fri, 11 May 2018 23:29:12 +0200
>>  > Paul Cercueil <paul@crapouillou.net> wrote:
>>  >
>>  > > By specifying the properties "mtd-oob-ecc" and "mtd-oob-free",=20
>> it is
>>  > > now possible to specify from devicetree where the ECC data is=20
>> located
>>  > > inside the OOB region.
>>  >
>>  > Why would we want to do that? I mean, ECC/free regions are ECC
>>  > controller dependent (and NAND chip dependent for the OOB size=20
>> part),
>>  > so there's no reason to describe it in the DT. And more=20
>> importantly,
>>  > people are likely to get it wrong.
>>  >
>>  > I'm curious, why do you need that?
>>=20
>>  Good question.
>>=20
>>  The reason is that some SoCs have no ECC controller.
>>  The various boards for these SoCs then all use a different layout.
>=20
> Okay. Still think defining the layouts in the DT is a bad idea. We
> can add a jz4740 specific property to define the layout id
> (ingenic,nand-oob-layout =3D <layout-id>), but not a generic way to
> define custom layouts for all kind of NAND controller.

Okay.

>>=20
>>  My motivation is to get rid of this (move it to devicetree):
>> =20
>> https://elixir.bootlin.com/linux/latest/source/arch/mips/jz4740/board-qi=
_lb60.c#L93
>>  And enable the support of other boards with custom OOB layouts.
>=20
> Can you list the different layouts you have? I'm pretty sure there's a
> pattern. Maybe we can even deduce the layout from the page size or OOB
> size.

This is the other layout I have for another ingenic device:
http://projects.qi-hardware.com/index.php/p/qi-kernel/source/tree/od-2011-0=
9-18/arch/mips/jz4740/board-a320.c#L125

Page size and OOB size are the same between these two devices.

-Paul
=
