From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] mfd: devicetree: bindings: Add clock subdevice node information
Date: Thu, 30 Jul 2015 17:21:56 -0500
Message-ID: <CAL_Jsq+BuhbHgnYi6HfAJx986vtDuUJzbxBRgivX9pF1GhUSvQ@mail.gmail.com>
References: <1437476823-3358-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1437476823-3358-3-git-send-email-vaibhav.hiremath@linaro.org>
 <CAJKOXPeUJ-7je67q+9X1_FcFiczoQ6rqwMAoPLswapFEmqGGVg@mail.gmail.com> <55BAA17F.1070305@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55BAA17F.1070305-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 30, 2015 at 5:13 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 07/22/2015 10:08 PM, Krzysztof Kozlowski wrote:
>>
>> 2015-07-21 20:07 GMT+09:00 Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>>>
>>> This patch updates the binding documentation for optional
>>> clocks node and related information for buffered 32KHz clock.
>>>
>>> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> ---
>>>   Documentation/devicetree/bindings/mfd/88pm800.txt | 28
>>> +++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>
>> +Cc Stephen Boyd (clocks)
>>
>> We had a discussion whether clock bindings should be put in MFD
>> bindings documentation or into separate file in bindings/clock but
>> either way is fine for me:
>
>
> No patch? :)
>
> I think Rob has been pushing for MFDs to document everything within one
> file, but either way is fine from clk perspective.

I don't recall that exactly. I did say that child bindings need to
point back to the MFD binding. So this is fine with me:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
