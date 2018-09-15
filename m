From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v3 09/11] dt-bindings: add constants for
 Microsemi Ocelot SerDes driver
Date: Fri, 14 Sep 2018 19:31:31 -0700
Message-ID: <ec72decd-6ce9-6a4c-b5c3-7af4d7146551@gmail.com>
References: <cover.ff40d591b548a6da31716e6e600f11a303e0e643.1536912834.git-series.quentin.schulz@bootlin.com>
 <73113ea4b3d8d34c05d88413b3d15cc1733cf25e.1536912834.git-series.quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <73113ea4b3d8d34c05d88413b3d15cc1733cf25e.1536912834.git-series.quentin.schulz@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>, alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org



On 09/14/18 01:16, Quentin Schulz wrote:
> The Microsemi Ocelot has multiple SerDes and requires that the SerDes be
> muxed accordingly to the hardware representation.
> 
> Let's add a constant for each SerDes available in the Microsemi Ocelot.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>  include/dt-bindings/phy/phy-ocelot-serdes.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 include/dt-bindings/phy/phy-ocelot-serdes.h
> 
> diff --git a/include/dt-bindings/phy/phy-ocelot-serdes.h b/include/dt-bindings/phy/phy-ocelot-serdes.h
> new file mode 100644
> index 0000000..cf111ba
> --- /dev/null
> +++ b/include/dt-bindings/phy/phy-ocelot-serdes.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/* Copyright (c) 2018 Microsemi Corporation */
> +#ifndef __PHY_OCELOT_SERDES_H__
> +#define __PHY_OCELOT_SERDES_H__
> +
> +#define SERDES1G_0	0
> +#define SERDES1G_1	1
> +#define SERDES1G_2	2
> +#define SERDES1G_3	3
> +#define SERDES1G_4	4
> +#define SERDES1G_5	5
> +#define SERDES1G_MAX	6

Given you use the C preprocessor you could have done something like:

#define SERDES1G(x)	(x)
#define SERDES1G_MAX	5
#define SERDES6G(x)	((x) + SERDES1G_MAX)

etc. but this works for me as well.

> +#define SERDES6G_0	SERDES1G_MAX
> +#define SERDES6G_1	(SERDES1G_MAX + 1)
> +#define SERDES6G_2	(SERDES1G_MAX + 2)
> +#define SERDES6G_MAX	(SERDES1G_MAX + 3)
> +#define SERDES_MAX	(SERDES1G_MAX + SERDES6G_MAX)
> +
> +#endif
> 

-- 
Florian
