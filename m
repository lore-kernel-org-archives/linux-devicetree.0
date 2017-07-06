From: Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 2/2] rtc: stm32: add STM32H7 RTC support
Date: Thu, 6 Jul 2017 09:33:00 +0200
Message-ID: <ebe3f3f0-263d-cf6c-6b6e-2f37ab435c88@st.com>
References: <1498470689-26829-1-git-send-email-amelie.delaunay@st.com>
 <1498470689-26829-3-git-send-email-amelie.delaunay@st.com>
 <20170705213746.6hf5af57ty6wsfgs@piout.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <rtc-linux+bncBC2IT2GSZUDRBM6P67FAKGQENTA25UI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170705213746.6hf5af57ty6wsfgs-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 07/05/2017 11:37 PM, Alexandre Belloni wrote:
> Hi,
> 
> This is mostly fine, even if I'm not too happy with the
> s/ck_rtc/rtc_ck/.
> 
This clock name has changed in datasheet between STM32F4/STM32F7 and 
STM32H7, so, I'm not really happy too... But, as there is only one clock 
on F4/F7, its name is not important for the end user. Now that pclk 
appears, we need to distinguish the two clocks, and for the end user, it 
is better if the clock names match the datasheet.

> On 26/06/2017 at 11:51:29 +0200, Amelie Delaunay wrote:
>> -	rtc->ck_rtc = devm_clk_get(&pdev->dev, NULL);
>> -	if (IS_ERR(rtc->ck_rtc)) {
>> -		dev_err(&pdev->dev, "no ck_rtc clock");
>> -		return PTR_ERR(rtc->ck_rtc);
>> +	match = of_match_device(stm32_rtc_of_match, &pdev->dev);
>> +	if (match && match->data)
>> +		rtc->data = (struct stm32_rtc_data *)match->data;
>> +	else
>> +		return -EINVAL;
> 
> This will never happen, you can remove that test.
> 
> 
OK, will be done in V2.

Thanks for the review,
Amelie

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
