From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 5/7] iio: Support triggered events
Date: Sun, 16 Aug 2015 10:05:54 +0100
Message-ID: <55D05272.7010107@kernel.org>
References: <1438174469-19054-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1438174648-19296-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <55C4B66C.1020609@metafoo.de> <55C4D878.1010605@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55C4D878.1010605-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org
List-Id: devicetree@vger.kernel.org

Vladimir - before I forget, could you try to wrap emails to around 
80 characters per line.  Otherwise we end up with really tricky
to read thread when some are doing so and others aren't!

On 07/08/15 17:10, Vladimir Barinov wrote:
> Hi Lars,
> 
> On 07.08.2015 16:45, Lars-Peter Clausen wrote:
>> Hi,
>>
>> On 07/29/2015 02:57 PM, Vladimir Barinov wrote:
>>> Support triggered events.
>>>
>>> This is useful for chips that don't have their own interrupt sources.
>>> It allows to use generic/standalone iio triggers for those drivers.
>>>
>> Thanks for the patch. Can you describe in more detail how
>> INDIO_EVENT_TRIGGERED differs from the INDIO_BUFFER_TRIGGERED. By just
>> looking at the source code I don't understand quite why it is necessary.
> This is needed for the case when iio buffer is not used and used only
> iio event.
> 
> The difference to INDIO_BUFFER_TRIGGERED is that for triggered buffer
> the trigger poll function is attached (using
> iio_trigger_attach_poll_func) only in industrialio-buffer.c using
> number of steps/conditions starting by issuing 1 to buffer/enable
> sysfs path.
> 
> For chips that do not use iio buffer but use only iio events the
> iio_trigger_attach_poll_func never called.
> 
> In case of using INDIO_BUFFER_TRIGGERED the poll func is
> attached/detached via industrialio-buffer.c In case of using
> INDIO_EVENT_TRIGGERED the poll func is attached/detached via
> industrialio-trigger.c during set/change the current trigger.
> 
> Regards, Vladimir
You've convinced Lars and I agree with his argument that this
is a sensible addition to IIO.
> 

>> Thanks,
>> - Lars
>>
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
