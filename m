From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: devicetree: dwc3: Add interrupt
 moderation
Date: Mon, 31 Oct 2016 13:28:28 -0700
Message-ID: <d2e54dd2-a400-39d4-3fc9-c41ba45bdb18@synopsys.com>
References: <cover.1477424426.git.johnyoun@synopsys.com>
 <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun@synopsys.com>
 <87eg32t6fn.fsf@linux.intel.com>
 <911fcadd-b852-d9db-c733-2df7c106c8d1@synopsys.com>
 <87shrgss3f.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87shrgss3f.fsf-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/28/2016 3:09 AM, Felipe Balbi wrote:
> 
> Hi,
> 
> John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
>> On 10/27/2016 3:47 AM, Felipe Balbi wrote:
>>>
>>> Hi,
>>>
>>> John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
>>>> Add interrupt moderation interval binding for dwc3.
>>>>
>>>> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>>> ---
>>>>  Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>> index e3e6983..17de9fc 100644
>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>> @@ -53,6 +53,7 @@ Optional properties:
>>>>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
>>>>  	register for post-silicon frame length adjustment when the
>>>>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
>>>> + - snps,imod_interval: the interrupt moderation interval.
>>>
>>> on top of all other comments, what's the unit here? nanoseconds? clock cycles?
>>>
>>
>> Number of 250 ns intervals. I'll update the description to clarify.
> 
> it's probably better to add it in nanoseconds itself, then let driver
> compute register value with DIV_ROUND_UP()
> 

I'm fine with it either way, but I think "increments of 250 ns" is
slightly cleaner in that it reflects the exact settings that are
possible and documented, and also fits neatly into a u16.

I assume you'd also like the internal variable dwc3->imod_interval
changed as well?

Regards,
John


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
