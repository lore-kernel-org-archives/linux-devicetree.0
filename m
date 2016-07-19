From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] doc: usb: ci-hdrc-usb2: add property
 over-current-polarity
Date: Tue, 19 Jul 2016 09:47:00 +0800
Message-ID: <20160719014700.GH31293@shlinux2>
References: <1468840547-17899-1-git-send-email-jun.li@nxp.com>
 <1468840547-17899-2-git-send-email-jun.li@nxp.com>
 <578CF4C2.4000804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <578CF4C2.4000804-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>, peter.chen-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 18, 2016 at 08:24:50AM -0700, Joshua Clayton wrote:
> Greetings,
> On 07/18/2016 04:15 AM, Li Jun wrote:
> > Adding over-current-polarity to indicate the over current flag
> > is low active or high active.
> >
> > Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > index 341dc67..c5d35f4 100644
> > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > @@ -81,6 +81,8 @@ i.mx specific properties
> >  - fsl,usbmisc: phandler of non-core register device, with one
> >    argument that indicate usb controller index
> >  - disable-over-current: disable over current detect
> > +- over-current-polarity: 0 if the over current signal polarity is low active,
> > +  1 if the over current signal polarity is high active.
> >  - external-vbus-divider: enables off-chip resistor divider for Vbus
> >  
> >  Example:
> The gpio device bindings already have active low/ active high.
> Could that be used here?
> 

No, the over current pin is a dedicated pin for USB, you need
to configure it through pinmux. If we are using a gpio (even
the same pin as OC pin), the USB subsystem will not know
OC event. The polarity is for OC pin and configured through
USB register.

> In the imx SPI subsystem, for instance, the developers used gpio rather than
> MUXED spi chipselect lines for exactly this kind of flexibility.
> 
> If there is no magic happening in silicon (which would seem to be the case if we can
> handle inverting polarity in the driver), I would suggest going the gpiod route.
> 

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
