From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: ION DTS changes for HiKey in -next
Date: Fri, 8 Jan 2016 21:05:21 -0800
Message-ID: <20160109050521.GB4489@kroah.com>
References: <20160107173744.GJ6588@sirena.org.uk>
 <20160108050214.GD30293@kroah.com>
 <20160108124439.GL6588@sirena.org.uk>
 <20160108135552.GE3097@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160108135552.GE3097@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Yu Dongbin <yudongbin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 08, 2016 at 01:55:52PM +0000, Mark Rutland wrote:
> On Fri, Jan 08, 2016 at 12:44:39PM +0000, Mark Brown wrote:
> > On Thu, Jan 07, 2016 at 09:02:14PM -0800, Greg Kroah-Hartman wrote:
> > > On Thu, Jan 07, 2016 at 05:37:44PM +0000, Mark Brown wrote:
> > 
> > > > I was just looking at DTs in -next and noticed that there is a patch
> > > > 59dfafd03fc (arm64: dts: Add dts files to enable ION on Hi6220 SoC)
> > > > which adds at DT doing something for ION.  Are we sure this should be
> > > > going into the main production DT?  The bindings haven't been reviewed
> > > > as far as I can tell, the matching driver is only in staging and hasn't
> > > > been posted upstream.
> > 
> > > Isn't "staging" upstream enough for this?  :)
> > 
> > I wouldn't have thought so, DTs are supposed to be an ABI so we want
> > proper review and having had a quick glance this doesn't look like it's
> > a hardware description so it's not clear to me it should be in DT at all.
> 
> Indeed.
> 
> The driver and the binding before that don't really belong either,
> I would have NAK'd those on devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, though it
> appears I either missed them or they never made it to that list.
> 
> From my PoV there should not be a platform-specific ION binding. If we
> need one at all, people should work on the proposed generic binding [1]
> or figure out how to do this with the existing reserved-memory bindings.

Ok, I've now reverted that commit, thanks for letting me know.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
