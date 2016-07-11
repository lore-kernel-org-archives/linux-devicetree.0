From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/6] libfdt: Add support for device tree overlays
Date: Mon, 11 Jul 2016 21:56:17 +0200
Message-ID: <20160711195623.12840-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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


Maxime Ripard (5):
  libfdt: Add iterator over properties
  libfdt: Add max phandle retrieval function
  libfdt: Add fdt_getprop_namelen_w
  libfdt: Add fdt_setprop_inplace_namelen_partial
  libfdt: Add overlay application function

Thierry Reding (1):
  libfdt: Add a subnodes iterator macro

 libfdt/Makefile.libfdt     |   2 +-
 libfdt/fdt_overlay.c       | 618 +++++++++++++++++++++++++++++++++++++++++++++
 libfdt/fdt_ro.c            |  26 ++
 libfdt/fdt_wip.c           |  29 ++-
 libfdt/libfdt.h            | 121 +++++++++
 libfdt/libfdt_env.h        |   1 +
 tests/.gitignore           |   2 +
 tests/Makefile.tests       |   4 +-
 tests/get_phandle.c        |   6 +
 tests/overlay.c            | 228 +++++++++++++++++
 tests/overlay_base.dts     |  21 ++
 tests/overlay_overlay.dts  |  96 +++++++
 tests/property_iterate.c   |  97 +++++++
 tests/property_iterate.dts |  24 ++
 tests/run_tests.sh         |  11 +
 tests/subnode_iterate.c    |   8 +-
 16 files changed, 1282 insertions(+), 12 deletions(-)
 create mode 100644 libfdt/fdt_overlay.c
 create mode 100644 tests/overlay.c
 create mode 100644 tests/overlay_base.dts
 create mode 100644 tests/overlay_overlay.dts
 create mode 100644 tests/property_iterate.c
 create mode 100644 tests/property_iterate.dts

-- 
2.9.0
