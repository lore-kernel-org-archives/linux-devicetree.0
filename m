From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: interrupts properties and API usage with GPIO controllers/Device
 Tree
Date: Tue, 31 May 2016 12:51:05 +0300
Message-ID: <574D5E89.10906@ti.com>
References: <57461CDC.603@gmail.com> <57485844.3050807@ti.com>
 <CACRpkdYULz6fgw8N_yLCGYzqV7DjeJGmh1b0e9coxpGqSgZf+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYULz6fgw8N_yLCGYzqV7DjeJGmh1b0e9coxpGqSgZf+A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 05/31/2016 11:49 AM, Linus Walleij wrote:
> On Fri, May 27, 2016 at 4:23 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>
>> Another interesting, related question (as for me) is "Is there a limitation
>>   that gpio bank can have only 32 GPIO pins (from gpiolib point of view)?"
>
> Do you mean for this driver or in general?

In general.

>
> The gpio MMIO driver has this limitation, but not the subsystem
> and gpiolib as far as I know.

Thanks.

-- 
regards,
-grygorii
