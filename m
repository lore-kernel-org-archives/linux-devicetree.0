From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: stm32: prepare stm32 family to welcome armv7 architecture
Date: Mon, 11 Dec 2017 14:40:43 +0100
Message-ID: <CAK8P3a2rrpFuwET8r1H0YWVABbCZr5c2ySrKCgA4mfoZPfWp6Q@mail.gmail.com>
References: <1512742277-28205-1-git-send-email-ludovic.Barre@st.com>
 <1512742277-28205-2-git-send-email-ludovic.Barre@st.com> <CACRpkdaKZk5N9F=_nYSzKWyXgW4xQ9Ltft7-UNM+a-nOpqq2xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaKZk5N9F=_nYSzKWyXgW4xQ9Ltft7-UNM+a-nOpqq2xg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 11, 2017 at 11:25 AM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Dec 8, 2017 at 3:11 PM, Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org> wrote:
>
>> From: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
>>
>> This patch prepares the STM32 machine for the integration of Cortex-A
>> based microprocessor (MPU), on top of the existing Cortex-M
>> microcontroller family (MCU). Since both MCUs and MPUs are sharing
>> common hardware blocks we can keep using ARCH_STM32 flag for most of
>> them. If a hardware block is specific to one family we can use either
>> ARCH_STM32_MCU or ARCH_STM32_MPU flag.
>>
>> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>

To what degree do we need to treat them as separate families
at all then? I wonder if the MCU/MPU distinction is always that
clear along the Cortex-M/Cortex-A separation, especially if
we ever get to a chip that has both types of cores. What
exactly would we miss if we do away with the ARCH_STM32_MCU
symbol here?

> So yesterdays application processors are todays MCU processors.
>
> I said this on a lecture for control systems a while back and
> stated it as a reason I think RTOSes are not really seeing a bright
> future compared to Linux.
>
> It happened quicker than I thought though, interesting.

I think there is still lots of room for smaller RTOS in the long run,
but it's likely that the 'MPU + external DRAM' design point will
shift further to Linux, as there isn't really a benefit in squeezing
in anything smaller when the minimum is 32MB or 128MB of
RAM, depending on the interface.

For on-chip eDRAM or SRAM based MPUs, that doesn't hold
true, the memory size is what drives the cost here.

        Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
