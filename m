From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 21/24] media: imx: Add MIPI CSI-2 Receiver subdev
 driver
Date: Wed, 1 Feb 2017 16:04:50 -0800
Message-ID: <defa1129-e341-6b6a-b0b2-bd2d38088245@gmail.com>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
 <1483755102-24785-22-git-send-email-steve_longerbeam@mentor.com>
 <20170201234438.GS27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170201234438.GS27312-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam@m>
List-Id: devicetree@vger.kernel.org



On 02/01/2017 03:44 PM, Russell King - ARM Linux wrote:
> On Fri, Jan 06, 2017 at 06:11:39PM -0800, Steve Longerbeam wrote:
>> +static int imxcsi2_get_fmt(struct v4l2_subdev *sd,
>> +			   struct v4l2_subdev_pad_config *cfg,
>> +			   struct v4l2_subdev_format *sdformat)
>> +{
>> +	struct imxcsi2_dev *csi2 = sd_to_dev(sd);
>> +
>> +	sdformat->format = csi2->format_mbus;
>> +
>> +	return 0;
>> +}
> Hi Steve,
>
> This isn't correct, and I suspect the other get_fmt implementations are
> the same - I've just checked imx-csi.c, and that also appears to have
> the same issue.
>
> When get_fmt() is called with sdformat->which == V4L2_SUBDEV_FORMAT_TRY,
> you need to return the try format rather than the current format.  See
> the second paragraph of Documentation/media/uapi/v4l/dev-subdev.rst's
> "Format Negotiation" section, where it talks about using
> V4L2_SUBDEV_FORMAT_TRY with both VIDIOC_SUBDEV_G_FMT and
> VIDIOC_SUBDEV_S_FMT.

Yes that's wrong. I'll fix.

Btw I read over Documentation/media/uapi/v4l/dev-subdev.rst (can't
remember if I ever did!), and it clears up a lot. I do see I'm doing some
other things wrong as well:

-  Formats should be propagated from sink pads to source pads. Modifying
    a format on a source pad should not modify the format on any sink
    pad.

I don't believe I'm affecting the source pad formats during sink pad
negotiation, or vice-versa, yet. But I will, once the pixel width alignment
optimization is implemented based on whether the output format is planar.
And I'll keep this direction-of-propagation rule in mind when I do so.

-  Sub-devices that scale frames using variable scaling factors should
    reset the scale factors to default values when sink pads formats are
    modified. If the 1:1 scaling ratio is supported, this means that
    source pads formats should be reset to the sink pads formats.

I'm not resetting the scaling factors on sink pad format change in
the scaling subdevs (imx-ic-prpenc and imx-ic-prpvf). Will fix that.

Steve

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
