From: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sat, 18 Mar 2017 12:58:27 -0700
Message-ID: <aef6c412-5464-726b-42f6-a24b7323aa9c@mentor.com>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
 <20170318192258.GL21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed;
        boundary="------------068B54720AA867F86D8CB3F5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170318192258.GL21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--------------068B54720AA867F86D8CB3F5
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/18/2017 12:22 PM, Russell King - ARM Linux wrote:
> Hi Steve,
>
> I've just been trying to get gstreamer to capture and h264 encode
> video from my camera at various frame rates, and what I've discovered
> does not look good.
>
> 1) when setting frame rates, media-ctl _always_ calls
>     VIDIOC_SUBDEV_S_FRAME_INTERVAL with pad=0.
>
> 2) media-ctl never retrieves the frame interval information, so there's
>     no way to read it back with standard tools, and no indication that
>     this is going on...

I think Philipp Zabel submitted a patch which addresses these
in media-ctl. Check with him.

>
> 3) gstreamer v4l2src is getting upset, because it can't enumerate the
>     frame sizes (VIDIOC_ENUM_FRAMESIZES fails),

Right, imx-media-capture.c (the "standard" v4l2 user interface module)
is not implementing VIDIOC_ENUM_FRAMESIZES. It should, but it can only
return the single frame size that the pipeline has configured (the mbus
format of the attached source pad).

>   which causes it to
>     fallback to using the "tvnorms" to decide about frame rates.  This
>     makes it impossible to use frame rates higher than 30000/1001, and
>     causes the pipeline validation to fail.

In v5 I added validation of frame intervals between pads,
but due to negative feedback I've pulled that. So next
version will not attempt to validate frame intervals between
source->sink pads.

Can you share your gstreamer pipeline? For now, until
VIDIOC_ENUM_FRAMESIZES is implemented, try a pipeline that
does not attempt to specify a frame rate. I use the attached
script for testing, which works for me.



>
> 0:00:01.937465845 20954  0x15ffe90 DEBUG                   v4l2 gstv4l2object.c:2474:gst_v4l2_object_probe_caps_for_format:<v4l2src0> Enumerating frame sizes for RGGB
> 0:00:01.937588518 20954  0x15ffe90 DEBUG                   v4l2 gstv4l2object.c:2601:gst_v4l2_object_probe_caps_for_format:<v4l2src0> Failed to enumerate frame sizes for pixelformat RGGB (Inappropriate ioctl for device)
> 0:00:01.937879535 20954  0x15ffe90 LOG                     v4l2 gstv4l2object.c:2708:gst_v4l2_object_get_nearest_size:<v4l2src0> getting nearest size to 1x1 with format RGGB
> 0:00:01.937990874 20954  0x15ffe90 LOG                     v4l2 gstv4l2object.c:2724:gst_v4l2_object_get_nearest_size:<v4l2src0> got nearest size 816x616
> 0:00:01.938250889 20954  0x15ffe90 ERROR                   v4l2 gstv4l2object.c:1873:gst_v4l2_object_get_interlace_mode: Driver bug detected - check driver with v4l2-compliance from http://git.linuxtv.org/v4l-utils.git
> 0:00:01.938326893 20954  0x15ffe90 LOG                     v4l2 gstv4l2object.c:2708:gst_v4l2_object_get_nearest_size:<v4l2src0> getting nearest size to 32768x32768 with format RGGB
> 0:00:01.938431566 20954  0x15ffe90 LOG                     v4l2 gstv4l2object.c:2724:gst_v4l2_object_get_nearest_size:<v4l2src0> got nearest size 816x616
> 0:00:01.939776641 20954  0x15ffe90 ERROR                   v4l2 gstv4l2object.c:1873:gst_v4l2_object_get_interlace_mode: Driver bug detected - check driver with v4l2-compliance from http://git.linuxtv.org/v4l-utils.git
> 0:00:01.940110660 20954  0x15ffe90 DEBUG                   v4l2 gstv4l2object.c:1955:gst_v4l2_object_get_colorspace: Unknown enum v4l2_colorspace 0
>
>     This triggers the "/* Since we can't get framerate directly, try to
>     use the current norm */" code in v4l2object.c, which causes it to
>     select one of the 30000/1001 norms:
>
> 0:00:01.955927879 20954  0x15ffe90 INFO                    v4l2 gstv4l2object.c:3811:gst_v4l2_object_get_caps:<v4l2src0> probed caps: video/x-bayer, format=(string)rggb, framerate=(fraction)30000/1001, width=(int)816, height=(int)616, pixel-aspect-ratio=(fraction)1/1; video/x-raw, format=(string)I420, framerate=(fraction)30000/1001, width=(int)816, height=(int)616, interlace-mode=(string)progressive, pixel-aspect-ratio=(fraction)1/1; video/x-raw, format=(string)YV12, framerate=(fraction)30000/1001, width=(int)816, height=(int)616, interlace-mode=(string)progressive, pixel-aspect-ratio=(fraction)1/1; video/x-raw, format=(string)BGR, framerate=(fraction)30000/1001, width=(int)816, height=(int)616, interlace-mode=(string)progressive, pixel-aspect-ratio=(fraction)1/1; video/x-raw, format=(st
 ring)RGB, framerate=(fraction)30000/1001, width=(int)816, height=(int)616, interlace-mode=(string)progressive, pixel-aspect-ratio=(fraction)1/1
>
>     despite the media pipeline actually being configured for 60fps.
>
>     Forcing it by adjusting the pipeline only results in gstreamer
>     failing, because it believes that v4l2 is unable to operate at
>     60fps.
>
>     Also note the complaints from v4l2src about the non-compliance...

Thanks, I've fixed most of v4l2-compliance issues, but this is not
done yet. Is that something you can help with?

Steve


--------------068B54720AA867F86D8CB3F5
Content-Type: application/x-shellscript; name="udpstream.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="udpstream.sh"

IyEvYmluL2Jhc2gKCnc9JDEKaD0kMgpmbXQ9JDMKZGV2PSQ0CnBvcnQ9JDUKCmlmIFtbICEg
JHcgXV0gfHwgW1sgISAkaCBdXSB8fCBbWyAhICRmbXQgXV0gfHwgW1sgISAkZGV2IF1dIHx8
IFtbICEgJHBvcnQgXV07IHRoZW4KICAgIGVjaG8gIlVzYWdlOiAkMCA8d2lkdGg+IDxoZWln
aHQ+IDxmb3VyY2M+IDxkZXZub2RlICM+IDx1ZHAgcG9ydD4iCiAgICBleGl0IDEKZmkKCmdz
dC1sYXVuY2gtMS4wIHY0bDJzcmMgZGV2aWNlPS9kZXYvdmlkZW8kZGV2ICEgInZpZGVvL3gt
cmF3LGZvcm1hdD0kZm10LHdpZHRoPSR3LGhlaWdodD0kaCIgISBqcGVnZW5jICEgcXVldWUg
ISBhdmltdXggbmFtZT1tdXggISB1ZHBzaW5rIGhvc3Q9MTkyLjE2OC4xLjU5IHBvcnQ9JHBv
cnQK
--------------068B54720AA867F86D8CB3F5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
