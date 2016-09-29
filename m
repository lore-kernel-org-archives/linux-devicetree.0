From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v6 0/4] libfdt: Add support for device tree overlays
Date: Thu, 29 Sep 2016 13:29:04 +0200
Message-ID: <20160929112908.4468-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

The device tree overlays are a great solution to the issue raised by
the bunch expandable boards we find everywhere these days, like the
Beaglebone, Raspberry Pi or CHIP.

Although for now Linux is the only available tool that can deal with
overlays, some other components like bootloaders or user-space tools
might need to apply these overlays on top of a base device tree.

To address these use cases, we introduce a new function to the libfdt,
fdt_overlay_apply, that does just that.

You can find a test program here: http://code.bulix.org/792zum-99476?raw

This is the last patches sent to U-boot, with the modifications
suggested by David, and the additional test cases.

Let me know what you think!
Maxime

Changes from v5:
  - Added the extra error codes suggested by David
  - Changed slightly the meaning of BADPHANDLE
  - Added an extra error check to deal with overlay without fixups
  - Fixed a test failure that went unnoticed so far (Thanks Tim!)
  - Rebased on top of 1.4.2

Changes from libfdt v4:
  - Renamed the index parameter in fdt_setprop_inplace_namelen_partial
    to idx
  - Changed the fdt_setprop_inplace_namelen_partial tests to modify
    the existing compatibles instead of relying on new properties

Changes from libfdt v3:
  - Fixed a few error in the fixup parsing code
  - Added test cases with overlays with poorly formatted fixups
  - Fixed a few error, types returned
  - Added a new error for poorly formatted fixups
  - Added new tests for fdt_setprop_inplace_namelen_partial
  - Fixed the documentation of fdt_for_each_property_offset and
    fdt_for_each_subnode

Changes from libfdt v2:
  - Added test cases for the overlays that don't require overlay
    support in dtc
  - Only treat as fragments the top-level subnodes with an __overlay__
    subnode
  - Fixed kerneldoc for subnodes and property iterators
  - Improve kerneldoc for fdt_get_max_phandle
  - Make sure the fixup properties length is a multiple of 4 bytes
  - Improve the error checking on a few places
  - Improve a few variables names and types

Changes from U-Boot v4:
  - Added test cases for the functions
  - Changed the fdt_for_each_subnode argument order
  - Don't error out if -1 phandle is found in fdt_get_max_phandle
  - Used libfdt's fdt_path_offset_namelen

Changes from U-Boot v3:
  - Moved the patch to introduce fdt_getprop_namelen_w earlier to keep
    bisectability
  - Renamed fdt_setprop_inplace_namelen_by_index in
    fdt_setprop_inplace_namelen_partial
  - Reintroduced the check on the property length in fdt_setprop_inplace
  - Made sure the code was taking the non 32bits-aligned phandles
  - Used memchr instead of strchr in the fixup parsing code, and made
    sure the cases where the fixup format was wrong was reported as an
    error.
  - Fixed a bug where a property in a overlay having multiple phandles
    local to that overlay would only resolve the first one. Also added
    a test case for this
  - Added kerneldocs for all the overlay functions
  - Added a patch to fix a typo in separator
  - A few fixes, function renamings, error checking changes here and there

Changes from U-boot v2 / libfdt v1
  - Reworked the code to deal with Pantelis and David numerous
    comments, among which:
    * Remove the need for malloc in the overlay code, and added some
      libfdt functions to do that
    * Remove the DT magic in case of an error to not be able to use it
      anymore
    * Removed the fdt_ and _ function prefix for the static functions
    * Plus the usual bunch of rework, error checking and optimizations.

Maxime Ripard (4):
  libfdt: Add new errors for the overlay code
  libfdt: Extend the reach of FDT_ERR_BADPHANDLE
  libfdt: Add overlay application function
  tests: Add tests cases for the overlay code

 libfdt/Makefile.libfdt                      |   2 +-
 libfdt/fdt_overlay.c                        | 667 ++++++++++++++++++++++++++++
 libfdt/fdt_strerror.c                       |   3 +
 libfdt/libfdt.h                             |  53 ++-
 libfdt/libfdt_env.h                         |   1 +
 tests/.gitignore                            |   2 +
 tests/Makefile.tests                        |   3 +-
 tests/overlay.c                             | 232 ++++++++++
 tests/overlay_bad_fixup.c                   |  70 +++
 tests/overlay_bad_fixup_bad_index.dts       |  14 +
 tests/overlay_bad_fixup_base.dtsi           |  18 +
 tests/overlay_bad_fixup_empty.dts           |  14 +
 tests/overlay_bad_fixup_empty_index.dts     |  14 +
 tests/overlay_bad_fixup_index_trailing.dts  |  14 +
 tests/overlay_bad_fixup_path_empty_prop.dts |  14 +
 tests/overlay_bad_fixup_path_only.dts       |  14 +
 tests/overlay_bad_fixup_path_only_sep.dts   |  14 +
 tests/overlay_bad_fixup_path_prop.dts       |  14 +
 tests/overlay_base.dts                      |  21 +
 tests/overlay_overlay_dtc.dts               |  85 ++++
 tests/overlay_overlay_nodtc.dts             |  82 ++++
 tests/run_tests.sh                          |  32 ++
 22 files changed, 1378 insertions(+), 5 deletions(-)
 create mode 100644 libfdt/fdt_overlay.c
 create mode 100644 tests/overlay.c
 create mode 100644 tests/overlay_bad_fixup.c
 create mode 100644 tests/overlay_bad_fixup_bad_index.dts
 create mode 100644 tests/overlay_bad_fixup_base.dtsi
 create mode 100644 tests/overlay_bad_fixup_empty.dts
 create mode 100644 tests/overlay_bad_fixup_empty_index.dts
 create mode 100644 tests/overlay_bad_fixup_index_trailing.dts
 create mode 100644 tests/overlay_bad_fixup_path_empty_prop.dts
 create mode 100644 tests/overlay_bad_fixup_path_only.dts
 create mode 100644 tests/overlay_bad_fixup_path_only_sep.dts
 create mode 100644 tests/overlay_bad_fixup_path_prop.dts
 create mode 100644 tests/overlay_base.dts
 create mode 100644 tests/overlay_overlay_dtc.dts
 create mode 100644 tests/overlay_overlay_nodtc.dts

-- 
2.9.3
