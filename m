From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/4] DT printf format specifiers
Date: Wed, 14 Jun 2017 15:30:21 -0500
Message-ID: <20170614203025.7581-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This resurrects an old patch[1] from Pantelis adding printf format 
specifiers for DT nodes. The previous versions didn't get applied after 
debate about the what character(s) to use. Grant suggested %pO for 
base kobject and %pOF for struct device_node. Everyone agreed, but no 
new version was posted.

I ended up re-writing the core implementation to be more inline with how 
other format specifiers are written which allowed removing #define code 
fragments. The other 3 patches convert the core DT code to use %pOF and 
prepare for changing device_node.full_name to stop storing the full path 
for every node.

My plan is to merge this series for v4.13 and post follow-up patches to 
convert all arches and subsystems to %pOF for v4.14. The full series is 
available here[2]. I tested this on QEMU running the DT unittests.

Rob

[1] https://patchwork.kernel.org/patch/6127521/
[2] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-printf

Pantelis Antoniou (1):
  of: Custom printk format specifier for device node

Rob Herring (3):
  of: use kbasename instead of open coding
  of: find_node_by_full_name rewrite to compare each level
  of: Convert to using %pOF instead of full_name

 Documentation/printk-formats.txt |  31 +++++++++
 drivers/of/address.c             |  21 +++---
 drivers/of/base.c                |  76 ++++++++++++----------
 drivers/of/device.c              |   2 +-
 drivers/of/dynamic.c             |  33 +++++-----
 drivers/of/irq.c                 |  10 +--
 drivers/of/of_mdio.c             |  10 +--
 drivers/of/of_pci.c              |  29 ++++-----
 drivers/of/of_private.h          |   3 +
 drivers/of/overlay.c             |  21 +++---
 drivers/of/platform.c            |  34 +++++-----
 drivers/of/resolver.c            |  34 ++--------
 drivers/of/unittest.c            |  66 +++++++++++--------
 lib/vsprintf.c                   | 135 ++++++++++++++++++++++++++++++++++++++-
 scripts/checkpatch.pl            |   2 +-
 15 files changed, 331 insertions(+), 176 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
