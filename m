From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 00/10] Device property improvements, add %pfw format specifier
Date: Thu, 29 Aug 2019 13:10:33 +0300
Message-ID: <20190829101043.24963-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This set adds functionality into the device property API (counting a
node's parents as well as obtaining its name) in order to support printing
fwnode names using a new conversion specifier "%pfw". The names that are
produced are equivalent to its OF counterpart "%pOF" on OF systems for the
two supported modifiers ("f" and "P").

Printing a node's name is something that's been available on OF for a long
time and if something is converted to device property API (such as the
V4L2 fwnode framework) it always got removed of a nice feature that was
sometimes essential in debugging. With this set, that no longer is the
case.

since v2:

- Better comments in acpi_fwnode_get_name_prefix().

- Added swnode implementation.

- Fixed swnode refcounting in get_parent() ("swnode: Get reference to
  parent swnode in get_parent op")

- Make argument to to_software_node() const (a new patch)

- Factored out confusingly named kobject_string() that had a single
  caller.

- Cleaner fwnode_count_parents() implementation (as discussed in review).

- Made fwnode_count_parents() argument const.

- Added tests (last patch in the set).

since v1:

- Add patch to remove support for %pf and %pF (depends on another patch
  removing all use of %pf and %pF) (now 4th patch)

- Fix kerneldoc argument documentation for fwnode_get_name (2nd patch)

- Align kerneldoc style with the rest of drivers/base/property.c (no extra
  newline after function name)

- Make checkpatch.pl complain about "%pf" not followed by "w" (6th patch)

- WARN_ONCE() on use of invalid conversion specifiers ("%pf" not followed
  by "w")

Sakari Ailus (10):
  software node: Get reference to parent swnode in get_parent op
  software node: Make argument to to_software_node const
  device property: Add functions for accessing node's parents
  device property: Add fwnode_get_name for returning the name of a node
  device property: Add a function to obtain a node's prefix
  lib/vsprintf: Remove support for %pF and %pf in favour of %pS and %ps
  lib/vsprintf: Make use of fwnode API to obtain node names and
    separators
  lib/vsprintf: OF nodes are first and foremost, struct device_nodes
  lib/vsprintf: Add %pfw conversion specifier for printing fwnode names
  lib/test_printf: Add tests for %pfw printk modifier

 Documentation/core-api/printk-formats.rst | 34 ++++++---
 drivers/acpi/property.c                   | 48 +++++++++++++
 drivers/base/property.c                   | 83 +++++++++++++++++++--
 drivers/base/swnode.c                     | 55 +++++++++++++-
 drivers/of/property.c                     | 16 +++++
 include/linux/fwnode.h                    |  4 ++
 include/linux/property.h                  |  8 ++-
 lib/test_printf.c                         | 37 ++++++++++
 lib/vsprintf.c                            | 88 +++++++++++++----------
 scripts/checkpatch.pl                     |  4 +-
 10 files changed, 318 insertions(+), 59 deletions(-)

-- 
2.20.1
