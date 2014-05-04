From: Max Schwarz <max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/8] pinctrl: rockchip: use regmaps instead of raw mappings
Date: Sun, 04 May 2014 15:31:40 +0200
Message-ID: <2503713.QQRxskQ1Pq@typ>
References: <1414506.B4e2jZujVm@diego> <12837529.UNWjpLOtVY@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <12837529.UNWjpLOtVY@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Wednesday 30 April 2014 at 00:08:19, Heiko St=FCbner wrote:
> This allows us to use syscons in the future.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 116
> +++++++++++++++++++++++++------------ 1 file changed, 80 insertions(+=
), 36
> deletions(-)

You should add a "select REGMAP_MMIO" in drivers/pinctrl/Kconfig to mak=
e sure=20
it compiles. Or just add MFD_SYSCON since it depends on REGMAP_MMIO and=
 is a=20
runtime dependency for the new binding now.

Otherwise I tested your series with my tree on RK3188/Radxa Rock and=20
everything works.

Cheers,
  Max

>=20
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index ab71de8..71d9c99 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -37,6 +37,7 @@
>  #include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/clk.h>
> +#include <linux/regmap.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>=20
>  #include "core.h"
> @@ -86,7 +87,7 @@ enum rockchip_pin_bank_type {
>   */
>  struct rockchip_pin_bank {
>  	void __iomem			*reg_base;
> -	void __iomem			*reg_pull;
> +	struct regmap			*regmap_pull;
>  	struct clk			*clk;
>  	int				irq;
>  	u32				pin_base;
> @@ -120,8 +121,9 @@ struct rockchip_pin_ctrl {
>  	char				*label;
>  	enum rockchip_pinctrl_type	type;
>  	int				mux_offset;
> -	void	(*pull_calc_reg)(struct rockchip_pin_bank *bank, int pin_num,
> -				 void __iomem **reg, u8 *bit);
> +	void	(*pull_calc_reg)(struct rockchip_pin_bank *bank,
> +				    int pin_num, struct regmap **regmap,
> +				    int *reg, u8 *bit);
>  };
>=20
>  struct rockchip_pin_config {
> @@ -159,9 +161,9 @@ struct rockchip_pmx_func {
>  };
>=20
>  struct rockchip_pinctrl {
> -	void __iomem			*reg_base;
> +	struct regmap			*regmap_base;
>  	int				reg_size;
> -	void __iomem			*reg_pull;
> +	struct regmap			*regmap_pull;
>  	struct device			*dev;
>  	struct rockchip_pin_ctrl	*ctrl;
>  	struct pinctrl_desc		pctl;
> @@ -172,6 +174,12 @@ struct rockchip_pinctrl {
>  	unsigned int			nfunctions;
>  };
>=20
> +static struct regmap_config rockchip_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> +
>  static inline struct rockchip_pin_bank *gc_to_pin_bank(struct gpio_c=
hip
> *gc) {
>  	return container_of(gc, struct rockchip_pin_bank, gpio_chip);
> @@ -333,18 +341,24 @@ static const struct pinctrl_ops rockchip_pctrl_=
ops =3D {
> static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin) =
{
>  	struct rockchip_pinctrl *info =3D bank->drvdata;
> -	void __iomem *reg =3D info->reg_base + info->ctrl->mux_offset;
> +	unsigned int val;
> +	int reg, ret;
>  	u8 bit;
>=20
>  	if (bank->bank_type =3D=3D RK3188_BANK0 && pin < 16)
>  		return RK_FUNC_GPIO;
>=20
>  	/* get basic quadrupel of mux registers and the correct reg inside =
*/
> +	reg =3D info->ctrl->mux_offset;
>  	reg +=3D bank->bank_num * 0x10;
>  	reg +=3D (pin / 8) * 4;
>  	bit =3D (pin % 8) * 2;
>=20
> -	return ((readl(reg) >> bit) & 3);
> +	ret =3D regmap_read(info->regmap_base, reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	return ((val >> bit) & 3);
>  }
>=20
>  /*
> @@ -363,7 +377,7 @@ static int rockchip_get_mux(struct rockchip_pin_b=
ank
> *bank, int pin) static int rockchip_set_mux(struct rockchip_pin_bank =
*bank,
> int pin, int mux) {
>  	struct rockchip_pinctrl *info =3D bank->drvdata;
> -	void __iomem *reg =3D info->reg_base + info->ctrl->mux_offset;
> +	int reg, ret;
>  	unsigned long flags;
>  	u8 bit;
>  	u32 data;
> @@ -386,6 +400,7 @@ static int rockchip_set_mux(struct rockchip_pin_b=
ank
> *bank, int pin, int mux) bank->bank_num, pin, mux);
>=20
>  	/* get basic quadrupel of mux registers and the correct reg inside =
*/
> +	reg =3D info->ctrl->mux_offset;
>  	reg +=3D bank->bank_num * 0x10;
>  	reg +=3D (pin / 8) * 4;
>  	bit =3D (pin % 8) * 2;
> @@ -394,11 +409,11 @@ static int rockchip_set_mux(struct rockchip_pin=
_bank
> *bank, int pin, int mux)
>=20
>  	data =3D (3 << (bit + 16));
>  	data |=3D (mux & 3) << bit;
> -	writel(data, reg);
> +	ret =3D regmap_write(info->regmap_base, reg, data);
>=20
>  	spin_unlock_irqrestore(&bank->slock, flags);
>=20
> -	return 0;
> +	return ret;
>  }
>=20
>  #define RK2928_PULL_OFFSET		0x118
> @@ -406,11 +421,13 @@ static int rockchip_set_mux(struct rockchip_pin=
_bank
> *bank, int pin, int mux) #define RK2928_PULL_BANK_STRIDE		8
>=20
>  static void rk2928_calc_pull_reg_and_bit(struct rockchip_pin_bank *b=
ank,
> -				    int pin_num, void __iomem **reg, u8 *bit)
> +				    int pin_num, struct regmap **regmap,
> +				    int *reg, u8 *bit)
>  {
>  	struct rockchip_pinctrl *info =3D bank->drvdata;
>=20
> -	*reg =3D info->reg_base + RK2928_PULL_OFFSET;
> +	*regmap =3D info->regmap_base;
> +	*reg =3D RK2928_PULL_OFFSET;
>  	*reg +=3D bank->bank_num * RK2928_PULL_BANK_STRIDE;
>  	*reg +=3D (pin_num / RK2928_PULL_PINS_PER_REG) * 4;
>=20
> @@ -423,19 +440,23 @@ static void rk2928_calc_pull_reg_and_bit(struct
> rockchip_pin_bank *bank, #define RK3188_PULL_BANK_STRIDE		16
>=20
>  static void rk3188_calc_pull_reg_and_bit(struct rockchip_pin_bank *b=
ank,
> -				    int pin_num, void __iomem **reg, u8 *bit)
> +				    int pin_num, struct regmap **regmap,
> +				    int *reg, u8 *bit)
>  {
>  	struct rockchip_pinctrl *info =3D bank->drvdata;
>=20
>  	/* The first 12 pins of the first bank are located elsewhere */
>  	if (bank->bank_type =3D=3D RK3188_BANK0 && pin_num < 12) {
> -		*reg =3D bank->reg_pull +
> -				((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
> +		*regmap =3D bank->regmap_pull;
> +		*reg =3D 0;
> +		*reg +=3D ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
>  		*bit =3D pin_num % RK3188_PULL_PINS_PER_REG;
>  		*bit *=3D RK3188_PULL_BITS_PER_PIN;
>  	} else {
> -		*reg =3D info->reg_pull ? info->reg_pull
> -				      : info->reg_base + RK3188_PULL_OFFSET;
> +		*regmap =3D info->regmap_pull ? info->regmap_pull
> +					    : info->regmap_base;
> +		*reg =3D info->regmap_pull ? 0 : RK3188_PULL_OFFSET;
> +
>  		/* correct the offset, as it is the 2nd pull register */
>  		*reg -=3D 4;
>  		*reg +=3D bank->bank_num * RK3188_PULL_BANK_STRIDE;
> @@ -455,7 +476,8 @@ static int rockchip_get_pull(struct rockchip_pin_=
bank
> *bank, int pin_num) {
>  	struct rockchip_pinctrl *info =3D bank->drvdata;
>  	struct rockchip_pin_ctrl *ctrl =3D info->ctrl;
> -	void __iomem *reg;
> +	struct regmap *regmap;
> +	int reg, ret;
>  	u8 bit;
>  	u32 data;
>=20
> @@ -463,15 +485,19 @@ static int rockchip_get_pull(struct rockchip_pi=
n_bank
> *bank, int pin_num) if (ctrl->type =3D=3D RK3066B)
>  		return PIN_CONFIG_BIAS_DISABLE;
>=20
> -	ctrl->pull_calc_reg(bank, pin_num, &reg, &bit);
> +	ctrl->pull_calc_reg(bank, pin_num, &regmap, &reg, &bit);
> +
> +	ret =3D regmap_read(regmap, reg, &data);
> +	if (ret)
> +		return ret;
>=20
>  	switch (ctrl->type) {
>  	case RK2928:
> -		return !(readl_relaxed(reg) & BIT(bit))
> +		return !(data & BIT(bit))
>  				? PIN_CONFIG_BIAS_PULL_PIN_DEFAULT
>=20
>  				: PIN_CONFIG_BIAS_DISABLE;
>=20
>  	case RK3188:
> -		data =3D readl_relaxed(reg) >> bit;
> +		data >>=3D bit;
>  		data &=3D (1 << RK3188_PULL_BITS_PER_PIN) - 1;
>=20
>  		switch (data) {
> @@ -498,7 +524,8 @@ static int rockchip_set_pull(struct rockchip_pin_=
bank
> *bank, {
>  	struct rockchip_pinctrl *info =3D bank->drvdata;
>  	struct rockchip_pin_ctrl *ctrl =3D info->ctrl;
> -	void __iomem *reg;
> +	struct regmap *regmap;
> +	int reg, ret;
>  	unsigned long flags;
>  	u8 bit;
>  	u32 data;
> @@ -510,7 +537,7 @@ static int rockchip_set_pull(struct rockchip_pin_=
bank
> *bank, if (ctrl->type =3D=3D RK3066B)
>  		return pull ? -EINVAL : 0;
>=20
> -	ctrl->pull_calc_reg(bank, pin_num, &reg, &bit);
> +	ctrl->pull_calc_reg(bank, pin_num, &regmap, &reg, &bit);
>=20
>  	switch (ctrl->type) {
>  	case RK2928:
> @@ -519,7 +546,7 @@ static int rockchip_set_pull(struct rockchip_pin_=
bank
> *bank, data =3D BIT(bit + 16);
>  		if (pull =3D=3D PIN_CONFIG_BIAS_DISABLE)
>  			data |=3D BIT(bit);
> -		writel(data, reg);
> +		ret =3D regmap_write(regmap, reg, data);
>=20
>  		spin_unlock_irqrestore(&bank->slock, flags);
>  		break;
> @@ -548,7 +575,7 @@ static int rockchip_set_pull(struct rockchip_pin_=
bank
> *bank, return -EINVAL;
>  		}
>=20
> -		writel(data, reg);
> +		ret =3D regmap_write(regmap, reg, data);
>=20
>  		spin_unlock_irqrestore(&bank->slock, flags);
>  		break;
> @@ -557,7 +584,7 @@ static int rockchip_set_pull(struct rockchip_pin_=
bank
> *bank, return -EINVAL;
>  	}
>=20
> -	return 0;
> +	return ret;
>  }
>=20
>  /*
> @@ -1416,6 +1443,7 @@ static int rockchip_get_bank_data(struct
> rockchip_pin_bank *bank, struct device *dev)
>  {
>  	struct resource res;
> +	void __iomem *base;
>=20
>  	if (of_address_to_resource(bank->of_node, 0, &res)) {
>  		dev_err(dev, "cannot find IO resource for bank\n");
> @@ -1440,9 +1468,14 @@ static int rockchip_get_bank_data(struct
> rockchip_pin_bank *bank, return -ENOENT;
>  		}
>=20
> -		bank->reg_pull =3D devm_ioremap_resource(dev, &res);
> -		if (IS_ERR(bank->reg_pull))
> -			return PTR_ERR(bank->reg_pull);
> +		base =3D devm_ioremap_resource(dev, &res);
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
> +		rockchip_regmap_config.max_register =3D resource_size(&res) - 4;
> +		rockchip_regmap_config.name =3D "rockchip,rk3188-gpio-bank0-pull";
> +		bank->regmap_pull =3D devm_regmap_init_mmio(dev, base,
> +						  &rockchip_regmap_config);
> +
>  	} else {
>  		bank->bank_type =3D COMMON_BANK;
>  	}
> @@ -1507,6 +1540,7 @@ static int rockchip_pinctrl_probe(struct
> platform_device *pdev) struct device *dev =3D &pdev->dev;
>  	struct rockchip_pin_ctrl *ctrl;
>  	struct resource *res;
> +	void __iomem *base;
>  	int ret;
>=20
>  	if (!dev->of_node) {
> @@ -1527,19 +1561,29 @@ static int rockchip_pinctrl_probe(struct
> platform_device *pdev) info->dev =3D dev;
>=20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	info->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(info->reg_base))
> -		return PTR_ERR(info->reg_base);
> +	base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	rockchip_regmap_config.max_register =3D resource_size(res) - 4;
> +	rockchip_regmap_config.name =3D "rockchip,pinctrl";
> +	info->regmap_base =3D devm_regmap_init_mmio(&pdev->dev, base,
> +						  &rockchip_regmap_config);
>=20
>  	/* to check for the old dt-bindings */
>  	info->reg_size =3D resource_size(res);
>=20
>  	/* Honor the old binding, with pull registers as 2nd resource */
> -	if (ctrl->type =3D=3D RK3188 &&  info->reg_size < 0x200) {
> +	if (ctrl->type =3D=3D RK3188 && info->reg_size < 0x200) {
>  		res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -		info->reg_pull =3D devm_ioremap_resource(&pdev->dev, res);
> -		if (IS_ERR(info->reg_pull))
> -			return PTR_ERR(info->reg_pull);
> +		base =3D devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
> +
> +		rockchip_regmap_config.max_register =3D resource_size(res) - 4;
> +		rockchip_regmap_config.name =3D "rockchip,pinctrl-pull";
> +		info->regmap_pull =3D devm_regmap_init_mmio(&pdev->dev, base,
> +						  &rockchip_regmap_config);
>  	}
>=20
>  	ret =3D rockchip_gpiolib_register(pdev, info);

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
