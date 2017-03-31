From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 14/37] mtd: nand: denali: support "nand-ecc-strength"
 DT property
Date: Fri, 31 Mar 2017 11:46:59 +0200
Message-ID: <20170331114659.4964be35@bbrezillon>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
        <1490856383-31560-15-git-send-email-yamada.masahiro@socionext.com>
        <20170330160238.59e5a2c1@bbrezillon>
        <CAK7LNARUKwMHd79ALDx_SDY9XKcHPY96xTAOMQx6XarFgwb-AA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNARUKwMHd79ALDx_SDY9XKcHPY96xTAOMQx6XarFgwb-AA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, 31 Mar 2017 14:06:32 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2017-03-30 23:02 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Thu, 30 Mar 2017 15:46:00 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> Historically, this driver tried to choose as big ECC strength as
> >> possible, but it would be reasonable to allow DT to set a particular
> >> ECC strength with "nand-ecc-strength" property.  This is useful
> >> when a particular ECC setting is hard-coded by firmware (or hard-
> >> wired by boot ROM).
> >>
> >> If no ECC strength is specified in DT, "nand-ecc-maximize" is implied
> >> since this was the original behavior.  
> >
> > You said there is currently no DT users,  
> 
> Right.  No DT users ever in upstream.
> 
> 
> > so how about changing the
> > "fallback to ECC maximization" behavior for DT users, and instead of
> > maximizing the ECC strength take the NAND requirements into account
> > (chip->ecc_strength_ds).  
> 
> This is difficult to judge in some cases.
> 
> As I said before, 4/512 and 8/1024 are not equivalent.
> 
> If chip's requirement  chip->ecc_step_ds matches
> to the ecc->size supported by the controller,
> this is easy.
> 
> 
> If a chip requests 1024B, then the controller can only support 512B chunk
> (or vice versa), it is difficult to simply compare
> ecc strength.

You can try something like that when no explicit ecc.strength and
ecc.size has been set in the DT and when ECC_MAXIMIZE was not passed.

static int
denali_get_closest_ecc_strength(struct denali_nand_info *denali,
				int strength)
{
	/*
	 * Whatever you need to select a strength that is greater than
	 * or equal to strength.
	 */

	return X;
}

static int denali_try_to_match_ecc_req(struct denali_nand_info *denali)
{
	struct nand_chip *chip = &denali->nand;
	struct mtd_info *mtd = nand_to_mtd(chip);
	int max_ecc_bytes = mtd->oobsize - denali->bbtskipbytes;
	int ecc_steps, ecc_strength, ecc_bytes;
	int ecc_size = chip->ecc_step_ds;
	int ecc_strength = chip->ecc_strength_ds;

	/*
	 * No information provided by the NAND chip, let the core
	 * maximize the strength.
	 */
	if (!ecc_size || !ecc_strength)
		return -ENOTSUPP;

	if (ecc_size > 512)
		ecc_size = 1024;
	else
		ecc_size = 512;

	/* Adjust ECC step size based on hardware support. */
	if (ecc_size == 1024 &&
	    !(denali->caps & DENALI_CAP_ECC_SIZE_1024))
		ecc_size = 512;
	else if(ecc_size == 512 &&
		!(denali->caps & DENALI_CAP_ECC_SIZE_512))
		ecc_size = 1024;

	if (ecc_size < chip->ecc_size_ds) {
		/*
		 * When the selected size if smaller than the expected
		 * one we try to use the same strength but on 512 blocks
		 * so that we can still fix the same number of errors
		 * even if they are concentrated in the first 512bytes
		 * of a 1024bytes portion.
		 */
		ecc_strength = chip->ecc_strength_ds;
		ecc_strength = denali_get_closest_ecc_strength(denali,
							       ecc_strength);
	} else {
		/* Always prefer 1024bytes ECC blocks when possible. */
		if (ecc_size != 1024 &&
		    (denali->caps & DENALI_CAP_ECC_SIZE_1024) &&
		    mtd->writesize > 1024)
			ecc_size = 1024;

		/*
		 * Adjust the strength based on the selected ECC step
		 * size.
		 */
		ecc_strength = DIV_ROUND_UP(ecc_size,
					    chip->ecc_step_ds) *
			       chip->ecc_strength_ds;
	}

	ecc_bytes = denali_calc_ecc_bytes(ecc_size,
					  ecc_strength);
	ecc_bytes *= mtd->writesize / ecc_size;

	/*
	 * If we don't have enough space, let the core maximize
	 * the strength.
	 */
	if (ecc_bytes > max_ecc_bytes)
		return -ENOTSUPP;

	chip->ecc.strength = ecc_strength;
	chip->ecc.size = ecc_size;
	
	return 0;
}

> 
> Is it a bad thing if we use too strong ECC strength?
> 
> The disadvantage I see is we will have less OOB-free bytes,
> but this will not be fatal, I guess.

Not a bad thing in general, but I'd prefer to leave the choice to the
user. If one doesn't need the extra-safety brought by ECC strength
maximization and wants to have more OOB bytes it's better to follow
NAND requirements.
