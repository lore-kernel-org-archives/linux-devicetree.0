From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 2/3] mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash
 controller driver
Date: Mon, 24 Sep 2018 19:26:32 +0200
Message-ID: <20180924192632.1d5754da@bbrezillon>
References: <1537199260-7280-1-git-send-email-christophe.kerello@st.com>
        <1537199260-7280-3-git-send-email-christophe.kerello@st.com>
        <20180922154819.015dcca7@xps13>
        <6df8455e-2fb2-e65c-a492-fba42a9453f3@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6df8455e-2fb2-e65c-a492-fba42a9453f3@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Kerello <christophe.kerello@st.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Mon, 24 Sep 2018 18:36:36 +0200
Christophe Kerello <christophe.kerello@st.com> wrote:

> >> +static int stm32_fmc2_resume(struct device *dev)
> >> +{
> >> +	struct stm32_fmc2 *fmc2 = dev_get_drvdata(dev);
> >> +	int i, ret;
> >> +
> >> +	pinctrl_pm_select_default_state(dev);
> >> +
> >> +	ret = clk_prepare_enable(fmc2->clk);
> >> +	if (ret) {
> >> +		dev_err(dev, "can not enable the clock\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	stm32_fmc2_init(fmc2);
> >> +	stm32_fmc2_timings_init(fmc2);
> >> +	stm32_fmc2_setup(fmc2);
> >> +
> >> +	for (i = 0; i < fmc2->ncs; i++)
> >> +		nand_reset(&fmc2->chip, i);  
> > 
> > This means you have one different NAND chip wired on each CS.
> > 
> > We could have two CS wired to the same NAND chip. Calling nand_reset
> > twice would be harmless but a lost of time.

Actually, you have to call nand_reset() for each CS, otherwise not all
dies are reset.
