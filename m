From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/3] arm64,hi6220: Enable Hisilicon Hi6220 SoC
Date: Thu, 5 Feb 2015 22:18:17 -0800
Message-ID: <CAOesGMhKRtcGwE-5ZKsZC42ZCBYtLV9A0RT0mEySwsU2uk5cSA@mail.gmail.com>
References: <1423128277-10297-1-git-send-email-bintian.wang@huawei.com>
	<CANMBJr685FzZzQ660Z1aNJX+Kzkw1OqM6RJAviARbL+5a=MJ2A@mail.gmail.com>
	<CAOesGMgjv9iLnLmpLADQYoAw=oUkJDAJs72Q5q=DQ75paQ+A-g@mail.gmail.com>
	<CANMBJr7wx=BwDK9inc-2LdXQhyv-tZZry86Ojr=oH8z53Un76Q@mail.gmail.com>
	<CAAS=xmhj8UMwooYrXQBqzR=J5ernj+EWGV1AqEtHHoWiBgw8gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAS=xmhj8UMwooYrXQBqzR=J5ernj+EWGV1AqEtHHoWiBgw8gA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brent Wang <wangbintian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Haifeng Yan <yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, xuejiancheng@hu
List-Id: devicetree@vger.kernel.org

On Thu, Feb 5, 2015 at 8:21 PM, Brent Wang <wangbintian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Olof and Tyler,
>
> 2015-02-06 7:52 GMT+08:00 Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>>
>> On 5 February 2015 at 11:02, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>> > On Thu, Feb 5, 2015 at 10:46 AM, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > wrote:
>> >> Hi Bintian,
>> >>
>> >> On 5 February 2015 at 01:24, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> >> wrote:
>> >>> Hello,
>> >>>
>> >>> Hi6220 is one mobile solution of Hisilicon, this patchset contains
>> >>> initial support for Hi6220 SoC and HiKey development board, which
>> >>> is based on ARM Cortex A53 architecture. Initial support is minimal
>> >>> and includes just the arch configuration, clock driver, device tree
>> >>> configuration.
>> >>>
>> >>> Many peripheral drivers will be submitted later.
>> >>>
>> >>> Any comments will be appreciated!
>> >>>
>> >>> Thanks,
>> >>>
>> >>> Bintian Wang (3):
>> >>>   arm64: Enable Hisilicon ARMv8 SoC family in Kconfig and defconfig
>> >>>   clk: hi6220: Clock driver support for Hisilicon hi6220 SoC
>> >>>   arm64: dts: Add dts files for Hisilicon Hi6220 SoC
>> >>
>> >> Thanks for posting these! I've applied this series on top of
>> >> next-20150204, however there was some fuzz that needed to be cleaned
>> >> up on 3/3 [1]. I've confirmed the platform is booting to a basic user
>> >> space without issue.
>> >
>> > From ramdisk only, right?
>>
>> Correct, ramdisk only.
>>
>> > Given the timing of the posting of this
>> > patch set, I'm not going to merge it for 3.20. Hopefully for 3.21
>> > there will be some more peripheral support as well -- at least some
>> > sort of storage device.
>>
>> Seem fair to me. I also hope to see more patches posted shortly.
>
> Yes, the mmc and sd drivers will be submitted soon, should they be included
> in this patchset?  I have thought submitting this patch first for review, if
> there
> is no problem for this patchset and then submit other drivers, you know,
> other
> drivers will depend on this patchset.


The drivers should ideally not depend on the SoC patchset -- the
driver can go in independently. The DTS updates to specify the
hardware should go in through arm-soc even if the driver itself (and
the binding document update) should go in through the driver subsystem
instead.


So, you can choose if you want to post everything as a long series,
and cc different maintainers on the various parts of the series -- or
you can post each driver or subsystem as a patchset on its own and let
that get merged through respective maintainer. The latter is most
common these days.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
