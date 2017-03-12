From: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>
Subject: Re: [PATCH v5 00/39] i.MX Media Driver
Date: Sun, 12 Mar 2017 19:10:02 -0300
Message-ID: <20170312191002.5f0a2cff@vento.lan>
References: <1489121599-23206-1-git-send-email-steve_longerbeam@mentor.com>
        <20170312194700.GR21222@n2100.armlinux.org.uk>
        <20170312175923.6ad86dff@vento.lan>
        <20170312211324.GW21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170312211324.GW21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWNGWvitb5QawA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Em Sun, 12 Mar 2017 21:13:24 +0000
Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> escreveu:

> On Sun, Mar 12, 2017 at 05:59:28PM -0300, Mauro Carvalho Chehab wrote:
> > Yet, udev/systemd has some rules that provide an unique name for V4L
> > devices at /lib/udev/rules.d/60-persistent-v4l.rules. Basically, it
> > runs a small application (v4l_id) with creates a persistent symling
> > using rules like this:
> > 
> > 	KERNEL=="video*", ENV{ID_SERIAL}=="?*", SYMLINK+="v4l/by-id/$env{ID_BUS}-$env{ID_SERIAL}-video-index$attr{index}"
> > 
> > Those names are stored at /dev/v4l/by-path.  
> 
> This doesn't help:
> 
> $ ls -Al /dev/v4l/by-id/
> total 0
> lrwxrwxrwx 1 root root 13 Mar 12 19:54 usb-Sonix_Technology_Co.__Ltd._USB_2.0_Camera-video-index0 -> ../../video10
> $ ls -Al /dev/v4l/by-path/
> total 0
> lrwxrwxrwx 1 root root 12 Mar 12 19:54 platform-2040000.vpu-video-index0 -> ../../video0
> lrwxrwxrwx 1 root root 12 Mar 12 19:54 platform-2040000.vpu-video-index1 -> ../../video1
> lrwxrwxrwx 1 root root 12 Mar 12 20:53 platform-capture-subsystem-video-index0 -> ../../video2
> lrwxrwxrwx 1 root root 12 Mar 12 20:53 platform-capture-subsystem-video-index1 -> ../../video3
> lrwxrwxrwx 1 root root 12 Mar 12 20:53 platform-capture-subsystem-video-index2 -> ../../video4
> lrwxrwxrwx 1 root root 12 Mar 12 20:53 platform-capture-subsystem-video-index3 -> ../../video5
> lrwxrwxrwx 1 root root 12 Mar 12 20:53 platform-capture-subsystem-video-index4 -> ../../video6
> lrwxrwxrwx 1 root root 12 Mar 12 20:53 platform-capture-subsystem-video-index5 -> ../../video7
> lrwxrwxrwx 1 root root 12 Mar 12 20:53 platform-capture-subsystem-video-index6 -> ../../video8
> lrwxrwxrwx 1 root root 12 Mar 12 20:53 platform-capture-subsystem-video-index7 -> ../../video9
> lrwxrwxrwx 1 root root 13 Mar 12 19:54 platform-ci_hdrc.0-usb-0:1:1.0-video-index0 -> ../../video10
> 
> The problem is the "platform-capture-subsystem-video-index" entries.
> These themselves change order.  For instance, I now have:
> 
> - entity 72: ipu1_csi0 capture (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video6
> 
> which means it's platform-capture-subsystem-video-index4.  Before, it
> was platform-capture-subsystem-video-index2.

That's a driver problem. v4l_id gets information to build the persistent
name from the result of VIDIOC_QUERYCAP.

In the case of Exynos gsc driver, for example, the information is here:

static int gsc_m2m_querycap(struct file *file, void *fh,
			   struct v4l2_capability *cap)
{
	struct gsc_ctx *ctx = fh_to_ctx(fh);
	struct gsc_dev *gsc = ctx->gsc_dev;

	strlcpy(cap->driver, GSC_MODULE_NAME, sizeof(cap->driver));
	strlcpy(cap->card, GSC_MODULE_NAME " gscaler", sizeof(cap->card));
	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
		 dev_name(&gsc->pdev->dev));
	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE |
		V4L2_CAP_VIDEO_CAPTURE_MPLANE |	V4L2_CAP_VIDEO_OUTPUT_MPLANE;

	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
	return 0;
}

See that the bus_info there is filled with:

	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s", dev_name(&gsc->pdev->dev));

>From the output you printed, it seems that the i.MX6 is just doing:
	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:");
for some devices.

If you change the i.MX6 driver to do the same, you'll likely be able to
have unique names there too.

Regards,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
