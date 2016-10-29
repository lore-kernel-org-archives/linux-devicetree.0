From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 00/12] of: Make drivers/of/resolver.c more readable
Date: Fri, 28 Oct 2016 23:26:20 -0700
Message-ID: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

drivers/of/resolve.c is a bit difficult to read.  Clean it up so
that review of future overlay related patches will be easier.

Most of the patches are intended to be reformatting, with no functional
change.  Patches that are expected to have a functional change are:

  Remove excessive printks to reduce clutter.
  Update structure of code to be clearer, also remove BUG_ON()
    Any functional change would reflect undefined behavior on bad overlay.
    Some error message text modified.
    BUG_ON() removed.
  Add back an error message, restructured

The patches are grouped into sets of changes that are intended
to be easy to verify correctness through simple inspection.

Some of the individual patches have checkpatch warnings or errors.
But after all patches are applied, the number of errors and
warnings from running checkpatch against the entire file are
reduced to two line size warnings.

These patches are only tested via the unit tests. I do not have
expansion boards to test with real hardware.

changes from rfc to v1:
  - Remove fewer one line comments
  - Add more extensive header comment to of_resolve_phandles()
    to explain the how and why of resolving phandles
  - Update patch header comments
  - Incorporated patch "Remove braces around single line blocks"
    into the previous patch in the series


Frank Rowand (12):
  of: Remove comments that state the obvious, to reduce clutter
  of: Remove excessive printks to reduce clutter.
  of: Convert comparisons to zero or NULL to logical expressions
  of: Rename functions to more accurately reflect what they do
  of: Remove prefix "__of_" from local function names
  of: Rename variables to better reflect purpose or follow convention
  of: Update structure of code to be clearer, also remove BUG_ON()
  of: Remove redundant size check
  of: Update comments to reflect changes and increase clarity
  of: Add back an error message, restructured
  of: Move setting of pointer to beside test for non-null
  of: Remove unused variable overlay_symbols

 drivers/of/resolver.c | 364 ++++++++++++++++++++++----------------------------
 1 file changed, 156 insertions(+), 208 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
