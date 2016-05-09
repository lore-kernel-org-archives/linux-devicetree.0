From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 0/3] of: generic infrastructure fixes
Date: Mon,  9 May 2016 21:11:25 +0300
Message-ID: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

The first patch renames the *_node_sysfs methods to _node_post since
this is more accurate when more work takes place besides sysfs
tweaking when the next patch is using a hashtable for phandles.
This is a win for very large blobs with a large number of phandles.
Current we use an exhaustive search which is not optimal at all.

Finally, a long standing request of applied overlays populating
the symbol list is implemented; this allows staggered overlay
application with a symbol from a previous overlay being used
by another after it.

Pantelis Antoniou (3):
  of: rename *_node_sysfs to _node_post
  of: Support hashtable lookups for phandles
  of: overlay: Pick up label symbols from overlays.

 drivers/of/base.c       |  39 +++++++++++++++---
 drivers/of/dynamic.c    |  18 ++++++---
 drivers/of/of_private.h |  35 ++++++++++++++++-
 drivers/of/overlay.c    | 102 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/of/unittest.c   |   4 +-
 include/linux/of.h      |   2 +
 6 files changed, 186 insertions(+), 14 deletions(-)

-- 
1.7.12
