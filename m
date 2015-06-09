From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 01/22] usb: add OTG version number in
 usb_otg_descriptor
Date: Tue, 9 Jun 2015 18:15:04 +0300
Message-ID: <20150609181504.2882e9f9@rockdesk>
References: <20150609135130.GA20453@shlinux1.ap.freescale.net>
	<Pine.LNX.4.44L0.1506091013460.1324-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1506091013460.1324-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Tue, 9 Jun 2015 10:16:23 -0400
Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org> wrote:

> On Tue, 9 Jun 2015, Li Jun wrote:
> 
> > > > -/* USB_DT_OTG (from OTG 1.0a supplement) */
> > > > +/* USB_DT_OTG */
> > > >  struct usb_otg_descriptor {
> > > >  	__u8  bLength;
> > > >  	__u8  bDescriptorType;
> > > >  
> > > >  	__u8  bmAttributes;	/* support for HNP, SRP, etc */
> > > > +	struct bcdOTG otg_rev[0];
> > > 
> > > why not just __le16 bcdOTG here ?
> > 
> > usb_otg_descriptor of OTG 1.0 and 2.0 have different size, if directly add
> > __le16 bcdOTG here, then it cannot used for OTG 1.0.
> > I use a zero length array as Peter suggested here for bcdOTG, then the size
> > of usb_otg_descriptor is still 3(not 5), which is compliant with OTG 1.x, if OTG

where does the memory for the zero length array pointer get allocated then?

> > 2.0 or later, we can use member of otg_rev to add bcdOTG, then the size
> > of usb_otg_descriptor + bcdOTG will be 5, in one word, I want to use existing
> > usb_otg_descriptor struct to cover both OTG 1.x and 2.0
> 
> In the end, you may find it is simpler to use two different 
> structures: usb_otg_descriptor and usb_otg_20_descriptor.  
> Try it and see.
> 

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
