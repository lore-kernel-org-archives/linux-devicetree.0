From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v7 0/4] ARM: SoC: add a new platform, UniPhier (arch/arm/mach-uniphier)
Date: Wed, 13 May 2015 16:00:21 +0900
Message-ID: <CAK7LNASyJmyUcKNecdhWjXbd615=9XcMxeLxC7y_z+psO03BbQ@mail.gmail.com>
References: <1431058034-5508-1-git-send-email-yamada.masahiro@socionext.com>
	<2101307.fSn8Z2ZyBq@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2101307.fSn8Z2ZyBq@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,


2015-05-13 0:00 GMT+09:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> On Friday 08 May 2015 13:07:10 Masahiro Yamada wrote:
>> This is an initial series for supporting Socionext UniPhier SoCs,
>> based on ARM Cortex-A9, mainly used for digital TVs, video recorders, etc.
>>
>>
>> Masahiro Yamada (4):
>>   ARM: UniPhier: add basic support for UniPhier architecture
>>   ARM: multi_v7_defconfig: enable UniPhier SoC family
>>   ARM: dts: UniPhier: add support for UniPhier SoCs and boards
>>   MAINTAINERS: add myself as ARM/UniPhier maintainer
>
> Applied all four patches, to the next/soc, next/defconfig, next/dt and
> next/soc branches respectively.

Thanks!
I can see them.


> Welcome as our latest new maintainer. In the future, please send
> any follow-up patches for the architecture specific code to
> arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org in addition to the normal recipients, once you
> consider them ready to be applied.


Please teach me a little more because I am not experienced enough
in this community.


I checked MAINTAINERS, but I could not find arm-DgEjT+Ai2yi4UlQgPVntAg@public.gmane.org
Is it documented somewhere?

I found ARM SUB-ARCHITECTURES entry in that file, but it does not mention
the responsible individuals.
(I assume, you and Olof are the ones.)


ARM SUB-ARCHITECTURES
L:      linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
S:      Maintained
F:      arch/arm/mach-*/
F:      arch/arm/plat-*/
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git



I have one more question.

Are you receiving pull requests from each sub-arch maintainer?
Or should every patch be submitted to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org and
applied by you (or other ARM-SoC maintainers)?

I have not earned enough reputations in this ML, so I know
it is too early for me to handle pull-reqs.

I understand the general development process of Linux, but
the maintainership of the ARM-SoC subsystem looks more hierarchized, so
I just want to know its development process correctly.


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
