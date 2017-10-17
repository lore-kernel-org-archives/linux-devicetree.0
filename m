From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 09/12] of: overlay: avoid race condition between
 applying multiple overlays
Date: Mon, 16 Oct 2017 19:04:28 -0700
Message-ID: <59E5652C.3020206@gmail.com>
References: <1508203074-26917-1-git-send-email-frowand.list@gmail.com>
 <1508203074-26917-10-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1508203074-26917-10-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On 10/16/17 18:17, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> The process of applying an overlay consists of:
>   - unflatten an overlay FDT (flattened device tree) into an
>     EDT (expanded device tree)
>   - fixup the phandle values in the overlay EDT to fit in a
>     range above the phandle values in the live device tree
>   - create the overlay changeset to reflect the contents of
>     the overlay EDT
>   - apply the overlay changeset, to modify the live device tree,
>     potentially changing the maximum phandle value in the live
>     device tree
> 
> There is currently no protection against two overlay applies
> concurrently determining what range of phandle values are in use
> in the live device tree, and subsequently changing that range.
> Add a mutex to prevent multiple overlay applies from occurring
> simultaneously.
> 
> Move of_resolve_phandles() into of_overlay_apply() so that it does not
> have to be duplicated by each caller of of_overlay_apply().
> 
> The test in of_resolve_phandles() that the overlay tree is detached is
> temporarily disabled so that old style overlay unittests do not fail.
> 
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---

Brown paper bag time.

Changes from version 1:

squash "[PATCH] of: overlay: move resolve phandles into of_overlay_apply()"
into "[PATCH 09/12] of: overlay: avoid race condition between applying multiple overlays"


>  drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c |  6 ------
>  drivers/of/of_private.h                      | 12 +++++++++++
>  drivers/of/overlay.c                         | 32 ++++++++++++++++++++++++++++
>  drivers/of/resolver.c                        |  7 ++++++
>  drivers/of/unittest.c                        | 22 +++++++++++++------
>  include/linux/of.h                           |  3 ---
>  6 files changed, 67 insertions(+), 15 deletions(-)
> 

< snip >
