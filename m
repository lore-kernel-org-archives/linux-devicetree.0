From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2] gpio: Added GPIO support to Zynq Ultrascale+ MPSoC
Date: Thu, 04 Jun 2015 15:26:07 +0200
Message-ID: <557051EF.7050404@monstr.eu>
References: <1433419832-40678-1-git-send-email-anuragku@xilinx.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="SUWcPEs6qf0POg26rA99snBiuvTARg1Le"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1433419832-40678-1-git-send-email-anuragku@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com
Cc: devicetree@vger.kernel.org, Anurag Kumar Vulisha <anuragku@xilinx.com>, svemula@xilinx.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, anirudh@xilinx.com, harini.katakam@xilinx.com, punnaia@xilinx.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SUWcPEs6qf0POg26rA99snBiuvTARg1Le
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 06/04/2015 02:10 PM, Anurag Kumar Vulisha wrote:
> Added support to Zynq Ultrascale+ MPSoC on the existing zynq gpio drive=
r.
>=20
> Signed-off-by: Anurag Kumar Vulisha <anuragku@xilinx.com>
> ---
>  Chnages in v2:
> 	1.Added device tree bingings for Zynq Ultrascale+ MPSoC
> 	2.Changed the commit message and subject from ZynqMP to
> 	  Zynq Ultrascale+ MPSoC
> ---
>  .../devicetree/bindings/gpio/gpio-zynq.txt         |    2 +-
>  drivers/gpio/Kconfig                               |    2 +-
>  drivers/gpio/gpio-zynq.c                           |  191 ++++++++++++=
+-------
>  3 files changed, 127 insertions(+), 68 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt b/Doc=
umentation/devicetree/bindings/gpio/gpio-zynq.txt
> index 986371a..db4c6a6 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.txt
> @@ -6,7 +6,7 @@ Required properties:
>  			  - First cell is the GPIO line number
>  			  - Second cell is used to specify optional
>  			    parameters (unused)
> -- compatible		: Should be "xlnx,zynq-gpio-1.0"
> +- compatible		: Should be "xlnx,zynq-gpio-1.0" or "xlnx,zynqmp-gpio-1.=
0"
>  - clocks		: Clock specifier (see clock bindings for details)
>  - gpio-controller	: Marks the device node as a GPIO controller.
>  - interrupts		: Interrupt specifier (see interrupt bindings for
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index caefe80..eef3a74 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -505,7 +505,7 @@ config GPIO_ZEVIO
> =20
>  config GPIO_ZYNQ
>  	tristate "Xilinx Zynq GPIO support"
> -	depends on ARCH_ZYNQ
> +	depends on ARCH_ZYNQ || ARCH_ZYNQMP
>  	select GPIOLIB_IRQCHIP
>  	help
>  	  Say yes here to support Xilinx Zynq GPIO controller.
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 184c4b1..d9d26aa 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -18,34 +18,47 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/of.h>
> =20
>  #define DRIVER_NAME "zynq-gpio"
> =20
>  /* Maximum banks */
>  #define ZYNQ_GPIO_MAX_BANK	4
> +#define ZYNQMP_GPIO_MAX_BANK	6
> =20
>  #define ZYNQ_GPIO_BANK0_NGPIO	32
>  #define ZYNQ_GPIO_BANK1_NGPIO	22
>  #define ZYNQ_GPIO_BANK2_NGPIO	32
>  #define ZYNQ_GPIO_BANK3_NGPIO	32
> =20
> -#define ZYNQ_GPIO_NR_GPIOS	(ZYNQ_GPIO_BANK0_NGPIO + \
> -				 ZYNQ_GPIO_BANK1_NGPIO + \
> -				 ZYNQ_GPIO_BANK2_NGPIO + \
> -				 ZYNQ_GPIO_BANK3_NGPIO)
> -
> -#define ZYNQ_GPIO_BANK0_PIN_MIN	0
> -#define ZYNQ_GPIO_BANK0_PIN_MAX	(ZYNQ_GPIO_BANK0_PIN_MIN + \
> -					ZYNQ_GPIO_BANK0_NGPIO - 1)
> -#define ZYNQ_GPIO_BANK1_PIN_MIN	(ZYNQ_GPIO_BANK0_PIN_MAX + 1)
> -#define ZYNQ_GPIO_BANK1_PIN_MAX	(ZYNQ_GPIO_BANK1_PIN_MIN + \
> -					ZYNQ_GPIO_BANK1_NGPIO - 1)
> -#define ZYNQ_GPIO_BANK2_PIN_MIN	(ZYNQ_GPIO_BANK1_PIN_MAX + 1)
> -#define ZYNQ_GPIO_BANK2_PIN_MAX	(ZYNQ_GPIO_BANK2_PIN_MIN + \
> -					ZYNQ_GPIO_BANK2_NGPIO - 1)
> -#define ZYNQ_GPIO_BANK3_PIN_MIN	(ZYNQ_GPIO_BANK2_PIN_MAX + 1)
> -#define ZYNQ_GPIO_BANK3_PIN_MAX	(ZYNQ_GPIO_BANK3_PIN_MIN + \
> -					ZYNQ_GPIO_BANK3_NGPIO - 1)
> +#define ZYNQMP_GPIO_BANK0_NGPIO 26
> +#define ZYNQMP_GPIO_BANK1_NGPIO 26
> +#define ZYNQMP_GPIO_BANK2_NGPIO 26
> +#define ZYNQMP_GPIO_BANK3_NGPIO 32
> +#define ZYNQMP_GPIO_BANK4_NGPIO 32
> +#define ZYNQMP_GPIO_BANK5_NGPIO 32
> +
> +#define	ZYNQ_GPIO_NR_GPIOS	118
> +#define	ZYNQMP_GPIO_NR_GPIOS	174
> +
> +#define ZYNQ_GPIO_BANK0_PIN_MIN(str)	0
> +#define ZYNQ_GPIO_BANK0_PIN_MAX(str)	(ZYNQ_GPIO_BANK0_PIN_MIN(str) + \=

