From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/13] pinctrl: add a pincontrol driver for BCM6358
Date: Tue, 23 Aug 2016 11:18:42 +0200
Message-ID: <CACRpkdYDZhA4_fvzFh5heE=Hvh9157rWRHdm+1k28hROSwk=7g@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com>
 <1471604025-21575-8-git-send-email-jonas.gorski@gmail.com>
 <CACRpkdaFYA2T2HXK-5xi9z_9-31ZCPCV2K1iy4Qt7JQed754tQ@mail.gmail.com> <CAOiHx==PWHx7-JEjVObLnrDOa4fSrs1sPPU7TAO7jGsnkAJLMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAOiHx==PWHx7-JEjVObLnrDOa4fSrs1sPPU7TAO7jGsnkAJLMQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>, Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 3:57 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:
> On 22 August 2016 at 15:21, Linus Walleij <linus.walleij@linaro.org> wrote:

>>> +       else
>>> +               mode = syscon_regmap_lookup_by_pdevname("syscon.fffe0098");
>>
>> That looks very very fragile.
>
> For !OF I need to use the pdevname, so I need to "guess" the right
> one, and using the scheme of "syscon.<address>" seemed to be the one
> most likely not conflicting with anything else.

OK from my side, I can live with that.

CC:ing the syscon pdev support author: Alexander what is your
thoughts about this? Is there a good convention to follow for
pdev lookups?

Yours,
Linus Walleij
