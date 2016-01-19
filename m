From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] USB: core: let USB device know device node
Date: Tue, 19 Jan 2016 10:52:54 +0800
Message-ID: <20160119025254.GA24548@shlinux2>
References: <20160118071309.GC8150@shlinux2>
 <Pine.LNX.4.44L0.1601181129340.25155-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1601181129340.25155-100000-pYrvlCTfrz9XsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 18, 2016 at 11:39:06AM -0500, Alan Stern wrote:
> On Mon, 18 Jan 2016, Peter Chen wrote:
> 
> > > > Why can't the root_hub reuse dev->dev.of_node?
> > > 
> > > Indeed, there's no need to add an .of_node field to struct usb_device, 
> > > since the embedded struct device already contains an .of_node field.
> > > 
> > 
> > No, the usb_device needs the .of_node field.
> 
> It already _has_ an .of_node field, in its embedded struct device.
> 
> > The devices belong to platform bus contains device node.
> > The devices (usb device) belong to USB bus which are created
> > dynamically do not contain device node.
> 
> I don't know what you mean.  struct usb_device _does_ contain an 
> embedded struct device.  It doesn't matter the structures are created 
> dynamically, statically, or any other way; this field is part of the 
> structure definition.
> 
> Suppose udev is a pointer to struct usb_device.  Then udev->dev is a
> struct device and udev->dev.of_node is a pointer to struct device_node.  
> You don't need to add a new udev->of_node field; just use
> udev->dev.of_node instead.
> 

Yes, you are right.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
