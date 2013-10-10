From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [rtc-linux] [PATCH V5 2/3] pincntrl: add support for ams AS3722
 pin control driver
Date: Thu, 10 Oct 2013 14:55:32 +0530
Message-ID: <5256728C.6060802@nvidia.com>
References: <1380729030-25896-1-git-send-email-ldewangan@nvidia.com> <1380729030-25896-3-git-send-email-ldewangan@nvidia.com> <CACRpkdbmAnRxDpP17tmAAeC7U6Yibd5N7vFA1o1h=4DdhW+H-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbmAnRxDpP17tmAAeC7U6Yibd5N7vFA1o1h=4DdhW+H-g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Landley <rob@landley.net>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 08 October 2013 05:46 PM, Linus Walleij wrote:
> On Wed, Oct 2, 2013 at 5:50 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>
>> The AS3722 is a compact system PMU suitable for mobile phones, tablets etc.
>>
>> Add a driver to support accessing the GPIO, pinmux and pin configuration
>> of 8 GPIO pins found on the ams AS3722 through pin control driver and
>> gpiolib.
>>
>> The driver will register itself as the pincontrol driver and gpio driver.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> ---
>> Changes from V1:
>> - Nit cleanups in driver and use module_platform_driver.
>>
>> Changes from V2:
>> - Move the gpio driver from gpio folder to pinctnrl driver and register
>>    driver as pincontrol driver.
>> - Provide pin configuration through pincntrl framework.
>>
>> Changes from V3:
>> - Added gpio ranges and pinctrl_gpio calls.
>> - Used pinctrl_gpio_* calls on gpio chips callback.
>> - Remove dummy function which just return not supported.
>> - Nit cleanups.
>>
>> Changes from V4:
>> - Drop separate DT binding document as it is moved to mfd/as3722.txt.
> As mentioned I am happy with this driver,
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> When you agreed with the DT folks and want me to merge it,
> tell me.
>

Stephen has given the ACK from DT side, so I think you can merge this patch.

Thanks,
Laxman

