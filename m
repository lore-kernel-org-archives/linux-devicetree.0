From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5] clk: si570: Add a driver for SI570 oscillators
Date: Sat, 14 Dec 2013 08:33:27 -0800
Message-ID: <52AC8857.8070504@roeck-us.net>
References: <1379806839-13762-1-git-send-email-soren.brinkmann@xilinx.com> <b625092b-682c-4072-85a6-9f9d7f378ec0@VA3EHSMHS043.ehs.local> <20131002231751.4343.81234@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131002231751.4343.81234@quantum>
Sender: linux-doc-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, =?UTF-8?B?U8O2cmVuIEJyaW5rbWFu?= =?UTF-8?B?bg==?= <soren.brinkmann@xilinx.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyunk@xilinx.com>
List-Id: devicetree@vger.kernel.org

On 10/02/2013 04:17 PM, Mike Turquette wrote:
> Quoting S=C3=B6ren Brinkmann (2013-10-02 10:20:38)
>> Hi Mike,
>>
>> could you please comment on this/apply it to clk-next?
>
> It looks good and is in the queue. Will show up in clk-next in a few
> days.
>
Hi Mike,

trying again ... what happened with this driver ? Any reason for not pu=
shing it after all ?

Thanks,
Guenter

> Thanks,
> Mike
>
>>
>>          Thanks,
>>          S=C3=B6ren
>>
>> On Sat, Sep 21, 2013 at 04:40:39PM -0700, Soren Brinkmann wrote:
>>> Add a driver for SILabs 570, 571, 598, 599 programmable oscillators=
=2E
>>> The devices generate low-jitter clock signals and are reprogrammabl=
e via
>>> an I2C interface.
>>>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>>> ---
>>> v5:
>>>   - fix typo in bindings documentation
>>>   - mention the unit for the 'temperature-stability' property
>>>   - remove calls to clk_unregister() (the device managed code takes=
 care
>>>     of it)
>>>
>>> v4:
>>>   - actually check and handle error on clk_set_rate() call
>>>
>>> v3:
>>>   - add delay in the path for small frequency changes, which can ta=
ke up
>>>     to 100us according to the data sheet
>>>   - use real range for usleep_range() argument
>>>   - use dev_err() over dev_warn() in set_rate()
>>>   - add list of applicable devices for 7ppm DT prop
>>>   - remove comments regarding platform data
>>>   - ignore 7ppm DT prop for incompatible devices
>>>   - replace raw numbers with #defines
>>>   - convert DT prop 'temperature-stability' from boolean to u32
>>>   - make 'temperature-stability' DT prop required (actually not ful=
ly
>>>     true, for 59x it is ignored and the driver does not require its
>>>     presence)
>>>
>>> v2:
>>>   - document clock-output-names in bindings documentation
>>>   - don't use wildcards in compatibility string
>>>   - change Kconfig entry to "... 570 and compatible devices"
>>>   - change some indentation flaws
>>>   - use 10000 as MIN and MAX value in usleep_range
>>>   - fail probe() if 'factory-fout' is not provided in DT
>>>     - default factory fout #defines removed
>>>   - use i2c driver_data instead of OF data
>>>     - remove some related structs and data
>>>   - rename DT property 'initial-fout' =3D> 'clock-frequency' (like =
si5351
>>>     driver)
>>>   - add some more details regarding the 'factory-fout' DT property
>>> ---
>>>   .../devicetree/bindings/clock/silabs,si570.txt     |  39 ++
>>>   drivers/clk/Kconfig                                |  10 +
>>>   drivers/clk/Makefile                               |   1 +
>>>   drivers/clk/clk-si570.c                            | 531 ++++++++=
+++++++++++++
>>>   4 files changed, 581 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/silabs=
,si570.txt
>>>   create mode 100644 drivers/clk/clk-si570.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/silabs,si570.t=
xt b/Documentation/devicetree/bindings/clock/silabs,si570.txt
>>> new file mode 100644
>>> index 0000000..c09f21e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/silabs,si570.txt
>>> @@ -0,0 +1,39 @@
>>> +Binding for Silicon Labs 570, 571, 598 and 599 programmable
>>> +I2C clock generators.
>>> +
>>> +Reference
>>> +This binding uses the common clock binding[1]. Details about the d=
evices can be
>>> +found in the data sheets[2][3].
>>> +
>>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>>> +[2] Si570/571 Data Sheet
>>> +    http://www.silabs.com/Support%20Documents/TechnicalDocs/si570.=
pdf
>>> +[3] Si598/599 Data Sheet
>>> +    http://www.silabs.com/Support%20Documents/TechnicalDocs/si598-=
99.pdf
>>> +
>>> +Required properties:
>>> + - compatible: Shall be one of "silabs,si570", "silabs,si571",
>>> +                            "silabs,si598", "silabs,si599"
>>> + - reg: I2C device address.
>>> + - #clock-cells: From common clock bindings: Shall be 0.
>>> + - factory-fout: Factory set default frequency. This frequency is =
part specific.
>>> +              The correct frequency for the part used has to be pr=
ovided in
>>> +              order to generate the correct output frequencies. Fo=
r more
>>> +              details, please refer to the data sheet.
>>> + - temperature-stability: Temperature stability of the device in P=
PM. Should be
>>> +                       one of: 7, 20, 50 or 100.
>>> +
>>> +Optional properties:
>>> + - clock-output-names: From common clock bindings. Recommended to =
be "si570".
>>> + - clock-frequency: Output frequency to generate. This defines the=
 output
