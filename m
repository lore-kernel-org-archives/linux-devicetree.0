From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH V2 3/5] gpio: add support for AMS AS3722 gpio
 driver
Date: Mon, 23 Sep 2013 15:31:32 +0530
Message-ID: <5240117C.8060300@nvidia.com>
References: <1379680214-9143-1-git-send-email-ldewangan@nvidia.com> <1379680214-9143-4-git-send-email-ldewangan@nvidia.com> <CACRpkdbJ6N-5RET+cmF=14jKVDnuAZtZwjcKym75ySER2gCpBQ@mail.gmail.com> <524001F3.3060602@nvidia.com> <CACRpkdYVTdh3+ayy96D4=iNO6ZASfTfeQOHF9vdoPjfLDCtB5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYVTdh3+ayy96D4=iNO6ZASfTfeQOHF9vdoPjfLDCtB5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Lobmaier <florian.lobmaier-QzQKeY2x7wg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 23 September 2013 02:56 PM, Linus Walleij wrote:
> On Mon, Sep 23, 2013 at 10:55 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On Monday 23 September 2013 01:36 PM, Linus Walleij wrote:
>>> This is pin control. Do not try to shoehorn pin control drivers into
>>> the GPIO subsystem. Take a good day off, read through
>>> Documentation/pinctrl.txt and come back with a thoroughly rewritten
>>> driver in drivers/pinctrl/pinctrl-as3722.c.
> (...)
>> Yes, the appropriate location is pin control for pull up/down etc
>> configuration but with this device, the actual issue is with the way it is
>> require to configure the pull up/down and input/output of the pin. There is
>> no separate bits for pull up/down and direction and it is  clubbed together.
>> The register's bits are defined as:
>>
>> Selects the GPIO mode (I, I/O, Tri, Pulls) (BIT 2:0)
>>    0 : Input
>>    1 : Output (push and pull) VSUP_GPIO
>>    2 : Output/Input (open drain, only NMOS is active)
>>    3 : ADC input (Tristate)
>>    4 : Input with pull-up to VDD_GPIO_lv
>>    5 : Input with pull-down
>>    6 : Output/Input open drain (nmos) with pull-up to VDD_GPIO_lv,
>>    7 : Output (push and pull) VDD_GPIO_lv
>>
>> So I can not actually configure the pull up/down, open drain and direction
>> independently until every thing is known.
>> Direction come from gpio driver but pull up/down and open drain
>> configuration come from the pin control.
>> And this is only the reason to make all configuration in single driver.
> This is nothing special. Create a single combined GPIO and
> pin control driver using the pin control framework and device
> tree bindings.
>

Ok, I was thinking that we should not call gpiochip_add() from the pin 
control driver in any new driver and that's why I developed gpio driver 
but it seems it is allowed. I saw some of driver in pinctrl are doing 
pin control and gpio functionality in single driver i.e. 
pincntrl-nomadik, pinctrl-samsung, pincntrl-st etc.
So this gpio driver can be moved now to the pincntrl folder and can use 
pincontrol and gpio framework.

I will respin the change.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
