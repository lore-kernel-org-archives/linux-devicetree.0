From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: BCM63XX: add support for BCM63138 SoC
Date: Wed, 2 Apr 2014 12:41:28 -0700
Message-ID: <CAGVrzcb-xay4QCLwxWnzDhC+fvr5eJVEBmWbTC6XkKS0SQzwWg@mail.gmail.com>
References: <1394127959-3159-1-git-send-email-f.fainelli@gmail.com> <CAGVrzcbxmWE+1drcyNK7K1a4ta6Pp1-Kc4xv7x0vDSumZen1fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGVrzcbxmWE+1drcyNK7K1a4ta6Pp1-Kc4xv7x0vDSumZen1fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, mbizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

2014-03-11 10:10 GMT-07:00 Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> 2014-03-06 9:45 GMT-08:00 Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> Hi all,
>>
>> This patchset adds very minimal support for the BCM63138 SoC which is
>> a xDSL SoC using a dual Cortex A9 CPU complex.
>>
>> Future work will focus on:
>>
>> - clock device/driver/providers
>> - SMP support (already working)
>> - DT'fying drivers/tty/serial/bcm63xx_uart.c to be usable
>
> Gentle ping, patch 2 should not be too controversial and could
> probably be queued for a next 3.14-rc pull request?

Thanks for merging patch 2, can I borrow some of your bandwidth to
review the remainder of the patches?

Thanks!

>
>>
>> Florian Fainelli (6):
>>   ARM: BCM63XX: add basic support for the Broadcom BCM63138 DSL SoC
>>   ARM: restrict BCM_KONA_UART to ARCH_BCM_MOBILE
>>   ARM: BCM63XX: add low-level UART debug support
>>   ARM: BCM63XX: add BCM63138 minimal Device Tree
>>   ARM: BCM63XX: add BCM963138DVT Reference platform DTS
>>   MAINTAINERS: add entry for the Broadcom BCM63xx ARM SoCs
>>
>>  .../devicetree/bindings/arm/bcm/bcm63138.txt       |   9 ++
>>  MAINTAINERS                                        |  10 ++
>>  arch/arm/Kconfig.debug                             |  20 +++-
>>  arch/arm/boot/dts/Makefile                         |   1 +
>>  arch/arm/boot/dts/bcm63138.dtsi                    | 109 +++++++++++++++++++++
>>  arch/arm/boot/dts/bcm63138dvt.dts                  |  18 ++++
>>  arch/arm/include/debug/bcm63xxx.S                  |  33 +++++++
>>  arch/arm/mach-bcm/Kconfig                          |  20 ++++
>>  arch/arm/mach-bcm/Makefile                         |   2 +
>>  arch/arm/mach-bcm/bcm63xx.h                        |  29 ++++++
>>  arch/arm/mach-bcm/board_bcm63xx.c                  |  94 ++++++++++++++++++
>>  11 files changed, 342 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm63138.txt
>>  create mode 100644 arch/arm/boot/dts/bcm63138.dtsi
>>  create mode 100644 arch/arm/boot/dts/bcm63138dvt.dts
>>  create mode 100644 arch/arm/include/debug/bcm63xxx.S
>>  create mode 100644 arch/arm/mach-bcm/bcm63xx.h
>>  create mode 100644 arch/arm/mach-bcm/board_bcm63xx.c
>>
>> --
>> 1.8.3.2
>>
>
>
>
> --
> Florian



-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
