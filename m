From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v3 0/3] ARM: uniphier: add outer cache support and rework
 SMP operations
Date: Sat, 10 Oct 2015 07:59:21 +0100
Message-ID: <CAK7LNATgK0OQbu_9J7DjUfDA_dKSCkCS4Kqw6vXD+=5oxkw4ig@mail.gmail.com>
References: <1442551054-2116-1-git-send-email-yamada.masahiro@socionext.com>
	<6239461.UGe6XP3dfB@wuerfel>
	<5275814.I392BfIEUH@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5275814.I392BfIEUH@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Ru tland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Jungseung Lee <js07.lee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxi
List-Id: devicetree@vger.kernel.org

Hi Arnd,


2015-10-06 15:22 GMT+01:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Tuesday 06 October 2015 16:20:23 Arnd Bergmann wrote:
>> On Friday 18 September 2015 13:37:31 Masahiro Yamada wrote:
>> > Hi Olof,
>> >
>> > Now Linux 4.3-rc1 is out, so I am back to this.
>> >
>> > 1/3: add outer cache support
>> > 2/3: rework SMP operations
>> > 3/3: add device tree nodes
>> >
>> > Because 2/3 highly depends on 1/3, I hope whole of this series
>> > is applied through ARM-SOC tree.
>>
>> Sorry for the long delay here. Is this the latest version of these
>> patches?
>>
>> Did Russell King review the first patch?
>> Is he ok with merging this through arm-soc?
>>
>
> I found an answer to the first question, as I see you posted
> v5 of the patchset in the meantime.


Yes, v5 is my latest version.


For the second question, Russell gave me some comments on the 1/3
and I answered.

He mentioned nothing about merging the whole series thru arm-soc.
(At least, he was not opposed to it, I guess)





-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
