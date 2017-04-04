From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: wm831x: Add basic device tree support
Date: Tue, 4 Apr 2017 20:00:14 +0300
Message-ID: <CAHp75Vfxvc2CMdNgiaRYZDFyBkftQ78aGMiF8+P_KFWA+x=QNQ@mail.gmail.com>
References: <1489745120-2918-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1489745120-2918-2-git-send-email-ckeepax@opensource.wolfsonmicro.com> <20170323114727.g7huthlsuh7tplxk@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170323114727.g7huthlsuh7tplxk@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 1:47 PM, Lee Jones <lee.jones@linaro.org> wrote:
> On Fri, 17 Mar 2017, Charles Keepax wrote:
>
>> Now the wm831x-core has basic DT support we can update this driver to
>> allow use of the GPIOs within a device tree system.
>>
>> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>
>> No changes since v4, still should go through Lee's tree.
>>
>> Thanks,
>> Charles
>>
>>  drivers/gpio/gpio-wm831x.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> Applied, thanks.

>> +#ifdef CONFIG_OF_GPIO
>> +     wm831x_gpio->gpio_chip.of_node = wm831x->dev->of_node;
>> +#endif

Just a bit of off topic.

If we can use struct fwnode_handle we might get rid of all those
CONFIG_OF_GPIO in the drivers.

-- 
With Best Regards,
Andy Shevchenko
