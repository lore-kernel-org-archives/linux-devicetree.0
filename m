From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: mediatek: Add config option for mt8173.
Date: Wed, 4 Mar 2015 18:01:29 +0800
Message-ID: <1425463289.21342.41.camel@mtksdaap41>
References: <1422342836-27689-1-git-send-email-hongzhou.yang@mediatek.com>
	 <20150225111107.GA29206@localhost> <1425436267.21342.39.camel@mtksdaap41>
	 <2108883.zjHYNOn4mC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2108883.zjHYNOn4mC@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alan.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, toby.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2015-03-04 at 10:53 +0100, Arnd Bergmann wrote:
> On Wednesday 04 March 2015 10:31:07 Yingjoe Chen wrote:
> > Hi,
> > 
> > Since we support devicetree, we don't need MACH_* to build a working
> > kernel. This is true even for our v7 soc. We intend to use it to reduce
> > numbers of drivers in product kernel binary.
> > Most drivers are shared among the same SoCs family, but some are not.
> > Currently for pinctrl driver, we are doing this so user don't need to
> > select them one by one:
> > 
> > config PINCTRL_MT8173
> >         def_bool MACH_MT8173
> >         select PINCTRL_MTK_COMMON
> > 
> > Alternatively, we could add these MACH_* to some other places, eg,
> > drivers/soc/mediatek. Or we don't add MACH_* at all, and have all
> > drivers export their own Kconfig option. User will need to select each
> > of them one-by-one.
> > 
> > What do you think?
> 
> I would rather see these as user-selectable options, which has the
> other benefit of giving compile-time coverage. For your example,
> I'd suggest doing
> 
> config PINCTRL_MT8173
>         bool "Mediatek MT8173 pin control"
> 	depends on ARCH_MEDIATEK || COMPILE_TEST
>         select PINCTRL_MTK_COMMON
> 	help
> 	   ... a useful description ...
> 

OK, I'll send a new patch to do this.
Thanks.

Joe.C



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
