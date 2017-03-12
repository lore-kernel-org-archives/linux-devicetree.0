From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sun, 12 Mar 2017 13:16:02 -0700
Message-ID: <c6eda3b3-52b8-8560-8f46-a6e2d6303bbd@gmail.com>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <20170312175118.GP21222@n2100.armlinux.org.uk>
 <191ef88d-2925-2264-6c77-46647394fc72@gmail.com>
 <20170312192932.GQ21222@n2100.armlinux.org.uk>
 <58b30bca-20ca-d4bd-7b86-04a4b8e71935@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58b30bca-20ca-d4bd-7b86-04a4b8e71935-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, pavel-+ZI9xUNit7I@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, p.zabel@pengut
List-Id: devicetree@vger.kernel.org



On 03/12/2017 12:44 PM, Steve Longerbeam wrote:
>
>
> On 03/12/2017 12:29 PM, Russell King - ARM Linux wrote:
>> On Sun, Mar 12, 2017 at 12:21:45PM -0700, Steve Longerbeam wrote:
>>> There's actually nothing preventing userland from disabling a link
>>> multiple times, and imx_media_link_notify() complies, and so
>>> csi_s_power(OFF) gets called multiple times, and so that WARN_ON()
>>> in there is silly, I borrowed this from other MC driver examples,
>>> but it makes no sense to me, I'll remove it and prevent the power
>>> count from going negative.
>>
>> Hmm.  So what happens if one of the CSI's links is enabled, and we
>> disable a different link from the CSI several times?  Doesn't that
>> mean the power count will go to zero despite there being an enabled
>> link?
>
> Yes, the CSI will be powered off even if it still has an enabled link.
> But one of its other links has been disabled, meaning the pipeline as
> a whole is disabled. So I think it makes sense to power down the CSI,
> the pipeline isn't usable at that point.
>
> And remember that the CSI does not allow both output pads to be enabled
> at the same time. If that were so then indeed there would be a problem,
> because it would mean there is another active pipeline that requires the
> CSI being powered on, but that's not the case.
>
> I think this is consistent with the other entities as well, but I will
> double check.


At first I thought this could be a problem for one entity, the csi-2
receiver.

It can enable all four of its output pads at once (if the input stream
contains all 4 virtual channels, the csi-2 receiver must support
demuxing all of them onto all 4 of its output pads).

But after more review, this should not be an issue. If a csi-2 sink
(a CSI or a CSI mux) link is disabled, the csi-2 receiver is no longer
reachable from that sink, so attempts to disable the csi-2 via that
path again is not possible. The other potential problem is disabling
from the csi-2's own sink pad, but in that case the csi-2 no longer
has a source, so again it makes sense to power off the csi-2 even
if it has enabled output pads.


Steve
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
