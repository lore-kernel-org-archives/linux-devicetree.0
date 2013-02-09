From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/2] gpio: gpio-generic: Fix bug in big endian bit conversion
Date: Sat, 09 Feb 2013 14:58:55 +0000
Message-ID: <20130209145855.D517E3E328E@localhost>
References: <1360060383-16880-1-git-send-email-andreas@gaisler.com> <1360060383-16880-2-git-send-email-andreas@gaisler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360060383-16880-2-git-send-email-andreas@gaisler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Larsson <andreas@gaisler.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

On Tue,  5 Feb 2013 11:33:02 +0100, Andreas Larsson <andreas@gaisler.com> wrote:
> The swap to convert LE to BE in bgpio_pin2mask_be should be on byte level, not
> on bit level.
> 
> Signed-off-by: Andreas Larsson <andreas@gaisler.com>
> ---
>  drivers/gpio/gpio-generic.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> index 05fcc0f..7f11537 100644
> --- a/drivers/gpio/gpio-generic.c
> +++ b/drivers/gpio/gpio-generic.c
> @@ -112,7 +112,10 @@ static unsigned long bgpio_pin2mask(struct bgpio_chip *bgc, unsigned int pin)
>  static unsigned long bgpio_pin2mask_be(struct bgpio_chip *bgc,
>  				       unsigned int pin)
>  {
> -	return 1 << (bgc->bits - 1 - pin);
> +	unsigned int bit = pin & 0x7; /* Bit number within byte */
> +	unsigned int base = pin - bit; /* Pin that is bit 0 within byte */
> +
> +	return 1 << ((bgc->bits - base - 8) + bit); /* shifted base + bit */

Ah, sorry for my previous reply. I see you have seen gpio-generic.  :-)

No, the original calculation is correct. BE and LE bit numbering are
opposite, bit Linux always uses LE numbers as far as bit masks are
concerned. Therefore pin 0 is the most significant bit, and
pin (nr_bits-1) is the least significant bit.

g.
