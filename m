From: Ye Xiaolong <xiaolong.ye-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [kbuild-all] [PATCH v4 3/9] arm: dts: mt7623: add
 mt7623-mt6323.dtsi file
Date: Wed, 31 May 2017 16:08:42 +0800
Message-ID: <20170531080842.GB12568@yexl-desktop>
References: <201705281908.LU8TFOQ8%fengguang.wu@intel.com>
 <d565b4dd-f6b7-ee43-ddfe-ae98328646ed@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d565b4dd-f6b7-ee43-ddfe-ae98328646ed-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Matthias

On 05/29, Matthias Brugger wrote:
>
>
>On 28/05/17 13:31, kbuild test robot wrote:
>>Hi John,
>>
>>[auto build test ERROR on robh/for-next]
>>[also build test ERROR on v4.12-rc2 next-20170526]
>>[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>>
>>url:    https://github.com/0day-ci/linux/commits/sean-wang-mediatek-com/arm-dts-extend-mt7623-support/20170525-142103
>>base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
>
>Mediatek dts patches should be tested against:
>https://github.com/mbgg/linux-mediatek.git for-next
>
>Not sure why this happend, as this got already fixed in lkp-tests:
>bc0c8847 ("mediatek: mark for-next branch")

0day mainly relies on MAINTAINERS file to determine the git am base for lkml
patches, could you help add your tree in below section?

ARM/Mediatek SoC support
M:      Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
L:      linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
L:      linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
S:      Maintained
F:      arch/arm/boot/dts/mt6*
F:      arch/arm/boot/dts/mt7*
F:      arch/arm/boot/dts/mt8*
F:      arch/arm/mach-mediatek/
F:      arch/arm64/boot/dts/mediatek/
N:      mtk
K:      mediatek


Thanks,
Xiaolong

>
>Regards,
>Matthias
>
>>config: arm-allyesconfig (attached as .config)
>>compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
>>reproduce:
>>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=arm
>>
>>All errors (new ones prefixed by >>):
>>
>>>>Error: arch/arm/boot/dts/mt7623-mt6323.dtsi:33.1-7 Label or path pwrap not found
>>>>Error: arch/arm/boot/dts/mt7623-mt6323.dtsi:261.1-6 Label or path mmc0 not found
>>>>Error: arch/arm/boot/dts/mt7623-mt6323.dtsi:266.1-6 Label or path mmc1 not found
>>    FATAL ERROR: Syntax error parsing input tree
>>
>>---
>>0-DAY kernel test infrastructure                Open Source Technology Center
>>https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>>
>_______________________________________________
>kbuild-all mailing list
>kbuild-all-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
>https://lists.01.org/mailman/listinfo/kbuild-all
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
