From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 4/4] rtc: isl1208: add support for isl1219 with hwmon for
 tamper detection
Date: Mon, 29 Jan 2018 13:59:19 -0800
Message-ID: <20180129215919.GA17988@roeck-us.net>
References: <20180123121801.4214-1-m.grzeschik@pengutronix.de>
 <20180123121801.4214-5-m.grzeschik@pengutronix.de>
 <20180123182254.GA27379@roeck-us.net>
 <20180124090333.r5o2mzpm4q536w4r@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180124090333.r5o2mzpm4q536w4r-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Denis.Osterland-85mDkmTllUAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 24, 2018 at 10:03:33AM +0100, Michael Grzeschik wrote:
[ ... ]
> > > +
> > > diff --git a/Documentation/hwmon/sysfs-interface b/Documentation/hwmon/sysfs-interface
> > > index fc337c317c673..a12b3c2b2a18c 100644
> > > --- a/Documentation/hwmon/sysfs-interface
> > > +++ b/Documentation/hwmon/sysfs-interface
> > > @@ -702,6 +702,13 @@ intrusion[0-*]_alarm
> > >  		the user. This is done by writing 0 to the file. Writing
> > >  		other values is unsupported.
> > >  
> > > +intrusion[0-*]_timestamp
> > > +		Chassis intrusion detection
> > > +		YYYY-MM-DD HH:MM:SS UTC (ts.sec): intrusion detected
> > > +		RO
> > > +		The corresponding timestamp on which the intrustion
> > > +		was detected.
> > > +
> > 
> > Sneaky. Nack. You don't just add attributes to the ABI because you want it,
> > without serious discussion, and much less so hidden in an RTC driver
> > (and even less as unparseable attribute).
> 
> Right; but it was not meant to be sneaky. I should have stick to my first
> thought and label this patch RFC. Sorry for that.
> 
> > In addition to that, I consider the attribute unnecessary. The intrusion
> > already generates an event which should be sufficient for all practical
> > purposes.
> 
> Would it make sense in between the other sysfs attributes of this driver?
> 
I don't understand what you mean with that, sorry.

>From an ABI perspective, the attibute doesn't add value since it is
highly device specific (or at least it is the only chip I am aware of
which reports such a time stamp). Feel free to add the attribute to the
driver and document it, but not as part of the hwmon ABI. In that
case I would be inclined to accept it. However, keep in mind that
your version, reporting a human readable date/time, would effectively
preclude it from ever making it into the ABI.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
