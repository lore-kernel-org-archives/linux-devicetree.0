From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] mtd: ofpart: drop undocumented, nonfunctional 'lock'
 property
Date: Tue, 27 Oct 2015 08:11:06 +0100
Message-ID: <20151027071106.GI25308@pengutronix.de>
References: <1445910966-11415-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445910966-11415-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,

On Mon, Oct 26, 2015 at 06:56:06PM -0700, Brian Norris wrote:
> The 'lock' property of a partition does nothing, because it effectively
> only sets the flags for the partition device, not the master device. And
> no MTD driver checks for MTD_POWERUP_LOCK in the partition device, only
> the master device.

This is not true. The flag gets checked in add_mtd_device:

	/* Some chips always power up locked. Unlock them now */
	if ((mtd->flags & MTD_WRITEABLE) && (mtd->flags & MTD_POWERUP_LOCK)) {
		error = mtd_unlock(mtd, 0, mtd->size);
		...
	}

add_mtd_device() is called either for the master mtd device or for each
partition (if there are partitions). The flow is like that:

- Some flash devices come up locked from power on. Drivers for these
  devices set the MTD_POWERUP_LOCK flag (cfi_cmdset_0001.c,
  cfi_cmdset_0002.c)
- The partitions inherit the flags from the master device, but not the
  ones set in mask_flags:

	ofpart.c:

	if (of_get_property(pp, "lock", &len))
		(*pparts)[i].mask_flags |= MTD_POWERUP_LOCK;

	mtdpart.c:

	slave->mtd.flags = master->flags & ~part->mask_flags;

- So if the lock property is not set then the MTD_POWERUP_LOCK flag is
  still set in add_mtd_device() for the partition and the corresponding
  partition is not unlocked. Otherwise the partition is unlocked.

So how I see it the mechanism is still functional, except that it's
broken when the recently introduced option MTD_PARTITIONED_MASTER is
set. When it's set then add_mtd_device() is called for the master device
aswell and the whole device gets unlocked. When the partitions are
registered later then it makes no difference whether they are unlocked
or not, they are already unlocked anyway.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
