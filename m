From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/6] ARM: DT: STi: STiH407: Update picophyreset for the
 usb3 controllers usb2 phy
Date: Wed, 25 Feb 2015 15:13:11 +0000
Message-ID: <20150225151310.GF5132@x1>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
 <1424871377-1795-4-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424871377-1795-4-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, kishon@ti.com, balbi@ti.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 25 Feb 2015, Peter Griffin wrote:

> Ths picophyreset is incorrectly defined, which stops the usb2 phy bei=
ng
> taken out of reset.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dt=
s/stih407-family.dtsi
> index c06a546..186412d 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -280,7 +280,7 @@
>  			#phy-cells =3D <0>;
>  			st,syscfg =3D <&syscfg_core 0x100 0xf4>;
>  			resets =3D <&softreset STIH407_PICOPHY_SOFTRESET>,
> -				 <&picophyreset STIH407_PICOPHY0_RESET>;
> +				 <&picophyreset STIH407_PICOPHY2_RESET>;
>  			reset-names =3D "global", "port";
>  		};
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
