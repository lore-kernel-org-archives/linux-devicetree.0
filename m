From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/7] pinctrl: Renesas RZ/A1 pin and gpio controller
Date: Thu, 16 Mar 2017 15:04:32 +0100
Message-ID: <6804f0d9-3768-c792-e4c7-2512fac83d2d@jmondi.org>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487610788-6939-2-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB1165969D5D3072A3A19DEDCE8A210@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165969D5D3072A3A19DEDCE8A210@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,
    thanks for looking into this...

On 09/03/2017 15:55, Chris Brandt wrote:
> Hi Jacopo,
>
> On Monday, February 20, 2017, Jacopo Mondi wrote:
>>
>> Add combined gpio and pin controller driver for Renesas RZ/A1
>> r7s72100 SoC.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> ---
>>  drivers/pinctrl/Kconfig        |   10 +
>>  drivers/pinctrl/Makefile       |    1 +
>>  drivers/pinctrl/pinctrl-rza1.c | 1026
>> ++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 1037 insertions(+)
>>  create mode 100644 drivers/pinctrl/pinctrl-rza1.c
>>
>> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
>> index 8f8c2af..61310ac 100644
>> --- a/drivers/pinctrl/Kconfig
>> +++ b/drivers/pinctrl/Kconfig
>> @@ -163,6 +163,16 @@ config PINCTRL_ROCKCHIP
>>  	select GENERIC_IRQ_CHIP
>>  	select MFD_SYSCON
>>
>> +config PINCTRL_RZA1
>> +	bool "Renesas r7s72100 RZ/A1 gpio and pinctrl driver"
>
> You can drop the "r7s72100" and just say RZ/A1.
>
>
>
>> +/**
>> + * rza1_pin_set_direction() - set I/O direction on a pin in port mode
>> + *
>> + * When running in output port mode keep PBDC enabled to allow reading
>> the
>> + * pin value from PPR.
>> + * When in alternate mode disable that (if not explicitly required) not
>> to
>> + * interfere with the alternate function mode.
>> + *
>> + * @port: port where pin sits on
>> + * @offset: pin offset
>> + * @input: input enable/disable flag
>> + */
>> +static inline void rza1_pin_set_direction(struct rza1_port *port,
>> +					  unsigned int offset,
>> +					  bool input)
>> +{
>> +	spin_lock(&port->lock);
>> +	if (input)
>> +		rza1_set_bit(port, PIBC_REG, offset, 1);
>> +	else {
>> +		rza1_set_bit(port, PM_REG, offset, 0);
>> +		rza1_set_bit(port, PBDC_REG, offset, 1);
>> +	}
>> +	spin_unlock(&port->lock);
>
> When input==true, you only set PIBC_REG. Otherwise you only set PM_REG and PBDC_REG. This would imply that this function will only ever get called once for a pin and never get called a second time with a different direction...meaning it would not really change a pin from output to input. I would assume that you would need to change this function to set those 3 registers either one way or the other.
>
> I would suggest:
>    PIBC_REG = 1 /* always gets set for GPIO mode */
>  input:
>    PM_REG = 1
>    PBDC_REG = 0
> output:
>    PM_REG = 0
>    PBDC_REG = 1
>

I assumed "set_direction()" to always be called after a "request()", so 
that the pin is always in reset state.
This is obviously not true, so I'm going to fix this as you suggested.
I'm just wondering why we should keep input buffer enabled even if we're 
running in output mode. This seems to be "safe" according to TRM but I'm 
a bit afraid of unexpected consequences (am I too paranoid?)

>
>
>> +/**
>> + * rza1_alternate_function_conf() - configure pin in alternate function
>> mode
>> + *
>> + * @pinctrl: RZ/A1 pin controller device
>> + * @pin_conf: single pin configuration descriptor
>> + */
>> +static int rza1_alternate_function_conf(struct rza1_pinctrl *rza1_pctl,
>> +					struct rza1_pin_conf *pin_conf)
>> +{
>> +	unsigned int offset = pin_conf->offset;
>> +	struct rza1_port *port = &rza1_pctl->ports[pin_conf->port];
>> +	u8 mux_mode = (pin_conf->mux_conf - 1) & MUX_FUNC_MASK;
>> +	u8 mux_conf = pin_conf->mux_conf >> MUX_FUNC_OFFS;
>> +	bool swio_en = !!(mux_conf & MUX_CONF_SWIO);
>> +	bool input_en = !!(mux_conf & MUX_CONF_INPUT_ENABLE);
>> +
>> +	rza1_pin_reset(port, offset);
>> +
>> +	/*
>> +	 * When configuring pin with Software Controlled IO mode in
>> alternate
>> +	 * mode, do not enable bi-directional control to avoid driving Pn
>> +	 * value to the pin input.
>> +	 * When working in direct IO mode (aka alternate function drives the
>> +	 * pin direction), enable bi-directional control for input pins in
>> +	 * order to enable the pin's input buffer as a consequence.
>> +	 */
>> +	if ((!swio_en && input_en) || (swio_en && !input_en))
>> +		rza1_set_bit(port, PBDC_REG, offset, 1);
>
>
> Maybe just set PBDC_REG at the end of the function with everything else.
> See below...
>

Let me reply below to both these comments...

>
>
>> +
>> +	/*
>> +	 * Enable alternate function mode and select it.
>> +	 *
>> +	 * ----------------------------------------------------
>> +	 * Alternate mode selection table:
>> +	 *
>> +	 * PMC	PFC	PFCE	PFCAE	mux_mode
>> +	 * 1	0	0	0	0
>> +	 * 1	1	0	0	1
>> +	 * 1	0	1	0	2
>> +	 * 1	1	1	0	3
>> +	 * 1	0	0	1	4
>> +	 * 1	1	0	1	5
>> +	 * 1	0	1	1	6
>> +	 * 1	1	1	1	7
>> +	 * ----------------------------------------------------
>> +	 */
>> +	rza1_set_bit(port, PFC_REG, offset, mux_mode & MUX_FUNC_PFC_MASK);
>> +	rza1_set_bit(port, PFCE_REG, offset, mux_mode & MUX_FUNC_PFCE_MASK);
>> +	rza1_set_bit(port, PFCEA_REG, offset, mux_mode &
>> MUX_FUNC_PFCEA_MASK);
>> +
>> +	/*
>> +	 * All alternate functions except a few (4) need PIPCn = 1.
>> +	 * If PIPCn has to stay disabled (SW IO mode), configure PMn
>> according
>> +	 * to I/O direction specified by pin configuration -after- PMC has
>> been
>> +	 * set to one.
>> +	 */
>> +	if (!swio_en)
>> +		rza1_set_bit(port, PIPC_REG, offset, 1);
>> +
>> +	rza1_set_bit(port, PMC_REG, offset, 1);
>> +
>> +	if (swio_en)
>> +		rza1_set_bit(port, PM_REG, offset, input_en);
>
>
> I would suggest something like this:
>
> 	if (bidir)
> 		rza1_set_bit(port, PBDC_REG, offset, 1);
> 	else {
> 		rza1_set_bit(port, PBDC_REG, offset, 0);
> 		rza1_set_bit(port, PM_REG, offset, swio_in);
> 	}
>
> 	rza1_set_bit(port, PMC_REG, offset, 1);
>
>

This looks nicer, for sure, but from my testing I found out that the 
sequence reported in section 54.19-c of TRM has to be carefully 
respected, particularly setting PM after PMC (and iirc setting PBDC 
before PFC*)
Am I wrong? I will give your suggestion spin anyway...

This apart, you suggestion is tied to your comment on [2/7] on replacing 
INPUT_EN with BIDIR and introduce SWIO_IN and SWIO_OUT, which I mostly 
agree on (I'll comment on that as well).

A sort of middle-ground to get rid of horrible conditions like
"if ((!swio_en && input_en) || (swio_en && !input_en))"
which requires a 7 lines comments to be explained and I still found 
obscure after a month I was not looking at it, would be making BIDIR and 
SWIO_[IN|OUT] exclusive, as if a pin is set to be SWIO it already has 
direction specified, and if it is said to be BIDIR, it means its 
direction is decided by the alternate function, not by software.
Does this fly for you? Do you see cases where those flags may have to be 
specified together?
If not, it would simplify this routine for sure...

Thanks
    j


>> +
>> +	return 0;
>> +}
>
>
>
>
> Chris
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

