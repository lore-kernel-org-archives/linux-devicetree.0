From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC PATCH 5/6] extcon-gpio: Describe devicetree bindings
Date: Mon, 16 Sep 2013 08:19:53 -0700
Message-ID: <20130916151953.GA5801@roeck-us.net>
References: <1377836978-24082-1-git-send-email-linux@roeck-us.net>
 <1377836978-24082-6-git-send-email-linux@roeck-us.net>
 <20130912164100.GF22013@e106331-lin.cambridge.arm.com>
 <20130912165304.GA12202@roeck-us.net>
 <20130916142147.GF30650@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130916142147.GF30650-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2013 at 03:21:47PM +0100, Mark Rutland wrote:
> On Thu, Sep 12, 2013 at 05:53:04PM +0100, Guenter Roeck wrote:
> > On Thu, Sep 12, 2013 at 05:41:00PM +0100, Mark Rutland wrote:
> > > On Fri, Aug 30, 2013 at 05:29:37AM +0100, Guenter Roeck wrote:
> > > > Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> > > > ---
> > > >  .../devicetree/bindings/extcon/extcon-gpio         |   23 ++++++++++++++++++++
> > > >  1 file changed, 23 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-gpio
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio b/Documentation/devicetree/bindings/extcon/extcon-gpio
> > > > new file mode 100644
> > > > index 0000000..091ddc6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/extcon/extcon-gpio
> > > > @@ -0,0 +1,23 @@
> > > > +Device-Tree bindings for extcon/extcon-gpio driver
> > > 
> > > Bindings shouldn't refer to Linux-specifics like particular drivers.
> > > What class of hardware are you actually trying to describe?
> > > 
> > Agreed. Question is where to put the bindings, as they are not really 
> > specific to the extcon driver. The extcon driver merely implements 
> > the bindings. This is why the "compatible" statement reads "gpio-connector"
> > and not "extcon-something".
> > 
> > The bindings describe a connector managed through gpio pins.
> 
> Ok, then that's what the binding document should state.
> 
> > 
> > > > +
> > > > +Required properties:
> > > > +	- compatible = "gpio-connector";
> > > > +	- presence-detect-gpios - presence detect gpio pin
> > > > +
> > > > +Optional properties:
> > > > +	- debounce-interval - debounce interval in milli-seconds
> > > > +	- state-on - on (connected) state
> > > > +	- state-off - off (disconnected) state
> > > > +	  Depending on the type of connector or cable, states may
> > > > +	  for example be reported as "connected"/"disconnected"
> > > > +	  or "inserted"/"removed".
> > > 
> > > I don't understand what the state-* properties describe. Do these
> > > provide semantic information to drivers? What is the full set of valid
> > > values?
> > > 
> > That is merely text which is ultimately passed on to the user.
> > Guess 'semantic information' might be a way to phrase it.
> 
> Where do these end up appearing to the user? Through names in the

Yes.

> filesystem? That's an ABI, which should be thoroughly described...
> 
Tricky, as I can not really describe how the extcon driver implements it.
I can add something like above explanation, ie that the implementation is
expected to pass the property to the user. Would that be acceptable ?

> If it's arbitrary, why is it necessary at all? Surely sensible names for
> the state of the connector can be coded in the driver for the device
> attached to said connectors (which can be consistent and later changed
> if necessary)...
> 
Good point. I took a "hint" from the implementation in the extcon driver,
which lets one do that. But doesn't your comment apply to pretty much all
"label" and similar properties in the various devicetree descriptions ?

> > 
> > > > +
> > > > +Example node:
> > > > +
> > > > +	some-connector {
> > > > +		compatible = "gpio-connector";
> > > > +		presence-detect-gpios = <&gpio1 7 1>;
> > > > +		debounce-interval = <1>;
> > > > +		state-on = "connected";
> > > > +		state-on = "disconnected";
> 
> I don't think that's a valid dts. I assume the second is meant to be
> "state-off"?
> 
Yes, obviously.

> > > > +	};
> > > 
> > > I'm not sure how much value this adds to bindings over describing the
> > > gpios directly. This seems to add a layer of indirection because of
> > > Linux internals.
> > > 
> > Not sure I understand what you mean with "describing the gpios directly".
> > Can you elaborate and/or provide an example ?
> 
> Take a look at the MMC bindings [1], specifically the cd-gpios and
> wp-gpios properties. I don't see why the connection of the GPIO needs to
> be described by a wrapper device that doesn't really exist, when it can
> be described directly.
> 
Question is - described to what or for what ? 

I think what you are saying is that describing a generic connector via
devicetree is not acceptable, even though it _does_ describe hardware.
I would have to describe a specific connector for a specific hardware
instead, which in turn would need its own driver. Is that correct ?

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
