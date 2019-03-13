From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 8/9] mtd: rawnand: ingenic: Add support for the JZ4725B
Date: Wed, 13 Mar 2019 09:46:40 -0300
Message-ID: <1552481200.2412.0@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190209192305.4434-8-paul@crapouillou.net> <20190304113519.2e102b25@xps13>
        <1551724204.4932.6@crapouillou.net> <20190304200947.69237b05@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304200947.69237b05@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Miquel,

Le lun. 4 mars 2019 =E0 16:09, Miquel Raynal <miquel.raynal@bootlin.com>=20
a =E9crit :
> Hi Paul,
>=20
> Paul Cercueil <paul@crapouillou.net> wrote on Mon, 04 Mar 2019=20
> 19:30:04
> +0100:
>=20
>>  On Mon, Mar 4, 2019 at 11:35 AM, Miquel Raynal=20
>> <miquel.raynal@bootlin.com> wrote:
>>  > Hi Paul,
>>  >
>>  > Paul Cercueil <paul@crapouillou.net=20
>> <mailto:paul@crapouillou.net>> > wrote on Sat,  9 Feb 2019 16:23:04
>>  > -0300:
>>  >
>>  >>  The boot ROM of the JZ4725B SoC expects a specific OOB layout=20
>> on the
>>  >>  NAND, so we use it unconditionally in the ingenic-nand driver.
>>  >> >>  Also add the jz4725b-bch driver to support the=20
>> JZ4725B-specific BCH
>>  >>  hardware.
>>  >> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net >>=20
>> <mailto:paul@crapouillou.net>>
>>  >>  ---
>>  >> >>  Changes:
>>  >> >>  v2: Instead of forcing the OOB layout, leave it to the board=20
>> code or
>>  >>      devicetree to decide if the jz4725b-specific layout should=20
>> be >> used
>>  >>      or not.
>>  >> >>  v3: - Revert the change in v2, as the previous behaviour was=20
>> >> correct.
>>  >>      - Also add support for the hardware BCH of the JZ4725B in=20
>> this
>>  >>        patch.
>>  >> >>  v4: - Add MODULE_* macros
>>  >>      - Add tweaks suggested by upstream feedback
>>  >> >>   drivers/mtd/nand/raw/ingenic/Kconfig        |  10 +
>>  >>   drivers/mtd/nand/raw/ingenic/Makefile       |   1 +
>>  >>   drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  48 ++++-
>>  >>   drivers/mtd/nand/raw/ingenic/jz4725b_bch.c  | 292 >>=20
>> ++++++++++++++++++++++++++++
>>  >>   4 files changed, 350 insertions(+), 1 deletion(-)
>>  >>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
>>  >> >
>>  > [...]
>>  >
>>  >>  +static int jz4725b_calculate(struct ingenic_ecc *bch,
>>  >>  +			     struct ingenic_ecc_params *params,
>>  >>  +			     const u8 *buf, u8 *ecc_code)
>>  >>  +{
>>  >>  +	int ret;
>>  >>  +
>>  >>  +	mutex_lock(&bch->lock);
>>  >>  +	ret =3D jz4725b_bch_init(bch, params, true);
>>  >
>>  > I really don't like this bch_init name. A BCH initialization is=20
>> what > is
>>  > supposed to be done only once (probably at boot time), can you=20
>> find a
>>  > better name or a better organization of the correct/calculate=20
>> path?
>>=20
>>  jz4725b_bch_setup() maybe?
>=20
> Unless I am not understanding what this does, I don't get why you=20
> would
> need to do this setup everytime you want to use the ECC engine. Are=20
> you
> sure this is needed?

It configures the hardware for a new ECC encoding or decoding sequence,=20
so
yes, it has to be done everytime.

-Paul
=
