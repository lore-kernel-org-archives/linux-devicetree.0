From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 0/9] dt: dependencies (for deterministic driver
 initialization order based on the DT)
Date: Tue, 26 Aug 2014 10:54:59 +0100
Message-ID: <20140826095459.GB32315@leverpostej>
References: <1399913280-6915-1-git-send-email-holler@ahsoftware.de>
 <20140514141914.446F7C4153D@trevor.secretlab.ca>
 <20140821140211.GD19293@ulmo.nvidia.com>
 <53F64624.5000403@ahsoftware.de>
 <20140822131919.GX21734@leverpostej>
 <20140825093931.GB2399@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140825093931.GB2399@ulmo>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 25, 2014 at 10:39:32AM +0100, Thierry Reding wrote:
> On Fri, Aug 22, 2014 at 02:19:19PM +0100, Mark Rutland wrote:
> > On Thu, Aug 21, 2014 at 08:19:00PM +0100, Alexander Holler wrote:
> > > Am 21.08.2014 16:02, schrieb Thierry Reding:
> > > 
> > > > Anyway, those are all fairly standard reasons for where deferred probe
> > > > triggers, and since I do like deferred probe for it's simplicity and
> > > > reliability I'd rather not try to work around it if boot time is all
> > > > that people are concerned about.
> > > 
> > > It's neither simple nor reliable. It's non deterministic brutforcing 
> > > while making it almost impossible to identify real errors.
> > 
> > It's horrible, yes.
> > 
> > > In my humble opinion the worst way to solve something. I'm pretty sure 
> > > if I would have suggest such a solution, the maintainer crowd would have 
> > > eaten me without cooking.
> > 
> > We didn't have a better workable solution at the time.
> 
> You make it sound like we've come up with a better workable solution in
> the meantime.

That wasn't the intention, but my sloppy wording does make it come
across that way.

> > Having a hack that got boards booting was considered better than not
> > having them boot.
> > I don't remember people being particularly enthralled by the idea.
> 
> Odd, I remember things quite differently.

Then perhaps my memory is faulty. :)

> Anyway, instead of going back and forth between "deferred probe is good"
> and "deferred probe is bad", how about we do something useful now and
> concentrate on how to make use of the information we have in DT with the
> goal to reduce the number of cases where deferred probing is required?

Certainly.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
