From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 00/12] of: overlay: clean up device tree overlay code
Date: Mon,  2 Oct 2017 20:53:34 -0700
Message-ID: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

I have found the device tree overlay code to be difficult to read and
maintain.  This patch series attempts to improve that situation.

The cleanup includes some changes visible to users of overlays.  The
only in kernel user of overlays is fixed up for those changes.  The
in kernel user is:

   drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c

Following the cleanup patches are a set of patches to fix various
issues.

The first five patches are intended to not make any functional
changes, and are segrated to ease review.

Frank Rowand (12):
  of: overlay.c: Remove comments that state the obvious, to reduce
    clutter
  of: overlay.c: Convert comparisons to zero or NULL to logical
    expressions
  of: overlay: rename identifiers to more reflect what they do
  of: overlay: rename identifiers in dup_and_fixup_symbol_prop()
  of: overlay: minor restructuring
  of: overlay: detect cases where device tree may become corrupt
  of: overlay: expand check of whether overlay changeset can be removed
  of: overlay: loosen overly strict phandle clash check
  of: overlay: avoid race condition between applying multiple overlays
  of: overlay: simplify applying symbols from an overlay
  of: overlay: remove a dependency on device node full_name
  of: overlay: remove unneeded check for NULL kbasename()

 Documentation/devicetree/overlay-notes.txt   |   12 +-
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |   15 +-
 drivers/of/base.c                            |    2 +-
 drivers/of/dynamic.c                         |  137 +++-
 drivers/of/of_private.h                      |   10 +-
 drivers/of/overlay.c                         | 1024 ++++++++++++++++----------
 drivers/of/unittest.c                        |   80 +-
 include/linux/of.h                           |   33 +-
 8 files changed, 871 insertions(+), 442 deletions(-)

-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
