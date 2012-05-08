From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 04/14] OF: pinctrl: MIPS: lantiq: implement lantiq/xway
 pinctrl support
Date: Tue, 8 May 2012 15:21:33 +0200
Message-ID: <CACRpkdYJDd84GbKM7r4Xy+d4iOtdD+rJ3kdq-zwVbf_Attj2Gw@mail.gmail.com>
References: <1336133919-26525-1-git-send-email-blogic@openwrt.org>
 <1336133919-26525-4-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1336133919-26525-4-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 4, 2012 at 2:18 PM, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:

> Implement support for pinctrl on lantiq/xway socs. The IO core found on t=
hese
> socs has the registers for pinctrl, pinconf and gpio mixed up in the same
> register range. As the gpio_chip handling is only a few lines, the driver=
 also
> implements the gpio functionality. This obseletes the old gpio driver tha=
t was
> located in the arch/ folder.
>
> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

Overall this is looking very good and a positive development for these SoCs.

Nitpicking below.

> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -216,6 +216,7 @@ config MACH_JZ4740
> =A0config LANTIQ
> =A0 =A0 =A0 =A0bool "Lantiq based platforms"
> =A0 =A0 =A0 =A0select DMA_NONCOHERENT
> + =A0 =A0 =A0 select PINCTRL

Shouldn't this be:
select PINCTRL
select PINCTRL_LANTIQ

?

> diff --git a/arch/mips/lantiq/Kconfig b/arch/mips/lantiq/Kconfig
> index 9485fe5..b86d942 100644
> --- a/arch/mips/lantiq/Kconfig
> +++ b/arch/mips/lantiq/Kconfig
> @@ -2,6 +2,7 @@ if LANTIQ
>
> =A0config SOC_TYPE_XWAY
> =A0 =A0 =A0 =A0bool
> + =A0 =A0 =A0 select PINCTRL_XWAY
> =A0 =A0 =A0 =A0default n

OK...

> -obj-y :=3D prom.o pmu.o ebu.o reset.o gpio.o gpio_stp.o gpio_ebu.o dma.o
> +obj-y :=3D prom.o pmu.o ebu.o reset.o gpio_stp.o gpio_ebu.o dma.o

Yeah good riddance :-)

> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index f73a5ea..a19bac96 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -30,6 +30,11 @@ config PINCTRL_PXA3xx
> =A0 =A0 =A0 =A0bool
> =A0 =A0 =A0 =A0select PINMUX
>
> +config PINCTRL_LANTIQ
> + =A0 =A0 =A0 bool
> + =A0 =A0 =A0 select PINMUX
> + =A0 =A0 =A0 select PINCONF

depends on LANTIQ

?

I don't think anyone else is going to want to compile
this.

> +
> =A0config PINCTRL_MMP2
> =A0 =A0 =A0 =A0bool "MMP2 pin controller driver"
> =A0 =A0 =A0 =A0depends on ARCH_MMP
> @@ -83,6 +88,10 @@ config PINCTRL_COH901
> =A0 =A0 =A0 =A0 =A0COH 901 335 and COH 901 571/3. They contain 3, 5 or 7
> =A0 =A0 =A0 =A0 =A0ports of 8 GPIO pins each.
>
> +config PINCTRL_XWAY
> + =A0 =A0 =A0 bool
> + =A0 =A0 =A0 select PINCTRL_LANTIQ

Shouldn't this be:

depends on SOC_TYPE_XWAY
depends on PINCTRL_LANTIQ

?

So LANTIQ selects it's pinctrl driver, the the xway SoC
selects its driver and they both are dependent on their
respective system.

> diff --git a/drivers/pinctrl/pinctrl-lantiq.h b/drivers/pinctrl/pinctrl-l=
antiq.h

> +#define ARRAY_AND_SIZE(x) =A0 =A0 =A0(x), ARRAY_SIZE(x)

Hm if we redefine this I start to wonder if this
should go into <linux/kernel.h>

No big deal, we can alsway refactor later.

