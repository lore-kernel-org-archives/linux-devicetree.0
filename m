From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 3/4] ARM: dts: Add STiH407 SoC support
Date: Tue, 20 May 2014 13:17:17 +0100
Message-ID: <20140520121717.GL24991@lee--X1>
References: <1400579192-17620-1-git-send-email-maxime.coquelin@st.com>
 <1400579192-17620-4-git-send-email-maxime.coquelin@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400579192-17620-4-git-send-email-maxime.coquelin@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime COQUELIN <maxime.coquelin@st.com>
Cc: Olof Johansson <olof@lixom.net>, Rob Landley <rob@landley.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

> The STiH407 is advanced multi-HD AVC processor with 3D graphics accel=
eration
> and 1.5-GHz ARM Cortex-A9 SMP CPU.
>=20
> Acked-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
> ---
>  arch/arm/boot/dts/stih407-clock.dtsi   |  40 +++
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 615 +++++++++++++++++++++++=
++++++++++
>  arch/arm/boot/dts/stih407.dtsi         | 263 ++++++++++++++
>  3 files changed, 918 insertions(+)
>  create mode 100644 arch/arm/boot/dts/stih407-clock.dtsi
>  create mode 100644 arch/arm/boot/dts/stih407-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/stih407.dtsi
>=20
> diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts=
/stih407-clock.dtsi
> new file mode 100644
> index 0000000..ae8068c
> --- /dev/null
> +++ b/arch/arm/boot/dts/stih407-clock.dtsi
> @@ -0,0 +1,40 @@
> +/*
> + * Copyright (C) 2014 STMicroelectronics R&D Limited
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +/ {
> +	clocks {
> +		/*
> +		 * Fixed 30MHz oscillator inputs to SoC
> +		 */
> +		CLK_SYSIN: CLK_SYSIN {

I thought we weren't using upper case clk names anymore?

> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <30000000>;
> +			clock-output-names =3D "CLK_SYSIN";
> +		};
> +
> +		/*
> +		 * ARM Peripheral clock for timers
> +		 */
> +		arm_periph_clk: arm_periph_clk {
> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-clock";
> +			clock-frequency =3D <600000000>;
> +		};
> +
> +		/*
> +		 * Bootloader initialized system infrastructure clock for
> +		 * serial devices.
> +		 */
> +		CLK_EXT2F_A9: clockgenC0@13 {

Or camel?=20

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
