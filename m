From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH 07/13] pinctrl: add a pincontrol driver for BCM6358
Date: Mon, 22 Aug 2016 15:57:08 +0200
Message-ID: <CAOiHx==PWHx7-JEjVObLnrDOa4fSrs1sPPU7TAO7jGsnkAJLMQ@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
 <1471604025-21575-8-git-send-email-jonas.gorski@gmail.com> <CACRpkdaFYA2T2HXK-5xi9z_9-31ZCPCV2K1iy4Qt7JQed754tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaFYA2T2HXK-5xi9z_9-31ZCPCV2K1iy4Qt7JQed754tQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi

On 22 August 2016 at 15:21, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Aug 19, 2016 at 12:53 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:
>
>> Add a pincotrol driver for BCM6358. BCM6358 allow overlaying different
>> functions onto the GPIO pins. It does not support configuring individual
>> pins but only whole groups. These groups may overlap, and still require
>> the directions to be set correctly in the GPIO register. In addition the
>> functions register controls other, not directly mux related functions.
>>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>
>> +       if (pdev->dev.of_node)
>> +               mode = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
>> +                                                      "brcm,gpiomode");
>
>
> This seems to be using syscon, albeit for something else.
>
>> +       else
>> +               mode = syscon_regmap_lookup_by_pdevname("syscon.fffe0098");
>
> That looks very very fragile.

For !OF I need to use the pdevname, so I need to "guess" the right
one, and using the scheme of "syscon.<address>" seemed to be the one
most likely not conflicting with anything else.


Regards
Jonas
