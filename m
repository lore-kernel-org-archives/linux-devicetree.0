From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/6] Shrinking DT memory usage
Date: Thu,  5 Oct 2017 14:44:16 -0500
Message-ID: <20171005194422.26224-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On kernels with a minimal config and a RAM target in the 100s of KB, DT 
is quite a hog of runtime memory usage. How much is dependent on how many
nodes and properties in the DT which have a corresponding struct device_node
and struct property in the kernel. Just skipping disabled nodes saves a 
lot by not creating the device_nodes in the first place[1], but there's 
more low hanging fruit by making some of the fields in struct property and
struct device_node optional. With the changes here, the memory usage goes
from 17KB to under 8KB on QEMU's ARM virt machine which is a relatively 
small DT.

The majority of the diffstat here is just moving all the kobject/sysfs 
related code to its own file so we can avoid adding a bunch of ifdefs.

There's more drastic approaches we could take such as doing the 
unflattening at build time and storing the bulk of the unflattened tree 
as const data. Grant also has some ideas on storing properties as ids 
instead. He's explained it to me, but I still don't understand it.

Rob

[1] https://patchwork.kernel.org/patch/9983203/

Rob Herring (6):
  of: fix missing kobject init for !SYSFS && OF_DYNAMIC config
  of: remove struct property.unique_id for FDT
  of: make struct property _flags field configurable
  of: move kobj_to_device_node() into dynamic.c
  of: wrap accesses to device_node kobject
  of: make kobject and bin_attribute support configurable

 drivers/base/core.c     |   2 +-
 drivers/of/Kconfig      |   4 ++
 drivers/of/Makefile     |   1 +
 drivers/of/base.c       | 133 ---------------------------------------
 drivers/of/dynamic.c    |  27 ++------
 drivers/of/kobj.c       | 164 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/of/of_private.h |  29 +++++++--
 include/linux/of.h      |  28 +++++----
 8 files changed, 215 insertions(+), 173 deletions(-)
 create mode 100644 drivers/of/kobj.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
