From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v2] Add TI CDCE925 I2C controlled clock synthesizer driver
Date: Tue, 10 Mar 2015 09:58:12 +0100
Message-ID: <54FEB224.7010007@topic.nl>
References: <1414151815-21736-2-git-send-email-mike.looijmans@topic.nl> <1417677976-4218-1-git-send-email-mike.looijmans@topic.nl> <54AF7CBE.7040802@topic.nl> <CAPtuhTj-cfzvsjr58sqkOPeq8tU4FmEJ3=nxSzXpvTBfJN5suQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPtuhTj-cfzvsjr58sqkOPeq8tU4FmEJ3=nxSzXpvTBfJN5suQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

=EF=BB=BFOn 12-01-15 04:04, Mike Turquette wrote:
> On Thu, Jan 8, 2015 at 11:01 PM, Mike Looijmans <mike.looijmans@topic=
=2Enl> wrote:
>> Just a ping to inform if you've had had time to look at this?
>
> Its in the queue for review this week. A lot to catch up on after the
> holidays. Thanks for the ping.

Just another ping, you haven't forgotten me I hope?
We're using this chip on several boards now, and we'd really like to ge=
t all=20
the drivers "mainlined".

M.


>> On 12/04/2014 08:26 AM, Mike Looijmans wrote:
>>>
>>> This driver supports the TI CDCE925 programmable clock synthesizer.
>>> The chip contains two PLLs with spread-spectrum clocking support an=
d
>>> five output dividers. The driver only supports the following setup,
>>> and uses a fixed setting for the output muxes:
>>>     Y1 is derived from the input clock
>>>     Y2 and Y3 derive from PLL1
>>>     Y4 and Y5 derive from PLL2
>>> Given a target output frequency, the driver will set the PLL and
>>> divider to best approximate the desired output.
>>>
>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>> ---
>>>
>>> v2: Coding style check
>>>       Add devicetree binding documentation
>>>
>>>    .../devicetree/bindings/clock/cdce925.txt          |   61 ++
>>>    drivers/clk/Kconfig                                |   17 +
>>>    drivers/clk/Makefile                               |    1 +
>>>    drivers/clk/clk-cdce925.c                          |  792
>>> ++++++++++++++++++++
>>>    4 files changed, 871 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/clock/cdce9=
25.txt
>>>    create mode 100644 drivers/clk/clk-cdce925.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/cdce925.txt
>>> b/Documentation/devicetree/bindings/clock/cdce925.txt
>>> new file mode 100644
>>> index 0000000..0eac770
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/cdce925.txt
>>> @@ -0,0 +1,61 @@
>>> +Binding for TO CDCE925 programmable I2C clock synthesizers.
>>> +
>>> +Reference
>>> +This binding uses the common clock binding[1].
>>> +
>>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>>> +[2] http://www.ti.com/product/cdce925
>>> +
>>> +Required properties:
>>> + - compatible: Shall be one of "cdce925", "cdce925pw",
>>> + - reg: I2C device address.
>>> + - clocks: Points to a fixed parent clock that provides the input
>>> frequency.
>>> + - #clock-cells: From common clock bindings: Shall be 1.
>>> +
>>> +Optional properties:
>>> + - xtal-load-pf: Crystal load-capacitor value to fine-tune perform=
ance on
>>> a
>>> +                 board, or to compensate for external influences.
>>> +
>>> +
>>> +For each connected output Y1 through Y5, a child node should be pr=
ovided.
>>> Each
>>> +child node must have the following properties:
>>> + - #clock-cells: From common clock bindings: Shall be 0.
>>> +Optional properties for the output nodes:
>>> + - clock-frequency: Output frequency to generate. This defines the=
 output
