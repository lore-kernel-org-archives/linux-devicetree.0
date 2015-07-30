From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/4] mfd: devicetree: bindings: Add clock subdevice node
 information
Date: Thu, 30 Jul 2015 15:13:19 -0700
Message-ID: <55BAA17F.1070305@codeaurora.org>
References: <1437476823-3358-1-git-send-email-vaibhav.hiremath@linaro.org> <1437476823-3358-3-git-send-email-vaibhav.hiremath@linaro.org> <CAJKOXPeUJ-7je67q+9X1_FcFiczoQ6rqwMAoPLswapFEmqGGVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJKOXPeUJ-7je67q+9X1_FcFiczoQ6rqwMAoPLswapFEmqGGVg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgMichael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/22/2015 10:08 PM, Krzysztof Kozlowski wrote:
> 2015-07-21 20:07 GMT+09:00 Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>> This patch updates the binding documentation for optional
>> clocks node and related information for buffered 32KHz clock.
>>
>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/mfd/88pm800.txt | 28 +++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
> +Cc Stephen Boyd (clocks)
>
> We had a discussion whether clock bindings should be put in MFD
> bindings documentation or into separate file in bindings/clock but
> either way is fine for me:

No patch? :)

I think Rob has been pushing for MFDs to document everything within one 
file, but either way is fine from clk perspective.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
