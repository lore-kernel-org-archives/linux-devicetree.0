From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/5] of: generic infrastructure fixes
Date: Mon, 16 May 2016 19:52:31 +0300
Message-ID: <1463417556-23087-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The first patch renames the *_node_sysfs methods to _node_post since
this is more accurate when more work takes place besides sysfs
tweaking when the next patch is using a hashtable for phandles.
This is a win for very large blobs with a large number of phandles.
Current we use an exhaustive search which is not optimal at all.

The third patch adds a unittest/benchmark for hashed phandles
along with figures about performance.

A long standing request of applied overlays populating
the symbol list is implemented; this allows staggered overlay
application with a symbol from a previous overlay being used
by another after it.

Finally a pr_fmt for the overlay files is used for
uncluttering the printout a bit.

Changes since v1:
* Reworked phandle hash according to maintainer requests
* Added unittest/benchmark for phandle hash
* Reworked the overlay symbol patch
* Added pr_fmt patch


Pantelis Antoniou (5):
  of: rename *_node_sysfs to _node_post
  of: Support hashtable lookups for phandles
  of: unittest: hashed phandles unitest
  of: overlay: Pick up label symbols from overlays.
  of: overlay: Add pr_fmt for clarity

 drivers/of/base.c       |  45 +++++++++++--
 drivers/of/dynamic.c    |  18 +++--
 drivers/of/of_private.h |  37 ++++++++++-
 drivers/of/overlay.c    | 173 ++++++++++++++++++++++++++++++++++++------------
 drivers/of/unittest.c   |  72 +++++++++++++++++++-
 include/linux/of.h      |   2 +
 6 files changed, 289 insertions(+), 58 deletions(-)

-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
