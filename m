From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v2 1/5] misc: support the Arcx anybus bridge.
Date: Thu, 1 Nov 2018 13:17:22 -0400
Message-ID: <CAGngYiVorxYY+8e75068i4=PJi1gEvnGkgvBfi0+9H+c1qD-oQ@mail.gmail.com>
References: <20181031194425.32132-1-TheSven73@googlemail.com>
 <20181031194425.32132-2-TheSven73@googlemail.com> <CACRpkdai-6iNbz4EGuHNHkQYyR+yhTEJdRXP4G6fUKpA+XApjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdai-6iNbz4EGuHNHkQYyR+yhTEJdRXP4G6fUKpA+XApjQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sven Van Asbroeck <svendev@arcx.com>, Lee Jones <lee.jones@linaro.org>, robh+dt@kernel.org, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

> This is fun :)

It sure is ! It's fascinating to see how the kernel abstractions are designed,
and how code is reviewed here.

>> +static DEVICE_ATTR_RO(version);
>
> Do you need this in userspace really?
>
>> +static DEVICE_ATTR_RO(design_number);
>
> And this?

Unfortunately, I do :(
The application software reads these out and displays them in an UI. It's
important to be able to see these on a running device.
Perhaps there is another kernel abstraction I could use?

> This:
>>
>> +       cd->reset_gpio = of_get_named_gpio(np, "reset-gpios", 0);
>> +       if (!gpio_is_valid(cd->reset_gpio)) {
>> +               dev_err(dev, "reset-gpios not found\n");
>> +               return -EINVAL;
>> +       }
>> +       devm_gpio_request(dev, cd->reset_gpio, NULL);
>> +       gpio_direction_output(cd->reset_gpio, 0);
>
> Should be:
>
> cd->reset_gpiod = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> if (IS_ERR(cd->reset_gpiod))
>     return PTR_ERR(cd->reset_gpiod);

That's actually pretty neat !
Now we have nothing that explicitly refers to the devicetree (except the
device binding, of course). I now see the point you made earlier:
resets, gpios, interrupts etc are associated with "struct device" and
not necessarily with the devicetree.

The rest of your suggestions have already gone in.

I hope you'll have some time later to look at the architecture description
in the bus driver. Looking forward to your feedback and to the next iteration !

Cheers,
Sven
