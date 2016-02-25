From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH v2 2/2] rtc: rtc-pic32: Add PIC32 real time clock driver
Date: Thu, 25 Feb 2016 09:23:55 -0700
Message-ID: <56CF2A9B.5080005@microchip.com>
References: <1455905390-3491-2-git-send-email-joshua.henderson@microchip.com>
 <20160224222555.GA12073@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160224222555.GA12073-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/24/2016 03:25 PM, Alexandre Belloni wrote:
> Hi,
> 
> On 19/02/2016 at 11:09:45 -0700, Joshua Henderson wrote :
>> +static int pic32_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
>> +{
>> +	struct pic32_rtc_dev *pdata = dev_get_drvdata(dev);
>> +	void __iomem *base = pdata->reg_base;
>> +	unsigned int tries = 0;
>> +
>> +	clk_enable(pdata->clk);
>> +
>> +	do {
>> +		rtc_tm->tm_hour = readb(base + PIC32_RTCHOUR);
>> +		rtc_tm->tm_min = readb(base + PIC32_RTCMIN);
>> +		rtc_tm->tm_mon  = readb(base + PIC32_RTCMON);
>> +		rtc_tm->tm_mday = readb(base + PIC32_RTCDAY);
>> +		rtc_tm->tm_year = readb(base + PIC32_RTCYEAR);
>> +		rtc_tm->tm_sec  = readb(base + PIC32_RTCSEC);
>> +
>> +		/*
>> +		 * The only way to work out whether the system was mid-update
>> +		 * when we read it is to check the second counter, and if it
>> +		 * is zero, then we re-try the entire read.
>> +		 */
>> +		tries = 1;
>> +	} while (rtc_tm->tm_sec == 0 && tries < 2);
>> +
> 
> This doesn't seem right. It will wait up to a second as tries will
> always be less than 2, this is probably not what you want.

Dang good catch.  When fixed, it will work as expected:

# hwclock
tries 1
Sun Oct 17 19:23:59 2010  0.000000 seconds
# hwclock
tries 1
tries 2
Sun Oct 17 19:24:00 2010  0.000000 seconds
# hwclock
tries 1
Sun Oct 17 19:24:01 2010  0.000000 seconds

Josh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
