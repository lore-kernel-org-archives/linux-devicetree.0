From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: devicetree: dwc3: Add interrupt
 moderation
Date: Thu, 27 Oct 2016 14:08:25 -0700
Message-ID: <36413315-16eb-d690-b559-ab5ae103c5f9@synopsys.com>
References: <cover.1477424426.git.johnyoun@synopsys.com>
 <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun@synopsys.com>
 <20161026105632.GG19965@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161026105632.GG19965@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/26/2016 3:57 AM, Mark Rutland wrote:
> On Tue, Oct 25, 2016 at 12:42:46PM -0700, John Youn wrote:
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
> As otherwise commented, s/_/-/

Ok, forgot about that.

> 
> What is "interrupt moderation"? The cover mentions that this is to be
> used for some kind of workaround, but it's not clear to me what this is,
> and as such, whether it makes sense to describe it in this manner.
> 

Interrupt moderation throttles the interrupt rate to be no faster than
a specified interval. It's an optional feature of the controller.

This series implements the feature and enables it as a workaround for
a particular version of the controller.

This binding enables and configures the feature with an interval value
which is specified as a number of 250 ns increments.

I'll update the binding text to something like this:

 - snps,imod-interval: the interrupt moderation interval, specified in
   250 ns increments from 1 to 0xffff.


Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
