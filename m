From: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] dt-binding: timer: document NPCM7xx timer DT bindings
Date: Sun, 29 Oct 2017 22:49:35 +0200
Message-ID: <CAP6Zq1jKxvQ6bYF+WbxJEKEPb5J8RSS+bM=nH7L812bXJS7k9Q@mail.gmail.com>
References: <1506849098-18290-1-git-send-email-tmaimon77@gmail.com>
 <1506849098-18290-3-git-send-email-tmaimon77@gmail.com> <20171010155755.wfklwchg4eg7u6p6@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171010155755.wfklwchg4eg7u6p6@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sorry for the delay,


On 10 October 2017 at 17:57, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Oct 01, 2017 at 12:11:38PM +0300, Tomer Maimon wrote:
>> Added device tree binding documentation for Nuvoton NPCM7xx timer.
>>
>> Signed-off-by: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>>
>> diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>> new file mode 100644
>> index 000000000000..d1beea901509
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>> @@ -0,0 +1,25 @@
>> +Nuvoton NPCM7xx timer
>> +
>> +Nuvoton NPCM7xx have three timer modules, each timer module provides five 24-bit
>> +timer counters.
>> +
>> +Required properties:
>> +- compatible      : "nuvoton,npcm7xx-timer" for Poleg NPCM7xx.
>
> Don't use wildcards in compatible strings. Use SoC specific compatible
> strings with a fallback (the string for the 1st SoC which the block
> appeared) if necessary.
>
The SOC NPCM7xx is now on upstream process, I asked Brendan to modify
the NPCM7xx device tree to support the clock source driver

https://www.spinics.net/lists/arm-kernel/msg614424.html

and also the arcitecture name

https://www.spinics.net/lists/arm-kernel/msg614059.html

>> +- reg             : Offset and length of the register set for the device.
>> +- interrupts      : Contain the timer interrupt with flags for
>> +                    falling edge.
>> +
>> +Required clocking property, have to be one of:
>> +- clocks          : phandle of timer reference clock.
>> +- clock-frequency : The frequency in Hz of the clock that drives the NPCM7xx
>> +                    timer (usually 25000000).
>> +
>> +Example:
>> +
>> +timer@f0008000 {
>> +    compatible = "nuvoton,npcm7xx-timer";
>> +    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>> +    reg = <0xf0008000 0x1000>;
>> +    clocks = <&clk NPCM7XX_CLK_TIMER>;
>> +};
>> +
>> --
>> 2.14.1
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
