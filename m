From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 7/9] ARM: STi: DT: STiH407: Add FDMA driver dt nodes.
Date: Fri, 11 Sep 2015 17:27:49 +0100
Message-ID: <20150911162749.GD18779@x1>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
 <1441980871-24475-8-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441980871-24475-8-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, robh+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> These nodes are required to get the fdma driver working
> on STiH407 based silicon.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 51 +++++++++++++++++++++++++=
++++++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dt=
s/stih407-family.dtsi
> index 838b812..da07474b 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -565,5 +565,56 @@
>  						  <&phy_port2 PHY_TYPE_USB3>;
>  			};
>  		};
> +
> +		fdma0: fdma0-audio@8e20000 {

I'm not familiar with the FDMA driver, so can't comment knowledgeably,
but the <dev> part of <dev>@<base_address> should only describe the
type of hardware.  I believe in this case it should just be
dma@08e20000.  Also notice the leading zero in the address, which I
believe mitigates possible confusion.  Then you be more specific with
the label, so something like 'fdma-audio' seems appropriate here.

> +			compatible =3D "st,stih407-fdma-mpe31";
> +			reg =3D <0x8e20000 0x20000>;

I personally find padding up to 32bits helpful in the addresses.

> +			interrupts =3D <GIC_SPI 5 IRQ_TYPE_NONE>;
> +			dma-channels =3D <16>;
> +			#dma-cells =3D <3>;
> +			st,fdma-id =3D <0>;

We usually shy away from ID properties.  What is it required for in
this case?

> +			clocks =3D <&clk_s_c0_flexgen CLK_FDMA>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
> +			clock-names =3D "fdma_slim",
> +				      "fdma_hi",
> +				      "fdma_low",
> +				      "fdma_ic";
> +		};
> +
> +		fdma1: fdma1-app@8e40000 {
> +			compatible =3D "st,stih407-fdma-mpe31";
> +			reg =3D <0x8e40000 0x20000>;
> +			interrupts =3D <GIC_SPI 7 IRQ_TYPE_NONE>;
> +			dma-channels =3D <16>;
> +			#dma-cells =3D <3>;
> +			st,fdma-id =3D <1>;
> +			clocks =3D <&clk_s_c0_flexgen CLK_FDMA>,
> +				 <&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
> +				 <&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
> +			clock-names =3D "fdma_slim",
> +				      "fdma_hi",
> +				      "fdma_low",
> +				      "fdma_ic";
> +		};
> +
> +		fdma2: fdma2-free_running@8e60000 {
> +			compatible =3D "st,stih407-fdma-mpe31";
> +			reg =3D <0x8e60000 0x20000>;
> +			interrupts =3D <GIC_SPI 9 IRQ_TYPE_NONE>;
> +			dma-channels =3D <16>;
> +			#dma-cells =3D <3>;
> +			st,fdma-id =3D <2>;
> +			clocks =3D <&clk_s_c0_flexgen CLK_FDMA>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
> +				 <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
> +				 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
> +			clock-names =3D "fdma_slim",
> +				      "fdma_hi",
> +				      "fdma_low",
> +				      "fdma_ic";
> +		};
>  	};
>  };

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
