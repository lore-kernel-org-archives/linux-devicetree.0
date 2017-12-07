From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v3 08/15] drm/sun4i: Add LVDS support
Date: Thu, 7 Dec 2017 11:14:27 +0100
Message-ID: <CAOFm3uEpnBFUDBHK+SqQ-pGUPcWbGXNrWum4HRJ34tMtoX-2Qw@mail.gmail.com>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
 <b900e5963180c94ca02bde178b6674622a127787.1512486553.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b900e5963180c94ca02bde178b6674622a127787.1512486553.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, plaes@plaes.org, Icenowy Zheng <icenowy@aosc.io>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 5, 2017 at 4:10 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The TCON supports the LVDS interface to output to a panel or a bridge.
> Let's add support for it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
[]
> --- /dev/null
> +++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
> @@ -0,0 +1,183 @@
> +/*
> + * Copyright (C) 2015 NextThing Co
> + * Copyright (C) 2015-2017 Free Electrons
> + *
> + * Maxime Ripard <maxime.ripard@free-electrons.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + */

Maxime,

Would you consider using the new SPDX ids instead of this fine legalese?
e.g. this as the top line:

// SPDX-License-Identifier: GPL-2.0+

-- 
Cordially
Philippe Ombredanne
