From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: realview: basic device tree implementation
Date: Thu, 8 May 2014 13:20:19 +0200
Message-ID: <CACRpkdbH4WrMgmj+sdgx83KncV4iGTqvve_QisP14uuLP6XS2w@mail.gmail.com>
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

> Catalin originally added the sparsemem hack. I asked him today about
> it, and he also thinks that sparsemem without the hack should work,
> as long as there is highmem support. I think we can either do away
> with it entirely, or use the patch below to keep it alive.

IMO the patch make things worse. I'd just say we switch it to use highmem
and get rid of the madness.

Anyone claiming to be running performance-critical loads on the PBX
is either insane or a liar.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
