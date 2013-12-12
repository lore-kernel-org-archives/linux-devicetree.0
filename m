From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/9] phy: add phy_get_bus_width()/phy_set_bus_width()
 calls
Date: Thu, 12 Dec 2013 06:50:03 -0500
Message-ID: <20131212115003.GB20773@beef>
References: <1386847117-21240-1-git-send-email-mporter@linaro.org>
 <1386847117-21240-2-git-send-email-mporter@linaro.org>
 <20131212112715.GK4360@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131212112715.GK4360-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 12, 2013 at 11:27:15AM +0000, Russell King wrote:
> On Thu, Dec 12, 2013 at 06:18:29AM -0500, Matt Porter wrote:
> >  /**
> > + * struct phy_attrs - represents phy attributes
> > + * @bus_width: Data path width implemented by PHY
> > + */
> > +struct phy_attrs {
> > +	u32			bus_width;
> 
> Why u32?

Kishon suggested it and I changed it on this rev...forgetting about the
error path below.

> >  int phy_power_off(struct phy *phy);
> > +static inline u32 phy_get_bus_width(struct phy *phy)
> > +{
> > +	return phy->attrs.bus_width;
> ...
> >  
> > +static inline u32 phy_get_bus_width(struct phy *phy)
> > +{
> > +	return -ENOSYS;
> 
> Why u32, especially as you're returning a negative number here.
> 
> If the bus width is a small integer (I'm assuming you don't have up to
> 2^30 bus signals) then what's wrong with it being an 'int' ?

Yes, very correct...it's expected to always be a small positive integer
value or zero (when not populated as it's optional). I agree it should
go back to 'int' especially due to the negative value when GENERIC_PHY
isn't enabled.

-Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
