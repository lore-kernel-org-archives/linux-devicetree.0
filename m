From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v9 4/6] Documentation: DT: PL011: hi6220: add compatible
 string for Hisilicon designed UART
Date: Tue, 02 Jun 2015 10:13:26 +0100
Message-ID: <556D73B6.4090608@arm.com>
References: <1432950661-23060-1-git-send-email-bintian.wang@huawei.com>	<1432950661-23060-5-git-send-email-bintian.wang@huawei.com> <CACRpkdav_5x6RC9F++ErvqGyxDCF-=kap7-jCsO4zZ6QGVLfBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdav_5x6RC9F++ErvqGyxDCF-=kap7-jCsO4zZ6QGVLfBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd@codeaurora.>
List-Id: devicetree@vger.kernel.org

On 02/06/15 09:59, Linus Walleij wrote:
> On Sat, May 30, 2015 at 3:50 AM, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> 
>> Hisilicon does some performance enhancements based on PL011(e.g. larger
>> FIFO length), so add one compatible string "hisilicon,hi6220-uart" for
> 
> That compatible string in the commit message is not even
> the same as in the patch.
> 
>> future optimisations or workarounds works.
>>
>> Signed-off-by: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Suggested-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> 
> Maybe I missed out on the earlier conversation, but do you
> mean that the PrimeCell ID has not been properly set up
> to something unique in this HiSilicon version of the PL011
> block?
> 
> Even if so: do not override the compatible string like this,
> that is not the PrimeCell style.
> 
> Define an 8 bit vendor ID (like tha ASCII for 'H' 0x48
> or whatever) and encode it for these variants, if the
> hardware is just using the ARM default PrimeCell
> ID, override it in the device tree like Broadcom
> are doing in arch/arm/boot/dts/bcm2835.dtsi:
> 
> arm,primecell-periphid = <0x00241011>;
> 
> Maybe yours would be:
> 
> arm,primecell-periphid = <0x00048011>;
> 
> For a first HiSilicon variant, then do some
> <include/linux/amba/bus.h>:
> 
> enum amba_vendor {
>         AMBA_VENDOR_ARM = 0x41,
> +       AMBA_VENDOR_HISILICON = 0x48,
> 
> Then patch drivers/tty/serial/amba_pl011.c to add vendor_hisilicon
> and a match table for 0x00048011 just like everyone else.

That feels weird. This amba_vendor enum is not under control of the DT
author, nor the kernel. This is a set of codes that are managed by a
third party (probably ARM). What if some company with a name starting
with 'H' (Hilarious Inc?) comes up with some actual HW and ends up
conflicting with the above?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
