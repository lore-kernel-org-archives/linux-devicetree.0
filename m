From: frowand.list@gmail.com
Subject: [PATCH v5 0/4] of: remove *phandle properties from expanded device tree
Date: Fri,  9 Jun 2017 22:47:08 -0700
Message-ID: <1497073632-22402-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
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

Changes from v4:
   - rebase on 4.12-rc1
   - Add reason for "<NULL>" in of_attach_node()
   - Simplify and consolidate phandle detection logic in
     populate_properties().  This results in a change of behaviour,
     the value of property "ibm,phandle" will no longer override the
     value of properties "phandle" and "linux,phandle".

Changes from v3:
   - patch 1: fix incorrect variable name in __of_add_phandle_sysfs().
     Problem was reported by the kbuild test robot

Changes from v2:
   - patch 1: Remove check in __of_add_phandle_sysfs() that would not
     add a sysfs entry if IS_ENABLED(CONFIG_PPC_PSERIES)

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

 drivers/of/base.c       | 50 +++++++++++++++++++++++++++++++++++++++----
 drivers/of/dynamic.c    | 57 +++++++++++++++++++++++++++++++++++++------------
 drivers/of/fdt.c        | 43 ++++++++++++++++++-------------------
 drivers/of/of_private.h |  2 +-
 drivers/of/overlay.c    |  8 ++++---
 drivers/of/resolver.c   | 23 +-------------------
 include/linux/of.h      |  1 +
 7 files changed, 118 insertions(+), 66 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>
