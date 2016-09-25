From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH v3 4/5] powerpc/mm: restore top-down allocation when using movable_node
Date: Sun, 25 Sep 2016 13:36:55 -0500
Message-ID: <1474828616-16608-5-git-send-email-arbab@linux.vnet.ibm.com>
References: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

At boot, the movable_node option sets bottom-up memblock allocation.

This reduces the chance that, in the window before movable memory has
been identified, an allocation for the kernel might come from a movable
node. By going bottom-up, early allocations will most likely come from
the same node as the kernel image, which is necessarily in a nonmovable
node.

Then, once any known hotplug memory has been marked, allocation can be
reset back to top-down. On x86, this is done in numa_init(). This patch
does the same on power, in numa initmem_init().

Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
---
 arch/powerpc/mm/numa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index d7ac419..fdf1e69 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -945,6 +945,9 @@ void __init initmem_init(void)
 	max_low_pfn = memblock_end_of_DRAM() >> PAGE_SHIFT;
 	max_pfn = max_low_pfn;
 
+	/* bottom-up allocation may have been set by movable_node */
+	memblock_set_bottom_up(false);
+
 	if (parse_numa_properties())
 		setup_nonnuma();
 	else
-- 
1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
