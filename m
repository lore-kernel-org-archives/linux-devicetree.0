From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: realview: basic device tree implementation
Date: Thu, 8 May 2014 13:13:22 +0200
Message-ID: <CACRpkdbiiahjY6n++MJqX=JyoiJoQAVVaDnsj5DM5kS2rOyXAg@mail.gmail.com>
References: <1395826060-26662-1-git-send-email-linus.walleij@linaro.org>
	<4327457.yKTHVHA17K@wuerfel>
	<26412341.aCOKep5CZC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <26412341.aCOKep5CZC@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 26, 2014 at 10:09 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> I don't know if the ATAGS are actually correct in common boot loaders,
> since the kernel has been overriding them for ages.

The RealView U-Boot has not seen a commit since 2010 when
Peter Pearse retired but appears to pass incorrect ATAGs, 128MiB
@ 0x0 for all RealView variants.

But we need not worry about that for the DT boot path so much
as we can fix that up, just for legacy boots.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
