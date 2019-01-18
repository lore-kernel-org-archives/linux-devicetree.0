From: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH 3/4] memory: jz4780-nemc: Reduce size of const array
Date: Fri, 18 Jan 2019 09:15:17 +0100
Message-ID: <20190118091518.467087b8@bbrezillon>
References: <20190117224550.18043-1-paul@crapouillou.net>
        <20190117224550.18043-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117224550.18043-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 17 Jan 2019 19:45:49 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> The maximum value found in that array is 15, there's no need to store
> these values as uint32_t, a uint8_t is enough.

Is it really worth the additional cast you add in the code?

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/memory/jz4780-nemc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
> index bcf06adefc96..ef3f20e46590 100644
> --- a/drivers/memory/jz4780-nemc.c
> +++ b/drivers/memory/jz4780-nemc.c
> @@ -161,7 +161,7 @@ static bool jz4780_nemc_configure_bank(struct jz4780_nemc *nemc,
>  	 * Conversion of tBP and tAW cycle counts to values supported by the
>  	 * hardware (round up to the next supported value).
>  	 */
> -	static const uint32_t convert_tBP_tAW[] = {
> +	static const u8 convert_tBP_tAW[] = {
>  		0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
>  
>  		/* 11 - 12 -> 12 cycles */
> @@ -232,7 +232,7 @@ static bool jz4780_nemc_configure_bank(struct jz4780_nemc *nemc,
>  			return false;
>  		}
>  
> -		smcr |= convert_tBP_tAW[cycles] << NEMC_SMCR_TBP_SHIFT;
> +		smcr |= (u32)convert_tBP_tAW[cycles] << NEMC_SMCR_TBP_SHIFT;
>  	}
>  
>  	if (of_property_read_u32(node, "ingenic,nemc-tAW", &val) == 0) {
> @@ -244,7 +244,7 @@ static bool jz4780_nemc_configure_bank(struct jz4780_nemc *nemc,
>  			return false;
>  		}
>  
> -		smcr |= convert_tBP_tAW[cycles] << NEMC_SMCR_TAW_SHIFT;
> +		smcr |= (u32)convert_tBP_tAW[cycles] << NEMC_SMCR_TAW_SHIFT;
>  	}
>  
>  	if (of_property_read_u32(node, "ingenic,nemc-tSTRV", &val) == 0) {
