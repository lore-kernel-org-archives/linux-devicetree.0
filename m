From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 8/9] mtd: rawnand: ingenic: Add support for the JZ4725B
Date: Mon, 04 Mar 2019 19:30:04 +0100
Message-ID: <1551724204.4932.6@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190209192305.4434-8-paul@crapouillou.net> <20190304113519.2e102b25@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304113519.2e102b25@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Mon, Mar 4, 2019 at 11:35 AM, Miquel Raynal=20
<miquel.raynal@bootlin.com> wrote:
> Hi Paul,
>=20
> Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>>=20
> wrote on Sat,  9 Feb 2019 16:23:04
> -0300:
>=20
>>  The boot ROM of the JZ4725B SoC expects a specific OOB layout on the
>>  NAND, so we use it unconditionally in the ingenic-nand driver.
>>=20
>>  Also add the jz4725b-bch driver to support the JZ4725B-specific BCH
>>  hardware.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net=20
>> <mailto:paul@crapouillou.net>>
>>  ---
>>=20
>>  Changes:
>>=20
>>  v2: Instead of forcing the OOB layout, leave it to the board code or
>>      devicetree to decide if the jz4725b-specific layout should be=20
>> used
>>      or not.
>>=20
>>  v3: - Revert the change in v2, as the previous behaviour was=20
>> correct.
>>      - Also add support for the hardware BCH of the JZ4725B in this
>>        patch.
>>=20
>>  v4: - Add MODULE_* macros
>>      - Add tweaks suggested by upstream feedback
>>=20
>>   drivers/mtd/nand/raw/ingenic/Kconfig        |  10 +
>>   drivers/mtd/nand/raw/ingenic/Makefile       |   1 +
>>   drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  48 ++++-
>>   drivers/mtd/nand/raw/ingenic/jz4725b_bch.c  | 292=20
>> ++++++++++++++++++++++++++++
>>   4 files changed, 350 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
>>=20
>=20
> [...]
>=20
>>  +static int jz4725b_calculate(struct ingenic_ecc *bch,
>>  +			     struct ingenic_ecc_params *params,
>>  +			     const u8 *buf, u8 *ecc_code)
>>  +{
>>  +	int ret;
>>  +
>>  +	mutex_lock(&bch->lock);
>>  +	ret =3D jz4725b_bch_init(bch, params, true);
>=20
> I really don't like this bch_init name. A BCH initialization is what=20
> is
> supposed to be done only once (probably at boot time), can you find a
> better name or a better organization of the correct/calculate path?

jz4725b_bch_setup() maybe?

>>  +	if (ret) {
>>  +		dev_err(bch->dev, "Unable to init BCH with given parameters\n");
>>  +		goto out_disable;
>>  +	}
>>  +
>>  +	jz4725b_bch_write_data(bch, buf, params->size);
>>  +
>>  +	ret =3D jz4725b_bch_wait_complete(bch, BCH_BHINT_ENCF, NULL);
>>  +	if (ret) {
>>  +		dev_err(bch->dev, "timed out while calculating ECC\n");
>>  +		goto out_disable;
>>  +	}
>>  +
>>  +	jz4725b_bch_read_parity(bch, ecc_code, params->bytes);
>>  +
>>  +out_disable:
>>  +	jz4725b_bch_disable(bch);
>>  +	mutex_unlock(&bch->lock);
>>  +
>>  +	return ret;
>>  +}
>>  +
>=20
> [...]
>=20
> Thanks,
> Miqu=E8l

=