> +					ZYNQ##str##_GPIO_BANK0_NGPIO - 1)
> +#define ZYNQ_GPIO_BANK1_PIN_MIN(str)	(ZYNQ_GPIO_BANK0_PIN_MAX(str) + 1=
)
> +#define ZYNQ_GPIO_BANK1_PIN_MAX(str)	(ZYNQ_GPIO_BANK1_PIN_MIN(str) + \=

> +					ZYNQ##str##_GPIO_BANK1_NGPIO - 1)
> +#define ZYNQ_GPIO_BANK2_PIN_MIN(str)	(ZYNQ_GPIO_BANK1_PIN_MAX(str) + 1=
)
> +#define ZYNQ_GPIO_BANK2_PIN_MAX(str)	(ZYNQ_GPIO_BANK2_PIN_MIN(str) + \=

> +					ZYNQ##str##_GPIO_BANK2_NGPIO - 1)
> +#define ZYNQ_GPIO_BANK3_PIN_MIN(str)	(ZYNQ_GPIO_BANK2_PIN_MAX(str) + 1=
)
> +#define ZYNQ_GPIO_BANK3_PIN_MAX(str)	(ZYNQ_GPIO_BANK3_PIN_MIN(str) + \=

> +					ZYNQ##str##_GPIO_BANK3_NGPIO - 1)
> +#define ZYNQ_GPIO_BANK4_PIN_MIN(str)	(ZYNQ_GPIO_BANK3_PIN_MAX(str) + 1=
)
> +#define ZYNQ_GPIO_BANK4_PIN_MAX(str)	(ZYNQ_GPIO_BANK4_PIN_MIN(str) + \=

> +					ZYNQ##str##_GPIO_BANK4_NGPIO - 1)
> +#define ZYNQ_GPIO_BANK5_PIN_MIN(str)	(ZYNQ_GPIO_BANK4_PIN_MAX(str) + 1=
)
> +#define ZYNQ_GPIO_BANK5_PIN_MAX(str)	(ZYNQ_GPIO_BANK5_PIN_MIN(str) + \=

