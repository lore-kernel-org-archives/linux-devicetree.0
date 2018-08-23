From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 3/4] memory: jz4780-nemc: Reduce size of const array
Date: Thu, 23 Aug 2018 10:41:45 +0000
Message-ID: <b8fdca29afcb48aa9ee33cc896c24e66@AcuMS.aculab.com>
References: <20180822172953.11281-1-paul@crapouillou.net>
 <20180822172953.11281-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822172953.11281-3-paul@crapouillou.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Paul Cercueil' <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alex Smith <alex@alex-smith.me.uk>
Cc: "od@zcrc.me" <od@zcrc.me>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Paul Cercueil
> Sent: 22 August 2018 18:30
> The maximum value found in that array is 15, there's no need to store
> these values as uint32_t, a uint8_t is enough.
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

You don't need the cast here.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
