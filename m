From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/4] doc: dt-binding: ci-hdrc-usb2: add i.mx specific
 binding "need-three-clocks"
Date: Fri, 18 Sep 2015 10:35:49 +0800
Message-ID: <20150918023544.GA24297@shlinux2>
References: <1442368183-8103-1-git-send-email-peter.chen@freescale.com>
 <1442368183-8103-2-git-send-email-peter.chen@freescale.com>
 <55F97491.5060105@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F97491.5060105-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 16, 2015 at 08:54:25AM -0500, Rob Herring wrote:
> On 09/15/2015 08:49 PM, Peter Chen wrote:
> > Some SoCs needs three clock to let controller work, but others only
> > need one, add one property to differentiate this.
> 
> A given licensed IP block is going to have the same number of clock
> inputs from SOC to SOC.

Yes, I agree with you.

> So different numbers of clocks is a bit suspect.
> I guess there can be variations in bus clocks or other outside logic.

There are legacy platforms, no one knows exactly what the
other clocks are used for, and the former i.mx usb driver
(see drivers/usb/gadget/udc/fsl_mxc_udc.c) uses like this way.
So, I just follow it.

> 
> > 
> > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > index f15a317..4900092 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > @@ -54,6 +54,9 @@ i.mx specific properties
> >    argument that indicate usb controller index
> >  - disable-over-current: disable over current detect
> >  - external-vbus-divider: enables off-chip resistor divider for Vbus
> > +- need-three-clocks: the SoC before imx6 series (except for imx23/imx28)
> > +  needs three clcoks for controller, others only need one. Without this
> > +  property, the driver will consider this controller only need one clock.
> 
> That's pretty ugly and unnecessary. Either use the compatible string to
> determine

Since there are too many SoCs to use it, I just didn't want to add
judgement for platforms, and thought using feature property is simpler.
If you doesn't agree, I will use other ways.

> if you have 3 clocks or just always try to retrieve the 3
> clocks in the driver and fall back to 1.
> 

It is not easy to use this way, one-clock platforms have no dev_id for
clock, but three-clock platforms have.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
