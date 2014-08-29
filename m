From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] rtc: ds1307: add trickle charger device tree binding
Date: Fri, 29 Aug 2014 14:03:54 +0100
Message-ID: <20140829130354.GE21473@leverpostej>
References: <20140828155157.GB23677@roeck-us.net>
 <20140828161025.GO14650@leverpostej>
 <20140828164825.GA12153@roeck-us.net>
 <20140828172842.GF12769@titan.lakedaemon.net>
 <20140828174034.GC15307@roeck-us.net>
 <20140829073413.GN4587@fi-ourus-dhcp00977.emea.nsn-net.net>
 <20140829104001.GB19424@leverpostej>
 <20140829122452.GA3683@titan.lakedaemon.net>
 <20140829124216.GD21473@leverpostej>
 <20140829124829.GD3683@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140829124829.GD3683-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Matti Vaittinen <matti.vaittinen-OYasijW0DpE@public.gmane.org>, ext Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org" <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, "jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org" <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org" <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Sverdlin Alexander <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 29, 2014 at 01:48:29PM +0100, Jason Cooper wrote:
> On Fri, Aug 29, 2014 at 01:42:16PM +0100, Mark Rutland wrote:
> > On Fri, Aug 29, 2014 at 01:24:52PM +0100, Jason Cooper wrote:
> > > On Fri, Aug 29, 2014 at 11:40:02AM +0100, Mark Rutland wrote:
> ...
> Someone wrote:
> > > > > > > > http://datasheets.maximintegrated.com/en/ds/DS1307.pdf
> > > > > > > > http://datasheets.maximintegrated.com/en/ds/DS1337.pdf
> > > > > > > > http://datasheets.maximintegrated.com/en/ds/DS1338.pdf
> > > > > > > > http://datasheets.maximintegrated.com/en/ds/DS1339.pdf
> > > > > > > > http://datasheets.maximintegrated.com/en/ds/DS1340.pdf
> > > > > > > > http://datasheets.maximintegrated.com/en/ds/DS1388.pdf
> > > > > > > > http://datasheets.maximintegrated.com/en/ds/DS3231.pdf
> ...
> > > > I would suggest we have two properties that describe the resistor's
> > > > rating and whether or not there is a diode:
> > > > 
> > > > trickle-resistor-ohms = <250>
> > > > diode-connected;
> > > 
> > > I much prefer this solution over my own suggestion.  With one small
> > > change, s/diode-connected/trickle-diode-enable/  Does that sound ok?
> > 
> > I'm not too keen on 'enable'; I was under the impression that this
> > described whether or not there was an external diode. Perhaps I've
> > misunderstood?
> 
> iiuc from the link ds1339 ds, the register configuration is enabling
> internal diodes and resistors for the trickle charge configuration.  I
> may have read it incorrectly, though.

Ok.

> In either case, my main point was to prepend 'trickle-' to the property
> to more accurately describe what it is toggling.

That's fine by me. My only concern was 'enable' due to the
internal/external confusion.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
