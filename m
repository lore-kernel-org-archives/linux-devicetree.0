From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: realview: basic device tree implementation
Date: Thu, 22 May 2014 15:36:01 +0200
Message-ID: <5376959.IId6jNFDDg@wuerfel>
References: <1399586896-16906-1-git-send-email-linus.walleij@linaro.org> <CAL_JsqLN_f1uvrY6w7J7ZcR9pfM0_XKYMQ5YU8F4yAcMW+oDGw@mail.gmail.com> <CACRpkdaqsVUDA+6NC=EQmxcnDAnJEfPNYoptrEv=nq=eZEbA_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaqsVUDA+6NC=EQmxcnDAnJEfPNYoptrEv=nq=eZEbA_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 22 May 2014 15:30:39 Linus Walleij wrote:
> >> +       parent = soc_device_to_device(soc_dev);
> >
> > We really need to standardize this soc device stuff so that platforms
> > always have a parent soc device or not.
> 
> Arnds position is that the entire platform/board should not be
> a "soc device" and that seems correct since the board is no SoC.
> 
> So I will spin this off into a SoC driver and push under
> drivers/soc and bind to the SoC node in the device tree.

To be clear, this has nothing to do with whether this is strictly a SoC
or not. I would still want to see all the internal components of the
main chip under the soc node, and probably anything that is attached
to one of its interfaces under those nodes. The parts that should not
be under /soc are the ones that are not in the device hierarchy, such
as external clock generators.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
