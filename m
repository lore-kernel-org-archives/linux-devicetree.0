From: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Subject: Re: [PATCH v2] Add TI CDCE925 I2C controlled clock synthesizer driver
Date: Fri, 29 May 2015 09:19:13 +0200
Message-ID: <556812F1.5030007@topic.nl>
References: <1414151815-21736-2-git-send-email-mike.looijmans@topic.nl> <1417677976-4218-1-git-send-email-mike.looijmans@topic.nl> <20150528214827.4469.15789@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150528214827.4469.15789@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28-05-15 23:48, Michael Turquette wrote:
> Hi Mike,
>
> Quoting Mike Looijmans (2014-12-03 23:26:15)
>> This driver supports the TI CDCE925 programmable clock synthesizer.
>> The chip contains two PLLs with spread-spectrum clocking support and
>> five output dividers. The driver only supports the following setup,
>> and uses a fixed setting for the output muxes:
>>    Y1 is derived from the input clock
>>    Y2 and Y3 derive from PLL1
>>    Y4 and Y5 derive from PLL2
>> Given a target output frequency, the driver will set the PLL and
>> divider to best approximate the desired output.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
>
> Sorry for the delay reviewing this. I flagged it for review a while back
> and then lost track of it. There is a new-ish mailing list for clock
> stuff: linux-clk-u79uwXL29TaiAVqoAR/hOA@public.gmane.org Please send the next version there,
> Cc'ing myself and Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Okay, will do that. I'll be composing v2 soon.

> The biggest changes I highlight below are for the DT binding
> description. Otherwise the bulk of the driver looks OK, aside from some
> cosmetic bits.
>
>> ---
>>
>> v2: Coding style check
>>      Add devicetree binding documentation
>>
>>   .../devicetree/bindings/clock/cdce925.txt          |   61 ++
>>   drivers/clk/Kconfig                                |   17 +
>>   drivers/clk/Makefile                               |    1 +
>>   drivers/clk/clk-cdce925.c                          |  792 ++++++++++++++++++++
>>   4 files changed, 871 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/cdce925.txt
>>   create mode 100644 drivers/clk/clk-cdce925.c
>>
>> diff --git a/Documentation/devicetree/bindings/clock/cdce925.txt b/Documentation/devicetree/bindings/clock/cdce925.txt
>> new file mode 100644
>> index 0000000..0eac770
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/cdce925.txt
>> @@ -0,0 +1,61 @@
>> +Binding for TO CDCE925 programmable I2C clock synthesizers.
>> +
>> +Reference
>> +This binding uses the common clock binding[1].
>> +
>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +[2] http://www.ti.com/product/cdce925
>> +
>> +Required properties:
>> + - compatible: Shall be one of "cdce925", "cdce925pw",
>
> I think the vendor string is supposed to go here to prevent name space
> collision. E.g.:
>
> "ti,cdce925"
>
> DT People please correct me if I am wrong.

 From experience with other drivers, yes, I think it needs a "ti" prefix here.

>> + - reg: I2C device address.
>> + - clocks: Points to a fixed parent clock that provides the input frequency.
>> + - #clock-cells: From common clock bindings: Shall be 1.
>> +
>> +Optional properties:
>> + - xtal-load-pf: Crystal load-capacitor value to fine-tune performance on a
>> +                 board, or to compensate for external influences.
>
> OK, makes sense to expose xtal-load-pf in DT since it may vary per
> board.

Until someone wants to dynamically control this to compensate for temperature 
drift. But we'll cross that bridge when we find it...

>> +
>> +
>> +For each connected output Y1 through Y5, a child node should be provided. Each
>> +child node must have the following properties:
>> + - #clock-cells: From common clock bindings: Shall be 0.
>> +Optional properties for the output nodes:
>> + - clock-frequency: Output frequency to generate. This defines the output
>> +                   frequency set during boot. It can be reprogrammed during
>> +                   runtime through the common clock framework.
>> +
>> +For both PLL1 and PLL2 an optional child node can be used to specify spread
>> +spectrum clocking parameters.
>> +  - spread-spectrum: SSC mode as defined in the data sheet.
>> +  - spread-spectrum-center: Use "centered" mode instead of "max" mode. When this
>> +    is present, the clock runs at the requested frequency on average.
>
> I'm not sure these should be exposed in the binding description. Can the
> clock driver make the determination for which mode to enable? An
> interesting idea is to use the new clk_set_rate_range to control this
> function.
>
> Also I'm a bit confused about having the two parameters. Isn't "center"
> one of the modes? Is the second property needed?

