From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: realview: basic device tree implementation
Date: Thu, 22 May 2014 20:26:19 +0200
Message-ID: <5233065.1vXjHiDqN2@wuerfel>
References: <1399586896-16906-1-git-send-email-linus.walleij@linaro.org> <5057707.jNCXlqf9dH@wuerfel> <alpine.LFD.2.11.1405221406100.17310@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.11.1405221406100.17310-fMhRO7WWcppj+hNMo8g0rg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 22 May 2014 14:09:52 Nicolas Pitre wrote:
> On Thu, 22 May 2014, Arnd Bergmann wrote:
> 
> > On Thursday 22 May 2014 15:45:03 Catalin Marinas wrote:
> > > By making the DMA memory Strongly Ordered, we avoid the
> > > L220 write buffer. In addition to the above commit, we also had
> > > 2503a5ecd86c (ARM: 6201/1: RealView: Do not use outer_sync() on
> > > ARM11MPCore boards with L220).
> > 
> > Ah, so this also stands in the way of multiplatform realview 
> 
> Isn't the real value of a multiplatform realview in the ability to use 
> it with Qemu?  Did Qemu go to the extreme of emulating all those cache 
> issues?

The qemu developers have in the past always argued strongly that they
want to run the same kernel that runs on real hardware. Having a kernel
that runs only on the emulated version but not on actual hardware is
clearly against that goal, and  we should use CONFIG_ARCH_VIRT for
that purpose.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
