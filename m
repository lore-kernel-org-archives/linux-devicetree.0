From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 8/9] mtd: rawnand: ingenic: Add support for the
 JZ4725B
Date: Tue, 5 Feb 2019 19:54:57 +0100
Message-ID: <20190205195457.171cd3e3@xps13>
References: <20190204190426.11618-1-paul@crapouillou.net>
        <20190204190426.11618-8-paul@crapouillou.net>
        <20190205151256.1bb3dab0@xps13>
        <1549384157.1610.0@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549384157.1610.0@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, Mathieu Malaterre <malat@debian.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul,


[...]

> >>  +
> >>  +static void jz4725b_bch_init(struct ingenic_ecc *bch,
> >>  +			     struct ingenic_ecc_params *params, bool encode)  
> > 
> > I don't know the IP but 'encode' looks strange, what is it supposed to
> > mean?  
> 
> It is used to toggle between calculating the ECC codes for a given set of data,
> and using supplied ECC codes to verify a set of data.
> 
> I just reused the function and parameter names that were used in the
> jz4780-bch driver, that's where the 'encode' comes from.


I see, so it is kind of a "derive" vs. "verify" information. Please
add a comment explaining the parameter name then.

> >>  +{
> >>  +	u32 reg;
> >>  +
> >>  +	/* Clear interrupt status. */
> >>  +	writel(readl(bch->base + BCH_BHINT), bch->base + BCH_BHINT);
> >>  +
> >>  +	/* Initialise and enable BCH. */
> >>  +	writel(0x1f, bch->base + BCH_BHCCR);
> >>  +	writel(BCH_BHCR_BCHE, bch->base + BCH_BHCSR);
> >>  +
> >>  +	if (params->strength == 8)
> >>  +		writel(BCH_BHCR_BSEL_MASK, bch->base + BCH_BHCSR);
> >>  +	else
> >>  +		writel(BCH_BHCR_BSEL_MASK, bch->base + BCH_BHCCR);  
> > 
> > Here you write to BCH_BHCSR or BCH_BHCCR depending on
> > params->strength...
> >   
> >>  +
> >>  +	if (encode)
> >>  +		writel(BCH_BHCR_ENCE, bch->base + BCH_BHCSR);
> >>  +	else
> >>  +		writel(BCH_BHCR_ENCE, bch->base + BCH_BHCCR);  
> > 
> > ...and here depending on encode.
> > 
> > Can you explain a bit?  
> 
> BCH_BHCSR / BCH_BHCCR are set and clear registers for the BCH_BHCR
> register, which is itself read-only. The BSEL field is used to toggle
> between a strength of 4 (if cleared) and 8 (if set), while the ENCE
> field configures the IP for 'encoding' mode.

All clear. Can you add a short comment to explain it somewhere?


Thanks,
Miquèl
