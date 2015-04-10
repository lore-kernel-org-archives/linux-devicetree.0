From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 00/11] ARM: vf610m4: Add Vybrid Cortex-M4 support
Date: Fri, 10 Apr 2015 10:50:34 +0200
Message-ID: <CALszF6Cc_7g873cz-zr=k4dDqDu+aMRjT1o2RGEh-tpSjYyREA@mail.gmail.com>
References: <1428609855-27657-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428609855-27657-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, marc.zyngier-5wv7dgnIgG8@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

2015-04-09 22:04 GMT+02:00 Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>:
> In this fifth revision the patchset moves away from the idea
> including ARMv7-M platforms into ARCH_MULTIPLATFORM, but
> instead adds a new top-level config symbol ARM_SINGLE_ARMV7M
> Patch 7 adds this new config symbol while patch 8 alters the
> existing ARMv7-M platform ARCH_EFM32 to use ARM_SINGLE_ARMV7M.
> I chose to move the config symbol of the ARMv7-M specific
> architectures (ARCH_EFM32 at that point) below the multiarch
> includes. I think it is a good idea to keep them together, but
> I'm not sure if this is an appropriate place. The architecture
> which Vybrid is depending on, ARCH_MXC, is not also selectable
> when ARM_SINGLE_ARMV7M is selected.
>
> Since v3, this patchset does not contain the interrupt router
> driver anymore (MSCM IR). The driver has been merged inbetween:
> https://lkml.org/lkml/2015/3/8/6
>
> This patchset extends the NVIC driver to support irq domain
> hierarchy and the MSCM IR driver to support NVIC as a parent
> irq controller.
>
> The patchset has proven to be working on the Cortex-M4 of the
> Vybrid SoC using a Colibri VF61 module.
>
> Note: This patchset has dependencies on "ARM: ARMv7-M: Enlarge
> vector table up to 256 entries" (Maxime Coquelin) and the

I just submitted the patch to Russell's patch tracking system:
http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=8340/1

Kind regards,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
