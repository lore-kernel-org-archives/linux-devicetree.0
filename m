From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v5 15/39] [media] v4l2: add a frame interval error event
Date: Mon, 13 Mar 2017 11:02:34 +0100
Message-ID: <aa6a5a1d-18fd-8bed-a349-2654d2d1abe0@xs4all.nl>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <1489121599-23206-16-git-send-email-steve_longerbeam@mentor.com>
 <5b0a0e76-2524-4140-5ccc-380a8f949cfa@xs4all.nl>
 <ec05e6e0-79f2-2db2-bde9-4aed00d76faa@gmail.com>
 <6b574476-77df-0e25-a4d1-32d4fe0aec12@xs4all.nl>
 <5d5cf4a4-a4d3-586e-cd16-54f543dfcce9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5d5cf4a4-a4d3-586e-cd16-54f543dfcce9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/11/2017 07:14 PM, Steve Longerbeam wrote:
> 
> 
> On 03/11/2017 03:39 AM, Hans Verkuil wrote:
>> On 10/03/17 19:37, Steve Longerbeam wrote:
>>> Hi Hans,
>>>
>>> On 03/10/2017 04:03 AM, Hans Verkuil wrote:
>>>> On 10/03/17 05:52, Steve Longerbeam wrote:
>>>>> Add a new FRAME_INTERVAL_ERROR event to signal that a video capture or
>>>>> output device has measured an interval between the reception or transmit
>>>>> completion of two consecutive frames of video that is outside the nominal
>>>>> frame interval by some tolerance value.
>>>>
>>>> Reading back what was said on this I agree with Sakari that this doesn't
>>>> belong here.
>>>>
>>>> Userspace can detect this just as easily (if not easier) with a timeout.
>>>>
>>>
>>>
>>> Unfortunately measuring frame intervals from userland is not accurate
>>> enough for i.MX6.
>>>
>>> The issue here is that the IPUv3, specifically the CSI unit, can
>>> permanently lose vertical sync if there are truncated frames sent
>>> on the bt.656 bus. We have seen a single missing line of video cause
>>> loss of vertical sync. The only way to correct this is to shutdown
>>> the IPU capture hardware and restart, which can be accomplished
>>> simply by restarting streaming from userland.
>>>
>>> There are no other indicators from the sensor about these short
>>> frame events (believe me, we've exhausted all avenues with the ADV718x).
>>> And the IPUv3 DMA engine has no status indicators for short frames
>>> either. So the only way to detect them is by measuring frame intervals.
>>>
>>> The intervals have to be able to resolve a single line of missing video.
>>> With a PAL video source that requires better than 58 usec accuracy.
>>>
>>> There is too much uncertainty to resolve this at user level. The
>>> driver is able to resolve this by measuring intervals between hardware
>>> interrupts as long as interrupt latency is reasonably low, and we
>>> have another method using the i.MX6 hardware input capture support
>>> that can measure these intervals very accurately with no errors
>>> introduced by interrupt latency.
>>>
>>> I made this event a private event to imx-media driver in a previous
>>> iteration, so I can return it to a private event, but this can't be
>>> done at user level.
>>
>> It's fine to use an internal event as long as the end-user doesn't
>> see it. But if you lose vsyncs, then you never capture another frame,
>> right?
> 
> No, that's not correct. By loss of vertical sync, I mean the IPU
> captures portions of two different frames, resulting in a permanent
> "split image", with one frame containing portions of two consecutive
> images. Or, the video rolls continuously, if you remember the old CRT
> television sets of yore, it's the same rolling effect.
> 
> 
>> So userspace can detect that (i.e. no new frames arrive) and
>> it can timeout on that. Or you detect it in the driver and restart there,
>> or call vb2_queue_error().
>>
> 
> There is no timeout, the frames keep coming, but they are split images
> or rolling.

Ah, OK. That wasn't clear to me from the description.

> 
>> Anything really as long as this event isn't user-visible :-)
> 
> The event must be user visible, otherwise the user has no indication
> the error, and can't correct it by stream restart.

In that case the driver can detect this and call vb2_queue_error. It's
what it is there for.

The event doesn't help you since only this driver has this issue. So nobody
will watch this event, unless it is sw specifically written for this SoC.

Much better to call vb2_queue_error to signal a fatal error (which this
apparently is) since there are more drivers that do this, and vivid supports
triggering this condition as well.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
