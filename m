From: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/4] powerpc/mm: movable hotplug memory nodes
Date: Mon,  8 Aug 2016 13:27:19 -0500
Message-ID: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Bharata B Rao <bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

These changes enable onlining memory into ZONE_MOVABLE on power, and the
creation of discrete nodes of movable memory.

Node hotplug is not supported on power [1]. The approach taken instead is to
create a memoryless placeholder node for the designated address range at boot.
Hotplug and onlining of the memory are then done in the usual way.

The numa code on power currently prevents hotplugging to a memoryless node.
This limitation has been questioned before [2], and judging by the response,
there doesn't seem to be a reason we can't remove it. No issues have been
found in light testing.

[1] commit 3af229f ("powerpc/numa: Reset node_possible_map to only node_online_map")
[2] http://lkml.kernel.org/r/CAGZKiBrmkSa1yyhbf5hwGxubcjsE5SmkSMY4tpANERMe2UG4bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org
    http://lkml.kernel.org/r/20160511215051.GF22115-qNY8G7rN0TWMBe/gKFfDyNwqlRwYtuWJQQ4Iyu8u01E@public.gmane.org

Reza Arbab (4):
  dt-bindings: add doc for ibm,hotplug-aperture
  powerpc/mm: create numa nodes for hotplug memory
  powerpc/mm: allow memory hotplug into a memoryless node
  mm: enable CONFIG_MOVABLE_NODE on powerpc

 .../bindings/powerpc/opal/hotplug-aperture.txt     | 26 ++++++++++++++++++++++
 Documentation/kernel-parameters.txt                |  2 +-
 arch/powerpc/mm/numa.c                             | 23 ++++++++-----------
 mm/Kconfig                                         |  2 +-
 4 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/powerpc/opal/hotplug-aperture.txt

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
