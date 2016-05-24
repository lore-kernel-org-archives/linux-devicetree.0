From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V12 2/2] pinctrl: max77620: add pincontrol driver for
 MAX77620/MAX20024
Date: Tue, 24 May 2016 16:48:15 +0530
Message-ID: <57443877.4010106@nvidia.com>
References: <1463116755-30469-1-git-send-email-ldewangan@nvidia.com>	<1463116755-30469-4-git-send-email-ldewangan@nvidia.com> <CACRpkdZNDEL855=Mruwm4U7eFz-QiuvXuDP83QPOupkpj2Jpkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZNDEL855=Mruwm4U7eFz-QiuvXuDP83QPOupkpj2Jpkg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Tuesday 24 May 2016 04:51 PM, Linus Walleij wrote:
> On Fri, May 13, 2016 at 7:19 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO pins
>> which also act as the special function in alternate mode. Also
>> there is configuration like push-pull, open drain, FPS timing
>> etc for these pins.
>>
>> Add pin control driver to configure these parameters through
>> pin control APIs.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Patch applied for the next kernel cycle.
Thank you very much.

>
>> +       switch (param) {
>> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
>> +               if (mpci->pin_info[pin].drv_type == MAX77620_PIN_OD_DRV)
>> +                       arg = 1;
>> +               break;
> Hmmmm OK is this one of those cases we discussed where
> you need to be able to tell the pin config back-end to do the
> open draining (etc) from the GPIO driver?

The back end request was for tegra-gpio, not for this. On Tegra GPIO the 
open drain configurations are in different register space i.e. pin 
control register space instead of gpio controller.

In this driver, it is configuration via pinctrl. Here pincontrol and 
gpio driver share same registers.
Now, as we have the method to configure the open drain bit from the GPIO 
interface, we really dont need to do this from pinctrl framework.

For doing from GPIO framework, the client need to aware that gpio is 
open drain type.

Can we make something that open drain of pins can be provided via some 
common interface like DT of controller based on platforms configuration  
and client need not to worry about this? For client, it will be simple 
gpio calls.

