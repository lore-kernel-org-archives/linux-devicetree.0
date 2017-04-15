From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/4] of: remove *phandle properties from expanded device tree
Date: Fri, 14 Apr 2017 20:55:16 -0700
Message-ID: <1492228520-12450-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Remove "phandle" and "linux,phandle" properties from the internal
device tree.  The phandle will still be in the struct device_node
phandle field.

This is to resolve the issue found by Stephen Boyd [1] when he changed
the type of struct property.value from void * to const void *.  As
a result of the type change, the overlay code had compile errors
where the resolver updates phandle values.

  [1] http://lkml.iu.edu/hypermail/linux/kernel/1702.1/04160.html

Patch 1 is the phandle related changes.

Patches 2 - 4 are minor fixups for issues that became visible
while implementing patch 1.

Frank Rowand (4):
  of: remove *phandle properties from expanded device tree
  of: make __of_attach_node() static
  of: be consistent in form of file mode
  of: detect invalid phandle in overlay

 drivers/of/base.c       | 53 +++++++++++++++++++++++++++++++++++++++++++++----
 drivers/of/dynamic.c    | 31 ++++++++++++++++-------------
 drivers/of/fdt.c        | 40 ++++++++++++++++++++++---------------
 drivers/of/of_private.h |  1 -
 drivers/of/overlay.c    |  8 +++++---
 drivers/of/resolver.c   | 23 +--------------------
 include/linux/of.h      |  1 +
 7 files changed, 97 insertions(+), 60 deletions(-)

-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
