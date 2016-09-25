From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH v3 0/5] powerpc/mm: movable hotplug memory nodes
Date: Sun, 25 Sep 2016 13:36:51 -0500
Message-ID: <1474828616-16608-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
Sender: owner-linux-mm@kvack.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

These changes enable the dynamic creation of movable nodes on power.

On x86, the ACPI SRAT memory affinity structure can mark memory
hotpluggable, allowing the kernel to possibly create movable nodes at
boot.

While power has no analog of this SRAT information, we can still create
a movable memory node, post boot, by hotplugging all of the node's
memory into ZONE_MOVABLE.

We provide a way to describe the extents and numa associativity of such 
a node in the device tree, while deferring the memory addition to take 
place through hotplug.

In v1, this patchset introduced a new dt compatible id to explicitly 
create a memoryless node at boot. Here, things have been simplified to 
be applicable regardless of the status of node hotplug on power. We 
still intend to enable hotadding a pgdat, but that's now untangled as a 
separate topic.

v3:
* Use Rob Herring's suggestions to improve the node availability check.

* More verbose commit log in the patch enabling CONFIG_MOVABLE_NODE.

* Add a patch to restore top-down allocation the way x86 does.

v2:
* http://lkml.kernel.org/r/1473883618-14998-1-git-send-email-arbab@linux.vnet.ibm.com

* Use the "status" property of standard dt memory nodes instead of 
  introducing a new "ibm,hotplug-aperture" compatible id.

* Remove the patch which explicitly creates a memoryless node. This set 
  no longer has any bearing on whether the pgdat is created at boot or 
  at the time of memory addition.

v1:
* http://lkml.kernel.org/r/1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com

Reza Arbab (5):
  drivers/of: introduce of_fdt_is_available()
  drivers/of: do not add memory for unavailable nodes
  powerpc/mm: allow memory hotplug into a memoryless node
  powerpc/mm: restore top-down allocation when using movable_node
  mm: enable CONFIG_MOVABLE_NODE on powerpc

 Documentation/kernel-parameters.txt |  2 +-
 arch/powerpc/mm/numa.c              | 16 ++++------------
 drivers/of/fdt.c                    | 29 ++++++++++++++++++++++++++---
 include/linux/of_fdt.h              |  2 ++
 mm/Kconfig                          |  2 +-
 5 files changed, 34 insertions(+), 17 deletions(-)

-- 
1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
