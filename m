From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: devicetree: dwc3: Add interrupt
 moderation
Date: Mon, 31 Oct 2016 13:07:53 -0700
Message-ID: <75a1dc4a-1d7e-a8e3-dd71-c0bed1927dca@synopsys.com>
References: <cover.1477424426.git.johnyoun@synopsys.com>
 <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun@synopsys.com>
 <20161026105632.GG19965@leverpostej>
 <36413315-16eb-d690-b559-ab5ae103c5f9@synopsys.com>
 <20161028102350.GD5806@leverpostej> <87mvhosr4g.fsf@linux.intel.com>
 <20161028103843.GE5806@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161028103843.GE5806@leverpostej>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/28/2016 3:39 AM, Mark Rutland wrote:
> On Fri, Oct 28, 2016 at 01:30:07PM +0300, Felipe Balbi wrote:
>> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:
>>> On Thu, Oct 27, 2016 at 02:08:25PM -0700, John Youn wrote:
>>>> On 10/26/2016 3:57 AM, Mark Rutland wrote:
>>>>> On Tue, Oct 25, 2016 at 12:42:46PM -0700, John Youn wrote:
>>>>>> Add interrupt moderation interval binding for dwc3.
>>>
>>>>>> + - snps,imod_interval: the interrupt moderation interval.
> 
>>>> This series implements the feature and enables it as a workaround for
>>>> a particular version of the controller.
>>>
>>> ... as a workaround for *what*? Is there a bug in that IP version, or an
>>
>> you didn't receive the entire series, I guess. Here's last patch in the
>> series:
> 
> No, I did not. Thanks for forwarding this.
> 
>>  This is a workaround for STAR 9000961433 which affects only version
>>  3.00a of the DWC_usb3 core. This prevents the controller interrupt from
>>  being masked while handling events. Enabling interrupt moderation allows
>>  us to work around this issue because once the GEVNTCOUNT.count is
>>  written the IRQ is immediately deasserted and won't be asserted again
>>  until GEVNTCOUNT.EHB is cleared.
>>
>>  Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>  ---
>>   drivers/usb/dwc3/core.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>>  diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>  index 6733838..7fa0832 100644
>>  --- a/drivers/usb/dwc3/core.c
>>  +++ b/drivers/usb/dwc3/core.c
>>  @@ -1050,6 +1050,18 @@ static void dwc3_check_params(struct dwc3 *dwc)
>> 		 dwc->imod_interval = 0;
>> 	 }
>>
>>  +	/*
>>  +	 * Workaround for STAR 9000961433 which affects only version
>>  +	 * 3.00a of the DWC_usb3 core. This prevents the controller
>>  +	 * interrupt from being masked while handling events. IMOD
>>  +	 * allows us to work around this issue. Enable it for the
>>  +	 * affected version.
>>  +	 */
>>  +	if (!dwc->imod_interval &&
>>  +	    (dwc->revision == DWC3_REVISION_300A)) {
>>  +		dwc->imod_interval = 1;
>>  +	}
>>  +
>> 	 /* Check the maximum_speed parameter */
>> 	 switch (dwc->maximum_speed) {
>> 	 case USB_SPEED_LOW:
>>
>>> integration issue? Does the problem vary per-board?
>>>
>>> Generally, if there's a problem that needs to be worked around, we
>>> describe the problem in the DT (perhaps implicitly in the compatible
>>> string), and then the kernel chooses the workaround.
>>
>> Regardless of the silicon erratum, interrupt moderation is a *feature*
>> of the IP, common to all instances since revision v3.00a (IIRC). John is
>> just using interrupt moderation in the context of implementing this
>> workaround. But the actual feature is valid also without the erratum.
> 
> Sure, I understand this.
> 
>> Another thing to remember is that different applications (i.e. boards)
>> might want to moderate the interrupt for different periods. That's,
>> again, not related to the erratum at all.
> 
> ... again, the question is *why*?
> 
> If this varies per use-case, then it would be better to handle this
> dynamically -- people can run wildly different use-cases on the same
> hardware.

It could make sense either per use-case or per platform.

If we add a dynamic setting, would that be through sysfs?

> 
> I'm not sure that it makes sense for this to be in the DT, though I may
> have misunderstood.

I'm ok omitting the DT binding until it is needed by someone. Since we
currently only need it for the workaround, which is detected
automatically.

Felipe, are you ok with this?

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
