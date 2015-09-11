From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 08/11] ARM: DT: STiH407: Add SD pinctrl config for mmc0
 controller
Date: Fri, 11 Sep 2015 19:00:13 +0100
Message-ID: <20150911180013.GJ18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-9-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-9-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org, Nebil BEN MEFTEH <nebil.ben-mefteh@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> This patch adds the missing SD pinctrl config
> for mmc/sd controller 0. This is required to enable the
> B2144A daughter board that exposes this controller as a sd
> slot.
>=20
> Signed-off-by: Nebil BEN MEFTEH <nebil.ben-mefteh@st.com>
> Signed-off-by: Nebil BEN MEFTEH <nebil.ben-mefteh@st.com>

Duplicate.=20

> Acked-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Acked-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Same as before -- and for all the other patches.

Contrary to what I said before, the Ack is probably more correct here,
as I would _guess_ that Nebil wrote the patch, so his SoB should stay,
the Patrice added it to the internal tree.  Convert this to an Ack
now, as he's not in the upstream delivery path.

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index 798d901..3cd7e2a 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -883,6 +883,21 @@
>  						emmc_d7 =3D <&pio41 7 ALT1 BIDIR_PU>;
>  					};
>  				};
> +				pinctrl_sd0: sd0-0 {
> +					st,pins {
> +						sd_clk =3D <&pio40 6 ALT1 BIDIR>;
> +						sd_cmd =3D <&pio40 7 ALT1 BIDIR_PU>;
> +						sd_dat0 =3D <&pio41 0 ALT1 BIDIR_PU>;
> +						sd_dat1 =3D <&pio41 1 ALT1 BIDIR_PU>;
> +						sd_dat2 =3D <&pio41 2 ALT1 BIDIR_PU>;
> +						sd_dat3 =3D <&pio41 3 ALT1 BIDIR_PU>;
> +						sd_led =3D <&pio42 0 ALT2 OUT>;
> +						sd_pwren =3D <&pio42 2 ALT2 OUT>;
> +						sd_vsel =3D <&pio42 3 ALT2 OUT>;
> +						sd_cd =3D <&pio42 4 ALT2 IN>;
> +						sd_wp =3D <&pio42 5 ALT2 IN>;
> +					};
> +				};
>  			};
> =20
>  			fsm {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
