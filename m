From: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH V2 3/9] ARM: stm32: prepare stm32 family to welcome armv7
 architecture
Date: Tue, 19 Dec 2017 15:43:02 +0100
Message-ID: <45e2f530-1e72-6933-4367-95aadd709873@st.com>
References: <1513610272-7824-1-git-send-email-ludovic.Barre@st.com>
 <1513610272-7824-4-git-send-email-ludovic.Barre@st.com>
 <CAK8P3a1WzkVQ3591XjVQPLCqP0_zZ4ksqJqWvm7de_OnkE3oaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a1WzkVQ3591XjVQPLCqP0_zZ4ksqJqWvm7de_OnkE3oaQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Gerald Baeza <gerald.baeza-qxv4g6HH51o@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 12/18/2017 09:24 PM, Arnd Bergmann wrote:
> On Mon, Dec 18, 2017 at 4:17 PM, Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org> wrote:
>> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>>
>> This patch prepares the STM32 machine for the integration of Cortex-A
>> based microprocessor (MPU), on top of the existing Cortex-M
>> microcontroller family (MCU). Since both MCUs and MPUs are sharing
>> common hardware blocks we can keep using ARCH_STM32 flag for most of
>> them. If a hardware block is specific to one family we can use either
>> ARM_SINGLE_ARMV7M or ARCH_MULTI_V7 flag.
>>
>> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> 
> Looks good overall. Two more small comments:
> 
> 
>>
>> +if ARCH_STM32
>> +
>>   config MACH_STM32F429
>> -       bool "STMicrolectronics STM32F429"
>> -       depends on ARCH_STM32
>> +       bool "STMicroelectronics STM32F429"
>> +       depends on ARM_SINGLE_ARMV7M
>>          default y
> 
> Instead of the explicit dependency for each board, I'd leave the surrounding
> 'if ARM_SINGLE_ARMV7M'. I think you had in v1.

As you suggest, I follow mach-at91 example.
The point is on "depends on ARM_SINGLE_ARMV7M" ?
You prefer this way:
config MACH_STM32F429
	bool "STMicroelectronics STM32F429" if ARM_SINGLE_ARMV7M
	default y

BR
Ludo

> 
>> diff --git a/arch/arm/mach-stm32/Makefile b/arch/arm/mach-stm32/Makefile
>> index bd0b7b5..5940af1 100644
>> --- a/arch/arm/mach-stm32/Makefile
>> +++ b/arch/arm/mach-stm32/Makefile
>> @@ -1 +1 @@
>> -obj-y += board-dt.o
>> +obj-$(CONFIG_ARM_SINGLE_ARMV7M) += board-mcu-dt.o
>> diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-mcu-dt.c
>> similarity index 100%
>> rename from arch/arm/mach-stm32/board-dt.c
>> rename to arch/arm/mach-stm32/board-mcu-dt.c
> 
> Why the rename? I don't expect the new machines to have any notable
> contents in a board file, if any at all, so just use one file for both.
> I see the board-dt.c file refers to armv7m_restart, we can either put
> that in an #ifdef, or find a way to make it the default for all armv7-m
> platforms that don't provide any other restart method.
> 
>       Arnd
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
