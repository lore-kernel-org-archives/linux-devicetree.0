From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/9] mtd: rawnand: jz4780: Add support for the JZ4740
Date: Sun, 03 Feb 2019 11:10:50 -0300
Message-ID: <1549203050.1950.3@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
        <20190202231926.2444-5-paul@crapouillou.net>
        <20190203083151.4fc29c5b@bbrezillon> <1549202213.1950.1@crapouillou.net>
        <20190203150827.401ac31d@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190203150827.401ac31d@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



Le dim. 3 f=E9vr. 2019 =E0 11:08, Boris Brezillon <bbrezillon@kernel.org>=20
a =E9crit :
> On Sun, 03 Feb 2019 10:56:53 -0300
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  Le dim. 3 f=E9vr. 2019 =E0 4:31, Boris Brezillon=20
>> <bbrezillon@kernel.org>
>>  a =E9crit :
>>  > On Sat,  2 Feb 2019 20:19:21 -0300
>>  > Paul Cercueil <paul@crapouillou.net> wrote:
>>  >
>>  >>  Add support for probing the jz4780-nand driver on the JZ4740 SoC
>>  >> from
>>  >>  Ingenic.
>>  >>
>>  >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  >>  ---
>>  >>
>>  >>  Changes:
>>  >>
>>  >>  v2: - Add support for the JZ4740 and not the JZ4725B: they=20
>> behave
>>  >> the
>>  >>        same, and JZ4740 is fully upstream while JZ4725B is not.=20
>> The
>>  >>        JZ4725B devicetree will then simply use the
>>  >> "ingenic,jz4740-nand"
>>  >>        compatible string.
>>  >>      - Fix the number of bytes for the ECC when the ECC strength=20
>> is
>>  >> 4.
>>  >>        This is needed for the JZ4740, which uses Reed-Solomon
>>  >> instead of
>>  >>        BCH.
>>  >>
>>  >>   drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 48
>>  >> +++++++++++++++++-----
>>  >
>>  > If we're going to make the driver compatible with jz4740 and=20
>> jz4725b
>>  > maybe we should rename the source files jz47xx_{nand,bch}.{c,h}.
>>=20
>>  I don't know about that. Adding support for new hardware isn't a=20
>> good
>>  reason to
>>  rename the driver, or so I've been told around here, as you then=20
>> make
>>  it harder
>>  to review the git history of the driver.
>=20
> You already move files to a sub-directory so that doesn't make a huge
> difference, history will be hard to follow because of this move=20
> anyway.

Yes, but if I merge the *_bch.c files together, and eventually drop
jz4740-nand.c, does it still make sense to move to a sub-directory?
=
