From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/4] ARM: STi: DT: STiH407: Add DT node for eeprom
Date: Tue, 29 Mar 2016 10:12:58 +0100
Message-ID: <20160329091258.GC8659@x1>
References: <1458920188-29612-1-git-send-email-peter.griffin@linaro.org>
 <1458920188-29612-5-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458920188-29612-5-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

More information is required in the commit message.

What do we use the EEPROM for?  What information is contained within?
What stops working if we don't support it?  What starts working if we
do?

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stihxxx-b2120.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts=
/stihxxx-b2120.dtsi
> index 133375b..0d7c6dd 100644
> --- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
> +++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
> @@ -58,6 +58,15 @@
> =20
>  		i2c@9845000 {
>  			status =3D "okay";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			eeprom@50 {
> +				compatible =3D "at,24c256";
> +				pagesize =3D <64>;
> +				reg =3D <0x50>;
> +			};
>  		};
> =20
>  		i2c@9540000 {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
