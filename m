From: Bo Shen <voice.shen@atmel.com>
Subject: Re: [RFC PATCH 03/13] ARM: at91: DTS: sam9x5: add clock for SSC DT
 entry
Date: Tue, 2 Jul 2013 11:05:10 +0800
Message-ID: <51D24366.5000101@atmel.com>
References: <1372667978-4718-1-git-send-email-richard.genoud@gmail.com> <1372667978-4718-4-git-send-email-richard.genoud@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372667978-4718-4-git-send-email-richard.genoud@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Genoud <richard.genoud@gmail.com>
Cc: devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Richard,

On 7/1/2013 16:39, Richard Genoud wrote:
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>   arch/arm/mach-at91/at91sam9x5.c |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-at91/at91sam9x5.c b/arch/arm/mach-at91/at91sam9x5.c
> index 2abee66..191eb4b 100644
> --- a/arch/arm/mach-at91/at91sam9x5.c
> +++ b/arch/arm/mach-at91/at91sam9x5.c
> @@ -233,6 +233,7 @@ static struct clk_lookup periph_clocks_lookups[] = {
>   	CLKDEV_CON_DEV_ID("mci_clk", "f000c000.mmc", &mmc1_clk),
>   	CLKDEV_CON_DEV_ID("dma_clk", "ffffec00.dma-controller", &dma0_clk),
>   	CLKDEV_CON_DEV_ID("dma_clk", "ffffee00.dma-controller", &dma1_clk),
> +	CLKDEV_CON_DEV_ID("pclk", "at91sam9g45_ssc.0", &ssc_clk),

Actually, we don't use this anymore. Am I right?

>   	CLKDEV_CON_DEV_ID("pclk", "f0010000.ssc", &ssc_clk),
>   	CLKDEV_CON_DEV_ID(NULL, "f8010000.i2c", &twi0_clk),
>   	CLKDEV_CON_DEV_ID(NULL, "f8014000.i2c", &twi1_clk),
>

Best Regards,
Bo Shen
