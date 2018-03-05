From: frowand.list@gmail.com
Subject: [PATCH v5 2/3] memblock: add memblock_free() alloc when CONFIG_HAVE_MEMBLOCK is not set
Date: Sun,  4 Mar 2018 16:14:48 -0800
Message-ID: <1520208889-3908-3-git-send-email-frowand.list@gmail.com>
References: <1520208889-3908-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520208889-3908-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, cpandya@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

When CONFIG_HAVE_MEMBLOCK is not set, an error version of
memblock_alloc() exists.  Add the matching memblock_free().

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---

Andrew or Michal, can you please ack this patch to be accepted
by Rob?


With "of: add early boot allocation of
of_find_node_by_phandle() cache" applied, kbuild test robot reports
tilex architecture build error due to no prototype for memblock_free().

The version of the patch that kbuild test robot reported was
"[PATCH v4 2/2] of: add early boot allocation of
of_find_node_by_phandle() cache".  An updated version of that
patch is now patch 3/3 of this series.

 include/linux/memblock.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 8be5077efb5f..d6973b1d92bc 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -432,6 +432,10 @@ static inline unsigned long memblock_reserved_memory_within(phys_addr_t start_ad
 	return 0;
 }
 
+static inline int memblock_free(phys_addr_t base, phys_addr_t size)
+{
+	return 0;
+}
 #endif /* CONFIG_HAVE_MEMBLOCK */
 
 #endif /* __KERNEL__ */
-- 
Frank Rowand <frank.rowand@sony.com>
