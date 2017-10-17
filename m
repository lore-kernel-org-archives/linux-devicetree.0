From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 00/12] of: overlay: clean up device tree overlay code
Date: Mon, 16 Oct 2017 19:04:24 -0700
Message-ID: <59E56528.1060808@gmail.com>
References: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On 10/16/17 18:17, frowand.list@gmail.com wrote:
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
>  drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |   14 +-
>  drivers/of/base.c                            |    2 +-
>  drivers/of/dynamic.c                         |  137 +++-
>  drivers/of/of_private.h                      |   22 +-
>  drivers/of/overlay.c                         | 1034 ++++++++++++++++----------
>  drivers/of/resolver.c                        |    7 +
>  drivers/of/unittest.c                        |   81 +-
>  include/linux/of.h                           |   17 +-
>  9 files changed, 869 insertions(+), 457 deletions(-)
> 

Brown paper bag time.

Changes from version 1:

  squash "[PATCH] of: overlay: move resolve phandles into of_overlay_apply()"
  into "[PATCH 09/12] of: overlay: avoid race condition between applying multiple overlays"
