From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Tue, 5 Nov 2013 12:58:20 -0700
Message-ID: <20131105195820.GB20600@obsidianresearch.com>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <201311051948.11992.arnd@arndb.de>
 <20131105191230.GA20600@obsidianresearch.com>
 <201311052034.01114.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201311052034.01114.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 05, 2013 at 08:34:00PM +0100, Arnd Bergmann wrote:
> On Tuesday 05 November 2013, Jason Gunthorpe wrote:
> > The issue is sysfs, the TPM core attaches attributes to the driver's
> > struct device, which means it has to convert from struct device * to
> > its own private data. It is totally wrong, but that is the way
> > it has been for ever. :(
> 
> I've just had a very brief look at that subsystem, and the first driver
> I looked at (tpm_atmel) actually creates a child platform_device for
> the sole purpose of registering that with the tpm subsystem, which seems
> to avoid this problem. 

The TPM subsystem requires a struct device to bind onto (for sysfs at
least), so drivers that don't have one are required to create one :|

atmel is unusual as most drivers have a pre-existing device.

> Maybe the same can be done for the other drivers as
> well. Unfortunately, that will change the sysfs structure, which
> might break user space relying on the current path to the
> device. 

AFAIK the correct fix is to have the TPM subsystem core create a
struct device for its own use (eg tpm0), under its own class, which is
what other subsystems I looked at do. This way the subsystem can have
access to a release function that is properly tied to the actual
object lifetime, and it can use container_of to retrieve its own
private data from, eg sysfs. Combined with get_ops/put_ops style
access I think you can solve the unload lifetime issues with sysfs..

However, even if all that is done, compatibility sysfs's under the
driver's struct device will still be needed, which AFAICT will still
require the drvdata be owned by the subsystem not the driver :(

> The TPM subsystem definely seems a bit unusual in this regard, so I
> hope not too many other parts of the kernel have this particular
> problem.

It is just old, it was never updated to modern standards, hopefully that
is rare :|

> (side note: another unusual aspect of the TPM subsystem is the use of a
>  custom 'release' function override. Seems harmless, but very weird).	

Near as I can tell that is a hack that was put in to avoid panics
around unload lifetime issues - it doesn't solve any problems, just
makes them less common..

This is why I looked so closely at devm, I thought 'lets just remove
that release function hack and use devm', but they are not
equivalent. :)

Thanks for looking at this, a good chunk of the first round of
my cleanups will hit 3.13, next on the list are these problems.
https://lkml.org/lkml/2013/9/23/444

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
