From: Ye Xiaolong <xiaolong.ye-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: sun8i: a83t: Add device tree for Sinovoip Bananapi
 BPI-M3
Date: Thu, 24 Aug 2017 14:05:19 +0800
Message-ID: <20170824060519.GC7797@yexl-desktop>
References: <201708200827.WQojuopU%fengguang.wu@intel.com>
 <f14d6c43ddcf403775dfb6efe25e7196@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f14d6c43ddcf403775dfb6efe25e7196-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/20, icenowy-h8G6r0blFSE@public.gmane.org wrote:
>在 2017-08-20 08:59，kbuild test robot 写道：
>>Hi Chen-Yu,
>>
>>[auto build test ERROR on robh/for-next]
>>[also build test ERROR on v4.13-rc5 next-20170817]
>>[if your patch is applied to the wrong git tree, please drop us a note
>>to help improve the system]
>
>In fact this tree shouldn't be applied on robh's tree, but the
>arm-soc tree
>or its downstream, sunxi tree.

Thanks for the feedback, we'll improve the system accordingly.

Thanks,
Xiaolong
>
>>
>>url:
>>https://github.com/0day-ci/linux/commits/Chen-Yu-Tsai/ARM-sun8i-a83t-Add-device-tree-for-Sinovoip-Bananapi-BPI-M3/20170820-055904
>>base:
>>https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
>>for-next
>>config: arm-at91_dt_defconfig (attached as .config)
>>compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
>>reproduce:
>>        wget
>>https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross
>>-O ~/bin/make.cross
>>        chmod +x ~/bin/make.cross
>>        # save the attached .config to linux build tree
>>        make.cross ARCH=arm
>>
>>All errors (new ones prefixed by >>):
>>
>>>>Error: arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts:64.1-7
>>>>Label or path ehci0 not found
>>>>Error: arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts:71.1-6
>>>>Label or path mmc0 not found
>>>>Error: arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts:81.1-6
>>>>Label or path mmc2 not found
>>>>Error: arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts:91.1-7
>>>>Label or path r_rsb not found
>>>>Error: arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts:145.1-8
>>>>Label or path usbphy not found
>>   FATAL ERROR: Syntax error parsing input tree
>>
>>---
>>0-DAY kernel test infrastructure                Open Source
>>Technology Center
>>https://lists.01.org/pipermail/kbuild-all                   Intel
>>Corporation
>>
>>_______________________________________________
>>linux-arm-kernel mailing list
>>linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