>>> +                 frequency set during boot. It can be reprogrammed=
 during
>>> +                 runtime through the common clock framework.
>>> +
>>> +Example:
>>> +     si570: clock-generator@5d {
>>> +             #clock-cells =3D <0>;
>>> +             compatible =3D "silabs,si570";
>>> +             temperature-stability =3D <50>;
>>> +             reg =3D <0x5d>;
>>> +             factory-fout =3D <156250000>;
>>> +     };
>>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>>> index 279407a..349b88a 100644
>>> --- a/drivers/clk/Kconfig
>>> +++ b/drivers/clk/Kconfig
>>> @@ -64,6 +64,16 @@ config COMMON_CLK_SI5351
>>>          This driver supports Silicon Labs 5351A/B/C programmable c=
lock
>>>          generators.
>>>
>>> +config COMMON_CLK_SI570
>>> +     tristate "Clock driver for SiLabs 570 and compatible devices"
>>> +     depends on I2C
>>> +     depends on OF
>>> +     select REGMAP_I2C
>>> +     help
>>> +     ---help---
>>> +       This driver supports Silicon Labs 570/571/598/599 programma=
ble
>>> +       clock generators.
>>> +
>>>   config COMMON_CLK_S2MPS11
>>>        tristate "Clock driver for S2MPS11 MFD"
>>>        depends on MFD_SEC_CORE
>>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>>> index 7b11106..c0e94b3 100644
>>> --- a/drivers/clk/Makefile
>>> +++ b/drivers/clk/Makefile
>>> @@ -40,6 +40,7 @@ obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN) +=3D clk-axi-=
clkgen.o
>>>   obj-$(CONFIG_COMMON_CLK_WM831X) +=3D clk-wm831x.o
>>>   obj-$(CONFIG_COMMON_CLK_MAX77686) +=3D clk-max77686.o
>>>   obj-$(CONFIG_COMMON_CLK_SI5351) +=3D clk-si5351.o
>>> +obj-$(CONFIG_COMMON_CLK_SI570) +=3D clk-si570.o
>>>   obj-$(CONFIG_COMMON_CLK_S2MPS11) +=3D clk-s2mps11.o
>>>   obj-$(CONFIG_CLK_TWL6040)    +=3D clk-twl6040.o
>>>   obj-$(CONFIG_CLK_PPC_CORENET)        +=3D clk-ppc-corenet.o
>>> diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
>>> new file mode 100644
>>> index 0000000..5d0ac9f
>>> --- /dev/null
>>> +++ b/drivers/clk/clk-si570.c
>>> @@ -0,0 +1,531 @@
>>> +/*
>>> + * Driver for Silicon Labs Si570/Si571 Programmable XO/VCXO
>>> + *
>>> + * Copyright (C) 2010, 2011 Ericsson AB.
>>> + * Copyright (C) 2011 Guenter Roeck.
>>> + * Copyright (C) 2011 - 2013 Xilinx Inc.
>>> + *
>>> + * Author: Guenter Roeck <guenter.roeck@ericsson.com>
>>> + *      S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or m=
odify
>>> + * it under the terms of the GNU General Public License as publish=
ed by
>>> + * the Free Software Foundation; either version 2 of the License, =
or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/module.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/slab.h>
>>> +
>>> +/* Si570 registers */
>>> +#define SI570_REG_HS_N1              7
>>> +#define SI570_REG_N1_RFREQ0  8
>>> +#define SI570_REG_RFREQ1     9
>>> +#define SI570_REG_RFREQ2     10
>>> +#define SI570_REG_RFREQ3     11
>>> +#define SI570_REG_RFREQ4     12
>>> +#define SI570_REG_CONTROL    135
>>> +#define SI570_REG_FREEZE_DCO 137
>>> +#define SI570_DIV_OFFSET_7PPM        6
>>> +
>>> +#define HS_DIV_SHIFT         5
>>> +#define HS_DIV_MASK          0xe0
>>> +#define HS_DIV_OFFSET                4
>>> +#define N1_6_2_MASK          0x1f
>>> +#define N1_1_0_MASK          0xc0
>>> +#define RFREQ_37_32_MASK     0x3f
>>> +
>>> +#define SI570_MIN_FREQ               10000000L
>>> +#define SI570_MAX_FREQ               1417500000L
>>> +#define SI598_MAX_FREQ               525000000L
>>> +
>>> +#define FDCO_MIN             4850000000LL
>>> +#define FDCO_MAX             5670000000LL
>>> +
>>> +#define SI570_CNTRL_RECALL   (1 << 0)
>>> +#define SI570_CNTRL_FREEZE_M (1 << 5)
>>> +#define SI570_CNTRL_NEWFREQ  (1 << 6)
>>> +
>>> +#define SI570_FREEZE_DCO     (1 << 4)
>>> +
>>> +/**
>>> + * struct clk_si570:
>>> + * @hw:      Clock hw struct
>>> + * @regmap:  Device's regmap
>>> + * @div_offset:      Rgister offset for dividers
>>> + * @max_freq:        Maximum frequency for this device
>>> + * @fxtal:   Factory xtal frequency
>>> + * @n1:              Clock divider N1
>>> + * @hs_div:  Clock divider HSDIV
>>> + * @rfreq:   Clock multiplier RFREQ
>>> + * @frequency:       Current output frequency
>>> + * @i2c_client:      I2C client pointer
>>> + */
>>> +struct clk_si570 {
>>> +     struct clk_hw hw;
>>> +     struct regmap *regmap;
>>> +     unsigned int div_offset;
>>> +     u64 max_freq;
>>> +     u64 fxtal;
>>> +     unsigned int n1;
>>> +     unsigned int hs_div;
>>> +     u64 rfreq;
>>> +     u64 frequency;
>>> +     struct i2c_client *i2c_client;
>>> +};
>>> +#define to_clk_si570(_hw)    container_of(_hw, struct clk_si570, h=
w)
>>> +
>>> +enum clk_si570_variant {
>>> +     si57x,
>>> +     si59x
>>> +};
>>> +
>>> +/**
>>> + * si570_get_divs() - Read clock dividers from HW
>>> + * @data:    Pointer to struct clk_si570
>>> + * @rfreq:   Fractional multiplier (output)
>>> + * @n1:              Divider N1 (output)
>>> + * @hs_div:  Divider HSDIV (output)
>>> + * Returns 0 on success, negative errno otherwise.
>>> + *
>>> + * Retrieve clock dividers and multipliers from the HW.
>>> + */
>>> +static int si570_get_divs(struct clk_si570 *data, u64 *rfreq,
>>> +             unsigned int *n1, unsigned int *hs_div)
>>> +{
>>> +     int err;
>>> +     u8 reg[6];
>>> +     u64 tmp;
>>> +
>>> +     err =3D regmap_bulk_read(data->regmap, SI570_REG_HS_N1 + data=
->div_offset,
>>> +                     reg, ARRAY_SIZE(reg));
>>> +     if (err)
>>> +             return err;
>>> +
>>> +     *hs_div =3D ((reg[0] & HS_DIV_MASK) >> HS_DIV_SHIFT) + HS_DIV=
_OFFSET;
>>> +     *n1 =3D ((reg[0] & N1_6_2_MASK) << 2) + ((reg[1] & N1_1_0_MAS=
K) >> 6) + 1;
>>> +     /* Handle invalid cases */
>>> +     if (*n1 > 1)
>>> +             *n1 &=3D ~1;
>>> +
>>> +     tmp =3D reg[1] & RFREQ_37_32_MASK;
>>> +     tmp =3D (tmp << 8) + reg[2];
>>> +     tmp =3D (tmp << 8) + reg[3];
>>> +     tmp =3D (tmp << 8) + reg[4];
>>> +     tmp =3D (tmp << 8) + reg[5];
>>> +     *rfreq =3D tmp;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/**
>>> + * si570_get_defaults() - Get default values
>>> + * @data:    Driver data structure
>>> + * @fout:    Factory frequency output
>>> + * Returns 0 on success, negative errno otherwise.
>>> + */
>>> +static int si570_get_defaults(struct clk_si570 *data, u64 fout)
>>> +{
>>> +     int err;
>>> +     u64 fdco;
>>> +
>>> +     regmap_write(data->regmap, SI570_REG_CONTROL, SI570_CNTRL_REC=
ALL);
>>> +
>>> +     err =3D si570_get_divs(data, &data->rfreq, &data->n1, &data->=
hs_div);
>>> +     if (err)
>>> +             return err;
>>> +
>>> +     /*
>>> +      * Accept optional precision loss to avoid arithmetic overflo=
ws.
>>> +      * Acceptable per Silicon Labs Application Note AN334.
>>> +      */
>>> +     fdco =3D fout * data->n1 * data->hs_div;
>>> +     if (fdco >=3D (1LL << 36))
>>> +             data->fxtal =3D div64_u64(fdco << 24, data->rfreq >> =
4);
>>> +     else
>>> +             data->fxtal =3D div64_u64(fdco << 28, data->rfreq);
>>> +
>>> +     data->frequency =3D fout;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/**
>>> + * si570_update_rfreq() - Update clock multiplier
>>> + * @data:    Driver data structure
>>> + * Passes on regmap_bulk_write() return value.
>>> + */
>>> +static int si570_update_rfreq(struct clk_si570 *data)
>>> +{
>>> +     u8 reg[5];
>>> +
>>> +     reg[0] =3D ((data->n1 - 1) << 6) |
>>> +             ((data->rfreq >> 32) & RFREQ_37_32_MASK);
>>> +     reg[1] =3D (data->rfreq >> 24) & 0xff;
>>> +     reg[2] =3D (data->rfreq >> 16) & 0xff;
>>> +     reg[3] =3D (data->rfreq >> 8) & 0xff;
>>> +     reg[4] =3D data->rfreq & 0xff;
>>> +
>>> +     return regmap_bulk_write(data->regmap, SI570_REG_N1_RFREQ0 +
>>> +                     data->div_offset, reg, ARRAY_SIZE(reg));
>>> +}
>>> +
>>> +/**
>>> + * si570_calc_divs() - Caluclate clock dividers
>>> + * @frequency:       Target frequency
>>> + * @data:    Driver data structure
>>> + * @out_rfreq:       RFREG fractional multiplier (output)
>>> + * @out_n1:  Clock divider N1 (output)
>>> + * @out_hs_div:      Clock divider HSDIV (output)
>>> + * Returns 0 on success, negative errno otherwise.
>>> + *
>>> + * Calculate the clock dividers (@out_hs_div, @out_n1) and clock m=
ultiplier
>>> + * (@out_rfreq) for a given target @frequency.
>>> + */
>>> +static int si570_calc_divs(unsigned long frequency, struct clk_si5=
70 *data,
>>> +             u64 *out_rfreq, unsigned int *out_n1, unsigned int *o=
ut_hs_div)
>>> +{
>>> +     int i;
>>> +     unsigned int n1, hs_div;
>>> +     u64 fdco, best_fdco =3D ULLONG_MAX;
>>> +     static const uint8_t si570_hs_div_values[] =3D { 11, 9, 7, 6,=
 5, 4 };
>>> +
>>> +     for (i =3D 0; i < ARRAY_SIZE(si570_hs_div_values); i++) {
>>> +             hs_div =3D si570_hs_div_values[i];
>>> +             /* Calculate lowest possible value for n1 */
>>> +             n1 =3D div_u64(div_u64(FDCO_MIN, hs_div), frequency);
>>> +             if (!n1 || (n1 & 1))
>>> +                     n1++;
>>> +             while (n1 <=3D 128) {
>>> +                     fdco =3D (u64)frequency * (u64)hs_div * (u64)=
n1;
>>> +                     if (fdco > FDCO_MAX)
>>> +                             break;
>>> +                     if (fdco >=3D FDCO_MIN && fdco < best_fdco) {
>>> +                             *out_n1 =3D n1;
>>> +                             *out_hs_div =3D hs_div;
>>> +                             *out_rfreq =3D div64_u64(fdco << 28, =
data->fxtal);
>>> +                             best_fdco =3D fdco;
>>> +                     }
>>> +                     n1 +=3D (n1 =3D=3D 1 ? 1 : 2);
>>> +             }
>>> +     }
>>> +
>>> +     if (best_fdco =3D=3D ULLONG_MAX)
>>> +             return -EINVAL;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static unsigned long si570_recalc_rate(struct clk_hw *hw,
>>> +             unsigned long parent_rate)
>>> +{
>>> +     int err;
>>> +     u64 rfreq, rate;
>>> +     unsigned int n1, hs_div;
>>> +     struct clk_si570 *data =3D to_clk_si570(hw);
>>> +
>>> +     err =3D si570_get_divs(data, &rfreq, &n1, &hs_div);
>>> +     if (err) {
>>> +             dev_err(&data->i2c_client->dev, "unable to recalc rat=
e\n");
>>> +             return data->frequency;
>>> +     }
>>> +
>>> +     rfreq =3D div_u64(rfreq, hs_div * n1);
>>> +     rate =3D (data->fxtal * rfreq) >> 28;
>>> +
>>> +     return rate;
>>> +}
>>> +
>>> +static long si570_round_rate(struct clk_hw *hw, unsigned long rate=
,
>>> +             unsigned long *parent_rate)
>>> +{
>>> +     int err;
>>> +     u64 rfreq;
>>> +     unsigned int n1, hs_div;
>>> +     struct clk_si570 *data =3D to_clk_si570(hw);
>>> +
>>> +     if (!rate)
>>> +             return 0;
>>> +
>>> +     if (div64_u64(abs(rate - data->frequency) * 10000LL,
>>> +                             data->frequency) < 35) {
>>> +             rfreq =3D div64_u64((data->rfreq * rate) +
>>> +                             div64_u64(data->frequency, 2), data->=
frequency);
>>> +             n1 =3D data->n1;
>>> +             hs_div =3D data->hs_div;
>>> +
>>> +     } else {
>>> +             err =3D si570_calc_divs(rate, data, &rfreq, &n1, &hs_=
div);
>>> +             if (err) {
>>> +                     dev_err(&data->i2c_client->dev,
>>> +                                     "unable to round rate\n");
>>> +                     return 0;
>>> +             }
>>> +     }
>>> +
>>> +     return rate;
>>> +}
>>> +
>>> +/**
>>> + * si570_set_frequency() - Adjust output frequency
>>> + * @data:    Driver data structure
>>> + * @frequency:       Target frequency
>>> + * Returns 0 on success.
>>> + *
>>> + * Update output frequency for big frequency changes (> 3,500 ppm)=
=2E
>>> + */
>>> +static int si570_set_frequency(struct clk_si570 *data, unsigned lo=
ng frequency)
>>> +{
>>> +     int err;
>>> +
>>> +     err =3D si570_calc_divs(frequency, data, &data->rfreq, &data-=
>n1,
>>> +                     &data->hs_div);
>>> +     if (err)
>>> +             return err;
>>> +
>>> +     /*
>>> +      * The DCO reg should be accessed with a read-modify-write op=
eration
>>> +      * per AN334
>>> +      */
>>> +     regmap_write(data->regmap, SI570_REG_FREEZE_DCO, SI570_FREEZE=
_DCO);
>>> +     regmap_write(data->regmap, SI570_REG_HS_N1 + data->div_offset=
,
>>> +                     ((data->hs_div - HS_DIV_OFFSET) << HS_DIV_SHI=
=46T) |
>>> +                     (((data->n1 - 1) >> 2) & N1_6_2_MASK));
>>> +     si570_update_rfreq(data);
>>> +     regmap_write(data->regmap, SI570_REG_FREEZE_DCO, 0);
>>> +     regmap_write(data->regmap, SI570_REG_CONTROL, SI570_CNTRL_NEW=
=46REQ);
>>> +
>>> +     /* Applying a new frequency can take up to 10ms */
>>> +     usleep_range(10000, 12000);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/**
>>> + * si570_set_frequency_small() - Adjust output frequency
>>> + * @data:    Driver data structure
>>> + * @frequency:       Target frequency
>>> + * Returns 0 on success.
>>> + *
>>> + * Update output frequency for small frequency changes (< 3,500 pp=
m).
>>> + */
>>> +static int si570_set_frequency_small(struct clk_si570 *data,
>>> +                                  unsigned long frequency)
>>> +{
>>> +     /*
>>> +      * This is a re-implementation of DIV_ROUND_CLOSEST
>>> +      * using the div64_u64 function lieu of letting the compiler
>>> +      * insert EABI calls
>>> +      */
>>> +     data->rfreq =3D div64_u64((data->rfreq * frequency) +
>>> +                     div_u64(data->frequency, 2), data->frequency)=
;
>>> +     regmap_write(data->regmap, SI570_REG_CONTROL, SI570_CNTRL_FRE=
EZE_M);
>>> +     si570_update_rfreq(data);
>>> +     regmap_write(data->regmap, SI570_REG_CONTROL, 0);
>>> +
>>> +     /* Applying a new frequency (small change) can take up to 100=
us */
>>> +     usleep_range(100, 200);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int si570_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +             unsigned long parent_rate)
>>> +{
>>> +     struct clk_si570 *data =3D to_clk_si570(hw);
>>> +     struct i2c_client *client =3D data->i2c_client;
>>> +     int err;
>>> +
>>> +     if (rate < SI570_MIN_FREQ || rate > data->max_freq) {
>>> +             dev_err(&client->dev,
>>> +                     "requested frequency %lu Hz is out of range\n=
", rate);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     if (div64_u64(abs(rate - data->frequency) * 10000LL,
>>> +                             data->frequency) < 35)
>>> +             err =3D si570_set_frequency_small(data, rate);
>>> +     else
>>> +             err =3D si570_set_frequency(data, rate);
>>> +
>>> +     if (err)
>>> +             return err;
>>> +
>>> +     data->frequency =3D rate;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct clk_ops si570_clk_ops =3D {
>>> +     .recalc_rate =3D si570_recalc_rate,
>>> +     .round_rate =3D si570_round_rate,
>>> +     .set_rate =3D si570_set_rate,
>>> +};
>>> +
>>> +static bool si570_regmap_is_volatile(struct device *dev, unsigned =
int reg)
>>> +{
>>> +     switch (reg) {
>>> +     case SI570_REG_CONTROL:
>>> +             return true;
>>> +     default:
>>> +             return false;
>>> +     }
>>> +}
>>> +
>>> +static bool si570_regmap_is_writeable(struct device *dev, unsigned=
 int reg)
>>> +{
>>> +     switch (reg) {
>>> +     case SI570_REG_HS_N1 ... (SI570_REG_RFREQ4 + SI570_DIV_OFFSET=
_7PPM):
>>> +     case SI570_REG_CONTROL:
>>> +     case SI570_REG_FREEZE_DCO:
>>> +             return true;
>>> +     default:
>>> +             return false;
>>> +     }
>>> +}
>>> +
>>> +static struct regmap_config si570_regmap_config =3D {
>>> +     .reg_bits =3D 8,
>>> +     .val_bits =3D 8,
>>> +     .cache_type =3D REGCACHE_RBTREE,
>>> +     .max_register =3D 137,
>>> +     .writeable_reg =3D si570_regmap_is_writeable,
>>> +     .volatile_reg =3D si570_regmap_is_volatile,
>>> +};
>>> +
>>> +static int si570_probe(struct i2c_client *client,
>>> +             const struct i2c_device_id *id)
>>> +{
>>> +     struct clk_si570 *data;
>>> +     struct clk_init_data init;
>>> +     struct clk *clk;
>>> +     u32 initial_fout, factory_fout, stability;
>>> +     int err;
>>> +     enum clk_si570_variant variant =3D id->driver_data;
>>> +
>>> +     data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL=
);
>>> +     if (!data)
>>> +             return -ENOMEM;
>>> +
>>> +     init.ops =3D &si570_clk_ops;
>>> +     init.flags =3D CLK_IS_ROOT;
>>> +     init.num_parents =3D 0;
>>> +     data->hw.init =3D &init;
>>> +     data->i2c_client =3D client;
>>> +
>>> +     if (variant =3D=3D si57x) {
>>> +             err =3D of_property_read_u32(client->dev.of_node,
>>> +                             "temperature-stability", &stability);
>>> +             if (err) {
>>> +                     dev_err(&client->dev,
>>> +                               "'temperature-stability' property m=
issing\n");
>>> +                     return err;
>>> +             }
>>> +             /* adjust register offsets for 7ppm devices */
>>> +             if (stability =3D=3D 7)
>>> +                     data->div_offset =3D SI570_DIV_OFFSET_7PPM;
>>> +
>>> +             data->max_freq =3D SI570_MAX_FREQ;
>>> +     } else {
>>> +             data->max_freq =3D SI598_MAX_FREQ;
>>> +     }
>>> +
>>> +     if (of_property_read_string(client->dev.of_node, "clock-outpu=
t-names",
>>> +                     &init.name))
>>> +             init.name =3D client->dev.of_node->name;
>>> +
>>> +     err =3D of_property_read_u32(client->dev.of_node, "factory-fo=
ut",
>>> +                     &factory_fout);
>>> +     if (err) {
>>> +             dev_err(&client->dev, "'factory-fout' property missin=
g\n");
>>> +             return err;
>>> +     }
>>> +
>>> +     data->regmap =3D devm_regmap_init_i2c(client, &si570_regmap_c=
onfig);
>>> +     if (IS_ERR(data->regmap)) {
>>> +             dev_err(&client->dev, "failed to allocate register ma=
p\n");
>>> +             return PTR_ERR(data->regmap);
>>> +     }
>>> +
>>> +     i2c_set_clientdata(client, data);
>>> +     err =3D si570_get_defaults(data, factory_fout);
>>> +     if (err)
>>> +             return err;
>>> +
>>> +     clk =3D devm_clk_register(&client->dev, &data->hw);
>>> +     if (IS_ERR(clk)) {
>>> +             dev_err(&client->dev, "clock registration failed\n");
>>> +             return PTR_ERR(clk);
>>> +     }
>>> +     err =3D of_clk_add_provider(client->dev.of_node, of_clk_src_s=
imple_get,
>>> +                     clk);
>>> +     if (err) {
>>> +             dev_err(&client->dev, "unable to add clk provider\n")=
;
>>> +             return err;
>>> +     }
>>> +
>>> +     /* Read the requested initial output frequency from device tr=
ee */
>>> +     if (!of_property_read_u32(client->dev.of_node, "clock-frequen=
cy",
>>> +                             &initial_fout)) {
>>> +             err =3D clk_set_rate(clk, initial_fout);
>>> +             if (err) {
>>> +                     of_clk_del_provider(client->dev.of_node);
>>> +                     return err;
>>> +             }
>>> +     }
>>> +
>>> +     /* Display a message indicating that we've successfully regis=
tered */
>>> +     dev_info(&client->dev, "registered, current frequency %llu Hz=
\n",
>>> +                     data->frequency);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int si570_remove(struct i2c_client *client)
>>> +{
>>> +     of_clk_del_provider(client->dev.of_node);
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct i2c_device_id si570_id[] =3D {
>>> +     { "si570", si57x },
>>> +     { "si571", si57x },
>>> +     { "si598", si59x },
>>> +     { "si599", si59x },
>>> +     { }
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, si570_id);
>>> +
>>> +static const struct of_device_id clk_si570_of_match[] =3D {
>>> +     { .compatible =3D "silabs,si570" },
>>> +     { .compatible =3D "silabs,si571" },
>>> +     { .compatible =3D "silabs,si598" },
>>> +     { .compatible =3D "silabs,si599" },
>>> +     { },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, clk_si570_of_match);
>>> +
>>> +static struct i2c_driver si570_driver =3D {
>>> +     .driver =3D {
>>> +             .name =3D "si570",
>>> +             .of_match_table =3D of_match_ptr(clk_si570_of_match),
>>> +     },
>>> +     .probe          =3D si570_probe,
>>> +     .remove         =3D si570_remove,
>>> +     .id_table       =3D si570_id,
>>> +};
>>> +module_i2c_driver(si570_driver);
>>> +
>>> +MODULE_AUTHOR("Guenter Roeck <guenter.roeck@ericsson.com>");
>>> +MODULE_AUTHOR("Soeren Brinkmann <soren.brinkmann@xilinx.com");
>>> +MODULE_DESCRIPTION("Si570 driver");
>>> +MODULE_LICENSE("GPL");
>>> --
>>> 1.8.4
>>>
>>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
>
>
>

