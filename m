From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Mon, 30 Jan 2017 17:22:01 -0800
Message-ID: <951c1a08-c0f2-4333-b4bf-410de8dd863f@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <20170131004510.GQ27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170131004510.GQ27312-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media@vger.
List-Id: devicetree@vger.kernel.org



On 01/30/2017 04:45 PM, Russell King - ARM Linux wrote:
>
> Hi,
>
> Trying this driver with an imx219 camera (which works with Philipp's
> driver) results in not much happening... no /dev/media* node for it,
> no subdevs, no nothing.  No clues as to what's missing either.  Only
> messages from imx-media are from registering the various subdevs.
>
> [   37.444877] imx-media: Registered subdev imx6-mipi-csi2
> [   37.444973] imx-media: Registered subdev imx219 0-0010
> [   38.868740] imx-media: Registered subdev ipu1_ic_prpenc
> [   38.869265] imx-media: Registered subdev ipu1_ic_prpvf
> [   38.869425] imx-media: Registered subdev ipu1_ic_pp0
> [   38.870086] imx-media: Registered subdev ipu1_ic_pp1
> [   38.871510] imx-media: Registered subdev ipu2_ic_prpenc
> [   38.871743] imx-media: Registered subdev ipu1_smfc0
> [   38.873043] imx-media: Registered subdev ipu1_smfc1
> [   38.873225] imx-media: Registered subdev ipu2_ic_prpvf
> [   38.875027] imx-media: Registered subdev ipu2_smfc0
> [   38.875320] imx-media: Registered subdev ipu2_ic_pp0
> [   38.877148] imx-media: Registered subdev ipu2_smfc1
> [   38.877436] imx-media: Registered subdev ipu2_ic_pp1
> [   38.932089] imx-media: Registered subdev camif0
> [   38.956538] imx-media: Registered subdev camif1
> [   38.959148] imx-media: Registered subdev camif2
> [   38.964353] imx-media: Registered subdev camif3
> [  206.502077] imx-media: Registered subdev ipu1_csi0
> [  206.503304] imx-media: Registered subdev ipu1_csi1
> [  206.503814] imx-media: Registered subdev ipu2_csi0
> [  206.504281] imx-media: Registered subdev ipu2_csi1
>
> I also get:
>
> [   37.200072] imx6-mipi-csi2: data lanes: 2
> [   37.200077] imx6-mipi-csi2: flags: 0x00000200
>
> and from what I can see, all modules from drivers/staging/media/imx/ are
> loaded (had to load imx-csi by hand because of the brokenness in the
> drivers/gpu/ipu code attaching an device_node pointer after registering
> the platform device, which changes what userspace sees in the modalias
> file.)
>
> Any clues at what to look at?

Hi Russell,

I'm not familiar with IMX219, can you send me the source for the
imx219 subdev? I don't see it in 4.10-rc1.

I'm also having trouble finding a datasheet for it, but from what
I've read, it has a MIPI CSI-2 interface. It should work fine as long
as it presents a single source pad, registers asynchronously, and
sets its entity function to MEDIA_ENT_F_CAM_SENSOR.

Since I see it was registered asynchronously from the above, it
must have been added to the device tree. But given that there
is no /dev/media? node, the media driver is probably waiting for
another subdev to register, I don't know what that would be.

Can you send me the full patch on top of the v3 driver and I'll
try to find what's missing.

Edit: I see a subdev that is missing: the video mux. Did you enable
CONFIG_VIDEO_MULTIPLEXER?

Finally, what platform does this IMX219 sensor module plug into?


Steve

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
