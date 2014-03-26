From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: realview: basic device tree implementation
Date: Wed, 26 Mar 2014 15:03:56 +0100
Message-ID: <9768087.NlERCxKjPM@wuerfel>
References: <1395826060-26662-1-git-send-email-linus.walleij@linaro.org> <CAL_JsqKYR1aujNhOASivsg-ED6xDPCsSCcGVnQn5vy4sD1PhAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKYR1aujNhOASivsg-ED6xDPCsSCcGVnQn5vy4sD1PhAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 26 March 2014 08:59:32 Rob Herring wrote:
> On Wed, Mar 26, 2014 at 4:27 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >  menu "RealView platform type"
> >         depends on ARCH_REALVIEW
> >
> > +config REALVIEW_DT
> > +       bool "Support RealView(R) Device Tree based boot"
> > +       select ARM_GIC
> > +       select USE_OF
> > +       select SOC_BUS
> > +       select MFD_SYSCON
> 
> Sort.
> 
> This will probably need to be coordinated with Arnd's cpu selection rework.

Ignore my cpu selection patches here, we'll do those later.


	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
