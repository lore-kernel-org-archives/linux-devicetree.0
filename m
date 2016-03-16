From: Eric Auger <eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 2/3] vfio, platform: make reset driver a requirement
Date: Wed, 16 Mar 2016 05:36:29 +0100
Message-ID: <56E8E2CD.3020604@linaro.org>
References: <1457715275-11925-1-git-send-email-okaya@codeaurora.org>
 <1457715275-11925-3-git-send-email-okaya@codeaurora.org>
 <56E5A271.6000408@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E5A271.6000408-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Baptiste Reynal <b.reynal-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>, Alex Williamson <alex.williamson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sinan,
On 03/13/2016 06:25 PM, Sinan Kaya wrote:
> On 3/11/2016 11:54 AM, Sinan Kaya wrote:
>> The code was allowing platform devices to be used without a supporting VFIO
>> reset driver. The hardware can be left in some inconsistent state after a
>> guest machine abort.
>>
>> The reset driver will put the hardware back to safe state and disable
>> interrupts before returning the control back to the host machine.
>>
>> Signed-off-by: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> ---
>>  drivers/vfio/platform/vfio_platform_common.c | 16 +++++++++-------
>>  1 file changed, 9 insertions(+), 7 deletions(-)
>>
> I was looking at the code. It looks like this is going to break VFIO AMBA. The
> common implementation is shared with AMBA and platform devices.
> 
> I couldn't see a reset function for AMBA devices.
> 
> Is there anyway to write reset function for it? I have no experience with 
> AMBA devices.
To my knowledge only the PL330 DMA controller (drivers/dma/pl330.c) was
passthrough'ed at some point, rather for development purpose than
production purpose. This was done by Virtual Open Systems (ask Baptiste
for more details). But I don't think this is really used.
> 
> Would you include a reset needed flag and just not require it for AMBA? 
> (I honestly don't like this idea)
> 
I think the requirement also makes sense for AMBA.

Maybe an option would be to add a module parameter that would allow to
use the vfio platform/amba driver without reset module (with explicit
opt-in from the user). Maybe this can be done later on.

FYI I will not have access to my mailbox until the end of the week.

Best Regards

Eric

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
