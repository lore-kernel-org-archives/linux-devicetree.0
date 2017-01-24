From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 16/24] media: Add i.MX media core driver
Date: Tue, 24 Jan 2017 12:37:26 +0100
Message-ID: <1485257846.3600.106.camel@pengutronix.de>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
         <1483755102-24785-17-git-send-email-steve_longerbeam@mentor.com>
         <1484320822.31475.96.camel@pengutronix.de>
         <a94025b4-c4dd-de51-572e-d2615a7246e4@gmail.com>
         <1484574468.8415.136.camel@pengutronix.de>
         <e38feca9-ed6f-8288-e006-768d6ba2fe5a@gmail.com>
         <1485170006.2874.63.camel@pengutronix.de>
         <481289bb-424f-4ac4-66f1-7e1b4a0b7065@gmail.com>
         <c6087342-f61f-0b4c-f67e-4239f861e974@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c6087342-f61f-0b4c-f67e-4239f861e974-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Mon, 2017-01-23 at 17:45 -0800, Steve Longerbeam wrote:
> 
> On 01/23/2017 05:38 PM, Steve Longerbeam wrote:
> >
> >>
> >>> Second, ignoring the above locking issue for a moment,
> >>> v4l2_pipeline_pm_use()
> >>> will call s_power on the sensor _first_, then the mipi csi-2 s_power,
> >>> when executing
> >>> media-ctl -l '"ov5640 1-003c":0 -> "imx6-mipi-csi2":0[1]'. Which is the
> >>> wrong order.
> >>> In my version which enforces the correct power on order, the mipi csi-2
> >>> s_power
> >>> is called first in that link setup, followed by the sensor.
> >> I don't understand why you want to power up subdevs as soon as the links
> >> are established.
> >
> > Because that is the precedence, all other media drivers do pipeline
> > power on/off at link_notify. And v4l2_pipeline_link_notify() was written
> > as a link_notify method.
> >
> >>   Shouldn't that rather be done for all subdevices in the
> >> pipeline when the corresponding capture device is opened?
> >
> > that won't work. There's no guarantee the links will be established
> > at capture device open time.

If the device is opened before the links are established, it won't be
usable anyway. And I think the connected pipeline should be locked in
place while the video device is opened. Is there any reason to ever open
the video device and only then start linking entities?

> ugh, maybe v4l2_pipeline_pm_use() would work at open/release. If there are
> no links yet, it would basically be a no-op. And stream on requires 
> opening the
> device, and the pipeline links should be established by then, so this 
> might be
> fine, looking into this too.

Thanks for looking into it, at least I had that working for the
TC358743->MIPI-CSI2 link in my driver.

> >> It seems to me that powering up the pipeline should be the last step
> >> before userspace actually starts the capture.
> >
> > Well, I'm ok with moving pipeline power on/off to start/stop streaming.
> > I would actually prefer to do it then, I only chose at link_notify 
> > because of precedence. I'll look into it.

That might be too late, though. I would expect STREAMON/STREAMOFF to be
a rather fast operation as all the slow preparation could be at open /
REQBUFS time. Also, there might be sensors that need to be powered on to
handle the v4l2_ctrl passthrough?

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
