From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 04/14] OF: pinctrl: MIPS: lantiq: implement lantiq/xway
 pinctrl support
Date: Fri, 04 May 2012 14:57:26 -0600
Message-ID: <4FA442B6.1020501@wwwdotorg.org>
References: <1336133919-26525-1-git-send-email-blogic@openwrt.org> <1336133919-26525-4-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1336133919-26525-4-git-send-email-blogic@openwrt.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: John Crispin <blogic@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On 05/04/2012 06:18 AM, John Crispin wrote:
> Implement support for pinctrl on lantiq/xway socs. The IO core found on these
> socs has the registers for pinctrl, pinconf and gpio mixed up in the same
> register range. As the gpio_chip handling is only a few lines, the driver also
> implements the gpio functionality. This obseletes the old gpio driver that was
> located in the arch/ folder.

Overall looks pretty reasonable. Some comments below.

There doesn't appear to be binding documentation. Something is needed to
describe how to instantiate the pinctrl driver, and the format of the
"pin configuration nodes". See
Documentation/devicetree/bindings/pinctrl/ for some examples.

> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig

>  config LANTIQ
...
> +	select PINCTRL

> diff --git a/arch/mips/lantiq/Kconfig b/arch/mips/lantiq/Kconfig

>  config SOC_TYPE_XWAY
>  	bool
> +	select PINCTRL_XWAY

I'd be tempted to just select PINCTRL and PINCTRL_XWAY in the same place
under SOC_TYPE_XWAY.

> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile

>  obj-$(CONFIG_PINCTRL_TEGRA30)	+= pinctrl-tegra30.o
>  obj-$(CONFIG_PINCTRL_U300)	+= pinctrl-u300.o
>  obj-$(CONFIG_PINCTRL_COH901)	+= pinctrl-coh901.o
> +obj-$(CONFIG_PINCTRL_LANTIQ)	+= pinctrl-lantiq.o
> +obj-$(CONFIG_PINCTRL_XWAY)	+= pinctrl-xway.o

It'd be nice to keep this sorted. I know COH901 isn't right now; I guess
I should send a patch for that.

> diff --git a/drivers/pinctrl/pinctrl-lantiq.c b/drivers/pinctrl/pinctrl-lantiq.c

> +static const char *ltq_get_group_name(struct pinctrl_dev *pctrldev,
> +					 unsigned selector)
> +{
> +	struct ltq_pinmux_info *info = pinctrl_dev_get_drvdata(pctrldev);
> +	if (selector >= info->num_grps)
> +		return NULL;

Most/all other drivers removed this range checking, instead relying on
the pinctrl core to not be buggy, and to respect the limits set out in
the pinctrl device descriptor.

> +static int ltq_pinctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,

> +				"%s mixes pins and groups settings\n",

s/mixes/muxes/.

> +int ltq_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,

> +	*map = kzalloc(*num_maps * sizeof(struct pinctrl_map), GFP_KERNEL);

Check for failure.

> diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c

> +static int xway_pinconf_get(struct pinctrl_dev *pctldev,
...
> +	default:
> +		pr_err("%s: Invalid config param %04x\n",
> +					pinctrl_dev_get_name(pctldev), param);

Use dev_err instead of pr_err everywhere?

> +int irq_to_gpio(unsigned int gpio)
> +{
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL(irq_to_gpio);

Hasn't this function been removed? Perhaps it's only ARM that removed it.

> +static inline int xway_gpio_pin_count(void)
> +{
> +	if (of_machine_is_compatible("lantiq,ar9") ||
> +			of_machine_is_compatible("lantiq,gr9") ||
> +			of_machine_is_compatible("lantiq,vr9"))
> +		return 56;
> +	return 32;
> +}

What are those compatible values? Are they SoC variants or boards?

If they're SoC variants, then putting each of those compatible values
into the of_device_id table, and storing the per-SoC information in the
.data field is one way to go. Or, simply put this information into a
device-tree property.

If they're board names, this seems wrong; the code should be switching
on the SoC variant rather than the individual board. If a board happens
to hook up fewer of the pins that other boards that's fine, just don't
use them, but they still exist on the SoC and hence are reasonable to
represent in the driver.

> +static int __devinit pinmux_xway_probe(struct platform_device *pdev)

> +	for (i = 0; i < xway_chip.ngpio; i++) {
> +		/* strlen("ioXY") + 1 = 5 */
> +		char *name = devm_kzalloc(&pdev->dev, 5, GFP_KERNEL);
> +
> +		if (!name) {
> +			dev_err(&pdev->dev, "Failed to allocate pad name\n");
> +			return -ENOMEM;
> +		}
> +		snprintf(name, 5, "io%d", i);

Maybe time for a devm_kasprintf()?

> +	/* finish with registering the gpio range in pinctrl */
> +	xway_gpio_range.npins = xway_chip.ngpio;

Presumably, of_gpiochip_add() above dynamically allocates the base GPIO
number? If so, that value needs to be transferred into
xway_gpio_range.base too.

> +core_initcall_sync(pinmux_xway_init);

Does this need to be a core_initcall_sync; would a simple module_init()
do instead?
