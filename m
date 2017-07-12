From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/2] stacked overlay support
Date: Thu, 13 Jul 2017 00:24:17 +0300
Message-ID: <1499894659-25775-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Overlay application has a shortcoming that it is not possible
to refer to labels that were defined by a previously applied
overlay.

This patchset fixes the problem by keeping around the labels
that each overlay contains.

It is dependent on two previously submitted patches
"Introduce fdt_get_path_len() method"
"Introduce fdt_setprop_alloc() method"

Changes since V1:
* Rework to remove reliance on malloc and FDT_PATH_MAX

Pantelis Antoniou (2):
  fdt: Allow stacked overlays phandle references
  tests: Add stacked overlay tests on fdtoverlay

 .gitignore                     |   1 +
 libfdt/fdt_overlay.c           | 131 ++++++++++++++++++++++++++++++++++++++++-
 tests/run_tests.sh             |  15 +++++
 tests/stacked_overlay_bar.dts  |  13 ++++
 tests/stacked_overlay_base.dts |   6 ++
 tests/stacked_overlay_baz.dts  |  13 ++++
 6 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 tests/stacked_overlay_bar.dts
 create mode 100644 tests/stacked_overlay_base.dts
 create mode 100644 tests/stacked_overlay_baz.dts

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
