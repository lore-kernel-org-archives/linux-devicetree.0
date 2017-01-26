From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 07/11] clk: sunxi-ng: Add A80 Display Engine CCU
Date: Thu, 26 Jan 2017 11:39:28 +0100
Message-ID: <20170126103928.3kmvymoafsz5jfjm@lukather>
References: <20170124023230.3990-1-wens@csie.org>
 <20170124023230.3990-8-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sy5xlgwixv43i2gc"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170124023230.3990-8-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--sy5xlgwixv43i2gc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 24, 2017 at 10:32:26AM +0800, Chen-Yu Tsai wrote:
> Add support for the display engine clock controls found on the A80.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/clock/sun9i-de.txt         |  28 ++
>  drivers/clk/sunxi-ng/Makefile                      |   1 +
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c            | 283 +++++++++++++++=
++++++
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-de.h            |  33 +++
>  include/dt-bindings/clock/sun9i-a80-de.h           |  80 ++++++
>  include/dt-bindings/reset/sun9i-a80-de.h           |  58 +++++
>  6 files changed, 483 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sun9i-de.txt
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.h
>  create mode 100644 include/dt-bindings/clock/sun9i-a80-de.h
>  create mode 100644 include/dt-bindings/reset/sun9i-a80-de.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sun9i-de.txt b/Docum=
entation/devicetree/bindings/clock/sun9i-de.txt
> new file mode 100644
> index 000000000000..3a5e6df70677
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sun9i-de.txt
> @@ -0,0 +1,28 @@
> +Allwinner A80 Display Engine Clock Control Binding
> +------------------------------------
> +
> +Required properties :
> +- compatible: must contain one of the following compatibles:
> +		- "allwinner,sun9i-a80-de-clocks"
> +
> +- reg: Must contain the registers base address and length
> +- clocks: phandle to the clocks feeding the display engine subsystem.
> +	  Three are needed:
> +  - "mod": the display engine module clock
> +  - "dram": the DRAM bus clock for the system
> +  - "bus": the bus clock for the whole display engine subsystem
> +- clock-names: Must contain the clock names described just above
> +- resets: phandle to the reset control for the display engine subsystem.
> +- #clock-cells : must contain 1
> +- #reset-cells : must contain 1
> +
> +Example:
> +de_clocks: clock@03000000 {
> +	compatible =3D "allwinner,sun9i-a80-de-clks";
> +	reg =3D <0x03000000 0x30>;
> +	clocks =3D <&ccu CLK_DE>, <&ccu CLK_SDRAM>, <&ccu CLK_BUS_DE>;
> +	clock-names =3D "mod", "dram", "bus";
> +	resets =3D <&ccu RST_BUS_DE>;
> +	#clock-cells =3D <1>;
> +	#reset-cells =3D <1>;
> +};
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 8f37ef7fb67d..6feaac0c5600 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -26,4 +26,5 @@ obj-$(CONFIG_SUN8I_A33_CCU)	+=3D ccu-sun8i-a33.o
>  obj-$(CONFIG_SUN8I_H3_CCU)	+=3D ccu-sun8i-h3.o
>  obj-$(CONFIG_SUN8I_V3S_CCU)	+=3D ccu-sun8i-v3s.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80.o
> +obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80-de.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80-usb.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c b/drivers/clk/sunxi-=
ng/ccu-sun9i-a80-de.c
> new file mode 100644
> index 000000000000..3fc27db0a49a
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
> @@ -0,0 +1,283 @@
> +/*
> + * Copyright (c) 2016 Chen-Yu Tsai. All rights reserved.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_div.h"
> +#include "ccu_gate.h"
> +#include "ccu_reset.h"
> +
> +#include "ccu-sun9i-a80-de.h"
> +
> +static SUNXI_CCU_GATE(fe0_clk,		"fe0",		"fe0-div",
> +		      0x00, BIT(0), 0);
> +static SUNXI_CCU_GATE(fe1_clk,		"fe1",		"fe1-div",
> +		      0x00, BIT(1), 0);
> +static SUNXI_CCU_GATE(fe2_clk,		"fe2",		"fe2-div",
> +		      0x00, BIT(2), 0);
> +static SUNXI_CCU_GATE(iep_deu0_clk,	"iep-deu0",	"de",
> +		      0x00, BIT(4), 0);
> +static SUNXI_CCU_GATE(iep_deu1_clk,	"iep-deu1",	"de",
> +		      0x00, BIT(5), 0);
> +static SUNXI_CCU_GATE(be0_clk,		"be0",		"be0-div",
> +		      0x00, BIT(8), 0);
> +static SUNXI_CCU_GATE(be1_clk,		"be1",		"be1-div",
> +		      0x00, BIT(9), 0);
> +static SUNXI_CCU_GATE(be2_clk,		"be2",		"be2-div",
> +		      0x00, BIT(10), 0);
> +static SUNXI_CCU_GATE(iep_drc0_clk,	"iep-drc0",	"de",
> +		      0x00, BIT(12), 0);
> +static SUNXI_CCU_GATE(iep_drc1_clk,	"iep-drc1",	"de",
> +		      0x00, BIT(13), 0);
> +static SUNXI_CCU_GATE(merge_clk,	"merge",	"de",
> +		      0x00, BIT(20), 0);
> +
> +static SUNXI_CCU_GATE(dram_fe0_clk,	"dram-fe0",	"sdram",
> +		      0x04, BIT(0), 0);
> +static SUNXI_CCU_GATE(dram_fe1_clk,	"dram-fe1",	"sdram",
> +		      0x04, BIT(1), 0);
> +static SUNXI_CCU_GATE(dram_fe2_clk,	"dram-fe2",	"sdram",
> +		      0x04, BIT(2), 0);
> +static SUNXI_CCU_GATE(dram_deu0_clk,	"dram-deu0",	"sdram",
> +		      0x04, BIT(4), 0);
> +static SUNXI_CCU_GATE(dram_deu1_clk,	"dram-deu1",	"sdram",
> +		      0x04, BIT(5), 0);
> +static SUNXI_CCU_GATE(dram_be0_clk,	"dram-be0",	"sdram",
> +		      0x04, BIT(8), 0);
> +static SUNXI_CCU_GATE(dram_be1_clk,	"dram-be1",	"sdram",
> +		      0x04, BIT(9), 0);
> +static SUNXI_CCU_GATE(dram_be2_clk,	"dram-be2",	"sdram",
> +		      0x04, BIT(10), 0);
> +static SUNXI_CCU_GATE(dram_drc0_clk,	"dram-drc0",	"sdram",
> +		      0x04, BIT(12), 0);
> +static SUNXI_CCU_GATE(dram_drc1_clk,	"dram-drc1",	"sdram",
> +		      0x04, BIT(13), 0);
> +
> +static SUNXI_CCU_GATE(bus_fe0_clk,	"bus-fe0",	"bus-de",
> +		      0x08, BIT(0), 0);
> +static SUNXI_CCU_GATE(bus_fe1_clk,	"bus-fe1",	"bus-de",
> +		      0x08, BIT(1), 0);
> +static SUNXI_CCU_GATE(bus_fe2_clk,	"bus-fe2",	"bus-de",
> +		      0x08, BIT(2), 0);
> +static SUNXI_CCU_GATE(bus_deu0_clk,	"bus-deu0",	"bus-de",
> +		      0x08, BIT(4), 0);
> +static SUNXI_CCU_GATE(bus_deu1_clk,	"bus-deu1",	"bus-de",
> +		      0x08, BIT(5), 0);
> +static SUNXI_CCU_GATE(bus_be0_clk,	"bus-be0",	"bus-de",
> +		      0x08, BIT(8), 0);
> +static SUNXI_CCU_GATE(bus_be1_clk,	"bus-be1",	"bus-de",
> +		      0x08, BIT(9), 0);
> +static SUNXI_CCU_GATE(bus_be2_clk,	"bus-be2",	"bus-de",
> +		      0x08, BIT(10), 0);
> +static SUNXI_CCU_GATE(bus_drc0_clk,	"bus-drc0",	"bus-de",
> +		      0x08, BIT(12), 0);
> +static SUNXI_CCU_GATE(bus_drc1_clk,	"bus-drc1",	"bus-de",
> +		      0x08, BIT(13), 0);
> +
> +static SUNXI_CCU_M(fe0_div_clk, "fe0-div", "de", 0x20, 0, 4, 0);
> +static SUNXI_CCU_M(fe1_div_clk, "fe1-div", "de", 0x20, 4, 4, 0);
> +static SUNXI_CCU_M(fe2_div_clk, "fe2-div", "de", 0x20, 8, 4, 0);
> +static SUNXI_CCU_M(be0_div_clk, "be0-div", "de", 0x20, 16, 4, 0);
> +static SUNXI_CCU_M(be1_div_clk, "be1-div", "de", 0x20, 20, 4, 0);
> +static SUNXI_CCU_M(be2_div_clk, "be2-div", "de", 0x20, 24, 4, 0);

I couldn't find any documentation for this CCU.

What are those clocks for, and how the display engine should be using
(ie, which one is it expecting to drive / ungate / etc.)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--sy5xlgwixv43i2gc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYidHfAAoJEBx+YmzsjxAgiqQQAL6f/8m+Xr+FAdG1596VKYnD
UoejW2eY3dQwXXzyALixfkaElAsef8Hcbm+l/suomJTH7FNGEzVNGUoqsXP1x7ii
bF08EHCFy9S2M5XKLa9AxD+u+gWKhFzkzzw8d8k2jgY3qS4PGJE/lrRIxNlMJdQH
N2p+bsNNlMXSkqNcBD0niXoOJF+q/g9v787PSl5crph3AbFd1K3Lr6Wp4UlS4FB9
f7s7nL4wRxbA8gTzSzNLyP4FQBZ+LKbLsAUPa7/csYTzeUi7rvhIiPvPOkxdphYu
XDWlTrSU/xq6aVl0e1AUmDRrGrVu2d1TNaiGDVG1WUs1UECQgi57GyDbPw3LvtBR
ruGcF6J0V4oa2xHtWJs2TT/FTzNyn3fJB78Qq6urCxatRHDgWTIqLYvg09LZUxKj
WknpXvwxYfQFASOx3YBg8yBZ6B3l5Q5Q9EAyAoyufYtvaJ0J+/7SiDUvecGLf3Hv
+sih9LgJyrUnOHlg1kjlJDvcDyPHuTIX77Az31VMrOodjmn6M+NzbBSm4Es9vHlO
x6EoVL46S7iYTVjms3ZAHz4O/mJnpBg+peevwNddc4vHSXcSrTIs+xRnp76HSqm6
hu2awNywb3pJt3q7E+WtwMeRSrXk6znXkqipNTxDvqKRz/y/+emB9w9q3K7VhBXL
EwVqpnw1hOYzZUPaeMwc
=qJXQ
-----END PGP SIGNATURE-----

--sy5xlgwixv43i2gc--
