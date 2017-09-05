From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v4 0/3] arm64: Realtek RTD1295 RTC
Date: Tue, 5 Sep 2017 10:03:58 +0200
Message-ID: <12aac585-64f4-f08b-c5bf-b1f0ac124924@suse.de>
References: <20170904225324.29138-1-afaerber@suse.de>
 <20170905075900.wsroxyp6mzdzjclu@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170905075900.wsroxyp6mzdzjclu-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, =?UTF-8?B?6JKL5Li955C0?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 05.09.2017 um 09:59 schrieb Alexandre Belloni:
> On 05/09/2017 at 00:53:21 +0200, Andreas Färber wrote:
>> Hello,
>>
>> This series adds the RTC for the Realtek RTD1295 SoC.
>> Based on my RTD1295 clk series.
>>
>> There being no public source code for RTD1295, the implementation is based on
>> register offsets seen in the vendor DT, as well as older mach-rtk119x code
>> published by QNAP.
>>
>> v4 adds a missing clk_put().
>>
>> The DT node depends on the clk series for clock index and header.
>>
>> More experimental patches at:
>> https://github.com/afaerber/linux/commits/rtd1295-next
>>
>> Have a lot of fun!
>>
>> Cheers,
>> Andreas
>>
>> v3 -> v4:
>> * Added clk_put() (Alexandre)
>>
>> v2 -> v3:
>> * Dropped spinlock (Andrew)
>> * Improved year_days vs. days_in_year readability
>>
>> v1 -> v2:
>> * Updated rtc driver to no longer use open/release (Alexandre)
>> * Cleaned up debug output (Andrew)
>> * Avoided COMPILE_TEST division errors (kbuild)
>> * Various cleanups and extensions
>>
>> Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
>> Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>
>> Cc: 蒋丽琴 <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>>
>> Andreas Färber (3):
>>   dt-bindings: rtc: Add Realtek RTD1295
>>   rtc: Add Realtek RTD1295
>>   arm64: dts: realtek: Add RTD1295 RTC node
>>
>>  .../devicetree/bindings/rtc/realtek,rtd119x.txt    |  16 ++
>>  arch/arm64/boot/dts/realtek/rtd1295.dtsi           |   6 +
>>  drivers/rtc/Kconfig                                |   8 +
>>  drivers/rtc/Makefile                               |   1 +
>>  drivers/rtc/rtc-rtd119x.c                          | 242 +++++++++++++++++++++
>>  5 files changed, 273 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.txt
>>  create mode 100644 drivers/rtc/rtc-rtd119x.c
>>
> Applied, thanks.

Err, I am hoping you only queued patches 1-2? Please do not queue patch
3, that needs to go through my tree as per the comments - it will not build.

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
