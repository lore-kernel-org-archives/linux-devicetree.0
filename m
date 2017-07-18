From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 2/4] gpio: davinci: Handle the return value of
 davinci_gpio_irq_setup function
Date: Tue, 18 Jul 2017 23:16:07 +0530
Message-ID: <f8f33c82-6f08-bd8c-ecbb-df1f1c719624@ti.com>
References: <1500375436-9435-1-git-send-email-j-keerthy@ti.com>
 <1500375436-9435-3-git-send-email-j-keerthy@ti.com>
 <fcf0b39c-2683-e88d-b619-8ff66707b099@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <fcf0b39c-2683-e88d-b619-8ff66707b099@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suman Anna <s-anna@ti.com>, linus.walleij@linaro.org, ssantosh@kernel.org
Cc: devicetree@vger.kernel.org, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, fcooper@ti.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Tuesday 18 July 2017 10:24 PM, Suman Anna wrote:
> Hi Keerthy,
> 
> On 07/18/2017 05:57 AM, Keerthy wrote:
>> Currently davinci_gpio_irq_setup return value is ignored. Handle the
>> return value appropriately.
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>> ---
>>  drivers/gpio/gpio-davinci.c | 18 +++++++++++++-----
>>  1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>> index 2c88054..932f270 100644
>> --- a/drivers/gpio/gpio-davinci.c
>> +++ b/drivers/gpio/gpio-davinci.c
>> @@ -233,15 +233,23 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>>  		chips->regs[bank] = gpio_base + offset_array[bank];
>>  
>>  	ret = devm_gpiochip_add_data(dev, &chips->chip, chips);
>> +	if (ret)
>> +		goto err;
>> +
>> +	platform_set_drvdata(pdev, chips);
>> +	ret = davinci_gpio_irq_setup(pdev);
>>  	if (ret) {
>> -		ctrl_num = 0;
>> -		bank_base = 0;
>> -		return ret;
>> +		platform_set_drvdata(pdev, NULL);
> 
> This is not needed, driver core will set this automatically if probe fails.

okay. I will remove this.

> 
>> +		goto err;
>>  	}
>>  
>> -	platform_set_drvdata(pdev, chips);
>> -	davinci_gpio_irq_setup(pdev);
>>  	return 0;
>> +
>> +err:
>> +	ctrl_num = 0;
>> +	bank_base = 0;
> 
> Same comments as on Patch 1.

Yup will fix this as i have done with Patch 1.

> 
> regards
> Suman
> 
