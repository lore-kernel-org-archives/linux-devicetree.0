From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH v2 1/5] ARM: sun9i: Support SMP on A80 with Multi-Cluster
 Power Management (MCPM)
Date: Fri, 29 Dec 2017 14:47:19 +0100
Message-ID: <CAOFm3uHmvHfGyd++8y6XnOQWMOA_jm5ur5WvPNdUF8SCzLr8dA@mail.gmail.com>
References: <20171229105506.24851-1-mylene.josserand@free-electrons.com> <20171229105506.24851-2-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171229105506.24851-2-mylene.josserand@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, clabbe.montjoie@gmail.com, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, quentin.schulz@free-electrons.com
List-Id: devicetree@vger.kernel.org

Myl=C3=A8ne, Chen-Yu,

On Fri, Dec 29, 2017 at 11:55 AM, Myl=C3=A8ne Josserand
<mylene.josserand@free-electrons.com> wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>
> The A80 is a big.LITTLE SoC with 1 cluster of 4 Cortex-A7s and
> 1 cluster of 4 Cortex-A15s.

<snip>

> --- /dev/null
> +++ b/arch/arm/mach-sunxi/mcpm.c
> @@ -0,0 +1,391 @@
> +/*
> + * Copyright (c) 2015 Chen-Yu Tsai
> + *
> + * Chen-Yu Tsai <wens@csie.org>
> + *
> + * arch/arm/mach-sunxi/mcpm.c
> + *
> + * Based on arch/arm/mach-exynos/mcpm-exynos.c and Allwinner code
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */

Would you mind using a concise SPDX tag instead, as documented by
Thomas doc patches?

Thank you for your kind consideration!
--=20
Cordially
Philippe Ombredanne
