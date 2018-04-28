From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v4 1/7] gpio: pca953x: convert register constants to hex
Date: Sat, 28 Apr 2018 18:30:03 +0200
Message-ID: <A499CDE2-0DCD-4189-808B-EAAF6C03F9F4@goldelico.com>
References: <cover.1524764101.git.hns@goldelico.com> <cover.1524764101.git.hns@goldelico.com> <ee6da590a6053f190393d5e64d06b44fab886ecd.1524764101.git.hns@goldelico.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ee6da590a6053f190393d5e64d06b44fab886ecd.1524764101.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: galak@codeaurora.org, andy.shevchenko@gmail.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org


> Am 26.04.2018 um 19:34 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> 
> which makes it easier to match them with the data sheets.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> drivers/gpio/gpio-pca953x.c | 32 ++++++++++++++++----------------
> 1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index d02964983b5b..bd0593afdae3 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -25,25 +25,25 @@
> 
> #include <asm/unaligned.h>
> 
> -#define PCA953X_INPUT		0
> -#define PCA953X_OUTPUT		1
> -#define PCA953X_INVERT		2
> -#define PCA953X_DIRECTION	3
> +#define PCA953X_INPUT		0x00
> +#define PCA953X_OUTPUT		0x01
> +#define PCA953X_INVERT		0x02
> +#define PCA953X_DIRECTION	0x03
> 
> #define REG_ADDR_AI		0x80
> 
> -#define PCA957X_IN		0
> -#define PCA957X_INVRT		1
> -#define PCA957X_BKEN		2
> -#define PCA957X_PUPD		3
> -#define PCA957X_CFG		4
> -#define PCA957X_OUT		5
> -#define PCA957X_MSK		6
> -#define PCA957X_INTS		7
> -
> -#define PCAL953X_IN_LATCH	34
> -#define PCAL953X_INT_MASK	37
> -#define PCAL953X_INT_STAT	38
> +#define PCA957X_IN		0x00
> +#define PCA957X_INVRT		0x01
> +#define PCA957X_BKEN		0x02
> +#define PCA957X_PUPD		0x03
> +#define PCA957X_CFG		0x04
> +#define PCA957X_OUT		0x05
> +#define PCA957X_MSK		0x06
> +#define PCA957X_INTS		0x07
> +
> +#define PCAL953X_IN_LATCH	0x22
> +#define PCAL953X_PULL_EN	0x23
> +#define PCAL953X_PULL_SEL	0x24

oops, just spotted a bug above.

Here, we should update the registers PCAL953X_INT_MASK and
PCAL953X_INT_STAT. And add PCAL953X_PULL_EN and PCAL953X_PULL_SEL
in the next patch.

Sorry. I will send an update for the patch set.

> 
> #define PCA_GPIO_MASK		0x00FF
> #define PCA_INT			0x0100
> -- 
> 2.12.2
> 

BR,
Nikolaus
