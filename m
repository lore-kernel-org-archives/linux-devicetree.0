From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform
 driver
Date: Tue, 23 Oct 2012 15:33:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1210231522230.1635-100000@iolanthe.rowland.org>
References: <5086E62D.8040407@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5086E62D.8040407-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 23 Oct 2012, Stephen Warren wrote:

> > Nothing intrinsically distinguishes this class of hardware.  The only
> > thing these devices have in common is that they can be managed by
> > Linux's ehci-platform driver.
> 
> I don't agree. They're all EHCI USB controllers (or all EHCI USB
> controllers that don't require custom drivers due to quirks), which is a
> much more general statement than anything related to which driver Linux
> uses for them.

That's true, but it doesn't distinguish these devices.  There are other
EHCI controllers with no quirks that nevertheless can't be handled by
ehci-platform because they have requirements (_not_ quirks) that
ehci-platform is unable to deal with currently -- clocks or power
supplies or special register settings or PHYs or etc.

> > In essense, we're trying to say that the HW is compatible with a 
> > particular driver rather than with some other type of HW.
> 
> Using a compatible value in order to pick a specific driver in Linux is
> explicitly against the device tree design principles; DT is supposed to
> represent just the hardware.
> 
> > Maybe DT
> > wasn't intended to provide this kind of information, but it seems like 
> > a logical thing to do.  Unless DT already offers some other way to 
> > accomplish the same thing?
> 
> The typical way is for the Linux driver to declare that is supports a
> variety of different HW models.
> 
> Admittedly this is annoying when there are many HW models that otherwise
> wouldn't need any driver changes, hence the desire to (additionally)
> include some generic value in the compatible field, but again, what that
> generic value is should be driven by the HW itself, not the SW that's
> using it.

Okay, fine.  But then what should the binding documentation specify for
the compatible value?  A list of all the HW models that the driver
currently supports?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
