From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V12 2/2] gpio: max77620: add gpio driver for MAX77620/MAX20024
Date: Tue, 24 May 2016 16:37:22 +0530
Message-ID: <574435EA.5010908@nvidia.com>
References: <1463116755-30469-1-git-send-email-ldewangan@nvidia.com>	<1463116755-30469-3-git-send-email-ldewangan@nvidia.com> <CACRpkdbbij7Vj+5EDdb2E4neoGUr7Bk28jhKfFWvETTvyfYu7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbbij7Vj+5EDdb2E4neoGUr7Bk28jhKfFWvETTvyfYu7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Tuesday 24 May 2016 04:45 PM, Linus Walleij wrote:
> On Fri, May 13, 2016 at 7:19 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO
>> pins. It also supports interrupts from these pins.
>>
>> Add GPIO driver for these pins to control via GPIO APIs.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> PS, please add these optional features:
>
>> +       mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
>> +       mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
> Any chance you could send a patch to add a .get_direction() callback?

Sure, I will send the patch for this and also for the set_single_ended().

I will post the patch on top of this patch as a new patch as this is 
already applied in your tree.
Later on, it can be squashed or added as new patch.

