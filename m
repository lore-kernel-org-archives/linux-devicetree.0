From: frowand.list@gmail.com
Subject: [PATCH v2 0/4] of: remove *phandle properties from expanded device tree
Date: Mon, 24 Apr 2017 23:20:06 -0700
Message-ID: <1493101210-11745-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

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

Changes from v1:
   - Remove phandle properties in of_attach_node(), before attaching
     the node to the live tree.
   - Add the phandle sysfs entry for the node in of_attach_node().
   - When creating an overlay changeset, duplicate the node phandle in
     __of_node_dup().

Frank Rowand (4):
  of: remove *phandle properties from expanded device tree
  of: make __of_attach_node() static
  of: be consistent in form of file mode
  of: detect invalid phandle in overlay

 drivers/of/base.c       | 53 ++++++++++++++++++++++++++++++++++++++++++----
 drivers/of/dynamic.c    | 56 ++++++++++++++++++++++++++++++++++++-------------
 drivers/of/fdt.c        | 40 +++++++++++++++++++++--------------
 drivers/of/of_private.h |  2 +-
 drivers/of/overlay.c    |  8 ++++---
 drivers/of/resolver.c   | 23 +-------------------
 include/linux/of.h      |  1 +
 7 files changed, 123 insertions(+), 60 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>
