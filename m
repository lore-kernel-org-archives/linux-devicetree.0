From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v2 08/15] clk: sunxi-ng: Add divider
Date: Thu, 9 Jun 2016 09:40:28 +0200
Message-ID: <20160609094028.490c9d38599cda31fdd069be@free.fr>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
	<20160607204154.31967-9-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160607204154.31967-9-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue,  7 Jun 2016 22:41:47 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Add support for the various dividers (linear, table or pow-of-two bas=
ed)
> found in the CCU.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/clk/sunxi-ng/Makefile  |   1 +
>  drivers/clk/sunxi-ng/ccu_div.c | 136 +++++++++++++++++++++++++++++++=
++++++++++
>  drivers/clk/sunxi-ng/ccu_div.h | 135 +++++++++++++++++++++++++++++++=
+++++++++
>  3 files changed, 272 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu_div.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu_div.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Mak=
efile
> index c47cbd309d59..67a2559fe283 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -3,6 +3,7 @@ obj-y +=3D ccu_reset.o
> =20
>  obj-y +=3D ccu_frac.o
> =20
> +obj-y +=3D ccu_div.o
>  obj-y +=3D ccu_fixed_factor.o
>  obj-y +=3D ccu_gate.o
>  obj-y +=3D ccu_mux.o
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/cc=
u_div.c
> new file mode 100644
> index 000000000000..8659b4cb6c20
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
	[snip]
> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/cc=
u_div.h
> new file mode 100644
> index 000000000000..5edbdc1a98c8
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_div.h
> @@ -0,0 +1,135 @@
> +/*
> + * Copyright (c) 2016 Maxime Ripard. All rights reserved.
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef _CCU_DIV_H_
> +#define _CCU_DIV_H_
> +
> +#include <linux/clk-provider.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_mux.h"
> +
> +struct _ccu_div {
> +	u8			shift;
> +	u8			width;
> +
> +	u32			flags;
> +
> +	struct clk_div_table	*table;
> +};
> +
> +#define _SUNXI_CCU_DIV_TABLE_FLAGS(_shift, _width, _table, _flags)	\
> +	{								\
> +		.shift	=3D _shift,					\
> +		.width	=3D _width,					\
> +		.flags	=3D _flags,					\
> +		.table	=3D _table,					\
> +	}
> +
> +#define _SUNXI_CCU_DIV_FLAGS(_shift, _width, _flags)			\
> +	_SUNXI_CCU_DIV_TABLE_FLAGS(_shift, _width, NULL, _flags)
> +
> +#define _SUNXI_CCU_DIV_TABLE(_shift, _width, _table)			\
> +	_SUNXI_CCU_DIV_TABLE_FLAGS(_shift, _width, _table, 0)
> +
> +#define _SUNXI_CCU_DIV(_shift, _width)					\
> +	_SUNXI_CCU_DIV_TABLE_FLAGS(_shift, _width, NULL, 0)
> +
> +struct ccu_div {
> +	u32			enable;
> +
> +	struct _ccu_div		div;
> +	struct ccu_mux_internal	mux;
> +	struct ccu_common	common;
> +};
> +
> +#define SUNXI_CCU_DIV_TABLE_WITH_GATE(_struct, _name, _parent, _reg,=
	\
> +				      _shift, _width,			\
> +				      _table, _gate, _flags)		\
> +	struct ccu_div _struct =3D {					\

The gate is missing
		.enable =3D _gate,

(I was really afraid when I saw 217=B0C as the board temperature!)

> +		.div		=3D _SUNXI_CCU_DIV_TABLE(_shift, _width,	\
> +						       _table),		\
> +		.common	=3D {						\
> +			.reg		=3D _reg,				\
> +			.features	=3D CCU_FEATURE_GATE,		\
> +			.hw.init	=3D SUNXI_HW_INIT(_name,		\
> +							_parent,	\
> +							&ccu_div_ops,	\
> +							_flags),	\
> +		}							\
> +	}
> +
> +
> +#define SUNXI_CCU_DIV_TABLE(_struct, _name, _parent, _reg,		\
> +			    _shift, _width,				\
> +			    _table, _flags)				\
	[snip]

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
