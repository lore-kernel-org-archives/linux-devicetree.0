From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v4 00/36] i.MX Media Driver
Date: Thu, 16 Feb 2017 11:37:58 +0000
Message-ID: <20170216113758.GK27312@n2100.armlinux.org.uk>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1487211578-11360-1-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.orgde
List-Id: devicetree@vger.kernel.org

Two problems.

On Wed, Feb 15, 2017 at 06:19:02PM -0800, Steve Longerbeam wrote:
>   media: imx: propagate sink pad formats to source pads

1) It looks like all cases aren't being caught:

- entity 74: ipu1_csi0 (3 pads, 4 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev13
        pad0: Sink
                [fmt:SRGGB8/816x616 field:none]
                <- "ipu1_csi0_mux":2 [ENABLED]
        pad1: Source
                [fmt:AYUV32/816x616 field:none
                 crop.bounds:(0,0)/816x616
                 crop:(0,0)/816x616]
                -> "ipu1_ic_prp":0 []
                -> "ipu1_vdic":0 []
        pad2: Source
                [fmt:SRGGB8/816x616 field:none
                 crop.bounds:(0,0)/816x616
                 crop:(0,0)/816x616]
                -> "ipu1_csi0 capture":0 [ENABLED]

While the size has been propagated to pad1, the format has not.

2) /dev/video* device node assignment

I've no idea at the moment how the correct /dev/video* node should be
chosen - initially with Philipp and your previous code, it was
/dev/video3 after initial boot.  Philipp's was consistently /dev/video3.
Yours changed to /dev/video7 when removing and re-inserting the modules
(having fixed that locally.)  This version makes CSI0 be /dev/video7,
but after a remove+reinsert, it becomes (eg) /dev/video8.

/dev/v4l/by-path/platform-capture-subsystem-video-index4 also is not a
stable path - the digit changes (it's supposed to be a stable path.)
After a remove+reinsert, it becomes (eg)
/dev/v4l/by-path/platform-capture-subsystem-video-index5.
/dev/v4l/by-id doesn't contain a symlink for this either.

What this means is that it's very hard to script the setup, because
there's no easy way to know what device is the capture device.  While
it may be possible to do:

	media-ctl -d /dev/media1 -p | \
		grep -A2 ': ipu1_csi0 capture' | \
			sed -n 's|.*\(/dev/video[0-9]*\).*|\1|p'

that's hardly a nice solution - while it fixes the setup script, it
doesn't stop the pain of having to delve around to find the correct
device to use for gstreamer to test with.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
