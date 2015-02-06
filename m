From: Brent Wang <wangbintian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] clk: hi6220: Clock driver support for Hisilicon
 hi6220 SoC
Date: Fri, 6 Feb 2015 15:32:13 +0800
Message-ID: <CAAS=xmjURtR6Nhubg7JptXgtUGtZs8090FHJutnCaau4GzqZzg@mail.gmail.com>
References: <1423128277-10297-1-git-send-email-bintian.wang@huawei.com>
	<1423128277-10297-3-git-send-email-bintian.wang@huawei.com>
	<20150205192533.GE20735@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150205192533.GE20735@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>"olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <o>
List-Id: devicetree@vger.kernel.org

Hi Mark,

2015-02-06 3:25 GMT+08:00 Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>:
> On Thu, Feb 05, 2015 at 09:24:36AM +0000, Bintian Wang wrote:
>> Add clock drivers for hi6220 SoC, this driver controls the SoC
>> registers to supply different clocks to different IPs in the SoC.
>>
>> We add one divider clock for hi6220 because the divider in hi6220
>> also has a mask bit but it doesnot obey the rule defined by flag
>> "CLK_DIVIDER_HIWORD_MASK", we can not get index of the mask bit by
>> left shift fixed bits (e.g. 16 bits), so we add this divider clock
>> to handle it.
>>
>> This patch also enables this clock driver for ARCH_HISI and document
>> devicetree bindings.
>>
>> Signed-off-by: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Reviewed-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/clock/hi6220-clock.txt     |   30 +++
>>  arch/arm64/Kconfig                                 |    1 +
>>  drivers/clk/Kconfig                                |    2 +
>>  drivers/clk/Makefile                               |    4 +-
>>  drivers/clk/hisilicon/Kconfig                      |    5 +
>>  drivers/clk/hisilicon/Makefile                     |    1 +
>>  drivers/clk/hisilicon/clk-hi6220.c                 |  284 ++++++++++++++++++++
>>  drivers/clk/hisilicon/clk.c                        |   29 ++
>>  drivers/clk/hisilicon/clk.h                        |   17 ++
>>  drivers/clk/hisilicon/clkdivider-hi6220.c          |  273 +++++++++++++++++++
>>  include/dt-bindings/clock/hi6220-clock.h           |  172 ++++++++++++
>>  11 files changed, 815 insertions(+), 3 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/hi6220-clock.txt
>>  create mode 100644 drivers/clk/hisilicon/Kconfig
>>  create mode 100644 drivers/clk/hisilicon/clk-hi6220.c
>>  create mode 100644 drivers/clk/hisilicon/clkdivider-hi6220.c
>>  create mode 100644 include/dt-bindings/clock/hi6220-clock.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/hi6220-clock.txt b/Documentation/devicetree/bindings/clock/hi6220-clock.txt
>> new file mode 100644
>> index 0000000..a3ddda1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/hi6220-clock.txt
>> @@ -0,0 +1,30 @@
>> +* Hisilicon Hi6220 Clock Controller
>> +
>> +The hi6220 clock controller generates and supplies clock to various
>> +controllers within the hi6220 SoC.
>> +
>> +Required Properties:
>> +
>> +- compatible: should be one of the following:
>> +  - "hisilicon,hi6220-clock-ao" - controller for those clocks under SoC
>> +     power always on(AO) domain, it is the sub node of SoC power AO
>> +     controller in dts file.
>> +  - "hisilicon,hi6220-clock-sys" - controller for those clocks under SoC
>> +     system control domain, it is the sub node of SoC system controller
>> +     in dts file.
>> +  - "hisilicon,hi6220-clock-media" - controller for those clocks under
>> +     SoC media control domain, it is the sub node of SoC media controller
>> +     in dts file.
>> +  - "hisilicon,hi6220-clock-power" - controller for those clocks under
>> +     SoC power control domain, it is the sub node of SoC power controller
>> +     in dts file.
>
> These all refer to things which aren't documented (yet).
>
> Please sort out your patches so that any documentation you depend on
> comes earlier.
>
> Please also separate documentation from code. Note that dt includes are
> _bindings_ and should be added with the relevant documentation.
Thanks for help to review, I also think separate documentation from
code is better
way, it will be fixed in next version.

Thanks,

Bintian
> Thanks,
> Mark.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
