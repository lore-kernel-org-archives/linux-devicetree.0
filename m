From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: dts: hi3660: add pcie node
Date: Mon, 15 May 2017 17:37:43 +0800
Message-ID: <CAFGCpxwiBky85WPiusic_UOtMq2VtaG2XC0VG2Hrgz7jtBScUQ@mail.gmail.com>
References: <20170515062745.70082-1-songxiaowei@hisilicon.com>
 <201705151738.ls8RIrFp%fengguang.wu@intel.com> <CAFGCpxwmuEKdc6FF=OmQz8tEipbcO+PjkwmywXLtY5=UxSeKvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFGCpxwmuEKdc6FF=OmQz8tEipbcO+PjkwmywXLtY5=UxSeKvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Song Xiaowei <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kishon <kishon-l0cyMroinI0@public.gmane.org>, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, keith.busch-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Niklas Cassel <niklas.cassel-VrBV9hrLPhE@public.gmane.org>, Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>, "liudongdong (C)" <liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "Chenfeng (puck)" <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wangbinghui <wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Suzhuangluan <suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This PCIe node has dependencies on &crg_ctrl and &gpio11. However,
both of them are not appearing in mainline kernel tree yet. Sorry
about that. But I do have a plan to send all dts related changes to
maillist within this week, no later than this Wed (17/May). Would it
be possible you maintainers review this patch in parallel?

+Device tree maintainers.

-Guodong

>
> On Mon, May 15, 2017 at 5:18 PM, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Hi Song,
>>
>> [auto build test ERROR on pci/next]
>> [also build test ERROR on v4.12-rc1 next-20170515]
>> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>>
>> url:    https://github.com/0day-ci/linux/commits/Song-Xiaowei/arm64-dts-hi3660-add-pcie-node/20170515-144035
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
>> config: arm64-defconfig (attached as .config)
>> compiler: aarch64-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
>> reproduce:
>>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # save the attached .config to linux build tree
>>         make.cross ARCH=arm64
>>
>> All errors (new ones prefixed by >>):
>>
>> >> Error: arch/arm64/boot/dts/hisilicon/hi3660.dtsi:180.24-25 syntax error
>>    FATAL ERROR: Unable to parse input tree
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