Spread-spectrum adds "noise" to the output frequency. When the SSC level is 
set to 1% for example, the "center" mode boolean switch selects between 
oscillating within [freq-1%,freq] or [freq-0.5%,freq+0.5%].

Since SSC is mostly used to make a board pass electrical interference tests, I 
considered it more of a "board" property than something a clock client would 
want to be aware of.

I don't think "clk_set_rate_range" is appropriate here, that is supposed to 
set the clock to a constant frequency between two levels. This would map on 
something akin to "clk_set_accuracy" if such a thing existed.


>> +
>> +
>> +Example:
>> +
>> +       clockgen: cdce925pw@64 {
>> +               compatible = "cdce925";
>> +               reg = <0x64>;
>> +               clocks = <&xtal_27Mhz>;
>> +               xtal-load-pf = <5>;
>> +               #clock-cells = <1>;
>> +               /* PLL options to get SSC 1% centered */
>> +               PLL2 {
>> +                       spread-spectrum = <4>;
>> +                       spread-spectrum-center;
>> +               };
>> +               /* Outputs calculate mux and divider settings */
>> +               Y1 {
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <27000>;
>> +               };
>> +               audio_clock: Y2 {
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <12288000>; /* SPDIF audio */
>> +               };
>> +               hdmi_pixel_clock: Y4 {
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <148500000>; /* HD-video */
>> +               };
>> +       };
>
> I'd prefer for each CDCE925 to have a single node in DT describing it.
> The frequency of the Y outputs should be set by clock consumer devices.
> The example below illustrates a binding description I prefer, along with
> two consumer devices that claim Y output and set the frequencies.
>
> 	clock-controller: cdce925pw@64 {
> 		compatible = "ti,cdce925";
> 		#clock-cells = <1>;
> 		reg = <0x64>;
> 		clocks = <&xtal_27Mhz>;
> 		xtal-load-pf = <5>;
> 	};
>
> 	spdif: spdif@0 {
> 		compatible = "vendor,audio_device";
> 		reg = <0>;
> 		assigned-clocks = <&clock-controller 1>; /* Y2 */
> 		assigned-clock-rates = <12288000>;
> 	};
>
> 	hd_video: hd_video@1 {
> 		compatible = "vendor,hd_video";
> 		reg = <1>;
> 		assigned-clocks = <&clock-controller 3>; /* Y4 */
> 		assigned-clock-rates = <148500000>;
> 	};
>

Clear. I didn't know this was possible, and never encountered it in other DTs.
Was this added recently?


>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 455fd17..4e474b3 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -77,6 +77,23 @@ config COMMON_CLK_SI570
>>            This driver supports Silicon Labs 570/571/598/599 programmable
>>            clock generators.
>>
>> +config COMMON_CLK_CDCE925
>> +       tristate "Clock driver for TI CDCE925 devices"
>> +       depends on I2C
>> +       depends on OF
>> +       select REGMAP_I2C
>> +       help
>> +       ---help---
>> +         This driver supports the TI CDCE925 programmable clock synthesizer.
>> +         The chip contains two PLLs with spread-spectrum clocking support and
>> +         five output dividers. The driver only supports the following setup,
>> +         and uses a fixed setting for the output muxes.
>> +         Y1 is derived from the input clock
>> +         Y2 and Y3 derive from PLL1
>> +         Y4 and Y5 derive from PLL2
>> +         Given a target output frequency, the driver will set the PLL and
>> +         divider to best approximate the desired output.
>> +
>>   config COMMON_CLK_S2MPS11
>>          tristate "Clock driver for S2MPS1X/S5M8767 MFD"
>>          depends on MFD_SEC_CORE
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index d5fba5b..c476066 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -35,6 +35,7 @@ obj-$(CONFIG_COMMON_CLK_RK808)                += clk-rk808.o
>>   obj-$(CONFIG_COMMON_CLK_S2MPS11)       += clk-s2mps11.o
>>   obj-$(CONFIG_COMMON_CLK_SI5351)                += clk-si5351.o
>>   obj-$(CONFIG_COMMON_CLK_SI570)         += clk-si570.o
>> +obj-$(CONFIG_COMMON_CLK_CDCE925)       += clk-cdce925.o
>>   obj-$(CONFIG_CLK_TWL6040)              += clk-twl6040.o
>>   obj-$(CONFIG_ARCH_U300)                        += clk-u300.o
>>   obj-$(CONFIG_ARCH_VT8500)              += clk-vt8500.o
>> diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
>> new file mode 100644
>> index 0000000..faa867f
>> --- /dev/null
>> +++ b/drivers/clk/clk-cdce925.c
>> @@ -0,0 +1,792 @@
>> +/*
>> + * Driver for TI Dual PLL CDCE925 clock synthesizer
>> + *
>> + * This driver always connects the Y1 to the input clock, Y2/Y3 to PLL1
>> + * and Y4/Y5 to PLL2. PLL frequency is set on a first-come-first-serve
>> + * basis. Clients can directly request any frequency that the chip can
>> + * deliver using the standard clk framework. In addition, the device can
>> + * be configured and activated via the devicetree.
>> + *
>> + * Copyright (C) 2014, Topic Embedded Products
>> + * Licenced under GPL
>> + */
>> +#include <linux/clk-provider.h>
>> +#include <linux/clk-private.h>
>
> clk-private.h no longer exists. This is my fault though, since I've left
> this patch drifting for a while.

