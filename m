From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] [media] imx: csi: retain current field order and
 colorimetry setting as default
Date: Thu, 06 Apr 2017 17:25:54 +0200
Message-ID: <1491492354.2392.87.camel@pengutronix.de>
References: <1490661656-10318-1-git-send-email-steve_longerbeam@mentor.com>
         <1490661656-10318-22-git-send-email-steve_longerbeam@mentor.com>
         <1491486929.2392.29.camel@pengutronix.de>
         <20170406140533.GF17774@n2100.armlinux.org.uk>
         <1491490912.2392.74.camel@pengutronix.de>
         <20170406151032.GH17774@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170406151032.GH17774-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media@v
List-Id: devicetree@vger.kernel.org

On Thu, 2017-04-06 at 16:10 +0100, Russell King - ARM Linux wrote:
> On Thu, Apr 06, 2017 at 05:01:52PM +0200, Philipp Zabel wrote:
> > On Thu, 2017-04-06 at 15:05 +0100, Russell King - ARM Linux wrote:
> > > On Thu, Apr 06, 2017 at 03:55:29PM +0200, Philipp Zabel wrote:
> > > > +
> > > > +	/* Retain current field setting as default */
> > > > +	if (sdformat->format.field == V4L2_FIELD_ANY)
> > > > +		sdformat->format.field = fmt->field;
> > > > +
> > > > +	/* Retain current colorspace setting as default */
> > > > +	if (sdformat->format.colorspace == V4L2_COLORSPACE_DEFAULT) {
> > > > +		sdformat->format.colorspace = fmt->colorspace;
> > > > +		if (sdformat->format.xfer_func == V4L2_XFER_FUNC_DEFAULT)
> > > > +			sdformat->format.xfer_func = fmt->xfer_func;
> > > > +		if (sdformat->format.ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
> > > > +			sdformat->format.ycbcr_enc = fmt->ycbcr_enc;
> > > > +		if (sdformat->format.quantization == V4L2_QUANTIZATION_DEFAULT)
> > > > +			sdformat->format.quantization = fmt->quantization;
> > > > +	} else {
> > > > +		if (sdformat->format.xfer_func == V4L2_XFER_FUNC_DEFAULT) {
> > > > +			sdformat->format.xfer_func =
> > > > +				V4L2_MAP_XFER_FUNC_DEFAULT(
> > > > +						sdformat->format.colorspace);
> > > > +		}
> > > > +		if (sdformat->format.ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT) {
> > > > +			sdformat->format.ycbcr_enc =
> > > > +				V4L2_MAP_YCBCR_ENC_DEFAULT(
> > > > +						sdformat->format.colorspace);
> > > > +		}
> > > > +		if (sdformat->format.quantization == V4L2_QUANTIZATION_DEFAULT) {
> > > > +			sdformat->format.quantization =
> > > > +				V4L2_MAP_QUANTIZATION_DEFAULT(
> > > > +						cc->cs != IPUV3_COLORSPACE_YUV,
> > > > +						sdformat->format.colorspace,
> > > > +						sdformat->format.ycbcr_enc);
> > > > +		}
> > > > +	}
> > > 
> > > Would it make sense for this to be a helper function?
> > 
> > Quite possible, the next subdev that has to set frame_interval on both
> > pads manually because its upstream source pad doesn't suport
> > frame_interval might want to do the same.
> 
> Hmm.  I'm not sure I agree with this approach.  If a subdev hardware
> does not support any modification of the colourspace or field, then
> it should not be modifyable at the source pad - it should retain the
> propagated settings from the sink pad.

This new code is only relevant for the CSI_SINK_PAD.

> I thought I had already sent a patch doing exactly that.

Yes. Right above the modification there is a call to csi_try_fmt which
will already fix up sdformat->format for the source pads. So for the
CSI_SRC_PAD_DIRECT and CSI_SRC_PAD_IDMAC this should amount to a no-op.

If might be better to move this into a separate function and only call
it if sdformat->pad == CSI_SINK_PAD.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
