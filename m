From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Mon, 12 Sep 2016 12:41:21 +0200
Message-ID: <4969a7c3-ec4f-75e1-9591-6357c1a44a2c@baylibre.com>
References: <1473166599-29266-1-git-send-email-narmstrong@baylibre.com>
 <637a259a-8df8-623b-5dde-824561e6aee0@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <637a259a-8df8-623b-5dde-824561e6aee0@axentia.se>
Sender: linux-gpio-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Wei.Chen@csr.com, stigge@antcom.de, vladimir_zapolskiy@mentor.com
List-Id: devicetree@vger.kernel.org

Hi Peter,

On 09/12/2016 12:17 PM, Peter Rosin wrote:
> Hi!
> 
> Sorry for the delay, other stuff interfered...
Who hasn't ?

> 
> As I stated previously, we have an sx1502, and this seems /almost/ good.
> Comments inline.
> 
> On 2016-09-06 14:56, Neil Armstrong wrote:
[..]
>> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-sx150x.txt
>> @@ -0,0 +1,67 @@
>> +SEMTECH SX150x GPIO expander bindings
>> +
>> +Please refer to ../pinctrl/pinctrl-bindings.txt, gpio.txt, and
> 
> pinctrl-bindings.txt, ../gpio/gpio.txt
> 

Bad copy/paste, thanks !

>> +../interrupt-controller/interrupts.txt for generic information regarding
>> +pin controller, GPIO, and interrupt bindings.
>> +
>> +Required properties:
>> +- compatible: should be "semtech,sx1506q",
>> +			"semtech,sx1508q",
[...]
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -761,16 +761,12 @@ config GPIO_PCF857X
>>  	  platform-neutral GPIO calls.
>>  
>>  config GPIO_SX150X
>> -	bool "Semtech SX150x I2C GPIO expander"
>> -	depends on I2C=y
>> -	select GPIOLIB_IRQCHIP
>> +	bool "Semtech SX150x I2C GPIO expander (deprecated)"
>> +	select PINCTRL_SX150X
>>  	default n
>>  	help
>>  	  Say yes here to provide support for Semtech SX150-series I2C
> 
> SX150x-series ???

Same bad copy/paste

> 
>> -	  GPIO expanders. Compatible models include:
>> -
>> -	  8 bits:  sx1508q
>> -	  16 bits: sx1509q
>> +	  GPIO expanders. The GPIO driver was replaced by a Pinctrl version.
>>  
>>  config GPIO_TPIC2810
>>  	tristate "TPIC2810 8-Bit I2C GPO expander"
>> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>> index 2a035ed..ffd2f4c 100644
[...]
>> +static const struct sx150x_device_data sx1506q_device_data = {
>> +	.model = SX150X_456,
>> +	.reg_pullup	= 0x05,
>> +	.reg_pulldn	= 0x07,
>> +	.reg_dir	= 0x03,
>> +	.reg_data	= 0x01,
>> +	.reg_irq_mask	= 0x09,
>> +	.reg_irq_src	= 0x0f,
>> +	.reg_sense	= 0x0d,
>> +	.pri.x456 = {
>> +		.reg_pld_mode	= 0x21,
>> +		.reg_pld_table0	= 0x23,
>> +		.reg_pld_table1	= 0x25,
>> +		.reg_pld_table2	= 0x27,
>> +		.reg_pld_table3	= 0x29,
>> +		.reg_pld_table4	= 0x2b,
>> +		.reg_advance	= 0xad,
>> +	},
>> +	.ngpios	= 16,
>> +	.pins = sx150x_16_pins,
>> +	.npins = ARRAY_SIZE(sx150x_16_pins),
> 
> I don't think the oscio pin is available here...

Thanks for the info, I'll check all the datasheets and clarify the differences.

>> +};
>> +
>> +static const struct sx150x_device_data sx1502q_device_data = {
>> +	.model = SX150X_123,
>> +	.reg_pullup	= 0x02,
>> +	.reg_pulldn	= 0x03,
>> +	.reg_dir	= 0x01,
>> +	.reg_data	= 0x00,
>> +	.reg_irq_mask	= 0x05,
>> +	.reg_irq_src	= 0x08,
>> +	.reg_sense	= 0x07,
>> +	.pri.x123 = {
>> +		.reg_pld_mode	= 0x10,
>> +		.reg_pld_table0	= 0x11,
>> +		.reg_pld_table1	= 0x12,
>> +		.reg_pld_table2	= 0x13,
>> +		.reg_pld_table3	= 0x14,
>> +		.reg_pld_table4	= 0x15,
>> +		.reg_advance	= 0xad,
>> +	},
>> +	.ngpios	= 8,
>> +	.pins = sx150x_8_pins,
>> +	.npins = ARRAY_SIZE(sx150x_8_pins),
> 
> ...or here, which causes a problem because the pins are named gpio503
> etc when exporting in sysfs, instead of being based at gpio504 as they
> were with the old gpio-only driver. I simply subtracted 1 from the
> npins assignment for sx1502, but I think there should be separate
> sx150x_8_pins_osc and sx150x_16_pins_osc arrays. Or sx150x_9_pins and
> sx150x_17_pins. Or something.
>

Yes, let's keep it simple.

>> +};
>> +
>> +static s32 sx150x_i2c_write(struct i2c_client *client, u8 reg, u8 val)
>> +{
>> +	s32 err = i2c_smbus_write_byte_data(client, reg, val);
>> +
>> +	if (err < 0)
>> +		dev_warn(&client->dev,
>> +			"i2c write fail: can't write %02x to %02x: %d\n",
>> +			val, reg, err);
>> +	return err;
>> +}
>> +
[...]
>> +static int sx150x_reset(struct sx150x_pinctrl *pctl)
>> +{
>> +	int err;
>> +
> 
> Perhaps
> 
> 	if (pctl->data->model != SX150X_789)
> 		return -ENOTSUPP;
> 
> ???
> 

Aww, another crappy copy/paste, I really need to recheck what I copied verbatim from the previous driver,

>> +	err = i2c_smbus_write_byte_data(pctl->client,
>> +					pctl->data->pri.x789.reg_reset,
>> +					0x12);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	err = i2c_smbus_write_byte_data(pctl->client,
>> +					pctl->data->pri.x789.reg_reset,
>> +					0x34);
>> +	return err;
>> +}
>> +

Thanks for the comments,

I'll push a v2 asap.

Neil

