From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 6/6] ARM: rockchip: add smp bringup code
Date: Fri, 5 Jul 2013 11:55:19 -0300
Message-ID: <CAOMZO5Af=iSZMLEQOrxGfMCSTbfs2K=7QoCvEpkHNMna1V0FfQ@mail.gmail.com>
References: <201307051440.19428.heiko@sntech.de>
	<201307051443.27172.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201307051443.27172.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@arm.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Ulrich Prinz <ulrich.prinz@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 5, 2013 at 9:43 AM, Heiko St=C3=BCbner <heiko@sntech.de> wr=
ote:

> --- /dev/null
> +++ b/arch/arm/mach-rockchip/headsmp.S
> @@ -0,0 +1,32 @@
> +/*
> + * Copyright (c) 2013 MundoReader S.L.
> + * Author: Heiko Stuebner <heiko@sntech.de>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <linux/linkage.h>
> +#include <linux/init.h>
> +
> +       __CPUINIT

This should go away after this commit:
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next-history.gi=
t/commit/arch/arm/common/mcpm_platsmp.c?id=3Dc508abae89c3fa861c806ec003=
66d3b2f8d394cb
