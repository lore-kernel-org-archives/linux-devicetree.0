From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 0/3] of: overlay: load overlay symbols into live device tree
Date: Thu, 20 Jul 2017 09:47:47 -0500
Message-ID: <CAL_JsqJnr4bE__S8EtND83NN02+NfyHHJnGxNrDPAGpWRsCLQQ@mail.gmail.com>
References: <1500481523-31083-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500481523-31083-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 11:25 AM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>
>
> Symbols in a loaded overlay are not currently available to subsequently
> loaded overlays because the properties in the overlay's __symbols__
> node are not loaded into the live device tree.
>
> Patch 1 is unittests to test patches 2 and 3.
>
> Patch 2 fixes a problem discovered while developing patch 3.  If
> a node name in an overlay has a unit-address then the overlay
> code does not correctly match the node name against an existing
> node in the live tree.
>
> Patch 3 adds the properties in an overlay's __symbol__ node to
> the overlay changeset.
>
> changes since v3:
>   - fix make W=2 warnings in overlay_base.dts and overlay.dts
>   - update the test results in the patch comments to match the
>     .dts changes
>
> changes since v2:
>   - test on 4.13-rc1
>   - remove redundant comments from patch headers of patch 0 and patch 1
>   - guard make of overlay .dtb files with CONFIG_OF_OVERLAY
>   - guard unittest.c references to overlay .dtb files with
>     CONFIG_OF_OVERLAY
>
> changes since v1:
>   - patch 2: Use for_each_child_of_node() instead of open coding,
>     which allowed removing the new function child_by_full_name().
>
>
>
> Frank Rowand (3):
>   of: overlay: add overlay unittest data for node names and symbols
>   of: overlay: correctly apply overlay node with unit-address
>   of: overlay: add overlay symbols to live device tree

Series applied.

Rob
