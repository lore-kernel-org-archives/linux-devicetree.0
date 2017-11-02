From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Wed, 1 Nov 2017 19:41:15 -0500
Message-ID: <CAL_JsqKgwepy4Kb21oikYRsOtFpKJFTiLRs4q613AX+9opHQKg@mail.gmail.com>
References: <20170919224001.22284-1-brendanhiggins@google.com>
 <20170919224001.22284-3-brendanhiggins@google.com> <CAP6Zq1jPva2sFMYaNoN6C_4sXL9q=W_Wyt9Hy3+OsG6UJUVd6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAP6Zq1jPva2sFMYaNoN6C_4sXL9q=W_Wyt9Hy3+OsG6UJUVd6w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 29, 2017 at 3:33 PM, Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 20 September 2017 at 00:40, Brendan Higgins
> <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>> specific device tree for the NPCM750 (Poleg) evaluation board.
>>

>> +                       timer0: timer@f0000000 {
>> +                               compatible = "nuvoton,npcm750-timer";
>> +                               interrupts = <0 32 4>;
>> +                               reg = <0xf0000000 0x1000>;
>> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
>> +                       };
>
> I started the upstream process of NPCM7xx clocksource driver, I got
> the following comment:
> https://www.spinics.net/lists/devicetree/msg197916.html
>
> Is it possible to modify the the timer DT entry to:
>
> timer0: timer@f0008000 {
>         compatible = "nuvoton,npcm7xx-timer";

Please don't. Using 750 is correct. Using 7xx (i.e. wildcards) is not.

If there's subsequent SoCs with the same block, then you can do:
'"nuvoton,npcm760-timer", "nuvoton,npcm750-timer"'.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
