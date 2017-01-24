From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH 07/11] clk: sunxi-ng: Add A80 Display Engine CCU
Date: Tue, 24 Jan 2017 14:50:32 +0800
Message-ID: <20170124100509.53LGRxbi@smtp2m.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBOHZTPCAKGQESUIYLII-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


2017=E5=B9=B41=E6=9C=8824=E6=97=A5 10:32=E4=BA=8E Chen-Yu Tsai <wens@csie.o=
rg>=E5=86=99=E9=81=93=EF=BC=9A
>
> Add support for the display engine clock controls found on the A80.=20
>
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>=20
> ---=20
> .../devicetree/bindings/clock/sun9i-de.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 28 ++=20
> drivers/clk/sunxi-ng/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +=20
> drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 283 +++++++++++++++++++++=20
> drivers/clk/sunxi-ng/ccu-sun9i-a80-de.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 33 +++=20
> include/dt-bindings/clock/sun9i-a80-de.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 80 ++++++=20
> include/dt-bindings/reset/sun9i-a80-de.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 58 +++++=20
> 6 files changed, 483 insertions(+)=20
> create mode 100644 Documentation/devicetree/bindings/clock/sun9i-de.txt=
=20
> create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c=20
> create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.h=20
> create mode 100644 include/dt-bindings/clock/sun9i-a80-de.h=20
> create mode 100644 include/dt-bindings/reset/sun9i-a80-de.h=20
>
> diff --git a/Documentation/devicetree/bindings/clock/sun9i-de.txt b/Docum=
entation/devicetree/bindings/clock/sun9i-de.txt=20
> new file mode 100644=20
> index 000000000000..3a5e6df70677=20
> --- /dev/null=20
> +++ b/Documentation/devicetree/bindings/clock/sun9i-de.txt=20
> @@ -0,0 +1,28 @@=20
> +Allwinner A80 Display Engine Clock Control Binding=20
> +------------------------------------=20
> +=20
> +Required properties :=20
> +- compatible: must contain one of the following compatibles:=20
> + - "allwinner,sun9i-a80-de-clocks"=20
> +=20
> +- reg: Must contain the registers base address and length=20
> +- clocks: phandle to the clocks feeding the display engine subsystem.=20
> + =C2=A0 Three are needed:=20
> +=C2=A0 - "mod": the display engine module clock=20
> +=C2=A0 - "dram": the DRAM bus clock for the system=20
> +=C2=A0 - "bus": the bus clock for the whole display engine subsystem=20
> +- clock-names: Must contain the clock names described just above=20
> +- resets: phandle to the reset control for the display engine subsystem.=
=20
> +- #clock-cells : must contain 1=20
> +- #reset-cells : must contain 1=20
> +=20
> +Example:=20
> +de_clocks: clock@03000000 {=20
> + compatible =3D "allwinner,sun9i-a80-de-clks";=20

Different from the compatible above...

> + reg =3D <0x03000000 0x30>;=20
> + clocks =3D <&ccu CLK_DE>, <&ccu CLK_SDRAM>, <&ccu CLK_BUS_DE>;=20
> + clock-names =3D "mod", "dram", "bus";=20
> + resets =3D <&ccu RST_BUS_DE>;=20
> + #clock-cells =3D <1>;=20
> + #reset-cells =3D <1>;=20
> +};=20
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefil=
e=20
> index 8f37ef7fb67d..6feaac0c5600 100644=20
> --- a/drivers/clk/sunxi-ng/Makefile=20
> +++ b/drivers/clk/sunxi-ng/Makefile=20
> @@ -26,4 +26,5 @@ obj-$(CONFIG_SUN8I_A33_CCU) +=3D ccu-sun8i-a33.o=20
> obj-$(CONFIG_SUN8I_H3_CCU) +=3D ccu-sun8i-h3.o=20
> obj-$(CONFIG_SUN8I_V3S_CCU) +=3D ccu-sun8i-v3s.o=20
> obj-$(CONFIG_SUN9I_A80_CCU) +=3D ccu-sun9i-a80.o=20
> +obj-$(CONFIG_SUN9I_A80_CCU) +=3D ccu-sun9i-a80-de.o=20
> obj-$(CONFIG_SUN9I_A80_CCU) +=3D ccu-sun9i-a80-usb.o=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c b/drivers/clk/sunxi-=
ng/ccu-sun9i-a80-de.c=20
> new file mode 100644=20
> index 000000000000..3fc27db0a49a=20
> --- /dev/null=20
> +++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c=20
> @@ -0,0 +1,283 @@=20
> +/*=20
> + * Copyright (c) 2016 Chen-Yu Tsai. All rights reserved.=20
> + *=20
> + * This software is licensed under the terms of the GNU General Public=
=20
> + * License version 2, as published by the Free Software Foundation, and=
=20
> + * may be copied, distributed, and modified under those terms.=20
> + *=20
> + * This program is distributed in the hope that it will be useful,=20
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of=20
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=20
> + * GNU General Public License for more details.=20
> + */=20
> +=20
> +#include <linux/clk.h>=20
> +#include <linux/clk-provider.h>=20
> +#include <linux/of_address.h>=20
> +#include <linux/platform_device.h>=20
> +#include <linux/reset.h>=20
> +=20
> +#include "ccu_common.h"=20
> +#include "ccu_div.h"=20
> +#include "ccu_gate.h"=20
> +#include "ccu_reset.h"=20
> +=20
> +#include "ccu-sun9i-a80-de.h"=20
> +=20
> +static SUNXI_CCU_GATE(fe0_clk, "fe0", "fe0-div",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(0), 0);=20
> +static SUNXI_CCU_GATE(fe1_clk, "fe1", "fe1-div",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(1), 0);=20
> +static SUNXI_CCU_GATE(fe2_clk, "fe2", "fe2-div",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(2), 0);=20
> +static SUNXI_CCU_GATE(iep_deu0_clk, "iep-deu0", "de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(4), 0);=20
> +static SUNXI_CCU_GATE(iep_deu1_clk, "iep-deu1", "de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(5), 0);=20
> +static SUNXI_CCU_GATE(be0_clk, "be0", "be0-div",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(8), 0);=20
> +static SUNXI_CCU_GATE(be1_clk, "be1", "be1-div",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(9), 0);=20
> +static SUNXI_CCU_GATE(be2_clk, "be2", "be2-div",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(10), 0);=20
> +static SUNXI_CCU_GATE(iep_drc0_clk, "iep-drc0", "de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(12), 0);=20
> +static SUNXI_CCU_GATE(iep_drc1_clk, "iep-drc1", "de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(13), 0);=20
> +static SUNXI_CCU_GATE(merge_clk, "merge", "de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00, BIT(20), 0);=20
> +=20
> +static SUNXI_CCU_GATE(dram_fe0_clk, "dram-fe0", "sdram",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(0), 0);=20
> +static SUNXI_CCU_GATE(dram_fe1_clk, "dram-fe1", "sdram",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(1), 0);=20
> +static SUNXI_CCU_GATE(dram_fe2_clk, "dram-fe2", "sdram",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(2), 0);=20
> +static SUNXI_CCU_GATE(dram_deu0_clk, "dram-deu0", "sdram",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(4), 0);=20
> +static SUNXI_CCU_GATE(dram_deu1_clk, "dram-deu1", "sdram",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(5), 0);=20
> +static SUNXI_CCU_GATE(dram_be0_clk, "dram-be0", "sdram",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(8), 0);=20
> +static SUNXI_CCU_GATE(dram_be1_clk, "dram-be1", "sdram",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(9), 0);=20
> +static SUNXI_CCU_GATE(dram_be2_clk, "dram-be2", "sdram",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(10), 0);=20
> +static SUNXI_CCU_GATE(dram_drc0_clk, "dram-drc0", "sdram",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(12), 0);=20
> +static SUNXI_CCU_GATE(dram_drc1_clk, "dram-drc1", "sdram",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04, BIT(13), 0);=20
> +=20
> +static SUNXI_CCU_GATE(bus_fe0_clk, "bus-fe0", "bus-de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08, BIT(0), 0);=20
> +static SUNXI_CCU_GATE(bus_fe1_clk, "bus-fe1", "bus-de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08, BIT(1), 0);=20
> +static SUNXI_CCU_GATE(bus_fe2_clk, "bus-fe2", "bus-de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08, BIT(2), 0);=20
> +static SUNXI_CCU_GATE(bus_deu0_clk, "bus-deu0", "bus-de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08, BIT(4), 0);=20
> +static SUNXI_CCU_GATE(bus_deu1_clk, "bus-deu1", "bus-de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08, BIT(5), 0);=20
> +static SUNXI_CCU_GATE(bus_be0_clk, "bus-be0", "bus-de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08, BIT(8), 0);=20
> +static SUNXI_CCU_GATE(bus_be1_clk, "bus-be1", "bus-de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08, BIT(9), 0);=20
> +static SUNXI_CCU_GATE(bus_be2_clk, "bus-be2", "bus-de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08, BIT(10), 0);=20
> +static SUNXI_CCU_GATE(bus_drc0_clk, "bus-drc0", "bus-de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08, BIT(12), 0);=20
> +static SUNXI_CCU_GATE(bus_drc1_clk, "bus-drc1", "bus-de",=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x08, BIT(13), 0);=20
> +=20
> +static SUNXI_CCU_M(fe0_div_clk, "fe0-div", "de", 0x20, 0, 4, 0);=20
> +static SUNXI_CCU_M(fe1_div_clk, "fe1-div", "de", 0x20, 4, 4, 0);=20
> +static SUNXI_CCU_M(fe2_div_clk, "fe2-div", "de", 0x20, 8, 4, 0);=20
> +static SUNXI_CCU_M(be0_div_clk, "be0-div", "de", 0x20, 16, 4, 0);=20
> +static SUNXI_CCU_M(be1_div_clk, "be1-div", "de", 0x20, 20, 4, 0);=20
> +static SUNXI_CCU_M(be2_div_clk, "be2-div", "de", 0x20, 24, 4, 0);=20
> +=20
> +static struct ccu_common *sun9i_a80_de_clks[] =3D {=20
> + &fe0_clk.common,=20
> + &fe1_clk.common,=20
> + &fe2_clk.common,=20
> + &iep_deu0_clk.common,=20
> + &iep_deu1_clk.common,=20
> + &be0_clk.common,=20
> + &be1_clk.common,=20
> + &be2_clk.common,=20
> + &iep_drc0_clk.common,=20
> + &iep_drc1_clk.common,=20
> + &merge_clk.common,=20
> +=20
> + &dram_fe0_clk.common,=20
> + &dram_fe1_clk.common,=20
> + &dram_fe2_clk.common,=20
> + &dram_deu0_clk.common,=20
> + &dram_deu1_clk.common,=20
> + &dram_be0_clk.common,=20
> + &dram_be1_clk.common,=20
> + &dram_be2_clk.common,=20
> + &dram_drc0_clk.common,=20
> + &dram_drc1_clk.common,=20
> +=20
> + &bus_fe0_clk.common,=20
> + &bus_fe1_clk.common,=20
> + &bus_fe2_clk.common,=20
> + &bus_deu0_clk.common,=20
> + &bus_deu1_clk.common,=20
> + &bus_be0_clk.common,=20
> + &bus_be1_clk.common,=20
> + &bus_be2_clk.common,=20
> + &bus_drc0_clk.common,=20
> + &bus_drc1_clk.common,=20
> +=20
> + &fe0_div_clk.common,=20
> + &fe1_div_clk.common,=20
> + &fe2_div_clk.common,=20
> + &be0_div_clk.common,=20
> + &be1_div_clk.common,=20
> + &be2_div_clk.common,=20
> +};=20
> +=20
> +static struct clk_hw_onecell_data sun9i_a80_de_hw_clks =3D {=20
> + .hws =3D {=20
> + [CLK_FE0] =3D &fe0_clk.common.hw,=20
> + [CLK_FE1] =3D &fe1_clk.common.hw,=20
> + [CLK_FE2] =3D &fe2_clk.common.hw,=20
> + [CLK_IEP_DEU0] =3D &iep_deu0_clk.common.hw,=20
> + [CLK_IEP_DEU1] =3D &iep_deu1_clk.common.hw,=20
> + [CLK_BE0] =3D &be0_clk.common.hw,=20
> + [CLK_BE1] =3D &be1_clk.common.hw,=20
> + [CLK_BE2] =3D &be2_clk.common.hw,=20
> + [CLK_IEP_DRC0] =3D &iep_drc0_clk.common.hw,=20
> + [CLK_IEP_DRC1] =3D &iep_drc1_clk.common.hw,=20
> + [CLK_MERGE] =3D &merge_clk.common.hw,=20
> +=20
> + [CLK_DRAM_FE0] =3D &dram_fe0_clk.common.hw,=20
> + [CLK_DRAM_FE1] =3D &dram_fe1_clk.common.hw,=20
> + [CLK_DRAM_FE2] =3D &dram_fe2_clk.common.hw,=20
> + [CLK_DRAM_DEU0] =3D &dram_deu0_clk.common.hw,=20
> + [CLK_DRAM_DEU1] =3D &dram_deu1_clk.common.hw,=20
> + [CLK_DRAM_BE0] =3D &dram_be0_clk.common.hw,=20
> + [CLK_DRAM_BE1] =3D &dram_be1_clk.common.hw,=20
> + [CLK_DRAM_BE2] =3D &dram_be2_clk.common.hw,=20
> + [CLK_DRAM_DRC0] =3D &dram_drc0_clk.common.hw,=20
> + [CLK_DRAM_DRC1] =3D &dram_drc1_clk.common.hw,=20
> +=20
> + [CLK_BUS_FE0] =3D &bus_fe0_clk.common.hw,=20
> + [CLK_BUS_FE1] =3D &bus_fe1_clk.common.hw,=20
> + [CLK_BUS_FE2] =3D &bus_fe2_clk.common.hw,=20
> + [CLK_BUS_DEU0] =3D &bus_deu0_clk.common.hw,=20
> + [CLK_BUS_DEU1] =3D &bus_deu1_clk.common.hw,=20
> + [CLK_BUS_BE0] =3D &bus_be0_clk.common.hw,=20
> + [CLK_BUS_BE1] =3D &bus_be1_clk.common.hw,=20
> + [CLK_BUS_BE2] =3D &bus_be2_clk.common.hw,=20
> + [CLK_BUS_DRC0] =3D &bus_drc0_clk.common.hw,=20
> + [CLK_BUS_DRC1] =3D &bus_drc1_clk.common.hw,=20
> +=20
> + [CLK_FE0_DIV] =3D &fe0_div_clk.common.hw,=20
> + [CLK_FE1_DIV] =3D &fe1_div_clk.common.hw,=20
> + [CLK_FE2_DIV] =3D &fe2_div_clk.common.hw,=20
> + [CLK_BE0_DIV] =3D &be0_div_clk.common.hw,=20
> + [CLK_BE1_DIV] =3D &be1_div_clk.common.hw,=20
> + [CLK_BE2_DIV] =3D &be2_div_clk.common.hw,=20
> + },=20
> + .num =3D CLK_NUMBER,=20
> +};=20
> +=20
> +static struct ccu_reset_map sun9i_a80_de_resets[] =3D {=20
> + [RST_FE0] =3D { 0x0c, BIT(0) },=20
> + [RST_FE1] =3D { 0x0c, BIT(1) },=20
> + [RST_FE2] =3D { 0x0c, BIT(2) },=20
> + [RST_DEU0] =3D { 0x0c, BIT(4) },=20
> + [RST_DEU1] =3D { 0x0c, BIT(5) },=20
> + [RST_BE0] =3D { 0x0c, BIT(8) },=20
> + [RST_BE1] =3D { 0x0c, BIT(9) },=20
> + [RST_BE2] =3D { 0x0c, BIT(10) },=20
> + [RST_DRC0] =3D { 0x0c, BIT(12) },=20
> + [RST_DRC1] =3D { 0x0c, BIT(13) },=20
> + [RST_MERGE] =3D { 0x0c, BIT(20) },=20
> +};=20
> +=20
> +static const struct sunxi_ccu_desc sun9i_a80_de_clk_desc =3D {=20
> + .ccu_clks =3D sun9i_a80_de_clks,=20
> + .num_ccu_clks =3D ARRAY_SIZE(sun9i_a80_de_clks),=20
> +=20
> + .hw_clks =3D &sun9i_a80_de_hw_clks,=20
> +=20
> + .resets =3D sun9i_a80_de_resets,=20
> + .num_resets =3D ARRAY_SIZE(sun9i_a80_de_resets),=20
> +};=20
> +=20
> +static int sun9i_a80_de_clk_probe(struct platform_device *pdev)=20
> +{=20
> + struct resource *res;=20
> + struct clk *bus_clk;=20
> + struct reset_control *rstc;=20
> + void __iomem *reg;=20
> + int ret;=20
> +=20
> + res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=20
> + reg =3D devm_ioremap_resource(&pdev->dev, res);=20
> + if (IS_ERR(reg))=20
> + return PTR_ERR(reg);=20
> +=20
> + bus_clk =3D devm_clk_get(&pdev->dev, "bus");=20
> + if (IS_ERR(bus_clk)) {=20
> + ret =3D PTR_ERR(bus_clk);=20
> + if (ret !=3D -EPROBE_DEFER)=20
> + dev_err(&pdev->dev, "Couldn't get bus clk: %d\n", ret);=20
> + return ret;=20
> + }=20
> +=20
> + rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);=20
> + if (IS_ERR(rstc)) {=20
> + ret =3D PTR_ERR(bus_clk);=20
> + if (ret !=3D -EPROBE_DEFER)=20
> + dev_err(&pdev->dev,=20
> + "Couldn't get reset control: %d\n", ret);=20
> + return ret;=20
> + }=20
> +=20
> + /* The bus clock needs to be enabled for us to access the registers */=
=20
> + ret =3D clk_prepare_enable(bus_clk);=20
> + if (ret) {=20
> + dev_err(&pdev->dev, "Couldn't enable bus clk: %d\n", ret);=20
> + return ret;=20
> + }=20
> +=20
> + /* The reset control needs to be asserted for the controls to work */=
=20
> + ret =3D reset_control_deassert(rstc);=20
> + if (ret) {=20
> + dev_err(&pdev->dev,=20
> + "Couldn't deassert reset control: %d\n", ret);=20
> + goto err_disable_clk;=20
> + }=20
> +=20
> + ret =3D sunxi_ccu_probe(pdev->dev.of_node, reg,=20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &sun9i_a80_de_clk_desc);=20
> + if (ret)=20
> + goto err_assert_reset;=20
> +=20
> + return 0;=20
> +=20
> +err_assert_reset:=20
> + reset_control_assert(rstc);=20
> +err_disable_clk:=20
> + clk_disable_unprepare(bus_clk);=20
> + return ret;=20
> +}=20
> +=20
> +static const struct of_device_id sun9i_a80_de_clk_ids[] =3D {=20
> + { .compatible =3D "allwinner,sun9i-a80-de-clks" },=20
> + { }=20
> +};=20
> +=20
> +static struct platform_driver sun9i_a80_de_clk_driver =3D {=20
> + .probe =3D sun9i_a80_de_clk_probe,=20
> + .driver =3D {=20
> + .name =3D "sun9i-a80-de-clks",=20
> + .of_match_table =3D sun9i_a80_de_clk_ids,=20
> + },=20
> +};=20
> +builtin_platform_driver(sun9i_a80_de_clk_driver);=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.h b/drivers/clk/sunxi-=
ng/ccu-sun9i-a80-de.h=20
> new file mode 100644=20
> index 000000000000..a4769041e40f=20
> --- /dev/null=20
> +++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.h=20
> @@ -0,0 +1,33 @@=20
> +/*=20
> + * Copyright 2016 Chen-Yu Tsai=20
> + *=20
> + * Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>=20
> + *=20
> + * This program is free software; you can redistribute it and/or modify=
=20
> + * it under the terms of the GNU General Public License as published by=
=20
> + * the Free Software Foundation; either version 2 of the License, or=20
> + * (at your option) any later version.=20
> + *=20
> + * This program is distributed in the hope that it will be useful,=20
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of=20
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=20
> + * GNU General Public License for more details.=20
> + */=20
> +=20
> +#ifndef _CCU_SUN9I_A80_DE_H_=20
> +#define _CCU_SUN9I_A80_DE_H_=20
> +=20
> +#include <dt-bindings/clock/sun9i-a80-de.h>=20
> +#include <dt-bindings/reset/sun9i-a80-de.h>=20
> +=20
> +/* Intermediary clock dividers are not exported */=20
> +#define CLK_FE0_DIV 31=20
> +#define CLK_FE1_DIV 32=20
> +#define CLK_FE2_DIV 33=20
> +#define CLK_BE0_DIV 34=20
> +#define CLK_BE1_DIV 35=20
> +#define CLK_BE2_DIV 36=20
> +=20
> +#define CLK_NUMBER (CLK_BE2_DIV + 1)=20
> +=20
> +#endif /* _CCU_SUN9I_A80_DE_H_ */=20
> diff --git a/include/dt-bindings/clock/sun9i-a80-de.h b/include/dt-bindin=
gs/clock/sun9i-a80-de.h=20
> new file mode 100644=20
> index 000000000000..3dad6c3cd131=20
> --- /dev/null=20
> +++ b/include/dt-bindings/clock/sun9i-a80-de.h=20
> @@ -0,0 +1,80 @@=20
> +/*=20
> + * Copyright (C) 2016 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>=20
> + *=20
> + * This file is dual-licensed: you can use it either under the terms=20
> + * of the GPL or the X11 license, at your option. Note that this dual=20
> + * licensing only applies to this file, and not this project as a=20
> + * whole.=20
> + *=20
> + *=C2=A0 a) This file is free software; you can redistribute it and/or=
=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 modify it under the terms of the GNU General =
Public License as=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 published by the Free Software Foundation; ei=
ther version 2 of the=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 License, or (at your option) any later versio=
n.=20
> + *=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 This file is distributed in the hope that it =
will be useful,=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 but WITHOUT ANY WARRANTY; without even the im=
plied warranty of=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR P=
URPOSE.=C2=A0 See the=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 GNU General Public License for more details.=
=20
> + *=20
> + * Or, alternatively,=20
> + *=20
> + *=C2=A0 b) Permission is hereby granted, free of charge, to any person=
=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 obtaining a copy of this software and associa=
ted documentation=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 files (the "Software"), to deal in the Softwa=
re without=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 restriction, including without limitation the=
 rights to use,=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 copy, modify, merge, publish, distribute, sub=
license, and/or=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 sell copies of the Software, and to permit pe=
rsons to whom the=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 Software is furnished to do so, subject to th=
e following=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 conditions:=20
> + *=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 The above copyright notice and this permissio=
n notice shall be=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 included in all copies or substantial portion=
s of the Software.=20
> + *=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WAR=
RANTY OF ANY KIND,=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED=
 TO THE WARRANTIES=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR =
PURPOSE AND=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHOR=
S OR COPYRIGHT=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER LIABILITY,=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTH=
ERWISE, ARISING=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWA=
RE OR THE USE OR=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 OTHER DEALINGS IN THE SOFTWARE.=20
> + */=20
> +=20
> +#ifndef _DT_BINDINGS_CLOCK_SUN9I_A80_DE_H_=20
> +#define _DT_BINDINGS_CLOCK_SUN9I_A80_DE_H_=20
> +=20
> +#define CLK_FE0 0=20
> +#define CLK_FE1 1=20
> +#define CLK_FE2 2=20
> +#define CLK_IEP_DEU0 3=20
> +#define CLK_IEP_DEU1 4=20
> +#define CLK_BE0 5=20
> +#define CLK_BE1 6=20
> +#define CLK_BE2 7=20
> +#define CLK_IEP_DRC0 8=20
> +#define CLK_IEP_DRC1 9=20
> +#define CLK_MERGE 10=20
> +=20
> +#define CLK_DRAM_FE0 11=20
> +#define CLK_DRAM_FE1 12=20
> +#define CLK_DRAM_FE2 13=20
> +#define CLK_DRAM_DEU0 14=20
> +#define CLK_DRAM_DEU1 15=20
> +#define CLK_DRAM_BE0 16=20
> +#define CLK_DRAM_BE1 17=20
> +#define CLK_DRAM_BE2 18=20
> +#define CLK_DRAM_DRC0 19=20
> +#define CLK_DRAM_DRC1 20=20
> +=20
> +#define CLK_BUS_FE0 21=20
> +#define CLK_BUS_FE1 22=20
> +#define CLK_BUS_FE2 23=20
> +#define CLK_BUS_DEU0 24=20
> +#define CLK_BUS_DEU1 25=20
> +#define CLK_BUS_BE0 26=20
> +#define CLK_BUS_BE1 27=20
> +#define CLK_BUS_BE2 28=20
> +#define CLK_BUS_DRC0 29=20
> +#define CLK_BUS_DRC1 30=20
> +=20
> +#endif /* _DT_BINDINGS_CLOCK_SUN9I_A80_DE_H_ */=20
> diff --git a/include/dt-bindings/reset/sun9i-a80-de.h b/include/dt-bindin=
gs/reset/sun9i-a80-de.h=20
> new file mode 100644=20
> index 000000000000..205072770171=20
> --- /dev/null=20
> +++ b/include/dt-bindings/reset/sun9i-a80-de.h=20
> @@ -0,0 +1,58 @@=20
> +/*=20
> + * Copyright (C) 2016 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>=20
> + *=20
> + * This file is dual-licensed: you can use it either under the terms=20
> + * of the GPL or the X11 license, at your option. Note that this dual=20
> + * licensing only applies to this file, and not this project as a=20
> + * whole.=20
> + *=20
> + *=C2=A0 a) This file is free software; you can redistribute it and/or=
=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 modify it under the terms of the GNU General =
Public License as=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 published by the Free Software Foundation; ei=
ther version 2 of the=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 License, or (at your option) any later versio=
n.=20
> + *=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 This file is distributed in the hope that it =
will be useful,=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 but WITHOUT ANY WARRANTY; without even the im=
plied warranty of=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR P=
URPOSE.=C2=A0 See the=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 GNU General Public License for more details.=
=20
> + *=20
> + * Or, alternatively,=20
> + *=20
> + *=C2=A0 b) Permission is hereby granted, free of charge, to any person=
=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 obtaining a copy of this software and associa=
ted documentation=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 files (the "Software"), to deal in the Softwa=
re without=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 restriction, including without limitation the=
 rights to use,=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 copy, modify, merge, publish, distribute, sub=
license, and/or=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 sell copies of the Software, and to permit pe=
rsons to whom the=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 Software is furnished to do so, subject to th=
e following=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 conditions:=20
> + *=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 The above copyright notice and this permissio=
n notice shall be=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 included in all copies or substantial portion=
s of the Software.=20
> + *=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WAR=
RANTY OF ANY KIND,=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED=
 TO THE WARRANTIES=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR =
PURPOSE AND=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHOR=
S OR COPYRIGHT=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER LIABILITY,=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTH=
ERWISE, ARISING=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWA=
RE OR THE USE OR=20
> + *=C2=A0=C2=A0=C2=A0=C2=A0 OTHER DEALINGS IN THE SOFTWARE.=20
> + */=20
> +=20
> +#ifndef _DT_BINDINGS_RESET_SUN9I_A80_DE_H_=20
> +#define _DT_BINDINGS_RESET_SUN9I_A80_DE_H_=20
> +=20
> +#define RST_FE0 0=20
> +#define RST_FE1 1=20
> +#define RST_FE2 2=20
> +#define RST_DEU0 3=20
> +#define RST_DEU1 4=20
> +#define RST_BE0 5=20
> +#define RST_BE1 6=20
> +#define RST_BE2 7=20
> +#define RST_DRC0 8=20
> +#define RST_DRC1 9=20
> +#define RST_MERGE 10=20
> +=20
> +#endif /* _DT_BINDINGS_RESET_SUN9I_A80_DE_H_ */=20
> --=20
> 2.11.0=20
>
>
> _______________________________________________=20
> linux-arm-kernel mailing list=20
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org=20
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
