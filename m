From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: [PATCH v2 0/3] powerpc/mm: movable hotplug memory nodes
Date: Wed, 14 Sep 2016 15:06:55 -0500
Message-ID: <1473883618-14998-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <owner-linux-mm@kvack.org>
Sender: owner-linux-mm@kvack.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

These changes enable onlining memory into ZONE_MOVABLE on power, and the 
creation of discrete nodes of movable memory.

We provide a way to describe the extents and numa associativity of such 
a node in the device tree, yet still defer the memory addition to take 
place post-boot through hotplug.

In v1, this patchset introduced a new dt compatible id to explicitly 
create a memoryless node at boot. Here, things have been simplified to 
be applicable regardless of the status of node hotplug on power. We 
still intend to enable hotadding a pgdat, but that's now untangled as a 
separate topic.

v2:
* Use the "status" property of standard dt memory nodes instead of 
  introducing a new "ibm,hotplug-aperture" compatible id.

* Remove the patch which explicitly creates a memoryless node. This set 
  no longer has any bearing on whether the pgdat is created at boot or 
  at the time of memory addition.

v1:
* http://lkml.kernel.org/r/1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com

Reza Arbab (3):
  drivers/of: recognize status property of dt memory nodes
  powerpc/mm: allow memory hotplug into a memoryless node
  mm: enable CONFIG_MOVABLE_NODE on powerpc

 Documentation/kernel-parameters.txt |  2 +-
 arch/powerpc/mm/numa.c              | 13 +------------
 drivers/of/fdt.c                    |  8 ++++++++
 mm/Kconfig                          |  2 +-
 4 files changed, 11 insertions(+), 14 deletions(-)

-- 
1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
