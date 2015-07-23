From: Badola Nikhil <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 1/3] Documentation: dt: dwc3: Add snps,configure-fladj
 property
Date: Thu, 23 Jul 2015 10:52:19 +0000
Message-ID: <SN1PR0301MB1629C9F2083C8C4F5CE8CE4EF3820@SN1PR0301MB1629.namprd03.prod.outlook.com>
References: <1437646161-1764-1-git-send-email-nikhil.badola@freescale.com>
 <20150723095635.GA12330@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150723095635.GA12330@leverpostej>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]
> Sent: Thursday, July 23, 2015 3:27 PM
> To: Badola Nikhil-B46172
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; balbi-l0cyMroinI0@public.gmane.org
> Subject: Re: [PATCH 1/3] Documentation: dt: dwc3: Add snps,configure-fladj
> property
> 
> On Thu, Jul 23, 2015 at 11:09:21AM +0100, Nikhil Badola wrote:
> > Add property snps,configure-fladj for enabling post silicon frame
> > length adjustment
> >
> > Signed-off-by: Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> > b/Documentation/devicetree/bindings/usb/dwc3.txt
> > index 0815eac..90c3972 100644
> > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> > @@ -40,6 +40,7 @@ Optional properties:
> >   - snps,hird-threshold: HIRD threshold
> >   - snps,hsphy_interface: High-Speed PHY interface selection between
> "utmi" for
> >     UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has
> value 3.
> > + - snps,configure-fladj: enables post-silicon frame length adjustment
> 
> Could you elaborate on what this means and why you think it's necessary?

This property enables the use of GFLADJ_30MHZ field value of gfladj register for frame length 
adjustment instead of considering from the sideband input signal fladj_30mhz_reg from SOC. 
This is required when signal fladj_30mhz_reg is connected to a wrong value or is not valid as 
in our case, hence post-silicon.

However this field can be used to adjust any offset ranging from 00h to 3Fh, from the
clock source generating SOF(start of frame) packets. Thus, this property can be added to device 
tree with appropriate adjustment value.

> 
> >
> >  This is usually a subnode to DWC3 glue to which it is connected.
> >
> > --
> > 2.1.0
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe devicetree"
> > in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More
> majordomo
> > info at  http://vger.kernel.org/majordomo-info.html
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
