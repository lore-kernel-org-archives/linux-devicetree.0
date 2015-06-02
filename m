From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] mfd: 88pm800: allocate pdata->rtc if not allocated
 earlier
Date: Tue, 02 Jun 2015 15:19:38 +0530
Message-ID: <556D7C32.9080806@linaro.org>
References: <1432937962-4537-1-git-send-email-vaibhav.hiremath@linaro.org> <1432937962-4537-5-git-send-email-vaibhav.hiremath@linaro.org> <20150601082200.GC3329@x1> <556D3A14.6050505@linaro.org> <20150602074004.GH3329@x1> <556D71F6.4030608@linaro.org> <20150602093323.GI3329@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150602093323.GI3329@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On Tuesday 02 June 2015 03:03 PM, Lee Jones wrote:
> On Tue, 02 Jun 2015, Vaibhav Hiremath wrote:
>> On Tuesday 02 June 2015 01:10 PM, Lee Jones wrote:
>>> On Tue, 02 Jun 2015, Vaibhav Hiremath wrote:
>>>> On Monday 01 June 2015 01:52 PM, Lee Jones wrote:
>>>>> On Sat, 30 May 2015, Vaibhav Hiremath wrote:
>>>>>
>>>>>> RTC in pmic 88PM800 can run even the core is powered off, and user
>>>>>> can set alarm in RTC. When the alarm is timed out, the PMIC will power up
>>>>>> the core, and the whole system will boot up. And during PMIC driver probe,
>>>>>> it will read some register to find out whether this boot is caused by RTC
>>>>>> timeout or not, and pass on this information to the RTC driver.
>>>>>>
>>>>>> So we need rtc platform data to be existed in PMIC driver to pass this
>>>>>> information.
>>>>>>
>>>>>> Signed-off-by: Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>>>>>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>>> ---
>>>>>>   drivers/mfd/88pm800.c | 19 +++++++++++++++++++
>>>>>>   1 file changed, 19 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
>>>>>> index 8ea4467..34546a1 100644
>>>>>> --- a/drivers/mfd/88pm800.c
>>>>>> +++ b/drivers/mfd/88pm800.c
>>>>>> @@ -586,6 +586,25 @@ static int pm800_probe(struct i2c_client *client,
>>>>>>   			return ret;
>>>>>>   	}
>>>>>>
>>>>>> +	/*
>>>>>> +	 * RTC in pmic can run even the core is powered off, and user can set
>>>>>> +	 * alarm in RTC. When the alarm is time out, the PMIC will power up
>>>>>> +	 * the core, and the whole system will boot up. When PMIC driver is
>>>>>> +	 * probed, it will read out some register to find out whether this
>>>>>> +	 * boot is caused by RTC timeout or not, and it need pass this
>>>>>> +	 * information to RTC driver.
>>>>>> +	 * So we need rtc platform data to be existed to pass this information.
>>>>>> +	 */
>>>>>> +	if (!pdata->rtc) {
>>>>>> +		pdata->rtc = devm_kzalloc(&client->dev,
>>>>>> +					  sizeof(*(pdata->rtc)), GFP_KERNEL);
>>>>>> +		if (!pdata->rtc) {
>>>>>> +			dev_err(&client->dev,
>>>>>> +					"failed to allocate memory for rtc\n");
>>>>>> +			return -ENOMEM;
>>>>>> +		}
>>>>>> +	}
>>>>>> +
>>>>>
>>>>> Where is this memory first used?
>>>>>
>>>>
>>>> In the same file, look for field "rtc_wakeup".
>>>>
>>>> FYI,
>>>>
>>>> This field is used in two files,
>>>>
>>>> drivers/mfd/88pm800.c
>>>> and
>>>> drivers/rtc/rtc-88pm800.c	[sets the "platform_data" field]
>>>
>>> Then were is the platform_data field subsequently used?
>>
>> Currently not used, but it is for future use, where we would be
>> interested to know that the wakeup is really from reset or RTC wakeup.
>
> Well it was introduced 3 years ago, so the chances of it being "used
> in the future" are probably pretty low.  Unless of course, you are
> planning on submitting that code.  In which case, you can add this
> patch to that set and I can re-review it then.
>
>>> Looking at the RTC platform data declaration I see:
>>>
>>> struct pm80x_rtc_pdata {
>>>      int             vrtc;
>>>      int             rtc_wakeup;
>>> };
>>>
>>> Is 'vrtc' even used?  If so, where?
>>
>> No, it is not.
>
> So either submit a patch-set that makes use of them, or let me know
> that you're not going to do that and I'll remove it altogether.
> Likewise for rtc_wakeup.
>

I am ok with vrtc field, we can remove it.

But,
I would recommend _not_ to remove rtc_wakeup, as it may not be used 
immediately, but still have logical significance.

Consuming rtc_wakeup in the code is dependant on overall power
management support, which is always long pole for development. As you
would have seen, we have just started with baseport for pxa1928 and I
am starting on upstreaming driver part.


 From hardware perspective, this is important feature, where it indicate
whether the boot was triggered by reset assertion or by RTC wakeup. So
as of now from driver perspective I feel no harm to have one field for
this.


Finally, its your call. I will let you decide.
The field can be added later when it actually gets consumed.

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