Will remove it (was it removed after 3.19 maybe?)

> <snip>
>
>> +static u16 cdce925_calc_divider(unsigned long rate,
>> +               unsigned long parent_rate)
>> +{
>> +       if (rate >= parent_rate) {
>> +               return 1;
>> +       } else if (rate) {
>> +               unsigned long divider = DIV_ROUND_CLOSEST(parent_rate, rate);
>
> Nitpick: Please declare local variables outside of conditionals and
> loops.

I'll implement all the nitpicks.


> <snip>
>
>> +static long cdce925_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>> +               unsigned long *parent_rate)
>> +{
>> +       struct clk_cdce925_output *data = to_clk_cdce925_output(hw);
>> +       unsigned long l_parent_rate = *parent_rate;
>> +       u16 divider = cdce925_calc_divider(rate, l_parent_rate);
>> +
>> +       pr_debug("%s (index=%d parent_rate=%lu rate=%lu)\n", __func__,
>> +               data->index, l_parent_rate, rate);
>> +       if (l_parent_rate / divider != rate) {
>> +               l_parent_rate = cdce925_clk_best_parent_rate(hw, rate);
>> +               divider = cdce925_calc_divider(rate, l_parent_rate);
>> +               *parent_rate = l_parent_rate;
>> +       }
>> +       pr_debug("%s parent_rate=%lu pdiv=%u\n", __func__,
>
> Nitpick: I'm all for debugging, but there are a LOT of pr_debug
> statements in this driver that are just reporting some variable values.
> You can probably get rid of them, no?

Yeah, they were probably useful only in early development stages.

>
>> +               l_parent_rate, divider);
>> +       if (divider)
>> +               return (long)(l_parent_rate / divider);
>> +       return 0;
>
> Nitpick: More whitespace please.
>
> <snip>
>
>> +static int cdce925_probe(struct i2c_client *client,
> ...
>> +       /* Fetch settings from devicetree, if any */
>> +       for (i = 0; i < NUMBER_OF_OUTPUTS; ++i) {
>> +               sprintf(child_name, "Y%d", i+1);
>> +               np_output = of_get_child_by_name(node, child_name);
>> +               if (!np_output) {
>> +                       /* Disable unlisted/unused clock outputs explicitly */
>> +                       cdce925_clk_unprepare(&data->clk[i].hw);
>> +                       continue;
>> +               }
>> +               clk = data->clk[i].hw.clk;
>> +               if (!of_property_read_u32(np_output,
>> +                       "clock-frequency", &value)) {
>> +                       err = clk_set_rate(clk, value);
>> +                       if (err)
>> +                               dev_err(&client->dev,
>> +                                       "unable to set frequency %ud\n",
>> +                                       value);
>> +               }
>> +               if (of_property_read_bool(np_output, "clock-enabled")) {
>> +                       err = clk_prepare_enable(clk);
>> +                       if (err)
>> +                               dev_err(&client->dev,
>> +                                       "Failed to enable clock %s\n",
>> +                                       init.name);
>> +               } else {
>> +                       cdce925_clk_unprepare(&data->clk[i].hw);
>> +               }
>> +               err = of_clk_add_provider(np_output,
>> +                       of_clk_src_simple_get, clk);
>> +               if (err)
>> +                       dev_err(&client->dev,
>> +                               "unable to add clock provider '%s'\n",
>> +                               init.name);
>
> This duplicates the functionality we already have with
> assigned-clock-rates. Please use that from your clock consumer instead.

Okay, that'll need some investigation from my side. I'm currently stuck with a 
3.19 fork for my board, so I hope that won't become an issue?

More importantly, will the framework actively disable clocks that aren't assigned?
The state of the clock chip at boot is unknown, so clocks that were already 
set up properly should just continue running, while clocks that aren't used 
must actively be shut down by the driver at some point, otherwise they'll keep 
running and waste resources.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
