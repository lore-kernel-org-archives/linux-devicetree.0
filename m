From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCHv5 05/20] Documentation: dt-bindings: update ehci-orion
 binding documentation
Date: Mon, 12 May 2014 11:46:48 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1405121145220.1202-100000@iolanthe.rowland.org>
References: <5370DC0C.60604@free-electrons.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5370DC0C.60604-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 12 May 2014, Gregory CLEMENT wrote:

> Hi Alan,
> 
> On 11/05/2014 20:17, Thomas Petazzoni wrote:
> > This commit updates the Device Tree binding documentation of
> > ehci-orion to take into account the fact that we can now optionally
> > pass a clock and a PHY reference.
> 
> Would you agree to take this patch with the 4 first ones?
> 
> For this kind of change in the device tree the agreement was that it
> can be directly taken by the maintainer of the subsystem. Indeed here
> we don't introduce a new kind of device tree node, we just add a optional
> resource already used in many place.

Sorry, I missed this one.  Is it okay with the DT people?  If it is, 
you can submit it directly to Greg KH and he'll merge it.

Alan Stern

> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/usb/ehci-orion.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/ehci-orion.txt b/Documentation/devicetree/bindings/usb/ehci-orion.txt
> > index 6bc09ec..17c3bc8 100644
> > --- a/Documentation/devicetree/bindings/usb/ehci-orion.txt
> > +++ b/Documentation/devicetree/bindings/usb/ehci-orion.txt
> > @@ -6,6 +6,11 @@ Required properties:
> >    region.
> >  - interrupts: The EHCI interrupt
> >  
> > +Optional properties:
> > +- clocks: reference to the clock
> > +- phys: reference to the USB PHY
> > +- phy-names: name of the USB PHY, should be "usb"
> > +
> >  Example:
> >  
> >  	ehci@50000 {
> > 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
