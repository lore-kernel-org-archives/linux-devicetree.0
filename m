From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Kirkwood: ehci-orion: Add device tree binding
Date: Mon, 24 Sep 2012 09:13:53 +0200
Message-ID: <20120924071353.GA27099@lunn.ch>
References: <1346491586-23480-1-git-send-email-andrew@lunn.ch>
 <CAOesGMh1x8QMNBi_xKEfZ0druiAZbafVuXEQkktwVbQODDmR8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMh1x8QMNBi_xKEfZ0druiAZbafVuXEQkktwVbQODDmR8w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > +Required properties:
> > +- compatible: must be "marvell,orion-ehci"
> > +- reg: physical base address of the controller and length of memory mapped
> > +  region.
> > +- interrupts: The EHCI interrupt
> > +- phy-version: Can be one of:
> > +  "NA" - Don't touch the phy, something else has already configured it.
> > +  "orion5x" - PHY setup as specified by the Orion5x Errata
> > +
> > +Example:
> > +
> > +       ehci@50000 {
> > +               compatible = "marvell,orion-ehci";
> > +               reg = <0x50000 0x1000>;
> > +               interrupts = <19>;
> > +               phy-version = "NA";
> > +       };
> 
> This isn't an appropriate binding for phy. I know, it maps straight
> over from the platform data, but it doesn't focus on what the actual
> hardware is.
> 
> A couple of options. What probably makes most sense depending on how
> other phy bindings are moving ahead is to add a phy node under the
> ehci controller for the "orion5x" case, and have an appropriate
> compatible value there. No node means the same as "NA" in the above
> binding. Alternatively, have a phy phandle that points to the phy
> device if it sits on an i2c bus, etc.

I Olaf

Could i suggest a third option:

I just drop USB phy configuration all together.  Only mach-orion5x
needs this and nobody has shown any interest in moving mach-orion5x to
DT. So i would just hard code it to "NA".

If anybody does show interest in DT for orion5x, we can add a phy node
under ehci as a pure extension which does not affect backward
compatibility.

	Thanks
		Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
