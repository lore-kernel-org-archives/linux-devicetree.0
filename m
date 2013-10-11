From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] gpio: add export with name from dts
Date: Fri, 11 Oct 2013 10:21:43 -0700
Message-ID: <CAK5ve-L1+DL2no2LpHrVznEGJC8-=Sur8cNNVR0na+T7yM6L=w@mail.gmail.com>
References: <1381485939-12435-1-git-send-email-jiri.prchal@aksignal.cz>
 <CACRpkda0=wWPP1JD-pzafEsbrOh2KQmOsvei2gc6m9yBa1tDZg@mail.gmail.com>
 <5257E15D.5080602@aksignal.cz> <CACRpkdYkG-0x9_oQijA6hYn+snDsjtVT+RhYhDe_9gjfDdWuoA@mail.gmail.com>
 <5257F8D2.5080700@aksignal.cz> <CACRpkdau1nGVuDji+gxBnkuC2Ri4SM+MUL+FnQKvMpKMLnG1dQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdau1nGVuDji+gxBnkuC2Ri4SM+MUL+FnQKvMpKMLnG1dQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Crispin <blogic@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 11, 2013 at 7:46 AM, Linus Walleij <linus.walleij@linaro.or=
g> wrote:
> On Fri, Oct 11, 2013 at 3:10 PM, Ji=C5=99=C3=AD Prchal <jiri.prchal@a=
ksignal.cz> wrote:
>> Dne 11.10.2013 14:49, Linus Walleij napsal(a):
>
>>> If the GPIOs are actually connected to LEDs you should be
>>> using drivers/leds/leds-gpio.c and not export the GPIOs.
>>
>> I know that, just don't like /sys/class/leds/out15/brightness.
>

Maybe I lost some context here, what's problem about the name?

Thanks,
-Bryan

> Hm, then you might want to modify the way names are set
> on leds rather ... this is the way we handle LEDs in the kernel
> so any problems need to be discussed with Bryan Wu,
> the LED maintainer.
>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
