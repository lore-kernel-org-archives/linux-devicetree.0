From: Matti Vaittinen <matti.vaittinen-OYasijW0DpE@public.gmane.org>
Subject: Re: [PATCH] rtc: ds1307: add trickle charger device tree binding
Date: Fri, 29 Aug 2014 15:19:56 +0300
Message-ID: <20140829121954.GB13630@fi-ourus-dhcp00977.emea.nsn-net.net>
References: <20140828124237.GA29102@fi-ourus-dhcp00977.emea.nsn-net.net>
 <20140828125915.GJ14650@leverpostej>
 <20140828155157.GB23677@roeck-us.net>
 <20140828161025.GO14650@leverpostej>
 <20140828164825.GA12153@roeck-us.net>
 <20140828172842.GF12769@titan.lakedaemon.net>
 <20140828174034.GC15307@roeck-us.net>
 <20140829073413.GN4587@fi-ourus-dhcp00977.emea.nsn-net.net>
 <20140829104001.GB19424@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140829104001.GB19424@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ext Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: ext Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org" <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, "jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org" <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org" <san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org>, "hs-ynQEQJNshbs@public.gmane.org" <hs-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Sverdlin Alexander <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 29, 2014 at 11:40:02AM +0100, ext Mark Rutland wrote:
> On Fri, Aug 29, 2014 at 08:34:25AM +0100, Matti Vaittinen wrote:
> > On Thu, Aug 28, 2014 at 10:40:34AM -0700, ext Guenter Roeck wrote:
> > > On Thu, Aug 28, 2014 at 01:28:42PM -0400, Jason Cooper wrote:
> > > > On Thu, Aug 28, 2014 at 09:48:25AM -0700, Guenter Roeck wrote:
> > > > 
> > > > It may be a bit of overkill, but I think a DT macro would be the most
> > > > maintainable solution here:
> > > > 
> > > > #define DS1339_TRCKL_DIODE   0x08
> > > > #define DS1339_TRCKL_NODIODE 0x04
> > > > #define DS1339_TRCKL_R250    0x01
> > > > #define DS1339_TRCKL_R2000   0x02
> > > > #define DS1339_TRCKL_R4000   0x03
> > > > 
> > > > trickle_setup = <DS1339_TRCKL_DIODE | DS1339_TRCKL_R250>;
> > > > 
> > > > And the driver would take care of oring it with the enable pattern.
> > > > 
> > > 
> > > Yes, that sounds reasonable as well.
> > > 
> > I thought of this too. However the ds1307 seems to be designed to work
> > with bunch of chips. What then when next chip supported by this driver
> > introduces 75, 1000 and 5000 ohm resistors? Or something else. (Or add
> > some other configuration). I do not see this approach to be
> > maintainable in long run.
> 
> If a new chip comes out with new features, the driver will need an
> update anyhow. We have no guarantee that the register placement will be
> the same, let alone the layout.

This is why I originally also added the trickle_reg property. But let's
leave it out.

> 
> If and when said new chip comes out we allocate a new compatible string.
> If it's compatible iwith (i.e. is a superset of) an existing device's
> programming model, we add that existing string as a fallback in the
> compatible list so old kernels can drive the subset of features they
> understand.

Yes.

> 
> > I see strong possibility of polluting dt with endless amount of
> > defines. Furthermore I believe the benefits of these defines would be
> > negligible compared to effort maintaining defines and documentation of
> > them causes. Surely the one who needs to add dt node for this chip in
> > his board's dt has the manual for the chip he has on board. Especially
> > so if he knows the trickle charger there and wants to configure it.
> > The plain resistor type still gives zero information without knowing
> > the other details.
> 
> I would rather that the driver had some idea of what it were doing
> rather than being a glorified copy routine.
> 
> I would suggest we have two properties that describe the resistor's
> rating and whether or not there is a diode:
> 
> trickle-resistor-ohms = <250>
> diode-connected;
> 
> That's easy for a human to write and/or validate, we can easily extend
> it in future, requires no proliferation of macros, and describes the
> hardware rather than telling software what to do.
> 
> The driver becomes a little more complicated, but gains sanity checking,
> which is a good thing.

This looks like a nice way. Problem is that I can not provide support for 
all chips ds1307 supports. I have access to ds1339 variant only. I assume
the driver should thus reject this dt information for all other chips for 
now.

> 
> I'm still worried that we have no idea what the device is intended to
> charge. Surely that's important?

In my case it will charge capcitor which provides Vbackup for short
power breaks.

Br.
--Matti Vaittinen


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
