From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCHv2 1/2] dt-bindings: adi,adv7511.txt: document cec clock
Date: Tue, 19 Sep 2017 12:07:37 +0200
Message-ID: <7bfcd125-db23-61e3-2bc9-67e5c11f27fa@xs4all.nl>
References: <20170919073331.29007-1-hverkuil@xs4all.nl>
 <20170919073331.29007-2-hverkuil@xs4all.nl>
 <505bc74f-6563-ab1d-9aab-7893410aef7e@cogentembedded.com>
 <74b252c8-c1eb-8498-7b9b-54604fe2806a@cisco.com>
 <e68cffb1-346c-2018-9048-3f8523903809@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e68cffb1-346c-2018-9048-3f8523903809-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Hans Verkuil <hansverk-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/19/17 11:35, Sergei Shtylyov wrote:
> On 9/19/2017 12:29 PM, Hans Verkuil wrote:
> 
>>>> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>>>
>>>> Document the cec clock binding.
>>>>
>>>> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>>>> index 06668bca7ffc..4497ae054d49 100644
>>>> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
>>>> @@ -68,6 +68,8 @@ Optional properties:
>>>>    - adi,disable-timing-generator: Only for ADV7533. Disables the internal timing
>>>>      generator. The chip will rely on the sync signals in the DSI data lanes,
>>>>      rather than generate its own timings for HDMI output.
>>>> +- clocks: from common clock binding: handle to CEC clock.
>>>
>>>      It's called "phandle" in the DT speak. :-)
>>>      Are you sure the clock specifier would always be absent?
>>
>> Sorry? I don't understand the question. Did you mean: "can be absent?"?
> 
>     No, you only say that there'll be the clock phandle only. The clock 
> specifier may follow the phandle for the clock devices that have 
> "#clock-cells" prop != 0.

I have to say that I just copy-and-pasted this from other bindings. Would
this be better?

- clocks: list of clock specifiers, corresponding to entries in
  the clock-names property;
- clock-names: from common clock binding: must be "cec".

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
