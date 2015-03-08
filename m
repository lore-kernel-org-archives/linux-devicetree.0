From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/5] dt-bindings: Add pinctrl bindings for mt65xx/mt81xx.
Date: Sun, 8 Mar 2015 09:16:39 +0100
Message-ID: <CABuKBeL0y4OrLCtyV_n0eVsncpo7vT0ZentGC-ZW9YzBYDa1Qw@mail.gmail.com>
References: <1421818097-9281-1-git-send-email-hongzhou.yang@mediatek.com>
	<1421818097-9281-3-git-send-email-hongzhou.yang@mediatek.com>
	<CACRpkdYASTGTiiAF6EA=OCqYepdStf4UO9_qWGg6ACyd8=CaHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYASTGTiiAF6EA=OCqYepdStf4UO9_qWGg6ACyd8=CaHw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Vladimir Murzin <vladimir.murzin-5wv7dgnIgG8@public.gmane.org>, Ashwin Chaugule <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, dandan.he-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, alan.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, toby.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, maoguang.meng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jean-Christophe
List-Id: devicetree@vger.kernel.org

Hi Linus,

2015-02-10 9:01 GMT+01:00 Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> On Wed, Jan 21, 2015 at 1:28 PM, Hongzhou Yang
> <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
>> From: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>
>> Add devicetree bindings for Mediatek SoC pinctrl driver.
>>
>> Signed-off-by: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> OK applied this patch for v3.21 now, relying on Sascha's ACK.

I can see the the pinctrl driver parts in your tree repository [0],
but not in linux-next.
Do think of merging them in the next merge window?

Thanks,
Matthias

[0] https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=mtk-staging
>
> Yours,
> Linus Walleij



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
