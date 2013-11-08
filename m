From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: [PATCH v3 0/3] Introducing Device Tree Overlays
Date: Fri,  8 Nov 2013 17:06:07 +0200
Message-ID: <1383923170-24914-1-git-send-email-panto@antoniou-consulting.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joel Becker <jlbec-aKy9MeLSZ9dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following patchset introduces Device Tree overlays, a method
of dynamically altering the kernel's live Device Tree, along with
a generic interface to use it in a board agnostic manner.

It is against mainline as of today, Nov 5 2013:
	be408cd3e1fef73e9408b196a79b9934697fe3b1 
	Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net

It relies on the following previously submitted patches/patchsets:

The DTC compiler patch required to get symbol resolution working

	"dtc: Dynamic symbols & fixup support (v2)"

The I2C device registration patch

	"of: i2c: Export single device registration method"

And finally a patchset exporting various OF fixes

	"OF: Fixes in preperation of DT overlays"

Note that although this patchset allows DT overlay removal
on my preferred platform (omap), platform device registration
fails; another patchset that deals with this issue has been posted:

	"omap_device removal fixups"

I should also note that the /proc interface is an anachronism, but
it is the place where /proc/device-tree is also located, so it makes
sense to group /proc/device-tree & /proc/device-tree-overlay* together.
I am open to suggestions about where the generic interface should reside.
A suggestion has been made about configfs but I'd like to get this out
as a basis of discussion.

This low level interface should be used as a starting point for platforms
with discoverable hardware on the daughtercard level since they should use the
facilities provided to implement their own policy, dealing with things like
conflicts, high level resource allocation and so on.

Changes in V3:
 * Fixed of_free_overlay_info() missing static inline
 * Punting when handling PCI devices
 * Missing EXPORTs()
all by Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>

Changes in V2:
 * Removal of any bits related to a specific board (beaglebone).
 * Introduced a platform agnostic interface using /proc/device-tree-overlay
 * Various bug fixes related to i2c device handling have been squashed in.

Pantelis Antoniou (3):
  OF: Introduce Device Tree resolve support.
  OF: Introduce DT overlay support.
  DT: proc: Add runtime overlay interface in /proc

 .../devicetree/dynamic-resolution-notes.txt        |  25 +
 Documentation/devicetree/overlay-notes.txt         | 179 +++++
 drivers/of/Kconfig                                 |  19 +
 drivers/of/Makefile                                |   2 +
 drivers/of/overlay.c                               | 886 +++++++++++++++++++++
 drivers/of/resolver.c                              | 396 +++++++++
 fs/proc/proc_devtree.c                             | 278 +++++++
 include/linux/of.h                                 | 130 +++
 8 files changed, 1915 insertions(+)
 create mode 100644 Documentation/devicetree/dynamic-resolution-notes.txt
 create mode 100644 Documentation/devicetree/overlay-notes.txt
 create mode 100644 drivers/of/overlay.c
 create mode 100644 drivers/of/resolver.c

-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