> +					ZYNQ##str##_GPIO_BANK5_NGPIO - 1)
> =20
> =20
>  /* Register offsets for the GPIO device */
> @@ -89,12 +102,30 @@
>   * @base_addr:	base address of the GPIO device
>   * @clk:	clock resource for this controller
>   * @irq:	interrupt for the GPIO device
> + * @p_data:	pointer to platform data
>   */
>  struct zynq_gpio {
>  	struct gpio_chip chip;
>  	void __iomem *base_addr;
>  	struct clk *clk;
>  	int irq;
> +	const struct zynq_platform_data *p_data;
> +};
> +
> +/**
> + * struct zynq_platform_data -  zynq gpio platform data structure
> + * @label:	string to store in gpio->label
> + * @ngpio:	max number of gpio pins
> + * @max_bank:	maximum number of gpio banks
> + * @bank_min:	this array represents bank's min pin
> + * @bank_max:	this array represents bank's max pin
> +*/
> +struct zynq_platform_data {
> +	const char *label;
> +	u16 ngpio;
> +	int max_bank;
> +	int bank_min[ZYNQMP_GPIO_MAX_BANK];
> +	int bank_max[ZYNQMP_GPIO_MAX_BANK];
>  };
> =20
>  static struct irq_chip zynq_gpio_level_irqchip;
> @@ -112,39 +143,26 @@ static struct irq_chip zynq_gpio_edge_irqchip;
>   */
>  static inline void zynq_gpio_get_bank_pin(unsigned int pin_num,
>  					  unsigned int *bank_num,
> -					  unsigned int *bank_pin_num)
> +					  unsigned int *bank_pin_num,
> +					  struct zynq_gpio *gpio)
>  {
> -	switch (pin_num) {
> -	case ZYNQ_GPIO_BANK0_PIN_MIN ... ZYNQ_GPIO_BANK0_PIN_MAX:
> -		*bank_num =3D 0;
> -		*bank_pin_num =3D pin_num;
> -		break;
> -	case ZYNQ_GPIO_BANK1_PIN_MIN ... ZYNQ_GPIO_BANK1_PIN_MAX:
> -		*bank_num =3D 1;
> -		*bank_pin_num =3D pin_num - ZYNQ_GPIO_BANK1_PIN_MIN;
> -		break;
> -	case ZYNQ_GPIO_BANK2_PIN_MIN ... ZYNQ_GPIO_BANK2_PIN_MAX:
> -		*bank_num =3D 2;
> -		*bank_pin_num =3D pin_num - ZYNQ_GPIO_BANK2_PIN_MIN;
> -		break;
> -	case ZYNQ_GPIO_BANK3_PIN_MIN ... ZYNQ_GPIO_BANK3_PIN_MAX:
> -		*bank_num =3D 3;
> -		*bank_pin_num =3D pin_num - ZYNQ_GPIO_BANK3_PIN_MIN;
> -		break;
> -	default:
> -		WARN(true, "invalid GPIO pin number: %u", pin_num);
> -		*bank_num =3D 0;
> -		*bank_pin_num =3D 0;
> -		break;
> +	int bank;
> +
> +	for (bank =3D 0; bank < gpio->p_data->max_bank; bank++) {
> +		if ((pin_num >=3D gpio->p_data->bank_min[bank]) &&
> +			(pin_num <=3D gpio->p_data->bank_max[bank])) {
> +				*bank_num =3D bank;
> +				*bank_pin_num =3D pin_num -
> +						gpio->p_data->bank_min[bank];
> +				return;
> +		}
>  	}
> -}
> =20
> -static const unsigned int zynq_gpio_bank_offset[] =3D {
> -	ZYNQ_GPIO_BANK0_PIN_MIN,
> -	ZYNQ_GPIO_BANK1_PIN_MIN,
> -	ZYNQ_GPIO_BANK2_PIN_MIN,
> -	ZYNQ_GPIO_BANK3_PIN_MIN,
> -};
> +	/* default */
> +	WARN(true, "invalid GPIO pin number: %u", pin_num);
> +	*bank_num =3D 0;
> +	*bank_pin_num =3D 0;
> +}
> =20
>  /**
>   * zynq_gpio_get_value - Get the state of the specified pin of GPIO de=
vice
> @@ -161,7 +179,7 @@ static int zynq_gpio_get_value(struct gpio_chip *ch=
ip, unsigned int pin)
>  	unsigned int bank_num, bank_pin_num;
>  	struct zynq_gpio *gpio =3D container_of(chip, struct zynq_gpio, chip)=
;
> =20
> -	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num);
> +	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
> =20
>  	data =3D readl_relaxed(gpio->base_addr +
>  			     ZYNQ_GPIO_DATA_RO_OFFSET(bank_num));
> @@ -185,7 +203,7 @@ static void zynq_gpio_set_value(struct gpio_chip *c=
hip, unsigned int pin,
>  	unsigned int reg_offset, bank_num, bank_pin_num;
>  	struct zynq_gpio *gpio =3D container_of(chip, struct zynq_gpio, chip)=
;
> =20
> -	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num);
> +	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
> =20
>  	if (bank_pin_num >=3D ZYNQ_GPIO_MID_PIN_NUM) {
>  		/* only 16 data bits in bit maskable reg */
> @@ -222,7 +240,7 @@ static int zynq_gpio_dir_in(struct gpio_chip *chip,=
 unsigned int pin)
