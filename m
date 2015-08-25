From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH-v2 1/5] mfd: 88pm800: Fix tabbing issue
Date: Tue, 25 Aug 2015 16:26:16 +0530
Message-ID: <55DC49D0.1030608@linaro.org>
References: <1440442594-3102-1-git-send-email-vaibhav.hiremath@linaro.org> <1440442594-3102-3-git-send-email-vaibhav.hiremath@linaro.org> <20150825075246.GF19409@x1> <55DC2C4D.1040304@linaro.org> <20150825103546.GQ19409@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150825103546.GQ19409@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tuesday 25 August 2015 04:05 PM, Lee Jones wrote:
> On Tue, 25 Aug 2015, Vaibhav Hiremath wrote:
>
>>
>>
>> On Tuesday 25 August 2015 01:22 PM, Lee Jones wrote:
>>> On Tue, 25 Aug 2015, Vaibhav Hiremath wrote:
>>>
>>>> Driver had coding style issues where spaces were used instead
>>>> of tabs. This patch fixes them all.
>>>>
>>>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> ---
>>>>   drivers/mfd/88pm800.c | 125 ++++++++++++++++++++++++--------------------------
>>>>   1 file changed, 61 insertions(+), 64 deletions(-)
>>>
>>> Same comment as before.
>>>
>>> How similar is this file to the other one?
>>
>> I believe you are referring to include/linux/mfd/88pm80x.h
>>
>>>
>>> Can you reduce the size by having shared register defines?
>>>
>>
>> Not sure whether I understand your comment here,
>> They are common defines.
>
> I guess the question was a little convoluted.
>
> How about; why are the extra defines in the driver?  Why aren't all of
> them in the header file?  What is the difference between the defines
> in the C file compared with the ones defined in the header?
>


I do not see any difference and need of having defines separately in C
file.
That's the cleanup I was referring to in another email.

I will walk through the whole driver code and try to cleanup all such
coding related issues. Probably expect separate series here.

Thanks,
Vaibhav
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
