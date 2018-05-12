From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: nand: Add support for reading ooblayout from device
 tree
Date: Sat, 12 May 2018 20:30:29 +0200
Message-ID: <1526149829.1594.1@smtp.crapouillou.net>
References: <20180512115551.56C6E20787@mail.bootlin.com>
        <20180512154223.3b81c7f7@bbrezillon>
        <1526135906.4971.0@smtp.crapouillou.net>
        <20180512170034.12779313@bbrezillon>
        <1526146969.1594.0@smtp.crapouillou.net>
        <20180512200219.6ded51a6@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180512200219.6ded51a6@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Boris Brezillon <boris.brezillon@bolin.com>, Marek Vasut <marek.vasut@gmail.com>
List-Id: devicetree@vger.kernel.org



Le sam. 12 mai 2018 =E0 20:02, Boris Brezillon=20
<boris.brezillon@bootlin.com> a =E9crit :
> On Sat, 12 May 2018 19:42:49 +0200
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  >>  >>  My motivation is to get rid of this (move it to devicetree):
>>  >>  >>
>>  >>  >>
>>  >>=20
>> https://elixir.bootlin.com/linux/latest/source/arch/mips/jz4740/board-qi=
_lb60.c#L93
>>  >>  >>  And enable the support of other boards with custom OOB=20
>> layouts.
>>  >>  >
>>  >>  > Can you list the different layouts you have? I'm pretty sure
>>  >> there's a
>>  >>  > pattern. Maybe we can even deduce the layout from the page=20
>> size
>>  >> or OOB
>>  >>  > size.
>>  >>
>>  >>  This is the other layout I have for another ingenic device:
>>  >>
>>  >>=20
>> http://projects.qi-hardware.com/index.php/p/qi-kernel/source/tree/od-201=
1-09-18/arch/mips/jz4740/board-a320.c#L125
>>  >>
>>  >>  Page size and OOB size are the same between these two devices.
>>  >
>>  > Indeed. Do you know if there are other kind of layouts in the=20
>> wild?
>>=20
>>  I'm getting a new board in a few weeks, I'll be able to check that=20
>> out.
>>=20
>>  > Note that <layout-id> can be a string, so if each each board is
>>  > defining its own layout, you could specify the board name here.
>>  > Otherwise, if you just have those 2 patterns, you can just name=20
>> them
>>  > "contiguous" and "interleaved".
>>=20
>>  I don't like the idea of adding board-specific data inside the=20
>> driver...
>>  I'd prefer to use the method I used in this patch, but inside the
>>  jz4740-nand driver, if you're OK with it.
>=20
> Please don't. Encoding such detailed description in the DT has almost
> always proven to be poor choice. Also, people are likely to get it
> wrong, and then you'll have to fix all DTs, while, with a single=20
> unique
> ID representing the layout, you can
> - re-use existing layouts easily without having to describe everything
>   again in the DT
> - fix the driver without getting in trouble with people who claim
>   that DT is a stable ABI and don't want to update their DT
>=20
> So, please just pick user-friendly IDs and add layout definitions in
> the driver. If you don't want to leak board info in the driver, then
> don't name the layout with the board name. BTW, I still hope you'll=20
> only
> have 2 kind of layouts (contiguous and interleaved).

Alright. Thanks for the insights.

-Paul
=
