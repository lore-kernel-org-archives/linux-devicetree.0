From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC PATCH 00/13] of: Make drivers/of/resolver.c more readable
Date: Tue, 25 Oct 2016 13:58:53 -0700
Message-ID: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
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

  Remove comments that state the obvious, to reduce clutter
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


Frank Rowand (13):
  Remove comments that state the obvious, to reduce clutter
  Remove excessive printks to reduce clutter.
  Remove braces around single line blocks.
  Convert comparisons to zero or NULL to simplify logical expressions
  Rename functions to more accurately reflect what they do
  Remove prefix "__of_" and prefix "__" from local function names
  Rename variables to better reflect purpose or follow convention
  Update structure of code to be clearer, also remove BUG_ON()
  Remove redundant size check
  Update comments to reflect changes and increase clarity
  Add back an error message, restructured
  Move setting of pointer to beside test for non-null
  Remove unused variable overlay_symbols

 drivers/of/resolver.c | 349 ++++++++++++++++++++------------------------------
 1 file changed, 141 insertions(+), 208 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
