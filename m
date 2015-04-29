From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v7 0/9] mfd: watchdog: rtc: New driver for ST's LPC IP
Date: Wed, 29 Apr 2015 06:25:51 -0700
Message-ID: <5540DBDF.6020804@roeck-us.net>
References: <1428590854-14095-1-git-send-email-lee.jones@linaro.org> <20150429132152.GQ9169@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150429132152.GQ9169@x1>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, david.paris-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/29/2015 06:21 AM, Lee Jones wrote:
>> [Alessandro: This just needs RTC Acks now]
>
> Given this patch-set has been on the list for some time now and we
> haven't heard from Alessandro in all that time, I'm going to just
> apply the set and send out a pull-request to the other Maintainers.
>
> No point waiting any longer IMHO.
>

+1

Guenter

>> ST's Low Power Controller (LPC) controls two devices; watchdog and RTC.
>> Only one of the devices can be used at any one time, which is enforced
>> by the Device Driver model.
>>
>> This driver set provides everything you need to choose one (and only
>> one) of the LPC devices to run per I/P block, of which there are two
>> on the enabled STiH407 h/w.
>>
>> Version 7:
>>   - Fix 2 legacy typos in the binding documentation compatible string
>>     examples.
>>
>> Version 6:
>>   - RTC: GPL v2 => GPL to reflect the information in the header
>>   - Applied another Reviewed-by from Guenter
>>
>> Version 5:
>>   - Disable WDT clock over suspend
>>   - WDT: GPL v2 => GPL to reflect the information in the header
>>   - Change module name in Kconfig help and file header
>>
>> Version 4:
>>   - Use {readl,writel}_relaxed() calls
>>   - Add Guenter's Reviewed-by
>>   - Rebased onto v4.0-rc1
>>
>> Version 3:
>>   - Move Regmap pointer into core device data structure
>>   - Remove error message from devm_ioremap_resource
>>
>> Version 2:
>>   - Only calculate keepalive once in probe()
>>   - Check for a 0 clk_rate
>>   - Set limits using predefined attributes from watchdog_device
>>   - CONFIG_PM => CONFIG_SLEEP
>>   - Call st_wdog_setup() on resume
>>   - Remove MFD driver -- instead rely on driver probing mechanism
>>     which continues attempting to bind to different drivers until
>>     one does not return -ENODEV
>>
>> Lee Jones (9):
>>    mfd: dt-bindings: Provide human readable defines for LPC mode choosing
>>    ARM: multi_v7_defconfig: Enable support for ST's LPC Watchdog
>>    ARM: multi_v7_defconfig: Enable support for ST's LPC RTC
>>    ARM: STi: DT: STiH407: Add Device Tree node for the LPC
>>    watchdog: bindings: Provide ST bindings for ST's LPC Watchdog device
>>    watchdog: st_wdt: Add new driver for ST's LPC Watchdog
>>    rtc: bindings: Provide ST bindings for ST's LPC RTC device
>>    rtc: st: add new driver for ST's LPC RTC
>>    MAINTAINERS: Add Watchdog and RTC files to STI's maintainer entry
>>
>>   .../devicetree/bindings/rtc/rtc-st-lpc.txt         |  25 ++
>>   .../devicetree/bindings/watchdog/st_lpc_wdt.txt    |  38 +++
>>   MAINTAINERS                                        |   2 +
>>   arch/arm/boot/dts/stih407-family.dtsi              |  20 ++
>>   arch/arm/configs/multi_v7_defconfig                |   2 +
>>   drivers/rtc/Kconfig                                |  12 +
>>   drivers/rtc/Makefile                               |   1 +
>>   drivers/rtc/rtc-st-lpc.c                           | 354 +++++++++++++++++++++
>>   drivers/watchdog/Kconfig                           |  13 +
>>   drivers/watchdog/Makefile                          |   1 +
>>   drivers/watchdog/st_lpc_wdt.c                      | 344 ++++++++++++++++++++
>>   include/dt-bindings/mfd/st-lpc.h                   |  15 +
>>   12 files changed, 827 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/rtc-st-lpc.txt
>>   create mode 100644 Documentation/devicetree/bindings/watchdog/st_lpc_wdt.txt
>>   create mode 100644 drivers/rtc/rtc-st-lpc.c
>>   create mode 100644 drivers/watchdog/st_lpc_wdt.c
>>   create mode 100644 include/dt-bindings/mfd/st-lpc.h
>>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
