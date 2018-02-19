From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 04/10] pinctrl: actions: Add Actions S900 pinctrl driver
Date: Mon, 19 Feb 2018 22:59:09 +0530
Message-ID: <20180219172909.ph26jjihypnsxv25@linaro.org>
References: <20180217204433.3095-1-manivannan.sadhasivam@linaro.org>
 <20180217204433.3095-5-manivannan.sadhasivam@linaro.org>
 <086c080d-6d2d-6922-1cf3-1b1fbe028b0e@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <086c080d-6d2d-6922-1cf3-1b1fbe028b0e@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org, linus.walleij@linaro.org, liuwei@actions-semi.com, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andreas,
On Sat, Feb 17, 2018 at 10:41:48PM +0100, Andreas F=E4rber wrote:
> Am 17.02.2018 um 21:44 schrieb Manivannan Sadhasivam:
> > Add pinctrl driver for Actions Semi S900 SoC. The driver supports
> > pinctrl, pinmux and pinconf functionalities through a range of registers
> > common to both gpio driver and pinctrl driver.
> > =

> > Pinmux functionality is available only for the pin groups while the
> > pinconf functionality is available for both pin groups and individual
> > pins.
> > =

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pinctrl/Kconfig                |    1 +
> >  drivers/pinctrl/Makefile               |    1 +
> >  drivers/pinctrl/actions/Kconfig        |   12 +
> >  drivers/pinctrl/actions/Makefile       |    2 +
> >  drivers/pinctrl/actions/pinctrl-owl.c  |  573 ++++++++
> >  drivers/pinctrl/actions/pinctrl-owl.h  |  178 +++
> >  drivers/pinctrl/actions/pinctrl-s900.c | 2536 ++++++++++++++++++++++++=
++++++++
> >  7 files changed, 3303 insertions(+)
> >  create mode 100644 drivers/pinctrl/actions/Kconfig
> >  create mode 100644 drivers/pinctrl/actions/Makefile
> >  create mode 100644 drivers/pinctrl/actions/pinctrl-owl.c
> >  create mode 100644 drivers/pinctrl/actions/pinctrl-owl.h
> >  create mode 100644 drivers/pinctrl/actions/pinctrl-s900.c
> > =

> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 0f254b35c378..838c8fff8c24 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -368,6 +368,7 @@ config PINCTRL_OCELOT
> >  	select GENERIC_PINMUX_FUNCTIONS
> >  	select REGMAP_MMIO
> >  =

> > +source "drivers/pinctrl/actions/Kconfig"
> >  source "drivers/pinctrl/aspeed/Kconfig"
> >  source "drivers/pinctrl/bcm/Kconfig"
> >  source "drivers/pinctrl/berlin/Kconfig"
> > diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> > index d3692633e9ed..bf41d2484a44 100644
> > --- a/drivers/pinctrl/Makefile
> > +++ b/drivers/pinctrl/Makefile
> > @@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_INGENIC)	+=3D pinctrl-ingenic.o
> >  obj-$(CONFIG_PINCTRL_RK805)	+=3D pinctrl-rk805.o
> >  obj-$(CONFIG_PINCTRL_OCELOT)	+=3D pinctrl-ocelot.o
> >  =

> > +obj-$(CONFIG_ARCH_ACTIONS)	+=3D actions/
> =

> Here you require CONFIG_ARCH_ACTIONS ...
> =

How about making this as obj-y and having separate
CONFIG_PINCTRL_OWL and CONFIG_PINCTRL_S900 options in platform
makefile?
> >  obj-$(CONFIG_ARCH_ASPEED)	+=3D aspeed/
> >  obj-y				+=3D bcm/
> >  obj-$(CONFIG_PINCTRL_BERLIN)	+=3D berlin/
> > diff --git a/drivers/pinctrl/actions/Kconfig b/drivers/pinctrl/actions/=
Kconfig
> > new file mode 100644
> > index 000000000000..6075909d04e9
> > --- /dev/null
> > +++ b/drivers/pinctrl/actions/Kconfig
> > @@ -0,0 +1,12 @@
> > +config PINCTRL_OWL
> > +        bool
> =

