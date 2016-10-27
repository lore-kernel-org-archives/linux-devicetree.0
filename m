From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: devicetree: dwc3: Add interrupt
 moderation
Date: Thu, 27 Oct 2016 14:06:12 -0700
Message-ID: <a5b95df2-31c8-be55-013c-2ea4a3e7bf44@synopsys.com>
References: <cover.1477424426.git.johnyoun@synopsys.com>
 <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun@synopsys.com>
 <37f3eec3-b026-97ad-8b33-353a3b93f840@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <37f3eec3-b026-97ad-8b33-353a3b93f840-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/26/2016 3:22 AM, Sergei Shtylyov wrote:
> Hello.
> 
> On 10/25/2016 10:42 PM, John Youn wrote:
> 
>> Add interrupt moderation interval binding for dwc3.
>>
>> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index e3e6983..17de9fc 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -53,6 +53,7 @@ Optional properties:
>>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
>>  	register for post-silicon frame length adjustment when the
>>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
>> + - snps,imod_interval: the interrupt moderation interval.
> 
>     Hyphens are preferred in the DT node/prop names.
> 

Thanks will fix.

John


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
