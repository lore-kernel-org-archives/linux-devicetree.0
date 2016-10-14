From: Michael Scott <michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC V3 PATCH 5/7] arm64: dts: msm8994 SoC and Huawei Angler
 (Nexus 6P) support
Date: Fri, 14 Oct 2016 15:06:45 -0700
Message-ID: <6be08daf-0ad7-7913-ee63-854d52eb6ba1@linaro.org>
References: <1476265054-22511-1-git-send-email-jeremymc@redhat.com>
 <1476265054-22511-6-git-send-email-jeremymc@redhat.com>
 <20161012133450.GC21050@remoulade>
 <CAL_JsqLMs3cE6qne_GN-3E7c1ub_6U0y5UF0aLkxUD=k5fiOTw@mail.gmail.com>
 <3e641d25-8ca6-3594-5d3e-038d6f7a9eba@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3e641d25-8ca6-3594-5d3e-038d6f7a9eba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 10/12/2016 05:42 PM, Jeremy McNicoll wrote:
> On 2016-10-12 7:20 AM, Rob Herring wrote:
>> On Wed, Oct 12, 2016 at 8:34 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> 
>> wrote:
>>> On Wed, Oct 12, 2016 at 02:37:32AM -0700, Jeremy McNicoll wrote:
>>>> +/ {
>>>> +     model = "HUAWEI MSM8994 ANGLER rev-1.01";
>>>> +     compatible = "qcom,msm8994";
>>>> +     qcom,board-id= <8026 0>;

Hello Jeremy,

When I tested these patches on linux-next, the bootloader on my Nexus 6P 
wasn't finding the dtb until I adjusted the board-id value to <8023 0>.

Apparently, my hardware matches "Huawei Technologies, Inc. MSM8994 
Angler VN2" in the original kernel sources:
https://android.googlesource.com/kernel/msm/+/android-msm-angler-3.10-nougat/arch/arm64/boot/dts/huawei/huawei_angler_vn2.dts

I'm not sure what the most common hardware is out in the wild, but the 
board-id for your dts comes from this commit, which seems to indicate 
it's a DVT model (as opposed to a PVT model):
https://android.googlesource.com/kernel/msm/+/e9a476191862cfe8e5e30e2babc04052f9ab936b

We should definitely get a sample size of > 1

- Mike

>>>> +};
>>>
>>> This last property is undocumented, and unused.
>>
>> They are required by the bootloader which AIUI can't/won't be updated
>> to use the mainline compatible string. The alternative is leave them
>
> That is my understanding as well after talking to some QC people over
> beer the other night.
>
>> out and then you have to run the dtb thru QC's dtbTool to add them
>> which is worse IMO.
>>
>
> If there is an expectation that one has to run the dtbTool as a post
> compilation thing, in my opinion its not a good idea.  But if that is
> the path that is decided (not my personal favourite) then we should
> at least let people know somehow that they have to run this tool in
> order to boot their kernel.   (dont like that either)
>
>
> Its already hard enough to get debug serial going, or figuring out how 
> to get serial debug out.  We should make it as easy as possible for 
> people that want to contribute and help.   Google did _NOT_ lock down 
> these phones on purpose so that people can do what they want with them 
> (within reason).  The fewer barriers to entry the better.
>
>
>
>> I'd also leave them undocumented as we want to minimize their usage.
>>
>
> I agree with this and will leave policing of their usage to RobH ;-)
>
> -jeremy
>
>
>> Rob
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe 
>> linux-arm-msm" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe 
> linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
