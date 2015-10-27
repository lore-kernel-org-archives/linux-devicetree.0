From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mtd: ofpart: drop undocumented, nonfunctional 'lock'
 property
Date: Tue, 27 Oct 2015 11:32:44 -0700
Message-ID: <20151027183244.GU13239@google.com>
References: <1445910966-11415-1-git-send-email-computersforpeace@gmail.com>
 <20151027071106.GI25308@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151027071106.GI25308-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On Tue, Oct 27, 2015 at 08:11:06AM +0100, Sascha Hauer wrote:
> On Mon, Oct 26, 2015 at 06:56:06PM -0700, Brian Norris wrote:
> > The 'lock' property of a partition does nothing, because it effectively
> > only sets the flags for the partition device, not the master device. And
> > no MTD driver checks for MTD_POWERUP_LOCK in the partition device, only
> > the master device.
> 
> This is not true. The flag gets checked in add_mtd_device:
> 
> 	/* Some chips always power up locked. Unlock them now */
> 	if ((mtd->flags & MTD_WRITEABLE) && (mtd->flags & MTD_POWERUP_LOCK)) {
> 		error = mtd_unlock(mtd, 0, mtd->size);
> 		...
> 	}
> 
> add_mtd_device() is called either for the master mtd device or for each
> partition (if there are partitions). The flow is like that:
> 
> - Some flash devices come up locked from power on. Drivers for these
>   devices set the MTD_POWERUP_LOCK flag (cfi_cmdset_0001.c,
>   cfi_cmdset_0002.c)
> - The partitions inherit the flags from the master device, but not the
>   ones set in mask_flags:
> 
> 	ofpart.c:
> 
> 	if (of_get_property(pp, "lock", &len))
> 		(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;
> 
> 	mtdpart.c:
> 
> 	slave->mtd.flags = master->flags & ~part->mask_flags;
> 
> - So if the lock property is not set then the MTD_POWERUP_LOCK flag is
>   still set in add_mtd_device() for the partition and the corresponding
>   partition is not unlocked. Otherwise the partition is unlocked.

Wow, you're absolutely correct, and I'm not sure how I overlooked that.
So I guess this patch [1] should be rewritten to be clearer, and the
$subject patch dropped.

> So how I see it the mechanism is still functional, except that it's
> broken when the recently introduced option MTD_PARTITIONED_MASTER is
> set. When it's set then add_mtd_device() is called for the master device
> aswell and the whole device gets unlocked. When the partitions are
> registered later then it makes no difference whether they are unlocked
> or not, they are already unlocked anyway.

It's also broken for overlapping partitions. Similarly to some previous
proposals for per-partition ECC handling for NAND, I think.

When first looking at this property (and not understanding how exactly
it worked), I was wondering why there's a per-partition property but not
a per-device property. It seems that if there were a whole device
property, then one could use 'lock' for the whole device (and then
provide partition(s) which do not have the 'lock' property) in order to
get this behavior on PARTITIONED_MASTER.

I guess if one is really interested in fixing 'lock' for
PARTITIONED_MASTER, and we don't want to introduce DT "ABI" changes, we
can just have any partition that has the 'lock' flag mask the
POWERUP_LOCK flag in its parent (master) device. That seems like a
reasonable request.

(It also still seems reasonable to support the 'lock' flag in the parent
device, in case someone is not using ofpart.)

Brian

[1] http://patchwork.ozlabs.org/patch/508356/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
