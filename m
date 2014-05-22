From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: realview: basic device tree implementation
Date: Thu, 22 May 2014 20:52:38 +0200
Message-ID: <CACRpkdZX=UFhMfUn68hA+s2FLGRYy_dmjRng_fHtAQEhah0oRA@mail.gmail.com>
References: <1399586896-16906-1-git-send-email-linus.walleij@linaro.org>
	<5678119.IM3FN0FlT6@wuerfel>
	<20140522144503.GA27931@arm.com>
	<5057707.jNCXlqf9dH@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5057707.jNCXlqf9dH@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 22, 2014 at 5:49 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 22 May 2014 15:45:03 Catalin Marinas wrote:

>> Anyway, I don't think we have any streaming DMA used on these RealView
>> boards.
>
> Yes, I think that is correct. MMCI, SSP and serial could all use
> DMA but are not configured to do it.

PB1176 has no working DMA (borked DMA hardware), the PB11MPCore
actually has working DMA but only on UART TX and maybe AACI
(haven't tested) no clue about the Cortex boards PBA8 and PBX though.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
