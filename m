From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v2 1/5] mfd: 88pm800: Fix tabbing issue
Date: Tue, 25 Aug 2015 16:19:18 +0530
Message-ID: <55DC482E.8030206@linaro.org>
References: <1440442594-3102-1-git-send-email-vaibhav.hiremath@linaro.org> <1440442594-3102-2-git-send-email-vaibhav.hiremath@linaro.org> <20150825075121.GE19409@x1> <55DC2A51.6090008@linaro.org> <20150825103019.GP19409@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150825103019.GP19409@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tuesday 25 August 2015 04:00 PM, Lee Jones wrote:
> On Tue, 25 Aug 2015, Vaibhav Hiremath wrote:
>> On Tuesday 25 August 2015 01:21 PM, Lee Jones wrote:
>>> On Tue, 25 Aug 2015, Vaibhav Hiremath wrote:
>>>
>>>> Driver had coding style issues where spaces were used instead
>>>> of tabs. This patch fixes them all.
>>>
>>> That's not all it's doing though is it?
>>>
>>
>> Yes, its just tabbing related fixes.
>
> No, it's really not.
>
>>> Please describe all of your changes.
>
> ... we're also taking the opportunity to remove the unnecessary
> protection surrounding some of the defined values.
>

Ohhh ok. Forgot about brackets :)

Anyway,
Based on the comments you provided, I think both header file and
source file needs some more cleanup.
I will try to incorporate all changes in next version.

I may also submit separate series for cleanup version (depends on
patches I produce).

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
