From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 3/5] gpio: of: Return error if gpio hog configuration
 failed
Date: Thu, 10 Mar 2016 12:32:22 +0530
Message-ID: <56E11BFE.3040906@nvidia.com>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com> <1457438528-29054-4-git-send-email-ldewangan@nvidia.com> <56E05930.4080805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <56E05930.4080805@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, treding@nvidia.com, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org


On Wednesday 09 March 2016 10:41 PM, Stephen Warren wrote:
> On 03/08/2016 05:02 AM, Laxman Dewangan wrote:
>> If GPIO hog configuration failed while adding OF based
>> gpiochip() then return the error instead of ignoring it.
>>
>> This helps of properly handling the gpio driver dependency.
>>
>> When adding the gpio hog nodes for NVIDIA's Tegra210 platforms,
>> the gpio_hogd() fails with EPROBE_DEFER because pinctrl is not
>> ready at this time and gpio_request() for Tegra GPIO driver
>> returns error. The error was not causing the Tegra GPIO driver
>> to fail as the error was getting ignored.
>
>> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
>
>> @@ -218,9 +220,12 @@ static void of_gpiochip_scan_gpios(struct 
>> gpio_chip *chip)
>>           if (IS_ERR(desc))
>>               continue;
>>
>> -        if (gpiod_hog(desc, name, lflags, dflags))
>> -            continue;
>> +        ret = gpiod_hog(desc, name, lflags, dflags);
>> +        if (ret < 0)
>> +            return ret;
>>       }
>> +
>> +    return 0;
>>   }
>
> If there are multiple child nodes (which the code above is looping 
> over), and the hog for entries 0, 1, 2 succeed and the hog for entry 3 
> fails, don't you need to go back and unhog for nodes 0..2 so that the 
> next time this function is called, those hogs won't already be in 
> place thus preventing them from being hogged the second time around? 
> Or does hogging not take ownership of the resource and thus prevent it 
> from being acquired again?

The gpiolib take care per the error handling:

         status = of_gpiochip_add(chip);
         if (status)
                 goto err_remove_chip;

:::
err_remove_chip:
         acpi_gpiochip_remove(chip);
         gpiochip_free_hogs(chip);
         of_gpiochip_remove(chip);


