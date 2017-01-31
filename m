From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Tue, 31 Jan 2017 10:49:28 +0100
Message-ID: <1485856168.2932.11.camel@pengutronix.de>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
         <20170131004510.GQ27312@n2100.armlinux.org.uk>
         <951c1a08-c0f2-4333-b4bf-410de8dd863f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <951c1a08-c0f2-4333-b4bf-410de8dd863f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWPdpHbCvnp+Ag@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-01-30 at 17:22 -0800, Steve Longerbeam wrote:
> 
> On 01/30/2017 04:45 PM, Russell King - ARM Linux wrote:
> >
> > Hi,
> >
> > Trying this driver with an imx219 camera (which works with Philipp's
> > driver) results in not much happening... no /dev/media* node for it,
> > no subdevs, no nothing.  No clues as to what's missing either.  Only
> > messages from imx-media are from registering the various subdevs.
> >
> > [   37.444877] imx-media: Registered subdev imx6-mipi-csi2
> > [   37.444973] imx-media: Registered subdev imx219 0-0010
> > [   38.868740] imx-media: Registered subdev ipu1_ic_prpenc
> > [   38.869265] imx-media: Registered subdev ipu1_ic_prpvf
> > [   38.869425] imx-media: Registered subdev ipu1_ic_pp0
> > [   38.870086] imx-media: Registered subdev ipu1_ic_pp1
> > [   38.871510] imx-media: Registered subdev ipu2_ic_prpenc
> > [   38.871743] imx-media: Registered subdev ipu1_smfc0
> > [   38.873043] imx-media: Registered subdev ipu1_smfc1
> > [   38.873225] imx-media: Registered subdev ipu2_ic_prpvf
> > [   38.875027] imx-media: Registered subdev ipu2_smfc0
> > [   38.875320] imx-media: Registered subdev ipu2_ic_pp0
> > [   38.877148] imx-media: Registered subdev ipu2_smfc1
> > [   38.877436] imx-media: Registered subdev ipu2_ic_pp1
> > [   38.932089] imx-media: Registered subdev camif0
> > [   38.956538] imx-media: Registered subdev camif1
> > [   38.959148] imx-media: Registered subdev camif2
> > [   38.964353] imx-media: Registered subdev camif3
> > [  206.502077] imx-media: Registered subdev ipu1_csi0
> > [  206.503304] imx-media: Registered subdev ipu1_csi1
> > [  206.503814] imx-media: Registered subdev ipu2_csi0
> > [  206.504281] imx-media: Registered subdev ipu2_csi1
> >
> > I also get:
> >
> > [   37.200072] imx6-mipi-csi2: data lanes: 2
> > [   37.200077] imx6-mipi-csi2: flags: 0x00000200
> >
> > and from what I can see, all modules from drivers/staging/media/imx/ are
> > loaded (had to load imx-csi by hand because of the brokenness in the
> > drivers/gpu/ipu code attaching an device_node pointer after registering
> > the platform device, which changes what userspace sees in the modalias
> > file.)
> >
> > Any clues at what to look at?
> 
> Hi Russell,
> 
> I'm not familiar with IMX219, can you send me the source for the
> imx219 subdev? I don't see it in 4.10-rc1.
> 
> I'm also having trouble finding a datasheet for it, but from what
> I've read, it has a MIPI CSI-2 interface. It should work fine as long
> as it presents a single source pad, registers asynchronously, and
> sets its entity function to MEDIA_ENT_F_CAM_SENSOR.

What about MEDIA_ENT_F_VID_IF_BRIDGE?

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
