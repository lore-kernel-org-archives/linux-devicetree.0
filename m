From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 1/5] ARM: mediatek: Add config options for mediatek
 SoCs.
Date: Wed, 14 Jan 2015 10:33:01 +0800
Message-ID: <1421202781.27675.149.camel@mtksdaap41>
References: <1418772873-19747-1-git-send-email-hongzhou.yang@mediatek.com>
	 <1418772873-19747-2-git-send-email-hongzhou.yang@mediatek.com>
	 <CACRpkda2pHpjMAsEeuEebShQnbqf5knfNbEGtSHLN=o18HC5nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkda2pHpjMAsEeuEebShQnbqf5knfNbEGtSHLN=o18HC5nQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, alan.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, toby.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-01-13 at 10:43 +0100, Linus Walleij wrote:
> On Wed, Dec 17, 2014 at 12:34 AM, Hongzhou Yang
> <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> 
> > From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >
> > The upcoming MTK pinctrl driver have a big pin table for each SoC
> > and we don't want to bloat the kernel binary if we don't need it.
> > Add config options so we can build for one SoC only.
> >
> > Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> I guess this goes directly to the ARM SoC tree. As it is only
> Kconfig symbols it should be OK to merge out-of-order.
> 

Hi Matthias,

Since this one is in arch/arm/mach-mediatek, can you take it?

Links for original post in case you can't find it.
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/311181.html

Joe.C



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
