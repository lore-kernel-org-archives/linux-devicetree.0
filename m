From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 7/9] dt-bindings: media/s5p-cec.txt: document needs-hpd property
Date: Fri, 9 Jun 2017 11:46:59 -0500
Message-ID: <CAL_JsqLYwwYtFeYc8UcxGGzDWDOkri53SYDc+25XQwmsd3+aLA@mail.gmail.com>
References: <20170607144616.15247-1-hverkuil@xs4all.nl> <20170607144616.15247-8-hverkuil@xs4all.nl>
 <20170609140719.o2qzty6eyez66oxy@rob-hp-laptop> <2fa55431-bef2-9340-4ce8-e06f9648e109@xs4all.nl>
 <CAL_JsqLzxMSdQGCiCBa2-VKpe==djCsqP9GxywJ-X-defiRXMQ@mail.gmail.com> <8e6ed9b6-5b4b-8650-2c92-47a593e73d94@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8e6ed9b6-5b4b-8650-2c92-47a593e73d94-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hansverk-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 9, 2017 at 10:55 AM, Hans Verkuil <hansverk-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
> On 06/09/2017 05:31 PM, Rob Herring wrote:
>> On Fri, Jun 9, 2017 at 9:11 AM, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> wrote:
>>> On 09/06/17 16:07, Rob Herring wrote:
>>>> On Wed, Jun 07, 2017 at 04:46:14PM +0200, Hans Verkuil wrote:
>>>>> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>>>>
>>>>> Needed for boards that wire the CEC pin in such a way that it
>>>>> is unavailable when the HPD is low.
>>>>>
>>>>> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>>>> Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>>> Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>>> ---
>>>>>  Documentation/devicetree/bindings/media/s5p-cec.txt | 6 ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/s5p-cec.txt b/Documentation/devicetree/bindings/media/s5p-cec.txt
>>>>> index 4bb08d9d940b..261af4d1a791 100644
>>>>> --- a/Documentation/devicetree/bindings/media/s5p-cec.txt
>>>>> +++ b/Documentation/devicetree/bindings/media/s5p-cec.txt
>>>>> @@ -17,6 +17,12 @@ Required properties:
>>>>>    - samsung,syscon-phandle - phandle to the PMU system controller
>>>>>    - hdmi-phandle - phandle to the HDMI controller
>>>>>
>>>>> +Optional:
>>>>> +  - needs-hpd : if present the CEC support is only available when the HPD
>>>>> +    is high. Some boards only let the CEC pin through if the HPD is high, for
>>>>> +    example if there is a level converter that uses the HPD to power up
>>>>> +    or down.
>>>>
>>>> Seems like something common. Can you document in a common location?
>>>
>>> Should we do the same with hdmi-phandle? It is also used by CEC drivers to find
>>> the HDMI driver.
>>
>> Yes.
>>
>>> Currently only used by s5p-cec and stih-cec, but there will be more.
>>>
>>> I guess this would be a sensible place to document this:
>>>
>>> Documentation/devicetree/bindings/media/cec.txt
>>
>> Sounds good. You can do this as a follow-up to this patch if you want.
>> For this one:
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>
> Sorry, I have what might be a stupid question: should I update the s5p-cec.txt
> to refer to the cec.txt bindings file for the hdmi-phandle and needs-hpd instead
> of describing it here? It seems pointless to do that for the hdmi-phandle, but
> it might make more sense for the needs-hpd property.

Yes. Just make both say "see ./cec.txt". You're right it doesn't gain
much for hdmi-phandle, but at least indicates it is a standard
property.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
