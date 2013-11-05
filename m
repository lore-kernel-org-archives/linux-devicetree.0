From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Tue, 5 Nov 2013 21:17:32 +0100
Message-ID: <201311052117.33443.arnd@arndb.de>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org> <201311052034.01114.arnd@arndb.de> <20131105195820.GB20600@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131105195820.GB20600-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 05 November 2013, Jason Gunthorpe wrote:
> On Tue, Nov 05, 2013 at 08:34:00PM +0100, Arnd Bergmann wrote:
> > On Tuesday 05 November 2013, Jason Gunthorpe wrote:
> > > The issue is sysfs, the TPM core attaches attributes to the driver's
> > > struct device, which means it has to convert from struct device * to
> > > its own private data. It is totally wrong, but that is the way
> > > it has been for ever. :(
> > 
> > I've just had a very brief look at that subsystem, and the first driver
> > I looked at (tpm_atmel) actually creates a child platform_device for
> > the sole purpose of registering that with the tpm subsystem, which seems
> > to avoid this problem. 
> 
> The TPM subsystem requires a struct device to bind onto (for sysfs at
> least), so drivers that don't have one are required to create one :|
> 
> atmel is unusual as most drivers have a pre-existing device.

Eeek, yes I see now. OTOH, it would still be able to do the same thing
by binding to the actual platform_device. Judging from the copyright
notice, this driver predates the move to creating 'struct device'
instances for (most) device nodes, and it uses the old-style
method of searching the DT from the module_init function, which is
not how we do things today.

Creating a platform_device (or a plain device, for that matter)
from a proper probe() function would have a similar effect from
the perspective of the TPM subsystem (or other subsystems using
the same drvdata trick), and make it possible to use my proposed
devm_probe method from any tpm driver. The main downside I can
see is that it requires duplicating some code in each TPM driver
that wants to convert to devm_probe, but on the upside it doesn't
require any changes to the TPM subsystem or to other drivers the
way that a proper fix would.

> > Maybe the same can be done for the other drivers as
> > well. Unfortunately, that will change the sysfs structure, which
> > might break user space relying on the current path to the
> > device. 
> 
> AFAIK the correct fix is to have the TPM subsystem core create a
> struct device for its own use (eg tpm0), under its own class, which is
> what other subsystems I looked at do.

Yes. Note that the use of new 'class'es is not recommended any more,
nowadays we are supposed to use 'bus_type' for this, which is
traditionally something slightly different, but technically almost
the same implementation-wise.

> This way the subsystem can have
> access to a release function that is properly tied to the actual
> object lifetime, and it can use container_of to retrieve its own
> private data from, eg sysfs. Combined with get_ops/put_ops style
> access I think you can solve the unload lifetime issues with sysfs..
> 
> However, even if all that is done, compatibility sysfs's under the
> driver's struct device will still be needed, which AFAICT will still
> require the drvdata be owned by the subsystem not the driver :(

That depends: the requirement is that no user space breaks after
a change. I assume that there is a fairly limited set of packages
accessing the tpm sysfs files. If all of them are written properly,
they should be able to deal with looking at the files in a different
place in sysfs.

Another option is to change the TPM core sysfs attributes not to
look at drvdata, but to use devres_find() to find the data they
need.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
