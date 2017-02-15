From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Tue, 14 Feb 2017 18:27:09 -0800
Message-ID: <a581a944-9bee-e5ce-d7d7-24bf749a38e2@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1485870854.2932.63.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485870854.2932.63.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam@me>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

I've created a test branch off my imx-media-staging-md-wip called tc358743,
which cherry-picks a couple of your commits from your 
imx-media-staging-md-wip
branch:

[media] tc358743: set entity function to video interface bridge
[media] tc358743: put lanes in STOP state before starting streaming

And one more commit that enables the tc358743 in the DT for sabrelite:

ARM: dts: imx6-sabrelite: switch to tc358743

which is based off your work in imx6qdl-nitrogen6x-bd-hdmi-mipi.dtsi.

With that the tc358743 is loading fine, and is present in the media graph:

root@mx6q:~# dmesg | grep -i tc358
[   11.056799] imx-media: Registered subdev tc358743 1-000f
[   11.122133] imx-media: imx_media_create_link: tc358743 1-000f:0 -> 
imx6-mipi-csi2:0
[   11.490274] tc358743 1-000f: tc358743 found @ 0x1e (21a4000.i2c)


But I'm not able to get to testing streaming yet, see below.


On 01/31/2017 05:54 AM, Philipp Zabel wrote:
> Hi Steve,
>
> I have just tested the imx-media-staging-md-wip branch on a Nitrogen6X
> with a tc358743 (BD_HDMI_MIPI HDMI to MIPI CSI-2 receiver board). Some
> observations:
>
> # Link pipeline
> media-ctl -l "'tc358743 1-000f':0->'imx6-mipi-csi2':0[1]"
> media-ctl -l "'imx6-mipi-csi2':1->'ipu1_csi0_mux':0[1]"
> media-ctl -l "'ipu1_csi0_mux':2->'ipu1_csi0':0[1]"
> media-ctl -l "'ipu1_csi0':2->'ipu1_csi0 capture':0[1]"

This works fine, I can create these links.

>
> # Provide an EDID to the HDMI source
> v4l2-ctl -d /dev/v4l-subdev2 --set-edid=file=edid-1080p.hex

I can probably generate this Intel hex file myself from sysfs
edid outputs, but for convenience do you mind sending me this
file? I have a 1080p HDMI source I can plug into the tc358743.

The other problem here is that my version of v4l2-ctl, built from
master branch of git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:gjasny/v4l-utils.git, does not
support taking a subdev node:

root@mx6q:~# v4l2-ctl -d /dev/v4l-subdev15 --get-edid=format=hex
VIDIOC_QUERYCAP: failed: Inappropriate ioctl for device
/dev/v4l-subdev15: not a v4l2 node

Is this something you added yourself, or where can I find this version
of v4l2-ctrl?

Thanks,
Steve

> # At this point the HDMI source is enabled and sends a 1080p60 signal
> # Configure detected DV timings
> media-ctl --set-dv "'tc358743 1-000f':0"
>
> # Set pad formats
> media-ctl --set-v4l2 "'tc358743 1-000f':0[fmt:UYVY/1920x1080]"
> media-ctl --set-v4l2 "'imx6-mipi-csi2':1[fmt:UYVY2X8/1920x1080]"
> media-ctl --set-v4l2 "'ipu1_csi0_mux':2[fmt:UYVY2X8/1920x1080]"
> media-ctl --set-v4l2 "'ipu1_csi0':2[fmt:AYUV32/1920x1080]"
>
> v4l2-ctl -d /dev/video4 -V
> # This still is configured to 640x480, which is inconsistent with
> # the 'ipu1_csi0':2 pad format. The pad set_fmt above should
> # have set this, too.
>
> v4l2-ctl --list-formats -d /dev/video4
> # This lists all the RGB formats, which it shouldn't. There is
> # no CSC in this pipeline, so we should be limited to YUV formats
> # only.
>
> # Set capture format
> v4l2-ctl -d /dev/video4 -v width=1920,height=1080,pixelformat=UYVY
>
> v4l2-ctl -d /dev/video4 -V
> # Now the capture format is correctly configured to 1920x1080.
>
> v4l2-ctl -d 4 --list-frameintervals=width=1920,height=1080,pixelformat=UYVY
> # This lists nothing. We should at least provide the 'ipu1_csi0':2 pad
> # frame interval. In the future this should list fractions achievable
> # via frame skipping.
>
> v4l2-compliance -d /dev/video4
> # This fails two tests:
> # fail: v4l2-test-input-output.cpp(383): std == 0
> # fail: v4l2-test-input-output.cpp(449): invalid attributes for input 0
> # test VIDIOC_G/S/ENUMINPUT: FAIL
> # and
> # fail: v4l2-test-controls.cpp(782): subscribe event for control 'User Controls' failed
> # test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>
> # (Slowly) stream JPEG images to a display host:
> gst-launch-1.0 -v v4l2src device=/dev/video4 ! jpegenc ! rtpjpegpay ! udpsink
>
> I've done this a few times, and sometimes I only get a "ipu1_csi0: EOF
> timeout" message when starting streaming.
>
> regards
> Philipp
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
