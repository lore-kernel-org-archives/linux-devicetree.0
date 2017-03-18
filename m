From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sat, 18 Mar 2017 19:22:58 +0000
Message-ID: <20170318192258.GL21222@n2100.armlinux.org.uk>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489121599-23206-1-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgde
List-Id: devicetree@vger.kernel.org

Hi Steve,

I've just been trying to get gstreamer to capture and h264 encode
video from my camera at various frame rates, and what I've discovered
does not look good.

1) when setting frame rates, media-ctl _always_ calls
   VIDIOC_SUBDEV_S_FRAME_INTERVAL with pad=0.

2) media-ctl never retrieves the frame interval information, so there's
   no way to read it back with standard tools, and no indication that
   this is going on...

3) gstreamer v4l2src is getting upset, because it can't enumerate the
   frame sizes (VIDIOC_ENUM_FRAMESIZES fails), which causes it to
   fallback to using the "tvnorms" to decide about frame rates.  This
   makes it impossible to use frame rates higher than 30000/1001, and
   causes the pipeline validation to fail.

0:00:01.937465845 20954  0x15ffe90 DEBUG                   v4l2 gstv4l2object.c:2474:gst_v4l2_object_probe_caps_for_format:<v4l2src0> Enumerating frame sizes for RGGB
0:00:01.937588518 20954  0x15ffe90 DEBUG                   v4l2 gstv4l2object.c:2601:gst_v4l2_object_probe_caps_for_format:<v4l2src0> Failed to enumerate frame sizes for pixelformat RGGB (Inappropriate ioctl for device)
0:00:01.937879535 20954  0x15ffe90 LOG                     v4l2 gstv4l2object.c:2708:gst_v4l2_object_get_nearest_size:<v4l2src0> getting nearest size to 1x1 with format RGGB
0:00:01.937990874 20954  0x15ffe90 LOG                     v4l2 gstv4l2object.c:2724:gst_v4l2_object_get_nearest_size:<v4l2src0> got nearest size 816x616
0:00:01.938250889 20954  0x15ffe90 ERROR                   v4l2 gstv4l2object.c:1873:gst_v4l2_object_get_interlace_mode: Driver bug detected - check driver with v4l2-compliance from http://git.linuxtv.org/v4l-utils.git
0:00:01.938326893 20954  0x15ffe90 LOG                     v4l2 gstv4l2object.c:2708:gst_v4l2_object_get_nearest_size:<v4l2src0> getting nearest size to 32768x32768 with format RGGB
0:00:01.938431566 20954  0x15ffe90 LOG                     v4l2 gstv4l2object.c:2724:gst_v4l2_object_get_nearest_size:<v4l2src0> got nearest size 816x616
0:00:01.939776641 20954  0x15ffe90 ERROR                   v4l2 gstv4l2object.c:1873:gst_v4l2_object_get_interlace_mode: Driver bug detected - check driver with v4l2-compliance from http://git.linuxtv.org/v4l-utils.git
0:00:01.940110660 20954  0x15ffe90 DEBUG                   v4l2 gstv4l2object.c:1955:gst_v4l2_object_get_colorspace: Unknown enum v4l2_colorspace 0

   This triggers the "/* Since we can't get framerate directly, try to
   use the current norm */" code in v4l2object.c, which causes it to
   select one of the 30000/1001 norms:

0:00:01.955927879 20954  0x15ffe90 INFO                    v4l2 gstv4l2object.c:3811:gst_v4l2_object_get_caps:<v4l2src0> probed caps: video/x-bayer, format=(string)rggb, framerate=(fraction)30000/1001, width=(int)816, height=(int)616, pixel-aspect-ratio=(fraction)1/1; video/x-raw, format=(string)I420, framerate=(fraction)30000/1001, width=(int)816, height=(int)616, interlace-mode=(string)progressive, pixel-aspect-ratio=(fraction)1/1; video/x-raw, format=(string)YV12, framerate=(fraction)30000/1001, width=(int)816, height=(int)616, interlace-mode=(string)progressive, pixel-aspect-ratio=(fraction)1/1; video/x-raw, format=(string)BGR, framerate=(fraction)30000/1001, width=(int)816, height=(int)616, interlace-mode=(string)progressive, pixel-aspect-ratio=(fraction)1/1; video/x-raw, format=(stri
 ng)RGB, framerate=(fraction)30000/1001, width=(int)816, height=(int)616, interlace-mode=(string)progressive, pixel-aspect-ratio=(fraction)1/1

   despite the media pipeline actually being configured for 60fps.

   Forcing it by adjusting the pipeline only results in gstreamer
   failing, because it believes that v4l2 is unable to operate at
   60fps.

   Also note the complaints from v4l2src about the non-compliance...

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
