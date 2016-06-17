From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCHv3 5/7] EDAC, altera: Add Arria10 ECC memory init functions
Date: Fri, 17 Jun 2016 19:21:50 +0200
Message-ID: <20160617172150.GJ3912@pd.tnic>
References: <1465852752-11018-1-git-send-email-tthayer@opensource.altera.com>
 <1465852752-11018-6-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465852752-11018-6-git-send-email-tthayer@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: tthayer@opensource.altera.com
Cc: dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2016 at 04:19:10PM -0500, tthayer@opensource.altera.com wrote:
> From: Thor Thayer <tthayer@opensource.altera.com>
> 
> In preparation for additional memory module ECCs, add the
> memory initialization functions and helper functions used
> for memory initialization.
> 
> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> ---
> v2: Specify INTMODE selection -> IRQ on each ECC error.
>     Insert functions above memory-specific functions so that function
>     declarations are not required.
>     Use ERRINTENS & ERRINTENR registers instead of read/modify/write.
> v3: Changes for common compatibility string:
>     - Pass node instead of compatibility string.
>     - New altr_init_a10_ecc_device_type() for peripherals.
>     - Add __init to altr_init_a10_ecc_block().
>     - Add a10_get_irq_mask().
> ---
>  drivers/edac/altera_edac.c |  197 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/edac/altera_edac.h |    8 ++
>  2 files changed, 205 insertions(+)

> +/*
> + * This function uses the memory initialization block in the Arria10 ECC
> + * controller to initialize/clear the entire memory data and ECC data.
> + */
> +static int altr_init_memory_port(void __iomem *ioaddr, int port)
> +{
> +	int limit = ALTR_A10_ECC_INIT_WATCHDOG_10US;
> +	u32 init_mask = ALTR_A10_ECC_INITA;
> +	u32 stat_mask = ALTR_A10_ECC_INITCOMPLETEA;
> +	u32 clear_mask = ALTR_A10_ECC_ERRPENA_MASK;
> +	int ret = 0;
> +
> +	if (port) {
> +		init_mask = ALTR_A10_ECC_INITB;
> +		stat_mask = ALTR_A10_ECC_INITCOMPLETEB;
> +		clear_mask = ALTR_A10_ECC_ERRPENB_MASK;
> +	}

Do a
	u32 init_mask, stat_mask, clear_mask;

	if (port) {
		init_mask = ALTR_A10_ECC_INITB;
		...
	} else {
		init_mask = ALTR_A10_ECC_INITA;
		...
	}

so that you don't have to repeat the assignments in the if (port) case.

> +
> +	ecc_set_bits(init_mask, (ioaddr + ALTR_A10_ECC_CTRL_OFST));
> +	while (limit--) {
> +		if (ecc_test_bits(stat_mask,
> +				  (ioaddr + ALTR_A10_ECC_INITSTAT_OFST)))
> +			break;
> +		udelay(1);
> +	}
> +	if (limit < 0)
> +		ret = -EBUSY;
> +
> +	/* Clear any pending ECC interrupts */
> +	writel(clear_mask, (ioaddr + ALTR_A10_ECC_INTSTAT_OFST));
> +
> +	return ret;
> +}
> +
> +/*
> + * Aside from the L2 ECC, the Arria10 ECC memories have a common register
> + * layout so the following functions can be shared between all peripherals.

I don't understand - we're here under

#if defined(CONFIG_EDAC_ALTERA_ETHERNET)

What sharing do you mean?

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
