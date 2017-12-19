From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 3/9] ARM: stm32: prepare stm32 family to welcome armv7 architecture
Date: Tue, 19 Dec 2017 16:26:49 +0100
Message-ID: <CAK8P3a3X1icDWmVng8w0Yd58nAcViJQ9oZc4xm-dEycVPe+5pg@mail.gmail.com>
References: <1513610272-7824-1-git-send-email-ludovic.Barre@st.com>
 <1513610272-7824-4-git-send-email-ludovic.Barre@st.com> <CAK8P3a1WzkVQ3591XjVQPLCqP0_zZ4ksqJqWvm7de_OnkE3oaQ@mail.gmail.com>
 <45e2f530-1e72-6933-4367-95aadd709873@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <45e2f530-1e72-6933-4367-95aadd709873-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Gerald Baeza <gerald.baeza-qxv4g6HH51o@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 19, 2017 at 3:43 PM, Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org> wrote:
>
>
> On 12/18/2017 09:24 PM, Arnd Bergmann wrote:
>>
>> On Mon, Dec 18, 2017 at 4:17 PM, Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>
>> wrote:
>>>
>>> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>>>
>>> This patch prepares the STM32 machine for the integration of Cortex-A
>>> based microprocessor (MPU), on top of the existing Cortex-M
>>> microcontroller family (MCU). Since both MCUs and MPUs are sharing
>>> common hardware blocks we can keep using ARCH_STM32 flag for most of
>>> them. If a hardware block is specific to one family we can use either
>>> ARM_SINGLE_ARMV7M or ARCH_MULTI_V7 flag.
>>>
>>> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>>
>>
>> Looks good overall. Two more small comments:
>>
>>
>>>
>>> +if ARCH_STM32
>>> +
>>>   config MACH_STM32F429
>>> -       bool "STMicrolectronics STM32F429"
>>> -       depends on ARCH_STM32
>>> +       bool "STMicroelectronics STM32F429"
>>> +       depends on ARM_SINGLE_ARMV7M
>>>          default y
>>
>>
>> Instead of the explicit dependency for each board, I'd leave the
>> surrounding
>> 'if ARM_SINGLE_ARMV7M'. I think you had in v1.
>
>
> As you suggest, I follow mach-at91 example.
> The point is on "depends on ARM_SINGLE_ARMV7M" ?
> You prefer this way:
> config MACH_STM32F429
>         bool "STMicroelectronics STM32F429" if ARM_SINGLE_ARMV7M
>         default y
>

No, that would be wrong, that way you would always enable
MACH_STM32F429 when ARM_SINGLE_ARMV7M is turned
off, which is exactly the wrong way round. What I meant is

if ARCH_STM32

if ARM_SINGLE_ARMV7M

config MACH_STM32F429
         bool "STMicrolectronics STM32F429"

config MACH_STM32...
          ...

endif # ARMv7-M

if ARCH_MULTI_V7

config MACH_STM32...
          ...

endif # ARMv7-A

endif # STM32

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
