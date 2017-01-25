From: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v14 3/5] tee: add OP-TEE driver
Date: Wed, 25 Jan 2017 10:47:45 +0100
Message-ID: <20170125094744.GA7121@jax>
References: <1484744296-30003-1-git-send-email-jens.wiklander@linaro.org>
 <8183743.bSJXZpMh95@wuerfel>
 <20170123090852.GB1910@jax>
 <5564439.UZohRc66aK@wuerfel>
 <20170124125330.GA30998@jax>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170124125330.GA30998@jax>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 01:53:30PM +0100, Jens Wiklander wrote:
> On Mon, Jan 23, 2017 at 05:16:15PM +0100, Arnd Bergmann wrote:
> > On Monday, January 23, 2017 10:08:53 AM CET Jens Wiklander wrote:
> > > On Fri, Jan 20, 2017 at 05:57:51PM +0100, Arnd Bergmann wrote:
> > > > On Thursday, January 19, 2017 3:56:23 PM CET Jens Wiklander wrote:
> > > > > On Wed, Jan 18, 2017 at 05:28:17PM +0100, Arnd Bergmann wrote:
> > 
> > > > > Does the platform devices really need cleaning? I mean
> > > > > of_platform_default_populate_init() creates a bunch of platform devices
> > > > > which are just left there even if unused. Here we're doing the same
> > > > > thing except that we're doing it for a specific node in the DT.
> > > > 
> > > > I think it will work if you don't clean them up, but it feels wrong
> > > > to have a loadable module that creates devices when loaded but doesn't
> > > > remove them when unloaded.
> > > > 
> > > > This could be done differently by having the device creation done in
> > > > one driver and the the user of that device in another driver, but I
> > > > think just killing off the device achieves the same in a simpler way.
> > > 
> > > I see your point. My final concern here is that with device we got
> > > entries in sysfs and uevents that could be used to automatically start
> > > the correct supplicant. Different drivers are likely to require
> > > different supplicants. Starting the correct supplicant based on uevents
> > > is a quite elegant solution which I'm not sure how to support when
> > > skipping devices. Perhaps I could create an object below
> > > <sysfs>/firmware/tee ?
> > 
> > Putting the objects somewhere other than /sys/devices sounds good, yes.
> > This would also help with TEE implementations that might get probed
> > differently.
> > 
> > I think the natural place would be /sys/class/tee/, as we normally
> > require something in /sys/class anyway to support the character
> > device.
> > 
> > /sys/firmware/tee/ sounds less fitting, as there other TEE implementations
> > are not necessarily firmware based, as you point out. 
> > /sys/firmware/op-tee certainly makes sense for anything that is specific
> > to OP-TEE in particular, while /sys/class/tee would be for anything
> > that uses the ioctl interface. This part is particularly important to
> > get right from the start, just like the ioctls themselves we can't make
> > incompatible changes here later once there are users relying on the
> > upstream kernel interfaces.
> 
> /sys/class/tee/ sounds good, I'll use that. It's more or less what we
> also have today.

I'm sorry, it seems a struct device has to be used in order to put stuff
under /sys/class/tee/. Or am I missing something?

Thanks,
Jens
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
