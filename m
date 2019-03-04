From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 8/9] mtd: rawnand: ingenic: Add support for the
 JZ4725B
Date: Mon, 4 Mar 2019 20:09:47 +0100
Message-ID: <20190304200947.69237b05@xps13>
References: <20190209192305.4434-1-paul@crapouillou.net>
        <20190209192305.4434-8-paul@crapouillou.net>
        <20190304113519.2e102b25@xps13>
        <1551724204.4932.6@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551724204.4932.6@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

Paul Cercueil <paul@crapouillou.net> wrote on Mon, 04 Mar 2019 19:30:04
+0100:

> On Mon, Mar 4, 2019 at 11:35 AM, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > Hi Paul,
> > 
> > Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> > wrote on Sat,  9 Feb 2019 16:23:04
> > -0300:
> >   
> >>  The boot ROM of the JZ4725B SoC expects a specific OOB layout on the
> >>  NAND, so we use it unconditionally in the ingenic-nand driver.  
> >> >>  Also add the jz4725b-bch driver to support the JZ4725B-specific BCH  
> >>  hardware.  
> >> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net >> <mailto:paul@crapouillou.net>>  
> >>  ---  
> >> >>  Changes:
> >> >>  v2: Instead of forcing the OOB layout, leave it to the board code or  
> >>      devicetree to decide if the jz4725b-specific layout should be >> used
> >>      or not.  
> >> >>  v3: - Revert the change in v2, as the previous behaviour was >> correct.  
> >>      - Also add support for the hardware BCH of the JZ4725B in this
> >>        patch.  
> >> >>  v4: - Add MODULE_* macros  
> >>      - Add tweaks suggested by upstream feedback  
> >> >>   drivers/mtd/nand/raw/ingenic/Kconfig        |  10 +  
> >>   drivers/mtd/nand/raw/ingenic/Makefile       |   1 +
> >>   drivers/mtd/nand/raw/ingenic/ingenic_nand.c |  48 ++++-
> >>   drivers/mtd/nand/raw/ingenic/jz4725b_bch.c  | 292 >> ++++++++++++++++++++++++++++
> >>   4 files changed, 350 insertions(+), 1 deletion(-)
> >>   create mode 100644 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c  
> >> >   
> > [...]
> >   
> >>  +static int jz4725b_calculate(struct ingenic_ecc *bch,
> >>  +			     struct ingenic_ecc_params *params,
> >>  +			     const u8 *buf, u8 *ecc_code)
> >>  +{
> >>  +	int ret;
> >>  +
> >>  +	mutex_lock(&bch->lock);
> >>  +	ret = jz4725b_bch_init(bch, params, true);  
> > 
> > I really don't like this bch_init name. A BCH initialization is what > is
> > supposed to be done only once (probably at boot time), can you find a
> > better name or a better organization of the correct/calculate path?  
> 
> jz4725b_bch_setup() maybe?

Unless I am not understanding what this does, I don't get why you would
need to do this setup everytime you want to use the ECC engine. Are you
sure this is needed?
