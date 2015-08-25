From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: uniphier: add outer cache support and rework SMP operations
Date: Tue, 25 Aug 2015 10:50:00 +0900
Message-ID: <CAK7LNAQk4aEgZV3y90zBVMeq=jA45v683sCR1e5BBYtg5AcDOA@mail.gmail.com>
References: <1440382692-3855-1-git-send-email-yamada.masahiro@socionext.com>
	<CAOesGMgL3bNH_wG3igSJhNOkV0uUfNWEi0t-Gny2A1oNnGKu=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgL3bNH_wG3igSJhNOkV0uUfNWEi0t-Gny2A1oNnGKu=w@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jungseung Lee <js07.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>"linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linu>
List-Id: devicetree@vger.kernel.org

Hi Olof,


2015-08-25 6:47 GMT+09:00 Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>:
> Hi,
>
> On Sun, Aug 23, 2015 at 7:18 PM, Masahiro Yamada
> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>> 1/3: add outer cache support
>> 2/3: rework SMP operations
>> 3/3: add device tree nodes
>
> Timing of this is unfortunate, please resend after 4.3-rc1 is out and
> we can queue it up.

Given that rc8 is out and the merge window has been delayed,
is it still too late for 4.3-rc1?



>> Because 2/3 highly depends on 1/3, I hope whole of this series
>> is applied to ARM-SOC tree.
>
> Review or acked-by from Russell would be appreciated in that case.
>
>> Olof,
>> From this series, I am using "ARM: uniphier:" rather than "ARM: UniPhier:"
>> for the subject prefixes because I noticed you often rephased so when you
>> applied my patches.
>> Are sub-arch names in lower cases preferable in subject prefixes?
>
> If you look at "git log --no-merges --oneline arch/arm/mach-*" you'll
> see that most platforms use either all-caps or all-lowercase.

I see.

But, we use "UniPhier" (with only U and P capitalized) in our official
documents.



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
