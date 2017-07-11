From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCH] gpio/serial: revert "linux,first-pin" property handling
Date: Tue, 11 Jul 2017 17:42:56 +0200
Message-ID: <5310fa81-dc0e-75b1-05fb-2ec9b558f867@siemens.com>
References: <20170710140902.21935-1-linus.walleij@linaro.org>
 <db1ae5e9-dc03-403e-2f46-e05cbd4a7b4f@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <db1ae5e9-dc03-403e-2f46-e05cbd4a7b4f@siemens.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2017-07-10 16:23, Jan Kiszka wrote:
> On 2017-07-10 16:09, Linus Walleij wrote:
>> This is not a legal device tree property, because its binding has
>> not been reviewed and approved, nor does it exist in any device
>> tree binding document.
>>
>> It is further wrong, because it is added to the GPIO offset which
>> is by definition controller-local.

BTW, I don't get this second statement. The parameter passed in is
controlling which pin of the GPIO device can be controlled by the driver
at all. And that's also a very private interface between 8250_exar and
gpio-exar: the former tells the latter which pins are physically
available to drive, because the former operates the others already.

>>
>> Cc: Jan Kiszka <jan.kiszka@siemens.com>
>> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> This got in because I was stressed and was not paying attention.
>> Sorry about not noticing earlier, but I usually strongly nix any
>> such properties, please discuss this on the device tree list
>> first.
>> ---
>>  drivers/gpio/gpio-exar.c            | 25 +++++++++----------------
>>  drivers/tty/serial/8250/8250_exar.c |  2 --
>>  2 files changed, 9 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
>> index fb8d304cfa17..d02c5260525f 100644
>> --- a/drivers/gpio/gpio-exar.c
>> +++ b/drivers/gpio/gpio-exar.c
>> @@ -31,7 +31,6 @@ struct exar_gpio_chip {
>>  	int index;
>>  	void __iomem *regs;
>>  	char name[20];
>> -	unsigned int first_pin;
>>  };
>>  
>>  static void exar_update(struct gpio_chip *chip, unsigned int reg, int val,
>> @@ -53,9 +52,9 @@ static int exar_set_direction(struct gpio_chip *chip, int direction,
>>  			      unsigned int offset)
>>  {
>>  	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
>> -	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
>> +	unsigned int addr = offset / 8 ?
>>  		EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
>> -	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
>> +	unsigned int bit  = offset % 8;
>>  
>>  	exar_update(chip, addr, direction, bit);
>>  	return 0;
>> @@ -76,9 +75,9 @@ static int exar_get(struct gpio_chip *chip, unsigned int reg)
>>  static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
>>  {
>>  	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
>> -	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
>> +	unsigned int addr = offset / 8 ?
>>  		EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
>> -	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
>> +	unsigned int bit  = offset % 8;
>>  
>>  	return !!(exar_get(chip, addr) & BIT(bit));
>>  }
>> @@ -86,9 +85,9 @@ static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
>>  static int exar_get_value(struct gpio_chip *chip, unsigned int offset)
>>  {
>>  	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
>> -	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
>> +	unsigned int addr = offset / 8 ?
>>  		EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
>> -	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
>> +	unsigned int bit  = offset % 8;
>>  
>>  	return !!(exar_get(chip, addr) & BIT(bit));
>>  }
>> @@ -97,9 +96,9 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
>>  			   int value)
>>  {
>>  	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
>> -	unsigned int addr = (offset + exar_gpio->first_pin) / 8 ?
>> +	unsigned int addr = offset / 8 ?
>>  		EXAR_OFFSET_MPIOLVL_HI : EXAR_OFFSET_MPIOLVL_LO;
>> -	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
>> +	unsigned int bit  = offset % 8;
>>  
>>  	exar_update(chip, addr, value, bit);
>>  }
>> @@ -120,7 +119,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
>>  {
>>  	struct pci_dev *pcidev = to_pci_dev(pdev->dev.parent);
>>  	struct exar_gpio_chip *exar_gpio;
>> -	u32 first_pin, ngpios;
>> +	u32 ngpios;
>>  	void __iomem *p;
>>  	int index, ret;
>>  
>> @@ -132,11 +131,6 @@ static int gpio_exar_probe(struct platform_device *pdev)
>>  	if (!p)
>>  		return -ENOMEM;
>>  
>> -	ret = device_property_read_u32(&pdev->dev, "linux,first-pin",
>> -				       &first_pin);
>> -	if (ret)
>> -		return ret;
>> -
>>  	ret = device_property_read_u32(&pdev->dev, "ngpios", &ngpios);
>>  	if (ret)
>>  		return ret;
>> @@ -161,7 +155,6 @@ static int gpio_exar_probe(struct platform_device *pdev)
>>  	exar_gpio->gpio_chip.ngpio = ngpios;
>>  	exar_gpio->regs = p;
>>  	exar_gpio->index = index;
>> -	exar_gpio->first_pin = first_pin;
>>  
>>  	ret = devm_gpiochip_add_data(&pdev->dev,
>>  				     &exar_gpio->gpio_chip, exar_gpio);
>> diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
>> index b5c98e5bf524..4fb3a4ed4a1f 100644
>> --- a/drivers/tty/serial/8250/8250_exar.c
>> +++ b/drivers/tty/serial/8250/8250_exar.c
>> @@ -261,7 +261,6 @@ __xr17v35x_register_gpio(struct pci_dev *pcidev,
>>  }
>>  
>>  static const struct property_entry exar_gpio_properties[] = {
>> -	PROPERTY_ENTRY_U32("linux,first-pin", 0),
>>  	PROPERTY_ENTRY_U32("ngpios", 16),
>>  	{ }
>>  };
>> @@ -326,7 +325,6 @@ static int iot2040_rs485_config(struct uart_port *port,
>>  }
>>  
>>  static const struct property_entry iot2040_gpio_properties[] = {
>> -	PROPERTY_ENTRY_U32("linux,first-pin", 10),
>>  	PROPERTY_ENTRY_U32("ngpios", 1),
>>  	{ }
>>  };
>>
> 
> Sorry for the mess, I didn't know the proper process in details.
> 
> However, just reverting breaks the IOT2000, need to check if there are
> even physical risks. How can we quickly resolve this to proper mechanism?

Ping, before we half-break things with such a revert.

To summarize what we discussed during the patch development:

This is a private, non-device-tree interface between the creator,
8250_exar, and the GPIO device. The original proposal was to not use
device properties at all, rather some platform-data-like pattern [1].
Then we switched to properties [2], but that implicitly creates an
interfaces in the space that is under device tree control. But, for the
given use case, gpio-exar will never be parametrized via device trees or
ACPI.

So, how to proceed?

Jan

[1]
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1399507.html
[2]
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1407975.html

-- 
Siemens AG, Corporate Technology, CT RDA ITP SES-DE
Corporate Competence Center Embedded Linux
