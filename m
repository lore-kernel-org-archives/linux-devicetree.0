From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 09/12] mtd: rawnand: ingenic: Make use of ecc-engine
 property
Date: Fri, 15 Mar 2019 09:40:09 +0100
Message-ID: <20190315094009.66b91ad5@xps13>
References: <20190313222259.28704-1-paul@crapouillou.net>
        <20190313222259.28704-9-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313222259.28704-9-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, od@zcrc.me, Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

Paul Cercueil <paul@crapouillou.net> wrote on Wed, 13 Mar 2019 23:22:56
+0100:

> Use the 'ecc-engine' standard property instead of the custom
> 'ingenic,bch-controller' custom property, which is now deprecated.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v5: New patch
> 
>  drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> index d7f3a8c3abea..30436ca6628a 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> @@ -82,9 +82,9 @@ static struct ingenic_ecc *ingenic_ecc_get(struct device_node *np)
>  
>  /**
>   * of_ingenic_ecc_get() - get the ECC controller from a DT node
> - * @of_node: the node that contains a bch-controller property.
> + * @of_node: the node that contains a ecc-engine property.

Would "contains an ecc-engine property" be better English?

I am not sure what is the rule when it comes to plain English with
variable names. However if you agree, no need to re-send the series, I
can fix it when applying.

BTW, I added hw ECC engines support to my generic ECC engine
implementation, but migrating the whole raw NAND subsystem (using I/O
requests like in the SPI-NAND core, adding prepare/finish_io_req hooks)
is going to be much more invasive than initially expected, so I am not
sure I will finish the migration any time soon.


Thanks,
Miquèl
