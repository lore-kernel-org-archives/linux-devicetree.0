From: Matti Vaittinen <matti.vaittinen-OYasijW0DpE@public.gmane.org>
Subject: Re: [PATCH] rtc: ds1307: add trickle charger device tree binding
Date: Tue, 9 Sep 2014 09:22:06 +0300
Message-ID: <20140909062158.GB21342@fi-ourus-dhcp00977.emea.nsn-net.net>
References: <20140828125915.GJ14650@leverpostej>
 <20140828155157.GB23677@roeck-us.net>
 <20140828161025.GO14650@leverpostej>
 <20140828164825.GA12153@roeck-us.net>
 <20140828172842.GF12769@titan.lakedaemon.net>
 <20140828174034.GC15307@roeck-us.net>
 <20140829073413.GN4587@fi-ourus-dhcp00977.emea.nsn-net.net>
 <20140829104001.GB19424@leverpostej>
 <20140908135242.GA21412@amd>
 <20140908145825.GO12081@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140908145825.GO12081@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ext Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>, ext Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org" <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, "jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org" <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org" <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Sverdlin Alexander <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 08, 2014 at 03:58:25PM +0100, ext Mark Rutland wrote:
> On Mon, Sep 08, 2014 at 02:52:42PM +0100, Pavel Machek wrote:
> > > I would suggest we have two properties that describe the resistor's
> > > rating and whether or not there is a diode:
> > > 
> > > trickle-resistor-ohms = <250>
> > > diode-connected;
> > > 
> > > That's easy for a human to write and/or validate, we can easily extend
> > > it in future, requires no proliferation of macros, and describes the
> > > hardware rather than telling software what to do.
> > > 
> > > The driver becomes a little more complicated, but gains sanity checking,
> > > which is a good thing.
> > 
> > Certainly looks better than register bit defines.
> > 
> > As rtc-bq32k has similar options, I'm interested, too. I believe we
> > should add
> > 
> > trickle-charge-enable;

I am unsure about this. It makes sense for devices where we cannot
select resistor but just enable or disable charger. Is there any such
devices? For devices like ds1339 this makes no sense. For them it is
simpler to just enable the charger if resistor value is specified, and
default the charger to be off. But I do not see a problem in supporting
the trickle-charge-enable; for devices needing this (independently from
the ds1307 driver).

> > 
> > (we may not want to charge at all), and I believe the diode should be
> > 
> > disconnect-diode;
> > 
> > ... With diode connected, charge is slower, and that probably should
> > be the default value. We don't want to give too much current in
> > default case.  (bq32k has hard-coded resistor value for
> > diode/not-diode case).
> 
> I agree that if one case is less likely to be problematic / damaging
> that should be the default.

_Maybe_ 
diode-connected = <1>; or 
diode-connected = <0>; 
or both
diode-connected; and 
diode-disconnected;
could be used and let the driver to choose the defaults? But yes, I have
no problem with inverting the default to be diode-connected.

Then one question regarding the "process". Now if I cook up fourth patch
with inverted diode-connected default for ds1339, should I collect new
acks for this new patch? (V3 was acked by Alessandro and Jason.) I assume 
yes.

> 
> Mark.

-- 
=============================================

Matti Vaittinen
Senile SW Specialist
FINLAND 

~~ When things go utterly wrong vim users can always type :help! ~~

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
