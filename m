From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v3 20/24] media: imx: Add Camera Interface subdev driver
Date: Tue, 31 Jan 2017 13:42:52 +0000
Message-ID: <20170131134252.GX27312@n2100.armlinux.org.uk>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-21-git-send-email-steve_longerbeam@mentor.com>
 <b7456d40-040d-41b7-45bc-ef6709ab7933@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b7456d40-040d-41b7-45bc-ef6709ab7933-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.orgSteve
List-Id: devicetree@vger.kernel.org

On Fri, Jan 20, 2017 at 03:38:28PM +0100, Hans Verkuil wrote:
> Should be set to something like 'platform:imx-media-camif'. v4l2-compliance
> should complain about this.

... and more.

Driver Info:
        Driver name   : imx-media-camif
        Card type     : imx-media-camif
        Bus info      :
        Driver version: 4.10.0
        Capabilities  : 0x84200001
                Video Capture
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps   : 0x04200001
                Video Capture
                Streaming
                Extended Pix Format

Compliance test for device /dev/video3 (not using libv4l2):

Required ioctls:
                fail: v4l2-compliance.cpp(244): string empty
                fail: v4l2-compliance.cpp(297): check_ustring(vcap.bus_info, sizeof(vcap.bus_info))
        test VIDIOC_QUERYCAP: FAIL

Allow for multiple opens:
        test second video open: OK
                fail: v4l2-compliance.cpp(244): string empty
                fail: v4l2-compliance.cpp(297): check_ustring(vcap.bus_info, sizeof(vcap.bus_info))
        test VIDIOC_QUERYCAP: FAIL
        test VIDIOC_G/S_PRIORITY: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
                fail: v4l2-test-input-output.cpp(382): std == 0
                fail: v4l2-test-input-output.cpp(437): invalid attributes for input 0
        test VIDIOC_G/S/ENUMINPUT: FAIL
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

        Control ioctls:
                test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
                test VIDIOC_QUERYCTRL: OK
                test VIDIOC_G/S_CTRL: OK
                test VIDIOC_G/S/TRY_EXT_CTRLS: OK
                fail: v4l2-test-controls.cpp(779): subscribe event for control 'Camera Controls' failed
                test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
                test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
                Standard Controls: 13 Private Controls: 0

        Format ioctls:
                test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
                test VIDIOC_G/S_PARM: OK (Not Supported)
                test VIDIOC_G_FBUF: OK (Not Supported)
                fail: v4l2-test-formats.cpp(414): unknown pixelformat 42474752 for buftype 1
                test VIDIOC_G_FMT: FAIL
                test VIDIOC_TRY_FMT: OK (Not Supported)
                test VIDIOC_S_FMT: OK (Not Supported)
                test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)

        Codec ioctls:
                test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
                test VIDIOC_G_ENC_INDEX: OK (Not Supported)
                test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

        Buffer ioctls:
                test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
                fail: v4l2-test-buffers.cpp(500): q.has_expbuf(node)
                test VIDIOC_EXPBUF: FAIL


Total: 39, Succeeded: 33, Failed: 6, Warnings: 0

Not all of these may be a result of Steve's code - this is running against
my gradually modified version to support bayer formats (which seems to be
the cause of the v4l2-test-formats.cpp failure... for some reason the
driver isn't enumerating all the formats.)

And that reason is the way that the formats are enumerated:

static int camif_enum_fmt_vid_cap(struct file *file, void *fh,
                                  struct v4l2_fmtdesc *f)
{
        const struct imx_media_pixfmt *cc;
        u32 code;
        int ret;

        ret = imx_media_enum_format(&code, f->index, true, true);
        if (ret)
                return ret;
        cc = imx_media_find_format(0, code, true, true);
        if (!cc)
                return -EINVAL;

When imx_media_enum_format() hits this entry in the table:

        }, {
                .fourcc = V4L2_PIX_FMT_BGR24,
                .cs     = IPUV3_COLORSPACE_RGB,
                .bpp    = 24,
        }, {

becaues there's no .codes defined:

int imx_media_enum_format(u32 *code, u32 index, bool allow_rgb,
                          bool allow_planar)
{
...
        *code = fmt->codes[0];
        return 0;
}

So, we end up calling imx_media_find_format(0, 0, true, true), which
fails, returning NULL.  That causes camif_enum_fmt_vid_cap() to
return -EINVAL.

So everything past this entry is unable to be enumerated.

I think this is a really round-about way of enumerating the pixel
formats when there are soo many entries in the table which have no
media bus code - there's absolutely no way that any of those entries
can ever be enumerated in this fashion, so they might as well not be
in the table...

That's my present solution to this problem, to #if 0 out all the
entries without any .codes field.  I think the real answer is that
this needs a _separate_ function to enumerate the pixel formats for
camif_enum_fmt_vid_cap().  However, there may be other issues lurking
that I've not yet found (still trying to get this code to work...)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
