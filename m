From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 00/12] of: overlay: clean up device tree overlay code
Date: Fri, 13 Oct 2017 15:03:22 -0700
Message-ID: <59E1382A.6030003@gmail.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 10/02/17 20:53, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> I have found the device tree overlay code to be difficult to read and
> maintain.  This patch series attempts to improve that situation.
> 
> The cleanup includes some changes visible to users of overlays.  The
> only in kernel user of overlays is fixed up for those changes.  The
> in kernel user is:
> 
>    drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
> 
> Following the cleanup patches are a set of patches to fix various
> issues.
> 
> The first five patches are intended to not make any functional
> changes, and are segrated to ease review.
> 
> Frank Rowand (12):
>   of: overlay.c: Remove comments that state the obvious, to reduce
>     clutter
>   of: overlay.c: Convert comparisons to zero or NULL to logical
>     expressions
>   of: overlay: rename identifiers to more reflect what they do
>   of: overlay: rename identifiers in dup_and_fixup_symbol_prop()
>   of: overlay: minor restructuring
>   of: overlay: detect cases where device tree may become corrupt
>   of: overlay: expand check of whether overlay changeset can be removed
>   of: overlay: loosen overly strict phandle clash check
>   of: overlay: avoid race condition between applying multiple overlays
>   of: overlay: simplify applying symbols from an overlay
>   of: overlay: remove a dependency on device node full_name
>   of: overlay: remove unneeded check for NULL kbasename()
> 
>  Documentation/devicetree/overlay-notes.txt   |   12 +-
>  drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |   15 +-
>  drivers/of/base.c                            |    2 +-
>  drivers/of/dynamic.c                         |  137 +++-
>  drivers/of/of_private.h                      |   10 +-
>  drivers/of/overlay.c                         | 1024 ++++++++++++++++----------
>  drivers/of/unittest.c                        |   80 +-
>  include/linux/of.h                           |   33 +-
>  8 files changed, 871 insertions(+), 442 deletions(-)
> 

What is the status on this series?  Did I resolve all of the issues that
you found?  Is there anything else I need to do?

The last issue that I recall, was a question about "[PATCH 09/12] of: overlay: 
avoid race condition between applying multiple overlays", were you asked if
of_resolve_phandles() could be moved into of_overlay_apply().  I sent an
additional patch "[PATCH] of: overlay: move resolve phandles into
of_overlay_apply()" [1] that applies on top of this series to do so.

There is a trickle of new patches against the same files as in my
series, so I would like to get my series applied sooner that later,
if possible.

Thanks,

Frank

[1] https://lkml.org/lkml/2017/10/10/1389
