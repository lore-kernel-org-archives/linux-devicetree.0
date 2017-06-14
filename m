From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] stacked overlay support
Date: Wed, 14 Jun 2017 17:52:24 +0300
Message-ID: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Overlay application has a shortcoming that it is not possible
to refer to labels that were defined by a previously applied
overlay.

This patchset fixes the problem by keeping around the labels
that each overlay contains.

It is dependent on the previously submitted
"fdtoverlay, an overlay application tool" patchset and
"libfdt.h: Define FDT_PATH_MAX" patch.

Pantelis Antoniou (2):
  fdt: Allow stacked overlays phandle references
  tests: Add stacked overlay tests on fdtoverlay

 .gitignore                     |   1 +
 libfdt/fdt_overlay.c           | 148 ++++++++++++++++++++++++++++++++++++++++-
 tests/run_tests.sh             |  15 +++++
 tests/stacked_overlay_bar.dts  |  13 ++++
 tests/stacked_overlay_base.dts |   6 ++
 tests/stacked_overlay_baz.dts  |  13 ++++
 6 files changed, 195 insertions(+), 1 deletion(-)
 create mode 100644 tests/stacked_overlay_bar.dts
 create mode 100644 tests/stacked_overlay_base.dts
 create mode 100644 tests/stacked_overlay_baz.dts

-- 
2.1.4