> +#define LTQ_PINCONF_PACK(_param_, _arg_) =A0 =A0 =A0 ((_param_) << 16 | =
(_arg_))
> +#define LTQ_PINCONF_UNPACK_PARAM(_conf_) =A0 =A0 =A0 ((_conf_) >> 16)
> +#define LTQ_PINCONF_UNPACK_ARG(_conf_) =A0 =A0 =A0 =A0 ((_conf_) & 0xfff=
f)

No need to add _underscores_ around the macro parameters?
I've not seen any coding convention requiring this.

> +struct ltq_pinmux_info {
> + =A0 =A0 =A0 struct device *dev;
> + =A0 =A0 =A0 struct pinctrl_dev *pctrl;
> +
> + =A0 =A0 =A0 /* we need to manage up to 5 padcontrolers */

controllers

> + =A0 =A0 =A0 void __iomem *membase[5];
> +
> + =A0 =A0 =A0 /* the handler for the subsystem */
> + =A0 =A0 =A0 struct pinctrl_desc *desc;

It's a descriptor not a handler.

> + =A0 =A0 =A0 /* we expose our pads to the subsystem */
> + =A0 =A0 =A0 struct pinctrl_pin_desc *pads;
> +
> + =A0 =A0 =A0 /* the number of pads. this varies between socs */
> + =A0 =A0 =A0 unsigned int num_gpio;

Why not call it num_pads, atleast use the same name for
the array and the count.

> + =A0 =A0 =A0 /* these are our multifunction pins */
> + =A0 =A0 =A0 const struct ltq_mfp_pin *mfp;
> + =A0 =A0 =A0 unsigned int num_mfp;
> +
> + =A0 =A0 =A0 /* a number of multifunction pins can be grouped together */
> + =A0 =A0 =A0 const struct ltq_pin_group *grps;
> + =A0 =A0 =A0 unsigned int num_grps;
> +
> + =A0 =A0 =A0 /* a mapping between function string and id */
> + =A0 =A0 =A0 const struct ltq_pmx_func *funcs;
> + =A0 =A0 =A0 unsigned int num_funcs;
> +
> + =A0 =A0 =A0 /* the pinconf options that we are able to read from the DT=
 */
> + =A0 =A0 =A0 const struct ltq_cfg_param *params;
> + =A0 =A0 =A0 unsigned int num_params;
> +
> + =A0 =A0 =A0 /* soc specific callback used to apply muxing */
> + =A0 =A0 =A0 int (*apply_mux)(struct pinctrl_dev *pctrldev, int pin, int=
 mux);
> +};
>
> +enum ltq_pin_list {
> + =A0 =A0 =A0 GPIO0 =3D 0,
> + =A0 =A0 =A0 GPIO1,

Wait, this enum is called something ending with _list but it's not
a list, it's a pin. The enum is like a type, so should define the basic
unit we're dealing with, not a collection of such units, so rename it
"ltq_pin" simply.

You could also consider using:
#define GPIO0 0
#define GPIO1 1

etc like some other drivers do. (Your pick.)

> diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xwa=
y.c

> +/* macros to help us access the registers */
> +#define gpio_getbit(m, r, p) =A0 (!!(ltq_r32(m + r) & (1 << p)))
> +#define gpio_setbit(m, r, p) =A0 ltq_w32_mask(0, (1 << p), m + r)
> +#define gpio_clearbit(m, r, p) ltq_w32_mask((1 << p), 0, m + r)

So what makes this arch so fantastic that it needs its own read/write funct=
ions?
(Just curious...)

You could replace (1 << p) with BIT(p) by using <linux/bitops.h>

> + =A0 =A0 =A0 {"pci", =A0 =A0 =A0 =A0 ARRAY_AND_SIZE(xrx_pci_grps)},
> + =A0 =A0 =A0 {"ebu", =A0 =A0 =A0 =A0 ARRAY_AND_SIZE(xrx_ebu_grps)},
> +};
> +
> +
> +
> +
> +
> +

You can never get enough whitespace :-)

Please trim it down...

> +/* --------- =A0pinconf related code --------- */
> +static int xway_pinconf_group_get(struct pinctrl_dev *pctldev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned gr=
oup,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned lo=
ng *config)
> +{
> + =A0 =A0 =A0 return -ENOTSUPP;
> +}
> +
> +static int xway_pinconf_group_set(struct pinctrl_dev *pctldev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned gr=
oup,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned lo=
ng config)
> +{
> + =A0 =A0 =A0 return -ENOTSUPP;
> +}

