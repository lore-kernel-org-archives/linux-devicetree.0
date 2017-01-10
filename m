From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add optional reset gpio control
Date: Tue, 10 Jan 2017 11:13:11 -0800
Message-ID: <1b85a1aa-4382-03d0-7920-4f1fdfcbda76@gmail.com>
References: <1483391271-17304-1-git-send-email-steve_longerbeam@mentor.com>
 <1483391271-17304-2-git-send-email-steve_longerbeam@mentor.com>
 <e043cb00-9b8e-edec-0949-b23fbed6e2c5@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e043cb00-9b8e-edec-0949-b23fbed6e2c5@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>
List-Id: devicetree@vger.kernel.org



On 01/04/2017 02:25 AM, Vladimir Zapolskiy wrote:
> Hi Steve,
>
> On 01/02/2017 11:07 PM, Steve Longerbeam wrote:
>> Add optional reset-gpios pin control. If present, de-assert the
>> specified reset gpio pin to bring the chip out of reset.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>> Cc: linux-gpio@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>   Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |  4 ++++
>>   drivers/gpio/gpio-pca953x.c                             | 11 +++++++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> index 08dd15f..da54f4c 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> @@ -29,6 +29,10 @@ Required properties:
>>   	onsemi,pca9654
>>   	exar,xra1202
>>   
>> +Optional properties:
>> + - reset-gpios: GPIO specification for the RESET input
>> +
>> +
> Drop the surplus empty line above.

done.

>
>>   Example:
>>   
>>   
>> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
>> index d5d72d8..ca2ddea 100644
>> --- a/drivers/gpio/gpio-pca953x.c
>> +++ b/drivers/gpio/gpio-pca953x.c
>> @@ -22,6 +22,7 @@
>>   #include <linux/of_platform.h>
>>   #include <linux/acpi.h>
>>   #include <linux/regulator/consumer.h>
>> +#include <linux/gpio/consumer.h>
>>   
>>   #define PCA953X_INPUT		0
>>   #define PCA953X_OUTPUT		1
>> @@ -754,8 +755,18 @@ static int pca953x_probe(struct i2c_client *client,
>>   		invert = pdata->invert;
>>   		chip->names = pdata->names;
>>   	} else {
>> +		struct gpio_desc *reset_gpio;
>> +
>>   		chip->gpio_start = -1;
>>   		irq_base = 0;
>> +
>> +		/* see if we need to de-assert a reset pin */
>> +		reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
>> +						     GPIOD_OUT_LOW);
>> +		if (IS_ERR(reset_gpio)) {
>> +			dev_err(&client->dev, "request for reset pin failed\n");
> I'm not confident that the error message is wanted here, you may consider either
> to remove it or at least print it out if (PTR_ERR(reset_gpio) != -EPROBE_DEFER).

no problem, I just removed it.


Steve