> Indentation.
> =

Ack.
> > +	depends on (ARCH_ACTIONS || COMPILE_TEST) && OF
> =

> ... so || COMPILE_TEST becomes moot.
> =

> Use CONFIG_PINCTRL_OWL in Makefile instead?
> =

Yes, as said above.
> > +	select PINMUX
> > +	select PINCONF
> > +	select GENERIC_PINCONF
> > +
> > +config PINCTRL_S900
> > +	bool "Actions Semi S900 pinctrl driver"
> > +	select PINCTRL_OWL
> > +	help
> > +	  Say Y here to enable Actions S900 pinctrl driver
> =

> Repeating the shortened name does not seem too helpful?
> =

Okay. Will make Actions Semi S900 everywhere.
> > diff --git a/drivers/pinctrl/actions/Makefile b/drivers/pinctrl/actions=
/Makefile
> > new file mode 100644
> > index 000000000000..bd232d28400f
> > --- /dev/null
> > +++ b/drivers/pinctrl/actions/Makefile
> > @@ -0,0 +1,2 @@
> > +obj-$(CONFIG_PINCTRL_OWL)	+=3D pinctrl-owl.o
> > +obj-$(CONFIG_PINCTRL_S900) 	+=3D pinctrl-s900.o
> > diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/ac=
tions/pinctrl-owl.c
> > new file mode 100644
> > index 000000000000..7ed8625c30f3
> > --- /dev/null
> > +++ b/drivers/pinctrl/actions/pinctrl-owl.c
> > @@ -0,0 +1,573 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * OWL SoC's Pinctrl driver
> > + *
> > + * Copyright (c) 2014 Actions Semi Inc.
> > + * Author: David Liu <liuwei@actions-semi.com>
> > + *
> > + * Copyright (c) 2018 Linaro Ltd.
> > + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pinctrl/machine.h>
> > +#include <linux/pinctrl/pinctrl.h>
> > +#include <linux/pinctrl/pinmux.h>
> > +#include <linux/pinctrl/pinconf.h>
> > +#include <linux/pinctrl/pinconf-generic.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +
> > +#include "../core.h"
> > +#include "../pinctrl-utils.h"
> > +#include "pinctrl-owl.h"
> > +
> > +/**
> > + * struct owl_pinctrl - pinctrl state of the device
> > + * @dev: device handle
> > + * @pctrldev: pinctrl handle
> > + * @lock: spinlock to protect registers
> > + * @soc: reference to soc_data
> > + * @base: pinctrl register base address
> > + */
> > +struct owl_pinctrl {
> > +	struct device *dev;
> > +	struct pinctrl_dev *pctrldev;
> > +	raw_spinlock_t lock;
> > +	struct clk *clk;
> > +	const struct owl_pinctrl_soc_data *soc;
> > +	void __iomem *base;
> > +};
> > +
> > +static int owl_get_groups_count(struct pinctrl_dev *pctrldev)
> > +{
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +
> > +	return pctrl->soc->ngroups;
> > +}
> > +
> > +static const char *owl_get_group_name(struct pinctrl_dev *pctrldev,
> > +				unsigned int group)
> > +{
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +
> > +	return pctrl->soc->groups[group].name;
> > +}
> > +
> > +static int owl_get_group_pins(struct pinctrl_dev *pctrldev,
> > +				unsigned int group,
> > +				const unsigned int **pins,
> > +				unsigned int *num_pins)
> > +{
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +
> > +	*pins =3D pctrl->soc->groups[group].pads;
> > +	*num_pins =3D pctrl->soc->groups[group].npads;
> > +
> > +	return 0;
> > +}
> > +
> > +static void owl_pin_dbg_show(struct pinctrl_dev *pctrldev,
> > +				struct seq_file *s,
> > +				unsigned int offset)
> > +{
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +
> > +	seq_printf(s, "%s", dev_name(pctrl->dev));
> > +}
> > +
> > +static struct pinctrl_ops owl_pinctrl_ops =3D {
> > +	.get_groups_count =3D owl_get_groups_count,
> > +	.get_group_name =3D owl_get_group_name,
> > +	.get_group_pins =3D owl_get_group_pins,
> > +	.pin_dbg_show =3D owl_pin_dbg_show,
> > +	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_all,
> > +	.dt_free_map =3D pinctrl_utils_free_map,
> > +};
> > +
> > +static int owl_get_funcs_count(struct pinctrl_dev *pctrldev)
> > +{
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +
> > +	return pctrl->soc->nfunctions;
> > +}
> > +
> > +static const char *owl_get_func_name(struct pinctrl_dev *pctrldev,
> > +				unsigned int function)
> > +{
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +
> > +	return pctrl->soc->functions[function].name;
> > +}
> > +
> > +static int owl_get_func_groups(struct pinctrl_dev *pctrldev,
> > +				unsigned int function,
> > +				const char * const **groups,
> > +				unsigned int * const num_groups)
> > +{
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +
> > +	*groups =3D pctrl->soc->functions[function].groups;
> > +	*num_groups =3D pctrl->soc->functions[function].ngroups;
> > +
> > +	return 0;
> > +}
> > +
> > +static inline int get_group_mfp_mask_val(const struct owl_pingroup *g,
> > +				int function,
> > +				u32 *mask,
> > +				u32 *val)
> > +{
> > +	int id;
> > +	u32 option_num;
> > +	u32 option_mask;
> > +
> > +	for (id =3D 0; id < g->nfuncs; id++) {
> > +		if (g->funcs[id] =3D=3D function)
> > +			break;
> > +	}
> > +	if (WARN_ON(id =3D=3D g->nfuncs))
> > +		return -EINVAL;
> > +
> > +	option_num =3D (1 << g->mfpctl_width);
> > +	if (id > option_num)
> > +		id -=3D option_num;
> > +
> > +	option_mask =3D option_num - 1;
> > +	*mask =3D (option_mask  << g->mfpctl_shift);
> > +	*val =3D (id << g->mfpctl_shift);
> > +
> > +	return 0;
> > +}
> > +
> > +static int owl_set_mux(struct pinctrl_dev *pctrldev,
> > +				unsigned int function,
> > +				unsigned int group)
> > +{
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +	const struct owl_pingroup *g;
> > +	unsigned long flags;
> > +	u32 val, mask, mfpval;
> > +
> > +	g =3D &pctrl->soc->groups[group];
> > +
> > +	if (get_group_mfp_mask_val(g, function, &mask, &val))
> > +		return -EINVAL;
> > +
> > +	raw_spin_lock_irqsave(&pctrl->lock, flags);
> > +
> > +	mfpval =3D readl(pctrl->base + g->mfpctl_reg);
> > +	mfpval &=3D ~mask;
> > +	mfpval |=3D val;
> > +	writel(mfpval, pctrl->base + g->mfpctl_reg);
> > +
> > +	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct pinmux_ops owl_pinmux_ops =3D {
> > +	.get_functions_count =3D owl_get_funcs_count,
> > +	.get_function_name =3D owl_get_func_name,
> > +	.get_function_groups =3D owl_get_func_groups,
> > +	.set_mux =3D owl_set_mux,
> > +};
> > +
> > +static int owl_pad_pinconf_reg(const struct owl_padinfo *info,
> > +				unsigned int param,
> > +				u32 *reg,
> > +				u32 *bit,
> > +				u32 *width)
> > +{
> > +	switch (param) {
> > +	case PIN_CONFIG_BIAS_BUS_HOLD:
> > +	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		if (!info->pullctl)
> > +			return -EINVAL;
> > +		*reg =3D info->pullctl->reg;
> > +		*bit =3D info->pullctl->shift;
> > +		*width =3D info->pullctl->width;
> > +		break;
> > +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > +		if (!info->st)
> > +			return -EINVAL;
> > +		*reg =3D info->st->reg;
> > +		*bit =3D info->st->shift;
> > +		*width =3D info->st->width;
> > +		break;
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int owl_pad_pinconf_arg2val(const struct owl_padinfo *info,
> > +				unsigned int param,
> > +				u32 *arg)
> > +{
> > +	switch (param) {
> > +	case PIN_CONFIG_BIAS_BUS_HOLD:
> > +		*arg =3D OWL_PINCONF_PULL_HOLD;
> > +		break;
> > +	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> > +		*arg =3D OWL_PINCONF_PULL_HIZ;
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		*arg =3D OWL_PINCONF_PULL_DOWN;
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		*arg =3D OWL_PINCONF_PULL_UP;
> > +		break;
> > +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > +		*arg =3D (*arg >=3D 1 ? 1 : 0);
> > +		break;
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int owl_pad_pinconf_val2arg(const struct owl_padinfo *padinfo,
> > +				unsigned int param,
> > +				u32 *arg)
> > +{
> > +	switch (param) {
> > +	case PIN_CONFIG_BIAS_BUS_HOLD:
> > +		*arg =3D *arg =3D=3D OWL_PINCONF_PULL_HOLD;
> > +		break;
> > +	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> > +		*arg =3D *arg =3D=3D OWL_PINCONF_PULL_HIZ;
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		*arg =3D *arg =3D=3D OWL_PINCONF_PULL_DOWN;
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		*arg =3D *arg =3D=3D OWL_PINCONF_PULL_UP;
> > +		break;
> > +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > +		*arg =3D *arg =3D=3D 1;
> > +		break;
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int owl_pin_config_get(struct pinctrl_dev *pctrldev,
> > +				unsigned int pin,
> > +				unsigned long *config)
> > +{
> > +	int ret =3D 0;
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +	const struct owl_padinfo *info;
> > +	unsigned int param =3D pinconf_to_config_param(*config);
> > +	u32 reg, bit, width;
> > +	u32 tmp, mask;
> > +	u32 arg =3D 0;
> > +
> > +	info =3D &pctrl->soc->padinfo[pin];
> > +
> > +	ret =3D owl_pad_pinconf_reg(info, param, &reg, &bit, &width);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tmp =3D readl(pctrl->base + reg);
> > +	mask =3D (1 << width) - 1;
> > +	arg =3D (tmp >> bit) & mask;
> > +
> > +	ret =3D owl_pad_pinconf_val2arg(info, param, &arg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*config =3D pinconf_to_config_packed(param, arg);
> > +
> > +	return ret;
> > +}
> > +
> > +static int owl_pin_config_set(struct pinctrl_dev *pctrldev,
> > +				unsigned int pin,
> > +				unsigned long *configs,
> > +				unsigned int num_configs)
> > +{
> > +	int ret =3D 0;
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +	const struct owl_padinfo *info;
> > +	unsigned long flags;
> > +	unsigned int param;
> > +	u32 reg, bit, width;
> > +	u32 mask =3D 0, tmp, arg =3D 0;
> > +	int i;
> > +
> > +	info =3D &pctrl->soc->padinfo[pin];
> > +
> > +	for (i =3D 0; i < num_configs; i++) {
> > +		param =3D pinconf_to_config_param(configs[i]);
> > +		arg =3D pinconf_to_config_argument(configs[i]);
> > +
> > +		ret =3D owl_pad_pinconf_reg(info, param, &reg, &bit, &width);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret =3D owl_pad_pinconf_arg2val(info, param, &arg);
> > +		if (ret)
> > +			return ret;
> > +
> > +		raw_spin_lock_irqsave(&pctrl->lock, flags);
> > +
> > +		mask =3D (1 << width) - 1;
> > +		mask =3D mask << bit;
> > +		tmp =3D readl(pctrl->base + reg);
> > +		tmp &=3D ~mask;
> > +		tmp |=3D arg << bit;
> > +		writel(tmp, pctrl->base + reg);
> > +
> > +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int owl_group_pinconf_reg(const struct owl_pingroup *g,
> > +				unsigned int param,
> > +				u32 *reg,
> > +				u32 *bit,
> > +				u32 *width)
> > +{
> > +	switch (param) {
> > +	case PIN_CONFIG_DRIVE_STRENGTH:
> > +		if (g->drv_reg < 0)
> > +			return -EINVAL;
> > +		*reg =3D g->drv_reg;
> > +		*bit =3D g->drv_shift;
> > +		*width =3D g->drv_width;
> > +		break;
> > +	case PIN_CONFIG_SLEW_RATE:
> > +		if (g->sr_reg < 0)
> > +			return -EINVAL;
> > +		*reg =3D g->sr_reg;
> > +		*bit =3D g->sr_shift;
> > +		*width =3D g->sr_width;
> > +		break;
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int owl_group_pinconf_arg2val(const struct owl_pingroup *g,
> > +				unsigned int param,
> > +				u32 *arg)
> > +{
> > +	switch (param) {
> > +	case PIN_CONFIG_DRIVE_STRENGTH:
> > +		switch (*arg) {
> > +		case 2:
> > +			*arg =3D OWL_PINCONF_DRV_2MA;
> > +			break;
> > +		case 4:
> > +			*arg =3D OWL_PINCONF_DRV_4MA;
> > +			break;
> > +		case 8:
> > +			*arg =3D OWL_PINCONF_DRV_8MA;
> > +			break;
> > +		case 12:
> > +			*arg =3D OWL_PINCONF_DRV_12MA;
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +	case PIN_CONFIG_SLEW_RATE:
> > +		if (*arg)
> > +			*arg =3D OWL_PINCONF_SLEW_FAST;
> > +		else
> > +			*arg =3D OWL_PINCONF_SLEW_SLOW;
> > +		break;
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int owl_group_pinconf_val2arg(const struct owl_pingroup *g,
> > +				unsigned int param,
> > +				u32 *arg)
> > +{
> > +	switch (param) {
> > +	case PIN_CONFIG_DRIVE_STRENGTH:
> > +		switch (*arg) {
> > +		case OWL_PINCONF_DRV_2MA:
> > +			*arg =3D 2;
> > +			break;
> > +		case OWL_PINCONF_DRV_4MA:
> > +			*arg =3D 4;
> > +			break;
> > +		case OWL_PINCONF_DRV_8MA:
> > +			*arg =3D 8;
> > +			break;
> > +		case OWL_PINCONF_DRV_12MA:
> > +			*arg =3D 12;
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +	case PIN_CONFIG_SLEW_RATE:
> > +		if (*arg)
> > +			*arg =3D 1;
> > +		else
> > +			*arg =3D 0;
> > +		break;
> > +	default:
> > +		return -ENOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int owl_group_config_get(struct pinctrl_dev *pctrldev,
> > +				unsigned int group,
> > +				unsigned long *config)
> > +{
> > +	int ret =3D 0;
> > +	const struct owl_pingroup *g;
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +	unsigned int param =3D pinconf_to_config_param(*config);
> > +	u32 reg, bit, width;
> > +	u32 mask, tmp, arg =3D 0;
> > +
> > +	g =3D &pctrl->soc->groups[group];
> > +
> > +	ret =3D owl_group_pinconf_reg(g, param, &reg, &bit, &width);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tmp =3D readl(pctrl->base + reg);
> > +	mask =3D (1 << width) - 1;
> > +	arg =3D (tmp >> bit) & mask;
> > +
> > +	ret =3D owl_group_pinconf_val2arg(g, param, &arg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*config =3D pinconf_to_config_packed(param, arg);
> > +
> > +	return ret;
> > +
> > +}
> > +
> > +static int owl_group_config_set(struct pinctrl_dev *pctrldev,
> > +				unsigned int group,
> > +				unsigned long *configs,
> > +				unsigned int num_configs)
> > +{
> > +	int ret =3D 0;
> > +	const struct owl_pingroup *g;
> > +	struct owl_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrldev);
> > +	unsigned long flags;
> > +	unsigned int param;
> > +	u32 reg, bit, width;
> > +	u32 mask, arg =3D 0;
> > +	u32 tmp;
> > +	int i;
> > +
> > +	g =3D &pctrl->soc->groups[group];
> > +
> > +	for (i =3D 0; i < num_configs; i++) {
> > +		param =3D pinconf_to_config_param(configs[i]);
> > +		arg =3D pinconf_to_config_argument(configs[i]);
> > +
> > +		ret =3D owl_group_pinconf_reg(g, param, &reg, &bit, &width);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret =3D owl_group_pinconf_arg2val(g, param, &arg);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/* Update register */
> > +		raw_spin_lock_irqsave(&pctrl->lock, flags);
> > +
> > +		mask =3D (1 << width) - 1;
> > +		mask =3D mask << bit;
> > +		tmp =3D readl(pctrl->base + reg);
> > +		tmp &=3D ~mask;
> > +		tmp |=3D arg << bit;
> > +		writel(tmp, pctrl->base + reg);
> > +
> > +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct pinconf_ops owl_pinconf_ops =3D {
> > +	.is_generic =3D true,
> > +	.pin_config_get =3D owl_pin_config_get,
> > +	.pin_config_set =3D owl_pin_config_set,
> > +	.pin_config_group_get =3D owl_group_config_get,
> > +	.pin_config_group_set =3D owl_group_config_set,
> > +};
> > +
> > +static struct pinctrl_desc owl_pinctrl_desc =3D {
> > +	.pctlops =3D &owl_pinctrl_ops,
> > +	.pmxops =3D &owl_pinmux_ops,
> > +	.confops =3D &owl_pinconf_ops,
> > +	.owner =3D THIS_MODULE,
> > +};
> > +
> > +int owl_pinctrl_probe(struct platform_device *pdev,
> > +				struct owl_pinctrl_soc_data *soc_data)
> > +{
> > +	struct resource *res;
> > +	struct owl_pinctrl *pctrl;
> > +
> > +	pctrl =3D devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> > +	if (!pctrl)
> > +		return -ENOMEM;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	pctrl->base =3D devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(pctrl->base))
> > +		return PTR_ERR(pctrl->base);
> > +
> > +	/* enable GPIO/MFP clock */
> > +	pctrl->clk =3D devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(pctrl->clk)) {
> > +		dev_err(&pdev->dev, "no clock defined\n");
> > +		return -ENODEV;
> =

> You need to return PTR_ERR(pctrl->clk) to make deferred loading work.
>
Ack. =

> > +	}
> > +	clk_prepare_enable(pctrl->clk);
> > +
> > +	raw_spin_lock_init(&pctrl->lock);
> > +
> > +	owl_pinctrl_desc.name =3D dev_name(&pdev->dev);
> > +	owl_pinctrl_desc.pins =3D soc_data->pins;
> > +	owl_pinctrl_desc.npins =3D soc_data->npins;
> > +
> > +	pctrl->soc =3D soc_data;
> > +	pctrl->dev =3D &pdev->dev;
> > +
> > +	pctrl->pctrldev =3D devm_pinctrl_register(&pdev->dev,
> > +					&owl_pinctrl_desc, pctrl);
> > +	if (IS_ERR(pctrl->pctrldev)) {
> > +		dev_err(&pdev->dev, "could not register Actions OWL pinmux driver\n"=
);
> > +		return PTR_ERR(pctrl->pctrldev);
> > +	}
> > +
> > +	platform_set_drvdata(pdev, pctrl);
> > +
> > +	pr_info("Initialized Actions OWL pin control driver\n");
> =

> Drop?
> =

Ack.
> > +
> > +	return 0;
> > +}
> [snip]
> =

> Let's discuss concerns about the naming and design separately.
> =

So, as per our discussion I'll be making all the pin names as lowercase
and the register name based pin groups will be changed to handle pinmuxing
using individual pins.

Thanks,
Mani
> Regards,
> Andreas
> =

> -- =

> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
> HRB 21284 (AG N=FCrnberg)
