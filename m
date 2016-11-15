From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: drm/bridge: adv7511: Add regulator
 bindings
Date: Tue, 15 Nov 2016 09:05:29 +0530
Message-ID: <533189c2-ccff-ed68-eb03-c56ad7e020bf@codeaurora.org>
References: <1472640730-24326-1-git-send-email-architt@codeaurora.org>
 <737415023.GKbfqYIf4s@avalon> <57E8C2CB.9000806@codeaurora.org>
 <1527982.jPo8JkVTxZ@avalon>
 <e3d74745-fd14-63f1-e93f-f57e886e26ed@codeaurora.org>
 <CAL_Jsq+KMPoyWvh1U3OKL6pX8D4QByqVFgcMks8myDfZEYeFCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+KMPoyWvh1U3OKL6pX8D4QByqVFgcMks8myDfZEYeFCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 11/10/2016 07:04 AM, Rob Herring wrote:
> On Fri, Oct 14, 2016 at 12:40 AM, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> Hi Rob,
>>
>>
>> On 09/26/2016 01:42 PM, Laurent Pinchart wrote:
>>>
>>> Hi Archit,
>>>
>>> On Monday 26 Sep 2016 12:10:11 Archit Taneja wrote:
>>>>
>>>> On 9/25/2016 10:58 PM, Laurent Pinchart wrote:
>>>>>
>>>>> On Friday 23 Sep 2016 14:50:27 Archit Taneja wrote:
>>>>>>
>>>>>> Add the regulator supply properties needed by ADV7511 and ADV7533. The
>>>>>> regulator names are named after the pin names, except for DVDD_3V on
>>>>>> ADV7511, which is left v3p3 to have the same name as it's on ADV7533.
>>>>>>
>>>>>> ADV7511 has a BGVDD pin for which the voltage to be configured isn't
>>>>>> clear. This needs to be updated in the document later.
>>>>>>
>>>>>> The regulators are specified as optional properties since there can
>>>>>> be boards which have a fixed supply directly routed to the pins, and
>>>>>> these may not be modelled as regulator supplies.
>>>>>>
>>>>>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>>>> Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>>>>>> ---
>>>>>> v2:
>>>>>> - Specify regulator supplies for ADV7511 too.
>>>>>> - Have separate supply entries for AVDD, DVDD, PVDD, A2VDD pins.
>>>>>> - Add additional BGVDD supply for ADV7511.
>>>>>>
>>>>>>   .../devicetree/bindings/display/bridge/adi,adv7511.txt     | 14
>>>>>> +++++++
>>>>>>   1 file changed, 14 insertions(+)
>>>>>>
>>>>>> diff --git
>>>>>> a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>>>>>> b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>>>>>> index
>>>>>> 6532a59..66e6bae 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>>>>>>
>>>>>> @@ -56,6 +56,20 @@ Optional properties:
>>>>>>   - adi,disable-timing-generator: Only for ADV7533. Disables the
>>>>>> internal
>>>>>>
>>>>>> timing generator. The chip will rely on the sync signals in the DSI
>>>>>> data
>>>>>> lanes, rather than generate its own timings for HDMI output.
>>>>>> +- avdd-supply: A 1.8V supply that powers up the AVDD pin on the chip.
>>>>>> +- dvdd-supply: A 1.8V supply that powers up the DVDD pin on the chip.
>>>>>> +- pvdd-supply: A 1.8V supply that powers up the PVDD pin on the chip.
>>>>>> +- v3p3-supply: A 3.3V supply that powers up the pin called DVDD_3V on
>>>>>> +  ADV7511 and V3P3 on ADV7533.
>>>>>> +
>>>>>> +ADV7511 specific supplies:
>>>>>> +- bgvdd-supply: Powers the BGVDD pin. The voltage isn't clear from
>>>>>> +  available datasheets.
>>>>>
>>>>>
>>>>> It's a 1.8V supply. The ADV7511 hardware user's guide recommends tying
>>>>> it
>>>>> to the PVDD supply, so I'm not sure we need a separate supply in DT.
>>>>
>>>>
>>>> Thanks for providing the info. I'll update it in the doc.
>>>>
>>>>> Similarly, the user's guide recommends supplying the AVDD, DVDD and PVDD
>>>>> pins with a single 1.8V LDO and three independent filters. We could thus
>>>>> possibly combine them into a single 1.8V supply.
>>>>
>>>>
>>>> I'd originally specified only one AVDD supply for all the 1.8 V
>>>> supplies, but Rob had recommended using separate supplies for each pin.
>>>>
>>>> I guess it doesn't do much harm specifying separate supplies, a
>>>> board can just provide avdd-supply, and the rest would be assumed dummy.
>>>
>>>
>>> DT should use the same regulator phandle for all power supplies in that
>>> case,
>>> not specify a single one.
>>>
>>>> It could also help describe boards which may not have followed the
>>>> user guide's recommendation, but I agree that's probably a rare
>>>> scenario.
>>>>
>>>> Is it okay if we stick with multiple supplies as it is in this version?
>>>
>>>
>>> It seems overkill to me but I can live with that. I'd remove the bgvdd
>>> supply
>>> though.
>>>
>>> Rob, what's your opinion on this ? Is there a specific reason why you
>>> prefer
>>> splitting the 1.8V supply in one supply per pin, when the hardware user's
>>> guide recommend powering them from the same LDO ?
>>
>>
>> Could you suggest us which way to go?
>
> If they are really intended to be the same supply, then combining them
> is fine with me.

Thanks, I'll change my patchset accordingly.

Archit

>
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
