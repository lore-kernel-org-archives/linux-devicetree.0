From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [RFC PATCH 1/2] tee: generic TEE subsystem
Date: Mon, 20 Apr 2015 11:55:15 -0600
Message-ID: <20150420175515.GA31958@obsidianresearch.com>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org>
 <1429257057-7935-2-git-send-email-jens.wiklander@linaro.org>
 <20150417163054.GA28241@obsidianresearch.com>
 <20150418090147.GF12732@n2100.arm.linux.org.uk>
 <20150418172923.GA10605@obsidianresearch.com>
 <20150420130203.GB25054@ermac>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150420130203.GB25054@ermac>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 20, 2015 at 03:02:03PM +0200, Jens Wiklander wrote:
> > It appeared to me this driver was copying TPM's old architecture,
> > which is very much known to be broken.
> 
> The struct tee_device holds a shared memory pool from which shared
> memory objects are allocated. These shared memory objects can be mapped
> both by user space and secure world. 

So this is a whole other set of problems besides what was already
brought up.

You need to figure out a lifetime model for this shared memory that
works.

> To come around the problem with what should happen when the driver
> is removed I'm increasing the refcount on the driver for each
> allocated shared memory object and created file pointers. As long as
> any resource is in use by either user space or secure world the
> driver can't be unloaded.

This isn't how the kernel works. The module refcount effects module
unload (it protects the .text) - it does not interact with driver
detatch. Userspace can trigger driver detatch (which results in
tee_unregister being called) at any time via sysfs.

If you properly design for that case then module unload sequencing
works properly for free.

Based on what I gather, I would suggest the following sequence in
tee_unregister
 - unregister all sysfs and char dev registrations.
 - Write lock ops and set to null. This will error future cdev ioctls,
   and guarentees no driver ops callbacks are in progress, or will be
   started in future.
 - Wait until all client accesses to shared memory are
   released.
 - Command the driver to release it's side of the
   shared memory and wait for that to complete
 - Free the shared memory
 - deref the tee_device's struct device (match ref in tee_register)

Then in your struct tee_device's release function free the tee_device
memory.

Replace all the module locking code with an active count in struct
tee_device (see something like kernfs_drain for an example).

> * Change to use the pattern (with a struct device etc) as described
>   above.

Yes, I think Greg confirmed you need to use a struct device, and purge
misc_device from the mid layer.

>   I can't protect the ops with just a mutex since tee_ioctl_cmd() needs to
>   be multithreaded.

Then use a sleeping read/write lock - aka an active count.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
