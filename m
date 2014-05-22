From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: realview: basic device tree implementation
Date: Thu, 22 May 2014 14:09:52 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1405221406100.17310@knanqh.ubzr>
References: <1399586896-16906-1-git-send-email-linus.walleij@linaro.org> <5678119.IM3FN0FlT6@wuerfel> <20140522144503.GA27931@arm.com> <5057707.jNCXlqf9dH@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5057707.jNCXlqf9dH@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 22 May 2014, Arnd Bergmann wrote:

> On Thursday 22 May 2014 15:45:03 Catalin Marinas wrote:
> > By making the DMA memory Strongly Ordered, we avoid the
> > L220 write buffer. In addition to the above commit, we also had
> > 2503a5ecd86c (ARM: 6201/1: RealView: Do not use outer_sync() on
> > ARM11MPCore boards with L220).
> 
> Ah, so this also stands in the way of multiplatform realview :(

Isn't the real value of a multiplatform realview in the ability to use 
it with Qemu?  Did Qemu go to the extreme of emulating all those cache 
issues?


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