Just don't define these function pointers and leave callbacks as NULL.
The pinctrl core should handle this and if it doesn't, patch the core
in pinconf.c.

> +static void xway_pinconf_dbg_show(struct pinctrl_dev *pctldev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct seq_file *s, unsigned offset)
> +{
> +}
> +
> +static void xway_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct seq_file *s, unsigned selector)
> +{
> +}

Just don't define them if you don't use them, leave pointers as NULL.

These are however good for verbose pretty-printing the pins/groups
hardware state.

> +static inline int xway_mux_apply(struct pinctrl_dev *pctrldev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int pin, in=
t mux)
> +{
> + =A0 =A0 =A0 struct ltq_pinmux_info *info =3D pinctrl_dev_get_drvdata(pc=
trldev);
> + =A0 =A0 =A0 int port =3D PORT(pin);
> +
> + =A0 =A0 =A0 if (mux & 0x1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_setbit(info->membase[0], GPIO_ALT0(pin=
), PORT_PIN(pin));
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_clearbit(info->membase[0], GPIO_ALT0(p=
in), PORT_PIN(pin));
> +
> + =A0 =A0 =A0 if ((port =3D=3D 3) && (mux & 0x2))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_setbit(info->membase[0], GPIO3_ALT1, P=
ORT_PIN(pin));
> + =A0 =A0 =A0 else if (mux & 0x2)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_setbit(info->membase[0], GPIO_ALT1(pin=
), PORT_PIN(pin));
> + =A0 =A0 =A0 else if (port =3D=3D 3)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_clearbit(info->membase[0], GPIO3_ALT1,=
 PORT_PIN(pin));
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_clearbit(info->membase[0], GPIO_ALT1(p=
in), PORT_PIN(pin));
> +
> + =A0 =A0 =A0 return 0;
> +}

Please introduce some #defines for the magic numbers used above:

0x1, 3, 0x2, 3, etc so we can easily figure out what's going on.

> +static struct ltq_pinmux_info xway_info =3D {
> + =A0 =A0 =A0 .mfp =A0 =A0 =A0 =A0 =A0 =A0=3D xway_mfp,
> + =A0 =A0 =A0 .desc =A0 =A0 =A0 =A0 =A0 =3D &xway_pctrl_desc,
> + =A0 =A0 =A0 .apply_mux =A0 =A0 =A0=3D xway_mux_apply,
> + =A0 =A0 =A0 .params =A0 =A0 =A0 =A0 =3D xway_cfg_params,
> + =A0 =A0 =A0 .num_params =A0 =A0 =3D ARRAY_SIZE(xway_cfg_params),
> +};
> +
> +
> +
> +

Whitespacey...

> +/* --------- =A0gpio_chip related code --------- */
> +
> +int gpio_to_irq(unsigned int gpio)
> +{
> + =A0 =A0 =A0 return -EINVAL;
> +}
> +EXPORT_SYMBOL(gpio_to_irq);
> +
> +int irq_to_gpio(unsigned int gpio)
> +{
> + =A0 =A0 =A0 return -EINVAL;
> +}
> +EXPORT_SYMBOL(irq_to_gpio);

Can't you just leave them undefined?

> +static struct gpio_chip xway_chip =3D {
> + =A0 =A0 =A0 .label =3D "gpio-xway",
> + =A0 =A0 =A0 .direction_input =3D xway_gpio_dir_in,
> + =A0 =A0 =A0 .direction_output =3D xway_gpio_dir_out,
> + =A0 =A0 =A0 .get =3D xway_gpio_get,
> + =A0 =A0 =A0 .set =3D xway_gpio_set,
> + =A0 =A0 =A0 .request =3D xway_gpio_req,
> + =A0 =A0 =A0 .free =3D xway_gpio_free,
> + =A0 =A0 =A0 .base =3D 0,
> +};
> +
> +
> +
> +

Whitespace.

Yours,
Linus Walleij
