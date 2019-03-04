From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 6/9] mtd: rawnand: ingenic: Separate top-level and
 SoC specific code
Date: Mon, 4 Mar 2019 11:20:58 +0100
Message-ID: <20190304112058.67cd5194@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190209192305.4434-6-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190209192305.4434-6-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

Paul Cercueil <paul@crapouillou.net> wrote on Sat,  9 Feb 2019 16:23:02
-0300:

> The ingenic-nand driver uses an API provided by the jz4780-bch driver.
> This makes it difficult to support other SoCs in the jz4780-bch driver.
> To work around this, we separate the API functions from the SoC-specific
> code, so that these API functions are SoC-agnostic.
> 

I like the idea, actually I am working on this separation (see
[1]) and I would really appreciate that you try to implement the
interface when it will be available (v2 is coming this week, I think v3
will be the one to test when raw NAND devices will be properly
supported). I will add you in Cc: if you want to follow/review.

[1] http://lists.infradead.org/pipermail/linux-mtd/2019-February/087815.html

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> v2: Add an optional .probe() callback. It is used for instance to set
>     the clock rate in the JZ4780 backend.
> 
> v3: The common code is now inside the ingenic-ecc module. Each
>     SoC-specific ECC code is now in its own module, which leaves to the
>     user the choice of which (if any) ECC code should be supported.
> 
> v4: No change
> 
>  drivers/mtd/nand/raw/ingenic/Kconfig        |  17 +++
>  drivers/mtd/nand/raw/ingenic/Makefile       |   5 +-
>  drivers/mtd/nand/raw/ingenic/ingenic_ecc.c  | 157 +++++++++++++++++++++++++
>  drivers/mtd/nand/raw/ingenic/ingenic_ecc.h  |  84 ++++++++++++++
>  drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  38 +++----
>  drivers/mtd/nand/raw/ingenic/jz4780_bch.c   | 170 +++++-----------------------
>  drivers/mtd/nand/raw/ingenic/jz4780_bch.h   |  40 -------
>  7 files changed, 308 insertions(+), 203 deletions(-)
>  create mode 100644 drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
>  create mode 100644 drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
>  delete mode 100644 drivers/mtd/nand/raw/ingenic/jz4780_bch.h
> 

[...]

> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
> index 8c73f7c5be9a..0f51fd15fe79 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand.c
> @@ -22,7 +22,7 @@
>  
>  #include <linux/jz4780-nemc.h>
>  
> -#include "jz4780_bch.h"
> +#include "ingenic_ecc.h"
>  
>  #define DRV_NAME	"ingenic-nand"
>  
> @@ -40,7 +40,7 @@ struct ingenic_nand_cs {
>  
>  struct ingenic_nfc {
>  	struct device *dev;
> -	struct jz4780_bch *bch;
> +	struct ingenic_ecc *ecc;
>  	struct nand_controller controller;
>  	unsigned int num_banks;
>  	struct list_head chips;
> @@ -124,10 +124,10 @@ static int ingenic_nand_ecc_calculate(struct nand_chip *chip, const u8 *dat,
>  {
>  	struct ingenic_nand *nand = to_ingenic_nand(nand_to_mtd(chip));
>  	struct ingenic_nfc *nfc = to_ingenic_nfc(nand->chip.controller);
> -	struct jz4780_bch_params params;
> +	struct ingenic_ecc_params params;
>  
>  	/*
> -	 * Don't need to generate the ECC when reading, BCH does it for us as
> +	 * Don't need to generate the ECC when reading, ECC does it for us as

"the ECC engine does it for us" would be more meaningful.

>  	 * part of decoding/correction.
>  	 */
>  	if (nand->reading)
> @@ -137,7 +137,7 @@ static int ingenic_nand_ecc_calculate(struct nand_chip *chip, const u8 *dat,
>  	params.bytes = nand->chip.ecc.bytes;
>  	params.strength = nand->chip.ecc.strength;
>  
> -	return jz4780_bch_calculate(nfc->bch, &params, dat, ecc_code);
> +	return ingenic_ecc_calculate(nfc->ecc, &params, dat, ecc_code);
>  }
>  

Thanks,
Miquèl
