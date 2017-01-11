From: Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCHv3 3/8] rtc: add STM32 RTC driver
Date: Wed, 11 Jan 2017 11:07:16 +0100
Message-ID: <1feb3a23-7450-2b5c-9c1c-c7ecacd7fa17@st.com>
References: <1483623809-29937-1-git-send-email-amelie.delaunay@st.com>
 <1483623809-29937-4-git-send-email-amelie.delaunay@st.com>
 <20170111000803.mlie6kizcsj2o7lh@piout.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <rtc-linux+bncBC2IT2GSZUDRBY4H3DBQKGQEEXXVFNY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170111000803.mlie6kizcsj2o7lh-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

On 01/11/2017 01:08 AM, Alexandre Belloni wrote:
> Looks good to me, however...
>
>
> On 05/01/2017 at 14:43:24 +0100, Amelie Delaunay wrote :
>> +struct stm32_rtc {
>> +	struct rtc_device *rtc_dev;
>> +	void __iomem *base;
>> +	struct clk *ck_rtc;
>> +	spinlock_t lock; /* Protects registers accesses */
>
> This spinlock seems to be useless, the rtc ops_lock is already
> protecting everywhere it is taken.
>
After having a deeper look on ops_lock, it seems this one is sufficient, 
so I'll remove all spinlock uses in this driver.
>> +	int irq_alarm;
>> +};
>> +
>
> [...]
>
>> +static int stm32_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +	struct stm32_rtc *rtc = dev_get_drvdata(dev);
>> +	struct rtc_time *tm = &alrm->time;
>> +	unsigned long irqflags;
>> +	unsigned int cr, isr, alrmar;
>> +	int ret = 0;
>> +
>> +	if (rtc_valid_tm(tm)) {
>> +		dev_err(dev, "Alarm time not valid.\n");
>> +		return -EINVAL;
>
> This will never happen, tm is already checked multiple times (up to
> three) in the core before this function can be called.
>
You're right. I'll remove all rtc_valid_tm calls.
>> +	}
>> +
>
> You don't need to resend the whole series, just this patch. I'll take
> 2/8 and 3/8, the other ones can go through the stm32 tree.
>
Thanks for reviewing. I send a v4 for this patch right now.

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