>  	unsigned int bank_num, bank_pin_num;
>  	struct zynq_gpio *gpio =3D container_of(chip, struct zynq_gpio, chip)=
;
> =20
> -	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num);
> +	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
> =20
>  	/* bank 0 pins 7 and 8 are special and cannot be used as inputs */
>  	if (bank_num =3D=3D 0 && (bank_pin_num =3D=3D 7 || bank_pin_num =3D=3D=
 8))
> @@ -255,7 +273,7 @@ static int zynq_gpio_dir_out(struct gpio_chip *chip=
, unsigned int pin,
>  	unsigned int bank_num, bank_pin_num;
>  	struct zynq_gpio *gpio =3D container_of(chip, struct zynq_gpio, chip)=
;
> =20
> -	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num);
> +	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
> =20
>  	/* set the GPIO pin as output */
>  	reg =3D readl_relaxed(gpio->base_addr + ZYNQ_GPIO_DIRM_OFFSET(bank_nu=
m));
> @@ -286,7 +304,7 @@ static void zynq_gpio_irq_mask(struct irq_data *irq=
_data)
>  	struct zynq_gpio *gpio =3D irq_data_get_irq_chip_data(irq_data);
> =20
>  	device_pin_num =3D irq_data->hwirq;
> -	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num);
> +	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio=
);
>  	writel_relaxed(BIT(bank_pin_num),
>  		       gpio->base_addr + ZYNQ_GPIO_INTDIS_OFFSET(bank_num));
>  }
> @@ -306,7 +324,7 @@ static void zynq_gpio_irq_unmask(struct irq_data *i=
rq_data)
>  	struct zynq_gpio *gpio =3D irq_data_get_irq_chip_data(irq_data);
> =20
>  	device_pin_num =3D irq_data->hwirq;
> -	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num);
> +	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio=
);
>  	writel_relaxed(BIT(bank_pin_num),
>  		       gpio->base_addr + ZYNQ_GPIO_INTEN_OFFSET(bank_num));
>  }
> @@ -325,7 +343,7 @@ static void zynq_gpio_irq_ack(struct irq_data *irq_=
data)
>  	struct zynq_gpio *gpio =3D irq_data_get_irq_chip_data(irq_data);
> =20
>  	device_pin_num =3D irq_data->hwirq;
> -	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num);
> +	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio=
);
>  	writel_relaxed(BIT(bank_pin_num),
>  		       gpio->base_addr + ZYNQ_GPIO_INTSTS_OFFSET(bank_num));
>  }
> @@ -375,7 +393,7 @@ static int zynq_gpio_set_irq_type(struct irq_data *=
irq_data, unsigned int type)
>  	struct zynq_gpio *gpio =3D irq_data_get_irq_chip_data(irq_data);
> =20
>  	device_pin_num =3D irq_data->hwirq;
> -	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num);
> +	zynq_gpio_get_bank_pin(device_pin_num, &bank_num, &bank_pin_num, gpio=
);
> =20
>  	int_type =3D readl_relaxed(gpio->base_addr +
>  				 ZYNQ_GPIO_INTTYPE_OFFSET(bank_num));
> @@ -470,7 +488,7 @@ static void zynq_gpio_handle_bank_irq(struct zynq_g=
pio *gpio,
>  				      unsigned int bank_num,
>  				      unsigned long pending)
>  {
> -	unsigned int bank_offset =3D zynq_gpio_bank_offset[bank_num];
> +	unsigned int bank_offset =3D gpio->p_data->bank_min[bank_num];
>  	struct irq_domain *irqdomain =3D gpio->chip.irqdomain;
>  	int offset;
> =20
> @@ -505,7 +523,7 @@ static void zynq_gpio_irqhandler(unsigned int irq, =
struct irq_desc *desc)
> =20
>  	chained_irq_enter(irqchip, desc);
> =20
> -	for (bank_num =3D 0; bank_num < ZYNQ_GPIO_MAX_BANK; bank_num++) {
> +	for (bank_num =3D 0; bank_num < gpio->p_data->max_bank; bank_num++) {=

>  		int_sts =3D readl_relaxed(gpio->base_addr +
>  					ZYNQ_GPIO_INTSTS_OFFSET(bank_num));
>  		int_enb =3D readl_relaxed(gpio->base_addr +
> @@ -582,6 +600,46 @@ static const struct dev_pm_ops zynq_gpio_dev_pm_op=
s =3D {
>  			zynq_gpio_runtime_resume, NULL)
>  };
> =20
> +static const struct zynq_platform_data zynqmp_gpio_def =3D {
> +	.label =3D "zynqmp_gpio",
> +	.ngpio =3D ZYNQMP_GPIO_NR_GPIOS,
> +	.max_bank =3D ZYNQMP_GPIO_MAX_BANK,
> +	.bank_min[0] =3D ZYNQ_GPIO_BANK0_PIN_MIN(MP),
> +	.bank_max[0] =3D ZYNQ_GPIO_BANK0_PIN_MAX(MP),
> +	.bank_min[1] =3D ZYNQ_GPIO_BANK1_PIN_MIN(MP),
> +	.bank_max[1] =3D ZYNQ_GPIO_BANK1_PIN_MAX(MP),
> +	.bank_min[2] =3D ZYNQ_GPIO_BANK2_PIN_MIN(MP),
> +	.bank_max[2] =3D ZYNQ_GPIO_BANK2_PIN_MAX(MP),
> +	.bank_min[3] =3D ZYNQ_GPIO_BANK3_PIN_MIN(MP),
> +	.bank_max[3] =3D ZYNQ_GPIO_BANK3_PIN_MAX(MP),
> +	.bank_min[4] =3D ZYNQ_GPIO_BANK4_PIN_MIN(MP),
> +	.bank_max[4] =3D ZYNQ_GPIO_BANK4_PIN_MAX(MP),
> +	.bank_min[5] =3D ZYNQ_GPIO_BANK5_PIN_MIN(MP),
> +	.bank_max[5] =3D ZYNQ_GPIO_BANK5_PIN_MAX(MP),
> +};
> +
> +static const struct zynq_platform_data zynq_gpio_def =3D {
> +	.label =3D "zynq_gpio",
> +	.ngpio =3D ZYNQ_GPIO_NR_GPIOS,
> +	.max_bank =3D ZYNQ_GPIO_MAX_BANK,
> +	.bank_min[0] =3D ZYNQ_GPIO_BANK0_PIN_MIN(),
> +	.bank_max[0] =3D ZYNQ_GPIO_BANK0_PIN_MAX(),
> +	.bank_min[1] =3D ZYNQ_GPIO_BANK1_PIN_MIN(),
> +	.bank_max[1] =3D ZYNQ_GPIO_BANK1_PIN_MAX(),
> +	.bank_min[2] =3D ZYNQ_GPIO_BANK2_PIN_MIN(),
> +	.bank_max[2] =3D ZYNQ_GPIO_BANK2_PIN_MAX(),
> +	.bank_min[3] =3D ZYNQ_GPIO_BANK3_PIN_MIN(),
> +	.bank_max[3] =3D ZYNQ_GPIO_BANK3_PIN_MAX(),
> +};
> +
> +static const struct of_device_id zynq_gpio_of_match[] =3D {
> +	{ .compatible =3D "xlnx,zynq-gpio-1.0", .data =3D (void *)&zynq_gpio_=
def },
> +	{ .compatible =3D "xlnx,zynqmp-gpio-1.0",
> +					.data =3D (void *)&zynqmp_gpio_def },
> +	{ /* end of table */ }
> +};
> +MODULE_DEVICE_TABLE(of, zynq_gpio_of_match);
> +
>  /**
>   * zynq_gpio_probe - Initialization method for a zynq_gpio device
>   * @pdev:	platform device instance
> @@ -599,11 +657,18 @@ static int zynq_gpio_probe(struct platform_device=
 *pdev)
>  	struct zynq_gpio *gpio;
>  	struct gpio_chip *chip;
>  	struct resource *res;
> +	const struct of_device_id *match;
> =20
>  	gpio =3D devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>  	if (!gpio)
>  		return -ENOMEM;
> =20
> +	match =3D of_match_node(zynq_gpio_of_match, pdev->dev.of_node);
> +	if (!match) {
> +		dev_err(&pdev->dev, "of_match_node() failed\n");
> +		return -EINVAL;
> +	}
> +	gpio->p_data =3D match->data;
>  	platform_set_drvdata(pdev, gpio);
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -619,7 +684,7 @@ static int zynq_gpio_probe(struct platform_device *=
pdev)
> =20
>  	/* configure the gpio chip */
>  	chip =3D &gpio->chip;
> -	chip->label =3D "zynq_gpio";
> +	chip->label =3D gpio->p_data->label;
>  	chip->owner =3D THIS_MODULE;
>  	chip->dev =3D &pdev->dev;
>  	chip->get =3D zynq_gpio_get_value;
> @@ -629,7 +694,7 @@ static int zynq_gpio_probe(struct platform_device *=
pdev)
>  	chip->direction_input =3D zynq_gpio_dir_in;
>  	chip->direction_output =3D zynq_gpio_dir_out;
>  	chip->base =3D -1;
> -	chip->ngpio =3D ZYNQ_GPIO_NR_GPIOS;
> +	chip->ngpio =3D gpio->p_data->ngpio;
> =20
>  	/* Enable GPIO clock */
>  	gpio->clk =3D devm_clk_get(&pdev->dev, NULL);
> @@ -651,7 +716,7 @@ static int zynq_gpio_probe(struct platform_device *=
pdev)
>  	}
> =20
>  	/* disable interrupts for all banks */
> -	for (bank_num =3D 0; bank_num < ZYNQ_GPIO_MAX_BANK; bank_num++)
> +	for (bank_num =3D 0; bank_num < gpio->p_data->max_bank; bank_num++)
>  		writel_relaxed(ZYNQ_GPIO_IXR_DISABLE_ALL, gpio->base_addr +
>  			       ZYNQ_GPIO_INTDIS_OFFSET(bank_num));
> =20
> @@ -695,12 +760,6 @@ static int zynq_gpio_remove(struct platform_device=
 *pdev)
>  	return 0;
>  }
> =20
> -static struct of_device_id zynq_gpio_of_match[] =3D {
> -	{ .compatible =3D "xlnx,zynq-gpio-1.0", },
> -	{ /* end of table */ }
> -};
> -MODULE_DEVICE_TABLE(of, zynq_gpio_of_match);
> -
>  static struct platform_driver zynq_gpio_driver =3D {
>  	.driver	=3D {
>  		.name =3D DRIVER_NAME,
>=20

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--SUWcPEs6qf0POg26rA99snBiuvTARg1Le
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlVwUfMACgkQykllyylKDCGxSACdFif4ce8Fz1Rf4+x4j9zetQ7C
QLMAnjhlSFrTf6q6ThmUu3zZS3+SsBf8
=6Gg9
-----END PGP SIGNATURE-----

--SUWcPEs6qf0POg26rA99snBiuvTARg1Le--
