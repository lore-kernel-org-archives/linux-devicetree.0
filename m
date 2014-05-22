From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2] ARM: realview: basic device tree implementation
Date: Thu, 22 May 2014 15:38:14 +0200
Message-ID: <4386397.P7WlMhNVxk@wuerfel>
References: <1399586896-16906-1-git-send-email-linus.walleij@linaro.org> <5678119.IM3FN0FlT6@wuerfel> <CACRpkdYE0Fb+HezqgDbVcqQmWwn7QL2+RWSRyAigv2qcMp2qFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYE0Fb+HezqgDbVcqQmWwn7QL2+RWSRyAigv2qcMp2qFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 22 May 2014 15:04:07 Linus Walleij wrote:
> On Thu, May 22, 2014 at 10:31 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Thursday 22 May 2014 09:41:39 Linus Walleij wrote:
> 
> >> The question can be rephrased like this:
> >> Should we create drivers/soc?
> >
> > I think we just did, not sure if the patches have made it into linux-next
> > already, but there were a couple of other platforms already that want this
> > directory.
> 
> Awesomeness. Can you give me the title of a patch or branch
> from ARM SoC I should pull in to build on top of this? Then I can
> split off all the SoC bus business and have the machine file real
> small, nice and clean.

I'd have to check again, it seems that as of today, there is no drivers/soc
on arm-soc yet. I do remember that there were at least two platforms besides
yours that want it though, so we have to coordinate it a bit.

Then again, as I expect all of them to go through arm-soc, we can probably
resolve the conflicts in our tree.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
