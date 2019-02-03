From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 9/9] mtd: rawnand: jz4780-bch: Add support for the
 JZ4740
Date: Sun, 03 Feb 2019 11:56:32 -0300
Message-ID: <1549205792.1588.0@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
        <20190202231926.2444-10-paul@crapouillou.net>
        <20190203083505.4dc52278@bbrezillon> <1549202293.1950.2@crapouillou.net>
        <20190203151604.23061e2a@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190203151604.23061e2a@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



Le dim. 3 f=E9vr. 2019 =E0 11:16, Boris Brezillon <bbrezillon@kernel.org>=20
a =E9crit :
> On Sun, 03 Feb 2019 10:58:13 -0300
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
>>  Le dim. 3 f=E9vr. 2019 =E0 4:35, Boris Brezillon=20
>> <bbrezillon@kernel.org>
>>  a =E9crit :
>>  > On Sat,  2 Feb 2019 20:19:26 -0300
>>  > Paul Cercueil <paul@crapouillou.net> wrote:
>>  >
>>  >>  Add the backend code for the jz4780-bch driver to support the=20
>> JZ4740
>>  >>  SoC from Ingenic.
>>  >>
>>  >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  >>  ---
>>  >>
>>  >>  Changes:
>>  >>
>>  >>  v2: New patch
>>  >>
>>  >>   drivers/mtd/nand/raw/ingenic/Makefile         |   2 +-
>>  >>   drivers/mtd/nand/raw/ingenic/jz4740_bch.c     | 173
>>  >> ++++++++++++++++++
>>  >>   .../mtd/nand/raw/ingenic/jz4780_bch_common.c  |   1 +
>>  >>   .../nand/raw/ingenic/jz4780_bch_internal.h    |   1 +
>>  >>   4 files changed, 176 insertions(+), 1 deletion(-)
>>  >>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4740_bch.c
>>  >>
>>  >>  diff --git a/drivers/mtd/nand/raw/ingenic/Makefile
>>  >> b/drivers/mtd/nand/raw/ingenic/Makefile
>>  >>  index f38b467490cf..d16c96113a93 100644
>>  >>  --- a/drivers/mtd/nand/raw/ingenic/Makefile
>>  >>  +++ b/drivers/mtd/nand/raw/ingenic/Makefile
>>  >>  @@ -1,3 +1,3 @@
>>  >>   obj-$(CONFIG_MTD_NAND_JZ4740) +=3D jz4740_nand.o
>>  >>   obj-$(CONFIG_MTD_NAND_JZ4780) +=3D jz4780_nand.o=20
>> jz4780_bch_common.o
>>  >> \
>>  >>  -				 jz4780_bch.o jz4725b_bch.o
>>  >>  +				 jz4780_bch.o jz4725b_bch.o jz4740_bch.o
>>  >
>>  > I still don't see the point of the jz4780_bch_common/jz47xxx_bch
>>  > separation. You seem to always embed all objects anyway, so you=20
>> can
>>  > just put the code for both engines in the same source file and=20
>> decide
>>  > which one to use based on the compat (which you already do=20
>> anyway).
>>=20
>>  Each SoC has a different set of registers for the BCH hardware. I=20
>> can
>>  try to
>>  cram everything into one file, but it won't be that much cleaner.
>=20
> Then maybe they deserve separate drivers/modules.
>=20
> BTW, didn't you say that one IP uses Reed-Salomon instead of BCH. I'd
> suggest prefixing structs and functions with jz47xx_ecc instead of
> jz47xx_bch and naming the common part jz47xx_ecc.c to reflect that.

Would it be a good idea to make a generic ECC API that the jz47xx_nand
driver could use? Then the three jz47xx BCH codepaths could be separate
drivers that register with the generic ECC core.
=
