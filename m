From: frowand.list@gmail.com
Subject: [PATCH v5 0/3] of: cache phandle nodes to reduce cost of of_find_node_by_phandle()
Date: Sun,  4 Mar 2018 16:14:46 -0800
Message-ID: <1520208889-3908-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, cpandya@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Create a cache of the nodes that contain a phandle property.  Use this
cache to find the node for a given phandle value instead of scanning
the devicetree to find the node.  If the phandle value is not found
in the cache, of_find_node_by_phandle() will fall back to the tree
scan algorithm.

Size and performance data is in patch 1/3 comments

Changes since v4:
  - Add patch 2/3 "memblock: add memblock_free() alloc when
    CONFIG_HAVE_MEMBLOCK is not set"
  - patch 3/3 (previously 2/2): add checks for zero returned by
    memblock_virt_alloc()

Changes since v3:
  - of_populate_phandle_cache(): add check for failed memory allocation
  - add patch 2/2 into series instead of as a standalone patch that was
    dependent on patch 1/2 of this series

Changes since v2:
  - add mask to calculation of phandle cache entry
  - which results in better overhead reduction for devicetrees with
    phandle properties not allocated in the monotonically increasing
    range of 1..n
  - due to mask, number of entries in cache potentially increased to
    next power of two
  - minor fixes as suggested by reviewers
  - no longer using live_tree_max_phandle() so do not move it from
    drivers/of/resolver.c to drivers/of/base.c

Changes since v1:
  - change short description from
    of: cache phandle nodes to reduce cost of of_find_node_by_phandle()
  - rebase on v4.16-rc1
  - reorder new functions in base.c to avoid forward declaration
  - add locking around kfree(phandle_cache) for memory ordering
  - add explicit check for non-null of phandle_cache in
    of_find_node_by_phandle().  There is already a check for !handle,
    which prevents accessing a null phandle_cache, but that dependency
    is not obvious, so this check makes it more apparent.
  - do not free phandle_cache if modules are enabled, so that
    cached phandles will be available when modules are loaded



Frank Rowand (3):
  of: cache phandle nodes to reduce cost of of_find_node_by_phandle()
  memblock: add memblock_free() alloc when CONFIG_HAVE_MEMBLOCK is not
    set
  of: add early boot allocation of of_find_node_by_phandle() cache

 drivers/of/base.c        | 124 +++++++++++++++++++++++++++++++++++++++++++++--
 drivers/of/fdt.c         |   2 +
 drivers/of/of_private.h  |   5 ++
 drivers/of/resolver.c    |   3 --
 include/linux/memblock.h |   4 ++
 5 files changed, 131 insertions(+), 7 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>
