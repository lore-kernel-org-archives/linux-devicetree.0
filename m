From: Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH 2/4] gpio: davinci: Handle the return value of
 davinci_gpio_irq_setup function
Date: Thu, 20 Jul 2017 15:32:27 +0530
Message-ID: <47055927-5102-b39f-fdbb-b5d89cb14632@ti.com>
References: <1500375436-9435-1-git-send-email-j-keerthy@ti.com>
 <1500375436-9435-3-git-send-email-j-keerthy@ti.com>
 <20170719111000.GX29638@localhost>
 <cbea9082-3799-281b-1364-50e442f5362f@ti.com>
 <cc66dfaf-05c5-8d55-03a6-556ec83c4487@ti.com>
 <20170720095047.GA2729@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170720095047.GA2729@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Johan Hovold <johan@kernel.org>
Cc: devicetree@vger.kernel.org, linus.walleij@linaro.org, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, fcooper@ti.com, ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On Thursday 20 July 2017 03:20 PM, Johan Hovold wrote:
> On Thu, Jul 20, 2017 at 02:40:37PM +0530, Keerthy wrote:
>>
>>
>> On Thursday 20 July 2017 12:14 PM, Keerthy wrote:
>>>
>>>
>>> On Wednesday 19 July 2017 04:40 PM, Johan Hovold wrote:
>>>> On Tue, Jul 18, 2017 at 04:27:14PM +0530, Keerthy wrote:
>>>>> Currently davinci_gpio_irq_setup return value is ignored. Handle the
>>>>> return value appropriately.
>>>>>
>>>>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>>>>> ---
>>>>>  drivers/gpio/gpio-davinci.c | 18 +++++++++++++-----
>>>>>  1 file changed, 13 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
>>>>> index 2c88054..932f270 100644
>>>>> --- a/drivers/gpio/gpio-davinci.c
>>>>> +++ b/drivers/gpio/gpio-davinci.c
>>>>> @@ -233,15 +233,23 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>>>>>  		chips->regs[bank] = gpio_base + offset_array[bank];
>>>>>  
>>>>>  	ret = devm_gpiochip_add_data(dev, &chips->chip, chips);
>>>>> +	if (ret)
>>>>> +		goto err;
>>>>> +
>>>>> +	platform_set_drvdata(pdev, chips);
>>>>> +	ret = davinci_gpio_irq_setup(pdev);
>>>>>  	if (ret) {
>>>>> -		ctrl_num = 0;
>>>>> -		bank_base = 0;
>>>>> -		return ret;
>>>>> +		platform_set_drvdata(pdev, NULL);
>>>>> +		goto err;
>>>>>  	}
>>>>>  
>>>>> -	platform_set_drvdata(pdev, chips);
>>>>> -	davinci_gpio_irq_setup(pdev);
>>>>>  	return 0;
>>>>
>>>> There's a separate but related bug here too as the clk_prepare_enable()
>>>> in davinci_gpio_irq_setup() is never balanced on driver unbind.
>>>
>>> Yes Johan. I will send that as a separate patch.
>>
>> This is already fixed in the latest kernel:
>>
>> commit 6dc0048cff988858254fcc26becfc1e9753efa79
>> Author: Arvind Yadav <arvind.yadav.cs@gmail.com>
>> Date:   Tue May 23 14:48:57 2017 +0530
> 
> That change only handles errors in davinci_gpio_irq_setup() (i.e. during
> probe) and not the imbalance at driver unbind that I was referring to.

Okay got it. One more clk_unprepare_disable() call needs to be there in
probe err path.

> 
> Johan
> 
