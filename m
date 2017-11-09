From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v2 2/2] rtc: sprd: Add Spreadtrum RTC driver
Date: Thu, 9 Nov 2017 09:53:01 +0800
Message-ID: <CAMz4kuJ4ZazBSWCi2mtZuj0gEaJ1CYB7Y=4oui6CD-nZBEOzXA@mail.gmail.com>
References: <c65b61e5e37cb43214973cb3e479ce06c4a73395.1510132279.git.baolin.wang@spreadtrum.com>
 <6482283a3ae8c6ec35d0a7a078420151a69b8aca.1510132279.git.baolin.wang@spreadtrum.com>
 <20171109012653.32zkqyh5p4jqhftr@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171109012653.32zkqyh5p4jqhftr@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

On 9 November 2017 at 09:26, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> Hi,
>
> On 08/11/2017 at 17:16:15 +0800, Baolin Wang wrote:
>> +static int sprd_rtc_read_time(struct device *dev, struct rtc_time *tm)
>> +{
>> +     struct sprd_rtc *rtc = dev_get_drvdata(dev);
>> +     time64_t secs;
>> +     int ret;
>> +
>
> I would have expected a check for SPRD_RTC_POWER_RESET_FLAG here.

Actually I want to create one separate patch to add this feature. But
like you suggested, I can add this checking in here in next version.
Thanks for your suggestion.

>
>
>> +     ret = sprd_rtc_get_secs(rtc, SPRD_RTC_TIME, &secs);
>> +     if (ret)
>> +             return ret;
>> +
>> +     rtc_time64_to_tm(secs, tm);
>> +     return rtc_valid_tm(tm);
>> +}
>> +
>> +static int sprd_rtc_set_time(struct device *dev, struct rtc_time *tm)
>> +{
>> +     struct sprd_rtc *rtc = dev_get_drvdata(dev);
>> +     time64_t secs = rtc_tm_to_time64(tm);
>> +
>
> And you need to reset SPRD_RTC_POWER_RESET_FLAG here
>
>> +     return sprd_rtc_set_secs(rtc, SPRD_RTC_TIME, secs);
>> +}
>> +

-- 
Baolin.wang
Best Regards
