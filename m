From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v4 13/36] [media] v4l2: add a frame timeout event
Date: Sat, 4 Mar 2017 12:56:00 +0200
Message-ID: <20170304105600.GS3220@valkosipuli.retiisi.org.uk>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <1487211578-11360-14-git-send-email-steve_longerbeam@mentor.com>
 <20170302155342.GJ3220@valkosipuli.retiisi.org.uk>
 <4b2bcee1-8da0-776e-4455-8d8e7a7abf0a@gmail.com>
 <20170303114506.GM3220@valkosipuli.retiisi.org.uk>
 <59663ea1-b277-1543-e770-6a102ac733a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <59663ea1-b277-1543-e770-6a102ac733a4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-me
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Fri, Mar 03, 2017 at 02:43:51PM -0800, Steve Longerbeam wrote:
> 
> 
> On 03/03/2017 03:45 AM, Sakari Ailus wrote:
> >On Thu, Mar 02, 2017 at 03:07:21PM -0800, Steve Longerbeam wrote:
> >>
> >>
> >>On 03/02/2017 07:53 AM, Sakari Ailus wrote:
> >>>Hi Steve,
> >>>
> >>>On Wed, Feb 15, 2017 at 06:19:15PM -0800, Steve Longerbeam wrote:
> >>>>Add a new FRAME_TIMEOUT event to signal that a video capture or
> >>>>output device has timed out waiting for reception or transmit
> >>>>completion of a video frame.
> >>>>
> >>>>Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> >>>>---
> >>>>Documentation/media/uapi/v4l/vidioc-dqevent.rst | 5 +++++
> >>>>Documentation/media/videodev2.h.rst.exceptions  | 1 +
> >>>>include/uapi/linux/videodev2.h                  | 1 +
> >>>>3 files changed, 7 insertions(+)
> >>>>
> >>>>diff --git a/Documentation/media/uapi/v4l/vidioc-dqevent.rst b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> >>>>index 8d663a7..dd77d9b 100644
> >>>>--- a/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> >>>>+++ b/Documentation/media/uapi/v4l/vidioc-dqevent.rst
> >>>>@@ -197,6 +197,11 @@ call.
> >>>>	the regions changes. This event has a struct
> >>>>	:c:type:`v4l2_event_motion_det`
> >>>>	associated with it.
> >>>>+    * - ``V4L2_EVENT_FRAME_TIMEOUT``
> >>>>+      - 7
> >>>>+      - This event is triggered when the video capture or output device
> >>>>+	has timed out waiting for the reception or transmit completion of
> >>>>+	a frame of video.
> >>>
> >>>As you're adding a new interface, I suppose you have an implementation
> >>>around. How do you determine what that timeout should be?
> >>
> >>The imx-media driver sets the timeout to 1 second, or 30 frame
> >>periods at 30 fps.
> >
> >The frame rate is not necessarily constant during streaming. It may well
> >change as a result of lighting conditions.
> 
> I think you mean that would be a _temporary_ change in frame rate, but
> yes I agree the data rate can temporarily fluctuate. Although I doubt
> lighting conditions would cause a sensor to pause data transmission
> for a full 1 second.

Likely not, at least not in typical conditions. The exposure time is still
quite specific to applications: it could be minutes if you take photos e.g.
of the night sky.

What I'm saying here is that any static value is likely not both reasonable
and workable in all potential situations all the time. Still there are cases
(as yours below) that may happen in relatively common cases on some hardware
(more common than taking long exposure photos of the night sky with the said
hardware :)).

> 
> 
> >I wouldn't add an event for this:
> >this is unreliable and 30 times the frame period is an arbitrary value
> >anyway. No other drivers do this either.
> 
> If no other drivers do this I don't mind removing it. It is really meant
> to deal with the ADV718x CVBS decoder, which often simply stops sending
> data on the BT.656 bus if there is an interruption in the input analog
> signal. But I agree that user space could detect this timeout instead.
> Unless I hear from someone else that they would like to keep this
> feature I'll remove it in version 5.

That's a bit of a special situation --- still there are alike conditions on
existing hardware. You should return the buffers to the user with the ERROR
flag set --- or return -EIO from VIDIOC_DQBUF, if the condition will
persist:

<URL:https://www.linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/vidioc-qbuf.html>

Do you already obtain the frame rate from the image source (e.g. tuner,
sensor, decoder) and multiply the frame time by some number in the current
implementation? Not all sub-device drivers may implement g_frame_interval()
so I'd disable the timeout in that case.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
