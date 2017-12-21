From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 3/9] ARM: stm32: prepare stm32 family to welcome armv7 architecture
Date: Thu, 21 Dec 2017 21:48:33 +0100
Message-ID: <CAK8P3a0ckEZednkP1XttxMDFT7ZEYuyp-QtuhUgJ0jAtp9cXZg@mail.gmail.com>
References: <1513610272-7824-1-git-send-email-ludovic.Barre@st.com>
 <1513610272-7824-4-git-send-email-ludovic.Barre@st.com> <CAK8P3a1WzkVQ3591XjVQPLCqP0_zZ4ksqJqWvm7de_OnkE3oaQ@mail.gmail.com>
 <8092d8f9-c097-136f-4f6f-0b7ffea17c91@st.com> <4093a02c-3216-d668-a6d8-1ce76046b554@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4093a02c-3216-d668-a6d8-1ce76046b554-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerald Baeza <gerald.baeza-qxv4g6HH51o@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 5:39 PM, Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org> wrote:

>>>
>> Currently "restart" is not functional on stm32 MCU (at least for
>> stm32f746, I will check on others MCU). My fear is if Ludovic made some
>> patches to make "armv7m_restart" the default ".restart" function for all
>> armv7-m platform, he will not be able to test it on stm32 MCU (as it is not
>> currently working). I propose to do it in 2 steps:
>>
>> 1-Keep as you suggest only one board-dt.c file for both (MCU and MPU) and
>> remove ".restart" function.
>>
>> 2-Investigate and send patches around ".restart" for both in an other
>> series.
>
>
> I resend

Yes, that seems fine.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