>>> +                   frequency set during boot. It can be reprogramm=
ed
>>> during
>>> +                   runtime through the common clock framework.
>>> +
>>> +For both PLL1 and PLL2 an optional child node can be used to speci=
fy
>>> spread
>>> +spectrum clocking parameters.
>>> +  - spread-spectrum: SSC mode as defined in the data sheet.
>>> +  - spread-spectrum-center: Use "centered" mode instead of "max" m=
ode.
>>> When this
>>> +    is present, the clock runs at the requested frequency on avera=
ge.
>>> +
>>> +
>>> +Example:
>>> +
>>> +       clockgen: cdce925pw@64 {
>>> +               compatible =3D "cdce925";
>>> +               reg =3D <0x64>;
>>> +               clocks =3D <&xtal_27Mhz>;
>>> +               xtal-load-pf =3D <5>;
>>> +               #clock-cells =3D <1>;
>>> +               /* PLL options to get SSC 1% centered */
>>> +               PLL2 {
>>> +                       spread-spectrum =3D <4>;
>>> +                       spread-spectrum-center;
>>> +               };
>>> +               /* Outputs calculate mux and divider settings */
>>> +               Y1 {
>>> +                       #clock-cells =3D <0>;
>>> +                       clock-frequency =3D <27000>;
>>> +               };
>>> +               audio_clock: Y2 {
>>> +                       #clock-cells =3D <0>;
>>> +                       clock-frequency =3D <12288000>; /* SPDIF au=
dio */
>>> +               };
>>> +               hdmi_pixel_clock: Y4 {
>>> +                       #clock-cells =3D <0>;
>>> +                       clock-frequency =3D <148500000>; /* HD-vide=
o */
>>> +               };
>>> +       };
>>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>>> index 455fd17..4e474b3 100644
>>> --- a/drivers/clk/Kconfig
>>> +++ b/drivers/clk/Kconfig
>>> @@ -77,6 +77,23 @@ config COMMON_CLK_SI570
>>>            This driver supports Silicon Labs 570/571/598/599 progra=
mmable
>>>            clock generators.
>>>
>>> +config COMMON_CLK_CDCE925
>>> +       tristate "Clock driver for TI CDCE925 devices"
>>> +       depends on I2C
>>> +       depends on OF
>>> +       select REGMAP_I2C
>>> +       help
>>> +       ---help---
>>> +         This driver supports the TI CDCE925 programmable clock
>>> synthesizer.
>>> +         The chip contains two PLLs with spread-spectrum clocking =
support
>>> and
>>> +         five output dividers. The driver only supports the follow=
ing
>>> setup,
>>> +         and uses a fixed setting for the output muxes.
>>> +         Y1 is derived from the input clock
>>> +         Y2 and Y3 derive from PLL1
>>> +         Y4 and Y5 derive from PLL2
>>> +         Given a target output frequency, the driver will set the =
PLL and
>>> +         divider to best approximate the desired output.
>>> +
>>>    config COMMON_CLK_S2MPS11
>>>          tristate "Clock driver for S2MPS1X/S5M8767 MFD"
>>>          depends on MFD_SEC_CORE
>>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>>> index d5fba5b..c476066 100644
>>> --- a/drivers/clk/Makefile
>>> +++ b/drivers/clk/Makefile
>>> @@ -35,6 +35,7 @@ obj-$(CONFIG_COMMON_CLK_RK808)                +=3D
>>> clk-rk808.o
>>>    obj-$(CONFIG_COMMON_CLK_S2MPS11)      +=3D clk-s2mps11.o
>>>    obj-$(CONFIG_COMMON_CLK_SI5351)               +=3D clk-si5351.o
>>>    obj-$(CONFIG_COMMON_CLK_SI570)                +=3D clk-si570.o
>>> +obj-$(CONFIG_COMMON_CLK_CDCE925)       +=3D clk-cdce925.o
>>>    obj-$(CONFIG_CLK_TWL6040)             +=3D clk-twl6040.o
>>>    obj-$(CONFIG_ARCH_U300)                       +=3D clk-u300.o
>>>    obj-$(CONFIG_ARCH_VT8500)             +=3D clk-vt8500.o
>>> diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
>>> new file mode 100644
>>> index 0000000..faa867f
>>> --- /dev/null
>>> +++ b/drivers/clk/clk-cdce925.c
>>> @@ -0,0 +1,792 @@
>>> +/*
>>> + * Driver for TI Dual PLL CDCE925 clock synthesizer
>>> + *
>>> + * This driver always connects the Y1 to the input clock, Y2/Y3 to=
 PLL1
>>> + * and Y4/Y5 to PLL2. PLL frequency is set on a first-come-first-s=
erve
>>> + * basis. Clients can directly request any frequency that the chip=
 can
>>> + * deliver using the standard clk framework. In addition, the devi=
ce can
>>> + * be configured and activated via the devicetree.
>>> + *
>>> + * Copyright (C) 2014, Topic Embedded Products
>>> + * Licenced under GPL
>>> + */
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/clk-private.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/module.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/gcd.h>
>>> +
>>> +/* The chip has 2 PLLs which can be routed through dividers to 5 o=
utputs.
>>> + * Model this as 2 PLL clocks which are parents to the outputs.
>>> + */
>>> +#define NUMBER_OF_PLLS 2
>>> +#define NUMBER_OF_OUTPUTS      5
>>> +
>>> +#define CDCE925_REG_GLOBAL1    0x01
>>> +#define CDCE925_REG_Y1SPIPDIVH 0x02
>>> +#define CDCE925_REG_PDIVL      0x03
>>> +#define CDCE925_REG_XCSEL      0x05
>>> +/* PLL parameters start at 0x10, steps of 0x10 */
>>> +#define CDCE925_OFFSET_PLL     0x10
>>> +/* Add CDCE925_OFFSET_PLL * (pll) to these registers before sendin=
g */
>>> +#define CDCE925_PLL_MUX_OUTPUTS        0x14
>>> +#define CDCE925_PLL_MULDIV     0x18
>>> +
>>> +#define CDCE925_PLL_FREQUENCY_MIN       80000000
>>> +#define CDCE925_PLL_FREQUENCY_MAX      230000000
>>> +struct clk_cdce925_chip;
>>> +
>>> +struct clk_cdce925_output {
>>> +       struct clk_hw hw;
>>> +       struct clk_cdce925_chip *chip;
>>> +       u8 index;
>>> +       u16 pdiv; /* 1..127 for Y2-Y5; 1..1023 for Y1 */
>>> +};
>>> +#define to_clk_cdce925_output(_hw) \
>>> +       container_of(_hw, struct clk_cdce925_output, hw)
>>> +
>>> +struct clk_cdce925_pll {
>>> +       struct clk_hw hw;
>>> +       struct clk_cdce925_chip *chip;
>>> +       u8 index;
>>> +       u16 m;   /* 1..511 */
>>> +       u16 n;   /* 1..4095 */
>>> +};
>>> +#define to_clk_cdce925_pll(_hw)        container_of(_hw, struct
>>> clk_cdce925_pll, hw)
>>> +
>>> +struct clk_cdce925_chip {
>>> +       struct regmap *regmap;
>>> +       struct i2c_client *i2c_client;
>>> +       struct clk_cdce925_pll pll[NUMBER_OF_PLLS];
>>> +       struct clk_cdce925_output clk[NUMBER_OF_OUTPUTS];
>>> +};
>>> +
>>> +/* ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** =
** */
>>> +
>>> +static unsigned long cdce925_pll_calculate_rate(unsigned long
>>> parent_rate,
>>> +       u16 n, u16 m)
>>> +{
>>> +       if ((!m || !n) || (m =3D=3D n))
>>> +               return parent_rate; /* In bypass mode runs at same
>>> frequency */
>>> +       return mult_frac(parent_rate, (unsigned long)n, (unsigned l=
ong)m);
>>> +}
>>> +
>>> +static unsigned long cdce925_pll_recalc_rate(struct clk_hw *hw,
>>> +               unsigned long parent_rate)
>>> +{
>>> +       /* Output frequency of PLL is Fout =3D (Fin/Pdiv)*(N/M) */
>>> +       struct clk_cdce925_pll *data =3D to_clk_cdce925_pll(hw);
>>> +
>>> +       return cdce925_pll_calculate_rate(parent_rate, data->n, dat=
a->m);
>>> +}
>>> +
>>> +static int cdce925_pll_find_rate(unsigned long rate,
>>> +               unsigned long parent_rate, u16 *n, u16 *m)
>>> +{
>>> +       if (rate <=3D parent_rate) {
>>> +               /* Can always deliver parent_rate in bypass mode */
>>> +               rate =3D parent_rate;
>>> +               *n =3D 0;
>>> +               *m =3D 0;
>>> +       } else {
>>> +               /* In PLL mode, need to apply min/max range */
>>> +               unsigned long un;
>>> +               unsigned long um;
>>> +               unsigned long g;
>>> +
>>> +               if (rate < CDCE925_PLL_FREQUENCY_MIN)
>>> +                       rate =3D CDCE925_PLL_FREQUENCY_MIN;
>>> +               else if (rate > CDCE925_PLL_FREQUENCY_MAX)
>>> +                       rate =3D CDCE925_PLL_FREQUENCY_MAX;
>>> +
>>> +               g =3D gcd(rate, parent_rate);
>>> +               um =3D parent_rate / g;
>>> +               un =3D rate / g;
>>> +               /* When outside hw range, reduce to fit (rounding e=
rrors)
>>> */
>>> +               while ((un > 4095) || (um > 511)) {
>>> +                       un >>=3D 1;
>>> +                       um >>=3D 1;
>>> +               }
>>> +               if (un =3D=3D 0)
>>> +                       un =3D 1;
>>> +               if (um =3D=3D 0)
>>> +                       um =3D 1;
>>> +
>>> +               *n =3D un;
>>> +               *m =3D um;
>>> +       }
>>> +
>>> +       pr_debug("%s(%lu,%lu) n=3D%u m=3D%u\n",
>>> +                       __func__, rate, parent_rate, *n, *m);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static long cdce925_pll_round_rate(struct clk_hw *hw, unsigned lon=
g rate,
>>> +               unsigned long *parent_rate)
>>> +{
>>> +       struct clk_cdce925_pll *data =3D to_clk_cdce925_pll(hw);
>>> +       u16 n, m;
>>> +       int ret;
>>> +
>>> +       pr_debug("%s (index=3D%d parent_rate=3D%lu rate=3D%lu)\n", =
__func__,
>>> +               data->index, *parent_rate, rate);
>>> +       ret =3D cdce925_pll_find_rate(rate, *parent_rate, &n, &m);
>>> +       return (long)cdce925_pll_calculate_rate(*parent_rate, n, m)=
;
>>> +}
>>> +
>>> +static int cdce925_pll_set_rate(struct clk_hw *hw, unsigned long r=
ate,
>>> +               unsigned long parent_rate)
>>> +{
>>> +       struct clk_cdce925_pll *data =3D to_clk_cdce925_pll(hw);
>>> +
>>> +       if (!rate || (rate =3D=3D parent_rate)) {
>>> +               data->m =3D 0; /* Bypass mode */
>>> +               data->n =3D 0;
>>> +               return 0;
>>> +       }
>>> +
>>> +       if ((rate < CDCE925_PLL_FREQUENCY_MIN) ||
>>> +               (rate > CDCE925_PLL_FREQUENCY_MAX)) {
>>> +               pr_debug("%s: rate %lu outside PLL range.\n", __fun=
c__,
>>> rate);
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       if (rate < parent_rate) {
>>> +               pr_debug("%s: rate %lu less than parent rate %lu.\n=
",
>>> __func__,
>>> +                       rate, parent_rate);
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       return cdce925_pll_find_rate(rate, parent_rate, &data->n,
>>> &data->m);
>>> +}
>>> +
>>> +
>>> +/* calculate p =3D max(0, 4 - int(log2 (n/m))) */
>>> +static u8 cdce925_pll_calc_p(u16 n, u16 m)
>>> +{
>>> +       u8 p;
>>> +       u16 r =3D n / m;
>>> +
>>> +       if (r >=3D 16)
>>> +               return 0;
>>> +       p =3D 4;
>>> +       while (r > 1) {
>>> +               r >>=3D 1;
>>> +               --p;
>>> +       }
>>> +       return p;
>>> +}
>>> +
>>> +/* Returns VCO range bits for VCO1_0_RANGE */
>>> +static u8 cdce925_pll_calc_range_bits(struct clk_hw *hw, u16 n, u1=
6 m)
>>> +{
>>> +       struct clk *parent =3D clk_get_parent(hw->clk);
>>> +       unsigned long rate =3D clk_get_rate(parent);
>>> +
>>> +       rate =3D mult_frac(rate, (unsigned long)n, (unsigned long)m=
);
>>> +       if (rate >=3D 175000000)
>>> +               return 0x3;
>>> +       if (rate >=3D 150000000)
>>> +               return 0x02;
>>> +       if (rate >=3D 125000000)
>>> +               return 0x01;
>>> +       return 0x00;
>>> +}
>>> +
>>> +/* I2C clock, hence everything must happen in (un)prepare because =
this
>>> + * may sleep */
>>> +static int cdce925_pll_prepare(struct clk_hw *hw)
>>> +{
>>> +       struct clk_cdce925_pll *data =3D to_clk_cdce925_pll(hw);
>>> +       u16 n =3D data->n;
>>> +       u16 m =3D data->m;
>>> +       u16 r;
>>> +       u8 q;
>>> +       u8 p;
>>> +       u16 nn;
>>> +       u8 pll[4]; /* Bits are spread out over 4 byte registers */
>>> +       u8 reg_ofs =3D data->index * CDCE925_OFFSET_PLL;
>>> +       unsigned i;
>>> +
>>> +       pr_debug("%s: index=3D%d\n", __func__, data->index);
>>> +
>>> +       if ((!m || !n) || (m =3D=3D n)) {
>>> +               /* Set PLL mux to bypass mode, leave the rest as is=
 */
>>> +               regmap_update_bits(data->chip->regmap,
>>> +                       reg_ofs + CDCE925_PLL_MUX_OUTPUTS, 0x80, 0x=
80);
>>> +       } else {
>>> +               /* According to data sheet: */
>>> +               /* p =3D max(0, 4 - int(log2 (n/m))) */
>>> +               p =3D cdce925_pll_calc_p(n, m);
>>> +               /* nn =3D n * 2^p */
>>> +               nn =3D n * BIT(p);
>>> +               /* q =3D int(nn/m) */
>>> +               q =3D nn / m;
>>> +               if ((q < 16) || (1 > 64)) {
>>> +                       pr_debug("%s invalid q=3D%d\n", __func__, q=
);
>>> +                       return -EINVAL;
>>> +               }
>>> +               r =3D nn - (m*q);
>>> +               if (r > 511) {
>>> +                       pr_debug("%s invalid r=3D%d\n", __func__, r=
);
>>> +                       return -EINVAL;
>>> +               }
>>> +               pr_debug("%s n=3D%d m=3D%d p=3D%d q=3D%d r=3D%d\n",=
 __func__,
>>> +                       n, m, p, q, r);
>>> +               /* encode into register bits */
>>> +               pll[0] =3D n >> 4;
>>> +               pll[1] =3D ((n & 0x0F) << 4) | ((r >> 5) & 0x0F);
>>> +               pll[2] =3D ((r & 0x1F) << 3) | ((q >> 3) & 0x07);
>>> +               pll[3] =3D ((q & 0x07) << 5) | (p << 2) |
>>> +                               cdce925_pll_calc_range_bits(hw, n, =
m);
>>> +               /* Write to registers */
>>> +               for (i =3D 0; i < ARRAY_SIZE(pll); ++i)
>>> +                       regmap_write(data->chip->regmap,
>>> +                               reg_ofs + CDCE925_PLL_MULDIV + i, p=
ll[i]);
>>> +               /* Enable PLL */
>>> +               regmap_update_bits(data->chip->regmap,
>>> +                       reg_ofs + CDCE925_PLL_MUX_OUTPUTS, 0x80, 0x=
00);
>>> +       }
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static void cdce925_pll_unprepare(struct clk_hw *hw)
>>> +{
>>> +       struct clk_cdce925_pll *data =3D to_clk_cdce925_pll(hw);
>>> +       u8 reg_ofs =3D data->index * CDCE925_OFFSET_PLL;
>>> +
>>> +       pr_debug("%s: index=3D%d\n", __func__, data->index);
>>> +       regmap_update_bits(data->chip->regmap,
>>> +                       reg_ofs + CDCE925_PLL_MUX_OUTPUTS, 0x80, 0x=
80);
>>> +}
>>> +
>>> +static const struct clk_ops cdce925_pll_ops =3D {
>>> +       .prepare =3D cdce925_pll_prepare,
>>> +       .unprepare =3D cdce925_pll_unprepare,
>>> +       .recalc_rate =3D cdce925_pll_recalc_rate,
>>> +       .round_rate =3D cdce925_pll_round_rate,
>>> +       .set_rate =3D cdce925_pll_set_rate,
>>> +};
>>> +
>>> +
>>> +static void cdce925_clk_set_pdiv(struct clk_cdce925_output *data, =
u16
>>> pdiv)
>>> +{
>>> +       pr_debug("%s: index=3D%d pdiv=3D%d\n", __func__, data->inde=
x, pdiv);
>>> +       switch (data->index) {
>>> +       case 0:
>>> +               regmap_update_bits(data->chip->regmap,
>>> +                       CDCE925_REG_Y1SPIPDIVH,
>>> +                       0x03, (pdiv >> 8) & 0x03);
>>> +               regmap_write(data->chip->regmap, 0x03, pdiv & 0xFF)=
;
>>> +               break;
>>> +       case 1:
>>> +               regmap_update_bits(data->chip->regmap, 0x16, 0x7F, =
pdiv);
>>> +               break;
>>> +       case 2:
>>> +               regmap_update_bits(data->chip->regmap, 0x17, 0x7F, =
pdiv);
>>> +               break;
>>> +       case 3:
>>> +               regmap_update_bits(data->chip->regmap, 0x26, 0x7F, =
pdiv);
>>> +               break;
>>> +       case 4:
>>> +               regmap_update_bits(data->chip->regmap, 0x27, 0x7F, =
pdiv);
>>> +               break;
>>> +       }
>>> +}
>>> +
>>> +static void cdce925_clk_activate(struct clk_cdce925_output *data)
>>> +{
>>> +       pr_debug("%s: index=3D%d\n", __func__, data->index);
>>> +       switch (data->index) {
>>> +       case 0:
>>> +               regmap_update_bits(data->chip->regmap,
>>> +                       CDCE925_REG_Y1SPIPDIVH, 0x0c, 0x0c);
>>> +               break;
>>> +       case 1:
>>> +       case 2:
>>> +               regmap_update_bits(data->chip->regmap, 0x14, 0x03, =
0x03);
>>> +               break;
>>> +       case 3:
>>> +       case 4:
>>> +               regmap_update_bits(data->chip->regmap, 0x24, 0x03, =
0x03);
>>> +               break;
>>> +       }
>>> +}
>>> +
>>> +static int cdce925_clk_prepare(struct clk_hw *hw)
>>> +{
>>> +       struct clk_cdce925_output *data =3D to_clk_cdce925_output(h=
w);
>>> +
>>> +       pr_debug("%s: index=3D%d\n", __func__, data->index);
>>> +       cdce925_clk_set_pdiv(data, data->pdiv);
>>> +       cdce925_clk_activate(data);
>>> +       return 0;
>>> +}
>>> +
>>> +static void cdce925_clk_unprepare(struct clk_hw *hw)
>>> +{
>>> +       struct clk_cdce925_output *data =3D to_clk_cdce925_output(h=
w);
>>> +
>>> +       pr_debug("%s: index=3D%d\n", __func__, data->index);
>>> +       /* Disable clock by setting divider to "0" */
>>> +       cdce925_clk_set_pdiv(data, 0);
>>> +}
>>> +
>>> +static unsigned long cdce925_clk_recalc_rate(struct clk_hw *hw,
>>> +               unsigned long parent_rate)
>>> +{
>>> +       struct clk_cdce925_output *data =3D to_clk_cdce925_output(h=
w);
>>> +
>>> +       pr_debug("%s: index=3D%d parent_rate=3D%lu pdiv=3D%d\n", __=
func__,
>>> +               data->index, parent_rate, data->pdiv);
>>> +       if (data->pdiv)
>>> +               return parent_rate / data->pdiv;
>>> +       return 0;
>>> +}
>>> +
>>> +static u16 cdce925_calc_divider(unsigned long rate,
>>> +               unsigned long parent_rate)
>>> +{
>>> +       if (rate >=3D parent_rate) {
>>> +               return 1;
>>> +       } else if (rate) {
>>> +               unsigned long divider =3D DIV_ROUND_CLOSEST(parent_=
rate,
>>> rate);
>>> +
>>> +               if (divider > 0x7F) /* TODO: Y1 has 10-bit divider =
*/
>>> +                       divider =3D 0x7F;
>>> +               return (u16)divider;
>>> +       } else {
>>> +               return 0;
>>> +       }
>>> +}
>>> +
>>> +static unsigned long cdce925_clk_best_parent_rate(
>>> +       struct clk_hw *hw, unsigned long rate)
>>> +{
>>> +       struct clk *pll =3D clk_get_parent(hw->clk);
>>> +       struct clk *root =3D clk_get_parent(pll);
>>> +       unsigned long root_rate =3D clk_get_rate(root);
>>> +       unsigned long best_rate_error =3D rate;
>>> +       u16 pdiv_min;
>>> +       u16 pdiv_max;
>>> +       u16 pdiv_best;
>>> +       u16 pdiv_now;
>>> +
>>> +       if (root_rate % rate =3D=3D 0)
>>> +               return root_rate; /* Don't need the PLL, use bypass=
 */
>>> +
>>> +       pdiv_min =3D (u16)max(1u, DIV_ROUND_UP(CDCE925_PLL_FREQUENC=
Y_MIN,
>>> rate));
>>> +       pdiv_max =3D (u16)min(127u, CDCE925_PLL_FREQUENCY_MAX / rat=
e);
>>> +
>>> +       if (pdiv_min > pdiv_max)
>>> +               return 0; /* No can do? */
>>> +
>>> +       pdiv_best =3D pdiv_min;
>>> +       for (pdiv_now =3D pdiv_min; pdiv_now < pdiv_max; ++pdiv_now=
) {
>>> +               unsigned long target_rate =3D rate * pdiv_now;
>>> +               long pll_rate =3D clk_round_rate(pll, target_rate);
>>> +               unsigned long actual_rate;
>>> +               unsigned long rate_error;
>>> +
>>> +               if (pll_rate <=3D 0)
>>> +                       continue;
>>> +               actual_rate =3D pll_rate / pdiv_now;
>>> +               rate_error =3D abs((long)actual_rate - (long)rate);
>>> +               if (rate_error < best_rate_error) {
>>> +                       pdiv_best =3D pdiv_now;
>>> +                       best_rate_error =3D rate_error;
>>> +               }
>>> +               /* TODO: Consider PLL frequency based on smaller n/=
m
>>> values
>>> +                * and pick the better one if the error is equal */
>>> +       }
>>> +
>>> +       return rate * pdiv_best;
>>> +}
>>> +
>>> +static long cdce925_clk_round_rate(struct clk_hw *hw, unsigned lon=
g rate,
>>> +               unsigned long *parent_rate)
>>> +{
>>> +       struct clk_cdce925_output *data =3D to_clk_cdce925_output(h=
w);
>>> +       unsigned long l_parent_rate =3D *parent_rate;
>>> +       u16 divider =3D cdce925_calc_divider(rate, l_parent_rate);
>>> +
>>> +       pr_debug("%s (index=3D%d parent_rate=3D%lu rate=3D%lu)\n", =
__func__,
>>> +               data->index, l_parent_rate, rate);
>>> +       if (l_parent_rate / divider !=3D rate) {
>>> +               l_parent_rate =3D cdce925_clk_best_parent_rate(hw, =
rate);
>>> +               divider =3D cdce925_calc_divider(rate, l_parent_rat=
e);
>>> +               *parent_rate =3D l_parent_rate;
>>> +       }
>>> +       pr_debug("%s parent_rate=3D%lu pdiv=3D%u\n", __func__,
>>> +               l_parent_rate, divider);
>>> +       if (divider)
>>> +               return (long)(l_parent_rate / divider);
>>> +       return 0;
>>> +}
>>> +
>>> +static int cdce925_clk_set_rate(struct clk_hw *hw, unsigned long r=
ate,
>>> +               unsigned long parent_rate)
>>> +{
>>> +       struct clk_cdce925_output *data =3D to_clk_cdce925_output(h=
w);
>>> +
>>> +       data->pdiv =3D cdce925_calc_divider(rate, parent_rate);
>>> +       pr_debug("%s (index=3D%d parent_rate=3D%lu rate=3D%lu div=3D=
%d)\n",
>>> __func__,
>>> +               data->index, parent_rate, rate, data->pdiv);
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct clk_ops cdce925_clk_ops =3D {
>>> +       .prepare =3D cdce925_clk_prepare,
>>> +       .unprepare =3D cdce925_clk_unprepare,
>>> +       .recalc_rate =3D cdce925_clk_recalc_rate,
>>> +       .round_rate =3D cdce925_clk_round_rate,
>>> +       .set_rate =3D cdce925_clk_set_rate,
>>> +};
>>> +
>>> +
>>> +static u16 cdce925_y1_calc_divider(unsigned long rate,
>>> +               unsigned long parent_rate)
>>> +{
>>> +       if (rate >=3D parent_rate)
>>> +               return 1;
>>> +       else if (rate) {
>>> +               unsigned long divider =3D DIV_ROUND_CLOSEST(parent_=
rate,
>>> rate);
>>> +
>>> +               if (divider > 0x3FF) /* Y1 has 10-bit divider */
>>> +                       divider =3D 0x3FF;
>>> +               return (u16)divider;
>>> +       } else
>>> +               return 0;
>>> +}
>>> +
>>> +static long cdce925_clk_y1_round_rate(struct clk_hw *hw, unsigned =
long
>>> rate,
>>> +               unsigned long *parent_rate)
>>> +{
>>> +       struct clk_cdce925_output *data =3D to_clk_cdce925_output(h=
w);
>>> +       unsigned long l_parent_rate =3D *parent_rate;
>>> +       u16 divider =3D cdce925_y1_calc_divider(rate, l_parent_rate=
);
>>> +
>>> +       pr_debug("%s (index=3D%d parent_rate=3D%lu rate=3D%lu pdiv=3D=
%u)\n",
>>> __func__,
>>> +               data->index, l_parent_rate, rate, divider);
>>> +       if (divider)
>>> +               return (long)(l_parent_rate / divider);
>>> +       return 0;
>>> +}
>>> +
>>> +static int cdce925_clk_y1_set_rate(struct clk_hw *hw, unsigned lon=
g rate,
>>> +               unsigned long parent_rate)
>>> +{
>>> +       struct clk_cdce925_output *data =3D to_clk_cdce925_output(h=
w);
>>> +
>>> +       data->pdiv =3D cdce925_y1_calc_divider(rate, parent_rate);
>>> +       pr_debug("%s (index=3D%d parent_rate=3D%lu rate=3D%lu div=3D=
%d)\n",
>>> __func__,
>>> +               data->index, parent_rate, rate, data->pdiv);
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct clk_ops cdce925_clk_y1_ops =3D {
>>> +       .prepare =3D cdce925_clk_prepare,
>>> +       .unprepare =3D cdce925_clk_unprepare,
>>> +       .recalc_rate =3D cdce925_clk_recalc_rate,
>>> +       .round_rate =3D cdce925_clk_y1_round_rate,
>>> +       .set_rate =3D cdce925_clk_y1_set_rate,
>>> +};
>>> +
>>> +
>>> +static struct regmap_config cdce925_regmap_config =3D {
>>> +       .name =3D "configuration0",
>>> +       .reg_bits =3D 8,
>>> +       .val_bits =3D 8,
>>> +       .cache_type =3D REGCACHE_RBTREE,
>>> +       .max_register =3D 0x2F,
>>> +};
>>> +
>>> +#define CDCE925_I2C_COMMAND_BLOCK_TRANSFER     0x00
>>> +#define CDCE925_I2C_COMMAND_BYTE_TRANSFER      0x80
>>> +
>>> +static int cdce925_regmap_i2c_write(
>>> +       void *context, const void *data, size_t count)
>>> +{
>>> +       struct device *dev =3D context;
>>> +       struct i2c_client *i2c =3D to_i2c_client(dev);
>>> +       int ret;
>>> +       u8 reg_data[2];
>>> +
>>> +       if (count !=3D 2)
>>> +               return -ENOTSUPP;
>>> +
>>> +       /* First byte is command code */
>>> +       reg_data[0] =3D CDCE925_I2C_COMMAND_BYTE_TRANSFER | ((u8 *)=
data)[0];
>>> +       reg_data[1] =3D ((u8 *)data)[1];
>>> +
>>> +       dev_dbg(&i2c->dev, "%s(%u) %#x %#x\n", __func__, count,
>>> +                       reg_data[0], reg_data[1]);
>>> +
>>> +       ret =3D i2c_master_send(i2c, reg_data, count);
>>> +       if (likely(ret =3D=3D count))
>>> +               return 0;
>>> +       else if (ret < 0)
>>> +               return ret;
>>> +       else
>>> +               return -EIO;
>>> +}
>>> +
>>> +static int cdce925_regmap_i2c_read(void *context,
>>> +          const void *reg, size_t reg_size, void *val, size_t val_=
size)
>>> +{
>>> +       struct device *dev =3D context;
>>> +       struct i2c_client *i2c =3D to_i2c_client(dev);
>>> +       struct i2c_msg xfer[2];
>>> +       int ret;
>>> +       u8 reg_data[2];
>>> +
>>> +       if (reg_size !=3D 1)
>>> +               return -ENOTSUPP;
>>> +
>>> +       xfer[0].addr =3D i2c->addr;
>>> +       xfer[0].flags =3D 0;
>>> +       xfer[0].buf =3D reg_data;
>>> +       if (val_size =3D=3D 1) {
>>> +               reg_data[0] =3D
>>> +                       CDCE925_I2C_COMMAND_BYTE_TRANSFER | ((u8
>>> *)reg)[0];
>>> +               xfer[0].len =3D 1;
>>> +       } else {
>>> +               reg_data[0] =3D
>>> +                       CDCE925_I2C_COMMAND_BLOCK_TRANSFER | ((u8
>>> *)reg)[0];
>>> +               reg_data[1] =3D val_size;
>>> +               xfer[0].len =3D 2;
>>> +       }
>>> +
>>> +       xfer[1].addr =3D i2c->addr;
>>> +       xfer[1].flags =3D I2C_M_RD;
>>> +       xfer[1].len =3D val_size;
>>> +       xfer[1].buf =3D val;
>>> +
>>> +       ret =3D i2c_transfer(i2c->adapter, xfer, 2);
>>> +       if (likely(ret =3D=3D 2)) {
>>> +               dev_dbg(&i2c->dev, "%s(%u, %u) %#x %#x\n", __func__=
,
>>> +                               reg_size, val_size, reg_data[0], *(=
(u8
>>> *)val));
>>> +               return 0;
>>> +       } else if (ret < 0)
>>> +               return ret;
>>> +       else
>>> +               return -EIO;
>>> +}
>>> +
>>> +/* The CDCE925 uses a funky way to read/write registers. Bulk mode=
 is
>>> + * just weird, so just use the single byte mode exclusively. */
>>> +static struct regmap_bus regmap_cdce925_bus =3D {
>>> +       .write =3D cdce925_regmap_i2c_write,
>>> +       .read =3D cdce925_regmap_i2c_read,
>>> +};
>>> +
>>> +static int cdce925_probe(struct i2c_client *client,
>>> +               const struct i2c_device_id *id)
>>> +{
>>> +       struct clk_cdce925_chip *data;
>>> +       struct device_node *node =3D client->dev.of_node;
>>> +       const char *parent_name;
>>> +       struct clk_init_data init;
>>> +       struct clk *clk;
>>> +       u32 value;
>>> +       int i;
>>> +       int err;
>>> +       struct device_node *np_output;
>>> +       char child_name[6];
>>> +
>>> +       dev_dbg(&client->dev, "%s\n", __func__);
>>> +       data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERN=
EL);
>>> +       if (!data)
>>> +               return -ENOMEM;
>>> +
>>> +       data->i2c_client =3D client;
>>> +       data->regmap =3D devm_regmap_init(&client->dev, &regmap_cdc=
e925_bus,
>>> +                       &client->dev, &cdce925_regmap_config);
>>> +       if (IS_ERR(data->regmap)) {
>>> +               dev_err(&client->dev, "failed to allocate register
>>> map\n");
>>> +               return PTR_ERR(data->regmap);
>>> +       }
>>> +       i2c_set_clientdata(client, data);
>>> +
>>> +       parent_name =3D of_clk_get_parent_name(node, 0);
>>> +       if (!parent_name) {
>>> +               dev_err(&client->dev, "missing parent clock\n");
>>> +               return -ENODEV;
>>> +       }
>>> +       dev_dbg(&client->dev, "parent is: %s\n", parent_name);
>>> +
>>> +       if (of_property_read_u32(node, "xtal-load-pf", &value) =3D=3D=
 0)
>>> +               regmap_write(data->regmap,
>>> +                       CDCE925_REG_XCSEL, (value << 3) & 0xF8);
>>> +       /* PWDN bit */
>>> +       regmap_update_bits(data->regmap, CDCE925_REG_GLOBAL1, BIT(4=
), 0);
>>> +
>>> +       /* Set input source for Y1 to be the XTAL */
>>> +       regmap_update_bits(data->regmap, 0x02, BIT(7), 0);
>>> +
>>> +       init.ops =3D &cdce925_pll_ops;
>>> +       init.flags =3D 0;
>>> +       init.parent_names =3D &parent_name;
>>> +       init.num_parents =3D parent_name ? 1 : 0;
>>> +
>>> +       /* Register PLL clocks */
>>> +       for (i =3D 0; i < NUMBER_OF_PLLS; ++i) {
>>> +               init.name =3D kasprintf(GFP_KERNEL, "%s.pll%d",
>>> +                       client->dev.of_node->name, i);
>>> +               data->pll[i].chip =3D data;
>>> +               data->pll[i].hw.init =3D &init;
>>> +               data->pll[i].index =3D i;
>>> +               clk =3D devm_clk_register(&client->dev, &data->pll[=
i].hw);
>>> +               kfree(init.name); /* clock framework made a copy of=
 the
>>> name */
>>> +               if (IS_ERR(clk)) {
>>> +                       dev_err(&client->dev, "Failed register PLL =
%d\n",
>>> i);
>>> +                       err =3D PTR_ERR(clk);
>>> +                       goto error;
>>> +               }
>>> +               sprintf(child_name, "PLL%d", i+1);
>>> +               np_output =3D of_get_child_by_name(node, child_name=
);
>>> +               if (!np_output)
>>> +                       continue;
>>> +               if (!of_property_read_u32(np_output,
>>> +                       "clock-frequency", &value)) {
>>> +                       err =3D clk_set_rate(clk, value);
>>> +                       if (err)
>>> +                               dev_err(&client->dev,
>>> +                                       "unable to set PLL frequenc=
y
>>> %ud\n",
>>> +                                       value);
>>> +               }
>>> +               if (!of_property_read_u32(np_output,
>>> +                       "spread-spectrum", &value)) {
>>> +                       u8 flag =3D of_property_read_bool(np_output=
,
>>> +                               "spread-spectrum-center") ? 0x80 : =
0x00;
>>> +                       regmap_update_bits(data->regmap,
>>> +                               0x16 + (i*CDCE925_OFFSET_PLL),
>>> +                               0x80, flag);
>>> +                       regmap_update_bits(data->regmap,
>>> +                               0x12 + (i*CDCE925_OFFSET_PLL),
>>> +                               0x07, value & 0x07);
>>> +               }
>>> +       }
>>> +
>>> +       /* Register output clock Y1 */
>>> +       init.ops =3D &cdce925_clk_y1_ops;
>>> +       init.flags =3D 0;
>>> +       init.num_parents =3D 1;
>>> +       init.parent_names =3D &parent_name; /* Mux Y1 to input */
>>> +       init.name =3D kasprintf(GFP_KERNEL, "%s.Y1",
>>> client->dev.of_node->name);
>>> +       data->clk[0].chip =3D data;
>>> +       data->clk[0].hw.init =3D &init;
>>> +       data->clk[0].index =3D 0;
>>> +       data->clk[0].pdiv =3D 1;
>>> +       clk =3D devm_clk_register(&client->dev, &data->clk[0].hw);
>>> +       kfree(init.name); /* clock framework made a copy of the nam=
e */
>>> +       if (IS_ERR(clk)) {
>>> +               dev_err(&client->dev, "clock registration Y1 failed=
\n");
>>> +               err =3D PTR_ERR(clk);
>>> +               goto error;
>>> +       }
>>> +
>>> +       /* Register output clocks Y2 .. Y5*/
>>> +       init.ops =3D &cdce925_clk_ops;
>>> +       init.flags =3D CLK_SET_RATE_PARENT;
>>> +       init.num_parents =3D 1;
>>> +       for (i =3D 1; i < NUMBER_OF_OUTPUTS; ++i) {
>>> +               init.name =3D kasprintf(GFP_KERNEL, "%s.Y%d",
>>> +                       client->dev.of_node->name, i+1);
>>> +               data->clk[i].chip =3D data;
>>> +               data->clk[i].hw.init =3D &init;
>>> +               data->clk[i].index =3D i;
>>> +               data->clk[i].pdiv =3D 1;
>>> +               switch (i) {
>>> +               case 1:
>>> +               case 2:
>>> +                       /* Mux Y2/3 to PLL1 */
>>> +                       init.parent_names =3D &data->pll[0].hw.clk-=
>name;
>>> +                       break;
>>> +               case 3:
>>> +               case 4:
>>> +                       /* Mux Y4/5 to PLL2 */
>>> +                       init.parent_names =3D &data->pll[1].hw.clk-=
>name;
>>> +                       break;
>>> +               }
>>> +               clk =3D devm_clk_register(&client->dev, &data->clk[=
i].hw);
>>> +               kfree(init.name); /* clock framework made a copy of=
 the
>>> name */
>>> +               if (IS_ERR(clk)) {
>>> +                       dev_err(&client->dev, "clock registration
>>> failed\n");
>>> +                       err =3D PTR_ERR(clk);
>>> +                       goto error;
>>> +               }
>>> +       }
>>> +
>>> +       /* Fetch settings from devicetree, if any */
>>> +       for (i =3D 0; i < NUMBER_OF_OUTPUTS; ++i) {
>>> +               sprintf(child_name, "Y%d", i+1);
>>> +               np_output =3D of_get_child_by_name(node, child_name=
);
>>> +               if (!np_output) {
>>> +                       /* Disable unlisted/unused clock outputs
>>> explicitly */
>>> +                       cdce925_clk_unprepare(&data->clk[i].hw);
>>> +                       continue;
>>> +               }
>>> +               clk =3D data->clk[i].hw.clk;
>>> +               if (!of_property_read_u32(np_output,
>>> +                       "clock-frequency", &value)) {
>>> +                       err =3D clk_set_rate(clk, value);
>>> +                       if (err)
>>> +                               dev_err(&client->dev,
>>> +                                       "unable to set frequency %u=
d\n",
>>> +                                       value);
>>> +               }
>>> +               if (of_property_read_bool(np_output, "clock-enabled=
")) {
>>> +                       err =3D clk_prepare_enable(clk);
>>> +                       if (err)
>>> +                               dev_err(&client->dev,
>>> +                                       "Failed to enable clock %s\=
n",
>>> +                                       init.name);
>>> +               } else {
>>> +                       cdce925_clk_unprepare(&data->clk[i].hw);
>>> +               }
>>> +               err =3D of_clk_add_provider(np_output,
>>> +                       of_clk_src_simple_get, clk);
>>> +               if (err)
>>> +                       dev_err(&client->dev,
>>> +                               "unable to add clock provider '%s'\=
n",
>>> +                               init.name);
>>> +       }
>>> +
>>> +       return 0;
>>> +
>>> +error:
>>> +       return err;
>>> +}
>>> +
>>> +static const struct i2c_device_id cdce925_id[] =3D {
>>> +       { "cdce925", 0 },
>>> +       { }
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, cdce925_id);
>>> +
>>> +static const struct of_device_id clk_cdce925_of_match[] =3D {
>>> +       { .compatible =3D "cdce925pw" },
>>> +       { .compatible =3D "cdce925" },
>>> +       { },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, clk_cdce925_of_match);
>>> +
>>> +static struct i2c_driver cdce925_driver =3D {
>>> +       .driver =3D {
>>> +               .name =3D "cdce925",
>>> +               .of_match_table =3D of_match_ptr(clk_cdce925_of_mat=
ch),
>>> +       },
>>> +       .probe          =3D cdce925_probe,
>>> +       .id_table       =3D cdce925_id,
>>> +};
>>> +module_i2c_driver(cdce925_driver);
>>> +
>>> +MODULE_AUTHOR("Mike Looijmans <mike.looijmans@topic.nl>");
>>> +MODULE_DESCRIPTION("cdce925 driver");
>>> +MODULE_LICENSE("GPL");




Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/
