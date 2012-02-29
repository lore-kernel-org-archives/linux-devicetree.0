From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH v6 0/2] of: Device Tree enhancements needed by MIPS/OCTEON
Date: Wed, 29 Feb 2012 11:21:02 -0800
Message-ID: <1330543264-18103-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

These two patches have been around for quite a while now.  I am
currently making a big push to get all out-of-tree OCTEON patches
upstream, and these two are prerequisites for all the rest.  The last
changes requested by Grant Likely and David Gibson (last May) are
incorporated.

As always, more comments are welcome, but it would be nice to see them
get merged too.


v6: No changes other than to split these out of the MIPS/OCTEON patch
    set to allow them to be merged separately if desired.

v5: Build libfdt in the lib directory instead of devices/of, and
    include all libfdt files.

    Changes to of_find_node_by_path() requested by Grant Likely.

v4: No changes to these two patches.

v3: libfdt building moved to devices/of/libfdt.  Cleanup and style
    improvements as suggested by Grant Likley.

v2: No changes to these two patches.


Background: The Octeon family of SOCs has a variety of on-chip
controllers for Ethernet, MDIO, I2C, and several other I/O devices.
These chips are used on boards with a great variety of different
configurations.  To date, the configuration and bus topology
information has been hard coded in the drivers and support code.

To facilitate supporting new chips and boards, we make use use the
Device Tree to encode the configuration information.  Migration to use
of the device tree is as follows:

o A device tree template is statically linked into the kernel image.
  Based on SOC type and board type, legacy configuration probing code
  is used to prune and patch the device tree template.

o New SOCs and boards will directly use a device tree passed by the
  bootloader.


These two patches are prerequisites for the bulk of the OCTEON changes.

1/2 - Infrastructure to allow scripts/dtc/libfdt to be used in the
      kernel.  As mentioned above, when using legacy bootloaders, we
      prune an in-kernel FDT image based on legacy probing code.
      libfdt is used to do the pruning.

2/2 - Enhancements to of_find_node_by_path() to allow it to traverse
      /aliases.  This is used by the OCTEON Ethernet drivers.


David Daney (2):
  of/lib: Allow scripts/dtc/libfdt to be used from kernel code
  of: Make of_find_node_by_path() traverse /aliases for relative paths.

 drivers/of/base.c          |   65 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/libfdt.h     |    8 +++++
 include/linux/libfdt_env.h |   13 +++++++++
 lib/Kconfig                |    6 ++++
 lib/Makefile               |    5 +++
 lib/fdt.c                  |    2 +
 lib/fdt_ro.c               |    2 +
 lib/fdt_rw.c               |    2 +
 lib/fdt_strerror.c         |    2 +
 lib/fdt_sw.c               |    2 +
 lib/fdt_wip.c              |    2 +
 11 files changed, 106 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/libfdt.h
 create mode 100644 include/linux/libfdt_env.h
 create mode 100644 lib/fdt.c
 create mode 100644 lib/fdt_ro.c
 create mode 100644 lib/fdt_rw.c
 create mode 100644 lib/fdt_strerror.c
 create mode 100644 lib/fdt_sw.c
 create mode 100644 lib/fdt_wip.c

-- 
1.7.2.3
