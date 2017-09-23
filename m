From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH 3/4] media: i2c: Add TDA1997x HDMI receiver driver
Date: Sat, 23 Sep 2017 09:30:29 +0200
Message-ID: <58433b8c-5e72-feb1-4515-9396d075e350@xs4all.nl>
References: <1506119053-21828-1-git-send-email-tharvey@gateworks.com>
 <1506119053-21828-4-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506119053-21828-4-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hans Verkuil <hansverk-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Tim,

On 23/09/17 00:24, Tim Harvey wrote:
> Add support for the TDA1997x HDMI receivers.

I did a very quick high-level scan and found a few blockers:

1) You *must* implement the get/set_edid ops. I won't accept
   the driver without that. You can use v4l2-ctl to set/get the
   EDID (see v4l2-ctl --help-edid).

2) The dv_timings_cap and enum_dv_timings ops are missing: those
   must be implemented as well.

3) Drop the deprecated g_mbus_config op.

4) Do a proper implementation of query_dv_timings. It appears you
   change the timings in the irq function: that's wrong. The sequence
   should be the following:

   a) the irq handler detects that timings have changed and sends
      a V4L2_EVENT_SOURCE_CHANGE event to userspace.
   b) when userspace receives that event it will stop streaming,
      call VIDIOC_QUERY_DV_TIMINGS and if new valid timings are
      detected it will call VIDIOC_S_DV_TIMINGS, allocate the new
      buffers and start streaming again.

   The driver shall never switch timings on its own, this must be
   directed from userspace. Different timings will require different
   configuration through the whole stack (other HW in the video pipeline,
   DMA engines, userspace memory allocations, etc, etc). Only userspace
   can do the reconfiguration.

General note: if you want to implement CEC and/or HDCP, contact me first.
I can give pointers on how to do that.

This is just a quick scan. I won't have time to do an in-depth review
for the next two weeks. Ideally you'll have a v2 ready by then with the
issues mentioned above fixed.

Did you run the v4l2-compliance utility to test this driver? For a v2
please run it and add the output to the cover letter of the patch series.

You say "TDA19972 support (2 inputs)": I assume that that means that there
are 2 inputs, but only one is active at a time. Right?

Regards,

	Hans

> 
> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
> ---
>  drivers/media/i2c/Kconfig            |    9 +
>  drivers/media/i2c/Makefile           |    1 +
>  drivers/media/i2c/tda1997x.c         | 3065 ++++++++++++++++++++++++++++++++++
>  include/dt-bindings/media/tda1997x.h |   78 +
>  include/media/i2c/tda1997x.h         |   53 +
>  5 files changed, 3206 insertions(+)
>  create mode 100644 drivers/media/i2c/tda1997x.c
>  create mode 100644 include/dt-bindings/media/tda1997x.h
>  create mode 100644 include/media/i2c/tda1997x.h

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
