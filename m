From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v3 00/24] i.MX Media Driver
Date: Fri, 20 Jan 2017 14:52:55 +0100
Message-ID: <c6e98327-7e2c-f34a-2d23-af7b236de441@xs4all.nl>
References: <1483755102-24785-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483755102-24785-1-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Steve, Philipp,

On 01/07/2017 03:11 AM, Steve Longerbeam wrote:
> In version 3:
> 
> Changes suggested by Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> 
>   - prepended FIM node properties with vendor prefix "fsl,".
> 
>   - make mipi csi-2 receiver compatible string SoC specific:
>     "fsl,imx6-mipi-csi2" instead of "fsl,imx-mipi-csi2".
> 
>   - redundant "_clk" removed from mipi csi-2 receiver clock-names property.
> 
>   - removed board-specific info from the media driver binding doc. These
>     were all related to sensor bindings, which already are (adv7180)
>     or will be (ov564x) covered in separate binding docs. All reference
>     board info not related to DT bindings has been moved to
>     Documentation/media/v4l-drivers/imx.rst.
> 
>   - removed "_mipi" from the OV5640 compatible string.
> 
> Changes suggested by Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>:
> 
>   Mostly cosmetic/non-functional changes which I won't list here, except
>   for the following:
> 
>   - spin_lock_irqsave() changed to spin_lock() in a couple interrupt handlers.
> 
>   - fixed some unnecessary of_node_put()'s in for_each_child_of_node() loops.
> 
>   - check/handle return code from required reg property of CSI port nodes.
> 
>   - check/handle return code from clk_prepare_enable().
> 
> Changes suggested by Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> 
>   - switch to VGEN3 Analog Vdd supply assuming rev. C SabreSD boards.
> 
>   - finally got around to passing valid IOMUX pin config values to the
>     pin groups.
> 
> Other changes:
> 
>   - removed the FIM properties that overrided the v4l2 FIM control defaults
>     values. This was left-over from a requirement of a customer and is not
>     necessary here.
> 
>   - The FIM must be explicitly enabled in the fim child node under the CSI
>     port nodes, using the status property. If not enabled, FIM v4l2 controls
>     will not appear in the video capture driver.
> 
>   - brought in additional media types patch from Philipp Zabel. Use new
>     MEDIA_ENT_F_VID_IF_BRIDGE in mipi csi-2 receiver subdev.
> 
>   - brought in latest platform generic video multiplexer subdevice driver
>     from Philipp Zabel (squashed with patch that uses new MEDIA_ENT_F_MUX).
> 
>   - removed imx-media-of.h, moved those prototypes into imx-media.h.

Based on the discussion on the mailinglist it seems everyone agrees that this
is the preferred driver, correct?

There are a bunch of review comments, so I will wait for a v4. I plan to merge
that staging driver unless there are major issues with it.

I am not sure if I would merge those sensor drivers in staging, I'll have to
take a closer look at those once v4 is posted.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
