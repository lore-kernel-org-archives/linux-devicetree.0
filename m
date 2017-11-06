From: Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] clocksource: npcm: add NPCM7xx timer driver
Date: Mon, 6 Nov 2017 12:18:08 +0200
Message-ID: <CAP6Zq1iFBx1H6SW8SfoPa811mtnJyLk9pycoBfeZitSD7dg-fg@mail.gmail.com>
References: <1509538604-8218-1-git-send-email-tmaimon77@gmail.com> <CAFd5g45esV+m1FJyZY=nu_nZpP_1749sYUMmRXfet41Ju+7Vsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFd5g45esV+m1FJyZY=nu_nZpP_1749sYUMmRXfet41Ju+7Vsw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 November 2017 at 02:28, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> On Wed, Nov 1, 2017 at 5:16 AM, Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Addressed comments from:
>>  - Daniel Lezcano: https://www.spinics.net/lists/devicetree/msg196683.html
>>
>> Changes since version 1:
>>  - Rename driver name
>>  - Removing unnecessary dependencies in configuration
>>  - Adding prefix to the macros
>>  - No changes to dt-binding documentation since v1
>>
>> Asked Brendon to modify NPCM7xx device tree for support NPCM7xx timer driver
>> https://www.spinics.net/lists/arm-kernel/msg614424.html
>
> Rob Herring asks that we keep the device tree binding the same as I have it.
> Unless, there is some part of the conversation that I am missing.

you are right that he asked to keep the competible as you have in the
device tree but
the reg is incorrect in your device tree, please modify it as follow:

timer0: timer@f0008000 {
        compatible = "nuvoton,npcm750-timer";
        interrupts = <0 32 4>;
        reg = <0xf0008000 0x1000>;
        clocks = <&clk NPCM7XX_CLK_TIMER>;
};

>
>>
>> Changes have been tested on the NPCM750 evaluation board.
>>
>> Tomer Maimon (2):
>>   clocksource: npcm: add NPCM7xx timer driver
>>   dt-binding: timer: document NPCM7xx timer DT bindings
>>
>>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
>>  drivers/clocksource/Kconfig                        |   8 +
>>  drivers/clocksource/Makefile                       |   1 +
>>  drivers/clocksource/npcm7xx-timer.c                | 224 +++++++++++++++++++++
>>  4 files changed, 258 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>>  create mode 100644 drivers/clocksource/npcm7xx-timer.c
>>
>> --
>> 2.14.1
>>

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
