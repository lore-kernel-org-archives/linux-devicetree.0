From: frowand.list@gmail.com
Subject: [PATCH v2 0/2] of: phandle_cache, fix refcounts, remove stale entry
Date: Sun, 16 Dec 2018 23:56:34 -0800
Message-ID: <1545033396-24485-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, Michael Bringmann <mwb@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, Thomas Falcon <tlfalcon@linux.vnet.ibm.com>, Juliet Kim <minkim@us.ibm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Non-overlay dynamic devicetree node removal may leave the node in
the phandle cache.  Subsequent calls to of_find_node_by_phandle()
will incorrectly find the stale entry.  This bug exposed the foloowing
phandle cache refcount bug.

The refcount of phandle_cache entries is not incremented while in
the cache, allowing use after free error after kfree() of the
cached entry.

Changes since v1:
  - make __of_free_phandle_cache() static
  - add WARN_ON(1) for unexpected condition in of_find_node_by_phandle()
  
Frank Rowand (2):
  of: of_node_get()/of_node_put() nodes held in phandle cache
  of: __of_detach_node() - remove node from phandle cache

 drivers/of/base.c       | 100 ++++++++++++++++++++++++++++++++++++------------
 drivers/of/dynamic.c    |   3 ++
 drivers/of/of_private.h |   4 ++
 3 files changed, 82 insertions(+), 25 deletions(-)

-- 
Frank Rowand <frank.rowand@sony.com>
