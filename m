From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH 10/20] gpio: pca953x: Add optional reset gpio control
Date: Fri, 30 Dec 2016 10:03:53 -0800
Message-ID: <9fa1db80-b0ea-68af-c122-49ea0b4315ec@gmail.com>
References: <1483050455-10683-1-git-send-email-steve_longerbeam@mentor.com>
 <1483050455-10683-11-git-send-email-steve_longerbeam@mentor.com>
 <CACRpkdZG2j4_LwP8KUVBTOtXma75YvYtC6CW1QqYwOm-MOZgHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CACRpkdZG2j4_LwP8KUVBTOtXma75YvYtC6CW1QqYwOm-MOZgHg@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Linus Walleij <linus.walleij@linaro.org>, LW@KARO-electronics.de
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Philipp Zabel <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus, Lothar,


On 12/30/2016 05:17 AM, Linus Walleij wrote:
> On Thu, Dec 29, 2016 at 11:27 PM, Steve Longerbeam
> <slongerbeam@gmail.com> wrote:
>
>> Add optional reset-gpios pin control. If present, de-assert the
>> specified reset gpio pin to bring the chip out of reset.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>> Cc: linux-gpio@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
> This seems like a separate patch from the other 19 patches so please send it
> separately so I can handle logistics easier in the future.

Ok, I'll send the next version separately.

>
>
>> @@ -133,6 +134,7 @@ struct pca953x_chip {
>>          const char *const *names;
>>          unsigned long driver_data;
>>          struct regulator *regulator;
>> +       struct gpio_desc *reset_gpio;
> Why do you even keep this around in the device state container?
>
> As you only use it in the probe() function, use a local variable.
>
> The descriptor will be free():ed by the devm infrastructure anyways.

I think my reasoning for putting the gpio handle into the device
struct was for possibly using it for run-time reset control at some
point. But that could be done later if needed, so I'll go ahead and
make it local.

>> +               /* see if we need to de-assert a reset pin */
>> +               chip->reset_gpio = devm_gpiod_get_optional(&client->dev,
>> +                                                          "reset",
>> +                                                          GPIOD_OUT_LOW);
>> +               if (IS_ERR(chip->reset_gpio)) {
>> +                       dev_err(&client->dev, "request for reset pin failed\n");
>> +                       return PTR_ERR(chip->reset_gpio);
>> +               }
> Nice.
>
>> +               if (chip->reset_gpio) {
>> +                       /* bring chip out of reset */
>> +                       dev_info(&client->dev, "releasing reset\n");
>> +                       gpiod_set_value(chip->reset_gpio, 0);
>> +               }
> Is this really needed given that you set it low in the
> devm_gpiod_get_optional()?

Yep, this is left over from a previous iteration, but it isn't needed now.
I'll remove it.

Steve
