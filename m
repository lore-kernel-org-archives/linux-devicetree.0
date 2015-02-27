From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/3] dtc: Dynamic DT support
Date: Fri, 27 Feb 2015 20:55:43 +0200
Message-ID: <1425063346-14554-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable the generation of symbol & fixup information for
use with dynamic DT loading.

Changes since v3:
* Rebase to latest dtc version.

Changes since v2:
* Split single patch to a patchset.
* Updated to dtc mainline.
* Changed __local_fixups__ format
* Clean up for better legibility.

Pantelis Antoniou (3):
  dtc: Symbol and local fixup generation support
  dtc: Plugin (object) device tree support.
  dtc: Document the dynamic plugin internals

 Documentation/dt-object-internal.txt | 301 +++++++++++++++++++++++++++++++++++
 Documentation/manual.txt             |  10 ++
 checks.c                             | 106 +++++++++++-
 dtc-lexer.l                          |   5 +
 dtc-parser.y                         |  22 ++-
 dtc.c                                |   9 +-
 dtc.h                                |  40 +++++
 flattree.c                           | 202 +++++++++++++++++++++++
 8 files changed, 688 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/dt-object-internal.txt

-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
