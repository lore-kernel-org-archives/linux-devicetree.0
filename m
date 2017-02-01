From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Wed, 01 Feb 2017 10:30:57 +0100
Message-ID: <1485941457.3353.13.camel@pengutronix.de>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
         <1485870854.2932.63.camel@pengutronix.de>
         <5586b893-bf5c-6133-0789-ccce60626b86@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5586b893-bf5c-6133-0789-ccce60626b86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam@me>
List-Id: devicetree@vger.kernel.org

On Tue, 2017-01-31 at 17:26 -0800, Steve Longerbeam wrote:
[...]
> > # Set pad formats
> > media-ctl --set-v4l2 "'tc358743 1-000f':0[fmt:UYVY/1920x1080]"
> > media-ctl --set-v4l2 "'imx6-mipi-csi2':1[fmt:UYVY2X8/1920x1080]"
> > media-ctl --set-v4l2 "'ipu1_csi0_mux':2[fmt:UYVY2X8/1920x1080]"
> > media-ctl --set-v4l2 "'ipu1_csi0':2[fmt:AYUV32/1920x1080]"
> >
> > v4l2-ctl -d /dev/video4 -V
> > # This still is configured to 640x480, which is inconsistent with
> > # the 'ipu1_csi0':2 pad format. The pad set_fmt above should
> > # have set this, too.
> 
> Because you've only configured the source pads,
> and not the sink pads. The ipu_csi source format is
> dependent on the sink format - output crop window is
> limited by max input sensor frame, and since sink pad is
> still at 640x480, output is reduced to that.

No, it is set (see below). What happens is that capture_g_fmt_vid_cap
just returns the capture devices' priv->vdev.fmt, even if it is
incompatible with the connected csi subdevice's output pad format.

priv->vdev.fmt was never changed from the default set in
imx_media_capture_device_register, because capture_s/try_fmt_vid_cap
were not called yet.

> Maybe I'm missing something, is it expected behavior that
> a source format should be automatically propagated to
> the sink?

media-ctl propagates the output pad format to all remote subdevices'
input pads for all enabled links:

https://git.linuxtv.org/v4l-utils.git/tree/utils/media-ctl/libv4l2subdev.c#n693

> > v4l2-ctl --list-formats -d /dev/video4
> > # This lists all the RGB formats, which it shouldn't. There is
> > # no CSC in this pipeline, so we should be limited to YUV formats
> > # only.
> 
> right, need to fix that. Probably by poking the attached
> source subdev (csi or prpenc/vf) for its supported formats.

You are right, in bayer/raw mode only one specific format should be
listed, depending on the CSI output pad format.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
