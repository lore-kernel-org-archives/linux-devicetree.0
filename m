From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 2/2] USB: doc: Binding document for ehci-platform
 driver
Date: Tue, 23 Oct 2012 10:10:46 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1210231004310.1635-100000@iolanthe.rowland.org>
References: <5085C470.4040707@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5085C470.4040707-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 22 Oct 2012, Stephen Warren wrote:

> > I see.  But why would it be done this way instead having a separate 
> > property?
> 
> Well, I did say normally:-)
> 
> I can certainly see an argument for representing these differences using
> custom properties, rather than deriving the information from the
> compatible value. It's probably be OK to do so for something generic
> like this; it's just perhaps not always the default choice.
> 
> Do note that even though this binding document dictates a particular
> value for the compatible property, every device tree should additionally
> add a separate value alongside it to indicate the specific HW model
> that's actually present, so that if some device-specific bug-fix or
> workaround needs to be applied, the model can be identified anyway.
> 
> So, rather than:
> 
> compatible = "usb-ehci";
> 
> You should always have e.g.:
> 
> compatible = "nvidia,tegra20-ehci", "usb-ehci";
> 
> Given that, there is then always enough information in the device tree
> for the driver to be able to derive the other values from the compatible
> value.

Yes, I get it.

> Whether you want to derive the information, or whether you want to
> explicitly represent it via properties, is a decision to make based on
> the trade-offs.
> 
> Oh, and I note that quite a few device trees already use compatible
> value "usb-ehci" in their device-trees. Care needs to be taken not to
> usurp that value from any existing device drivers if that was to be
> picked as the compatible value required by this binding.

Right.  I think Tony's new binding should use compatible value 
"usb-ehci-platform".  It will essentially be a superset of "usb-ehci".

> > And doesn't the same reasoning apply to has-tt?  Doesn't that mean the 
> > driver would have to match four different hardware types?  What happens 
> > if a third characteristic like these comes around; would the driver 
> > then have to check against eight different types?
> 
> No, the compatible value represents the model, so you'd have a table like:
> 
> compatible          -> bugX has_tt
> nvidia,tegra20-ehci -> 0    1
> vendor1,foo-ehci    -> 0    1
> vendor2,bar-ehci    -> 1    1
> vendor3,baz-ehci    -> 0    1
> vendor4,qux-ehci    -> 0    1
> ...
> 
> So the table size isn't related to the number of options. The table size
> is probably bigger than subset of options combinations that make sense.

Under the circumstances, and considering that usb-ehci-platform will be
rather generic, IMO it will be better to make has-tt,
has-synopsys-hc-bug, and no-io-watchdog separate properties, each
naturally defaulting to "not present".  That will avoid the need to 
update the driver's table each time a new board comes along.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
