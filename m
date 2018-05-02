From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 5/7] gpio: pca953x: fix address calculation for pcal6524
Date: Wed, 2 May 2018 15:28:11 +0300
Message-ID: <CAHp75VfD4gYesEw2n4JMycmr=qcAtqSkAAjwCViJZRYC6kVUVg@mail.gmail.com>
References: <cover.1524933096.git.hns@goldelico.com> <aaac818909d71523726094b1dfacc03e756874e9.1524933096.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <aaac818909d71523726094b1dfacc03e756874e9.1524933096.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

On Sat, Apr 28, 2018 at 7:31 PM, H. Nikolaus Schaller <hns@goldelico.com> wrote:
> The register constants are so far defined in a way that they fit
> for the pcal9555a when shifted by the number of banks, i.e. are
> multiplied by 2 in the accessor function.
>
> Now, the pcal6524 has 3 banks which means the relative offset
> is multiplied by 4 for the standard registers.
>
> Simply applying the bit shift to the extended registers gives
> a wrong result, since the base offset is already included in
> the offset.
>
> Therefore, we add code to the 24 bit accessor functions to
> adjust the register number for these exended registers.
>

Suggested-by ?

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index fc863faa3ce4..4194495a7990 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -221,9 +221,11 @@ static int pca957x_write_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
>  static int pca953x_write_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
>  {
>         int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +       int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
> +       int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
>
>         return i2c_smbus_write_i2c_block_data(chip->client,
> -                                             (reg << bank_shift) | REG_ADDR_AI,
> +                                             pinctrl | addr | REG_ADDR_AI,
>                                               NBANK(chip), val);
>  }
>
> @@ -263,9 +265,11 @@ static int pca953x_read_regs_16(struct pca953x_chip *chip, int reg, u8 *val)
>  static int pca953x_read_regs_24(struct pca953x_chip *chip, int reg, u8 *val)
>  {
>         int bank_shift = fls((chip->gpio_chip.ngpio - 1) / BANK_SZ);
> +       int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
> +       int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
>
>         return i2c_smbus_read_i2c_block_data(chip->client,
> -                                            (reg << bank_shift) | REG_ADDR_AI,
> +                                            pinctrl | addr | REG_ADDR_AI,
>                                              NBANK(chip), val);
>  }
>
> --
> 2.12.2
>



-- 
With Best Regards,
Andy Shevchenko
