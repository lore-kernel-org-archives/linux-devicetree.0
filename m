From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Tue, 5 Nov 2013 12:12:30 -0700
Message-ID: <20131105191230.GA20600@obsidianresearch.com>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <201311050939.21071.arnd@arndb.de>
 <20131105180314.GB14706@obsidianresearch.com>
 <201311051948.11992.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201311051948.11992.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 05, 2013 at 07:48:11PM +0100, Arnd Bergmann wrote:
> On Tuesday 05 November 2013, Jason Gunthorpe wrote:
> > I've been brewing a patch set to fix TPM, but it is a large effort. I
> > would think other legacy subsystems that are not fully class device
> > enabled will have similar challenges?
> 
> I think a common pattern is to have the subsystem data be referenced from
> the driver data using a pointer, and contain a back reference to the struct
> device, which should not be a problem.

The issue is sysfs, the TPM core attaches attributes to the driver's
struct device, which means it has to convert from struct device * to
its own private data. It is totally wrong, but that is the way
it has been for ever. :(

> Yes, that would work, but it would prevent another idea I had that I
> haven't mentioned here: If we add a pointer to the 'struct
> devm_probe' array to

Seems quiet reasonable, but having two entry points just means drivers
that need to use the 2nd can't use the pointer in struct devm_probe.

The other thing that occured to me is your method could reduce the
devm overhead. If you keep a pointer to the probe list and to the
private data structure then you can unwide all the allocations just by
running backwards along the probe list. You don't need to do any
per-resource devm allocations..

> which would fit in nicely with the rest of the design, but now I'm no longer
> sure if that would actually work with the lifetime rules of the netdev, which
> would pin the refcount on the 'struct device', which in turn could prevent
> the devres cleanup to be executed.

I looked into this question recently, while trying to fixup TPM..

I concluded that devm doesn't actually really follow the refcount on
struct device. devm cleanup is called unconditionally after remove()
is called, and remove is called unconditionally when the device_driver
is deleted, which is called unconditionally on module unload.

So anything that used to be in the remove() function can be safely
moved into devm, including netdev deallocation. This makes sense,
considering what devm is for..

This process is separate from the refcount driven release, which
happens once all krefs to the struct device are dropped (eg, sysfs
open files, open char devices, etc)

Which creates the nasty bit, a sysfs callback/etc can be run even
after the device release function has finished and after the private
data has been deleted..

At least, that is where my search ended up, would appreciate it if
anyone knows different :)

Regards,
Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
