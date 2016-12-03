From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rtc: add support for EPSON TOYOCOM RTC-7301SF/DG
Date: Sun, 4 Dec 2016 00:40:28 +0900
Message-ID: <CAC5umyir0+i8cg4+1EtoAx40vr0LX+6E2K=VVUnrnN+i3Li4jg@mail.gmail.com>
References: <1472396118-13424-1-git-send-email-akinobu.mita@gmail.com> <20161130210152.hiyfa3srismgvtj5@piout.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCPM5SUWUYIRBAGPRPBAKGQEG7VL4OA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161130210152.hiyfa3srismgvtj5-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-12-01 6:01 GMT+09:00 Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> Hi,
>
> Sorry for the very late review!
>
> It seems mostly fine for me, two small comments:
>
> On 28/08/2016 at 23:55:18 +0900, Akinobu Mita wrote :
>> diff --git a/drivers/rtc/rtc-r7301.c b/drivers/rtc/rtc-r7301.c
>> new file mode 100644
>> index 0000000..b1be281
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-r7301.c
>> @@ -0,0 +1,458 @@
>> +/*
>> + * EPSON TOYOCOM RTC-7301SF/DG Driver
>> + *
>> + * Copyright (c) 2016 Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> + *
>> + * Based on rtc-rp5c01.c
>> + *
>> + * Datasheet: http://www5.epsondevice.com/en/products/parallel/rtc7301sf.html
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/delay.h>
>> +#include <linux/regmap.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/rtc.h>
>> +
>> +#define DRV_NAME "rtc-r7301"
>> +
>> +enum {
>> +     RTC7301_1_SEC           = 0x0,  /* Bank 0 and Band 1 */
>> +     RTC7301_10_SEC          = 0x1,  /* Bank 0 and Band 1 */
>> +     RTC7301_AE              = BIT(3),
>> +     RTC7301_1_MIN           = 0x2,  /* Bank 0 and Band 1 */
>> +     RTC7301_10_MIN          = 0x3,  /* Bank 0 and Band 1 */
>> +     RTC7301_1_HOUR          = 0x4,  /* Bank 0 and Band 1 */
>> +     RTC7301_10_HOUR         = 0x5,  /* Bank 0 and Band 1 */
>> +     RTC7301_DAY_OF_WEEK     = 0x6,  /* Bank 0 and Band 1 */
>> +     RTC7301_1_DAY           = 0x7,  /* Bank 0 and Band 1 */
>> +     RTC7301_10_DAY          = 0x8,  /* Bank 0 and Band 1 */
>> +     RTC7301_1_MONTH         = 0x9,  /* Bank 0 */
>> +     RTC7301_10_MONTH        = 0xa,  /* Bank 0 */
>> +     RTC7301_1_YEAR          = 0xb,  /* Bank 0 */
>> +     RTC7301_10_YEAR         = 0xc,  /* Bank 0 */
>> +     RTC7301_100_YEAR        = 0xd,  /* Bank 0 */
>> +     RTC7301_1000_YEAR       = 0xe,  /* Bank 0 */
>> +     RTC7301_ALARM_CONTROL   = 0xe,  /* Bank 1 */
>> +     RTC7301_ALARM_CONTROL_AIE       = BIT(0),
>> +     RTC7301_ALARM_CONTROL_AF        = BIT(1),
>> +     RTC7301_TIMER_CONTROL   = 0xe,  /* Bank 2 */
>> +     RTC7301_ALARM_CONTROL_TIE       = BIT(0),
>> +     RTC7301_ALARM_CONTROL_TF        = BIT(1),
>> +     RTC7301_CONTROL         = 0xf,  /* All banks */
>> +     RTC7301_CONTROL_BUSY            = BIT(0),
>> +     RTC7301_CONTROL_STOP            = BIT(1),
>> +     RTC7301_CONTROL_BANK_SEL_0      = BIT(2),
>> +     RTC7301_CONTROL_BANK_SEL_1      = BIT(3),
>> +};
>> +
>
> Any particular reason why you use an enum instead of the usual #define?

No particular reason.  A part of this driver is based on rtc-rp5c01.c
which declares the register addresses like this.

> [...]
>
>> +static void rtc7301_init(struct rtc7301_priv *priv)
>> +{
>> +     unsigned long flags;
>> +
>> +     spin_lock_irqsave(&priv->lock, flags);
>> +
>> +     rtc7301_select_bank(priv, 1);
>> +     rtc7301_alarm_irq(priv, false);
>> +
>
> If the RTC is battery backed, it may still run with the core power off
> and maybe someone will actually expect the alarm to trigger at a later
> time.

You're right.  I'll remove these lines.

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
