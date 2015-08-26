From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 5/7] ARM: STi: DT: STiH407: Add FDMA driver and xbar
 driver dt nodes.
Date: Wed, 26 Aug 2015 08:46:20 +0100
Message-ID: <20150826074620.GV19409@x1>
References: <1436371888-27863-1-git-send-email-peter.griffin@linaro.org>
 <1436371888-27863-6-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436371888-27863-6-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, dan.j.williams@intel.com, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, ludovic.barre@st.com
List-Id: devicetree@vger.kernel.org

On Wed, 08 Jul 2015, Peter Griffin wrote:

> These nodes are required to get the fdma and xbar driver working
> on STiH407 based silicon.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 59 +++++++++++++++++++++++++=
++++++++++
>  1 file changed, 59 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dt=
s/stih407-family.dtsi
> index 838b812..b6d9e20 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -565,5 +565,64 @@
>  						  <&phy_port2 PHY_TYPE_USB3>;
>  			};
>  		};
> +
> +		xbar0: fdma-xbar-mpe@0 {

The unit address should match the one in the reg property.

> +			compatible =3D "st,fdma-xbar-1.0";

Is that a version number in the compatible string?

> +			reg =3D <0x8e80000 0x1000>;
> +			dma-requests =3D <79>;
> +			#st,fdma-xbar-cells =3D <1>;

Why can't FDMA use the generic DMA properties?

> +		};
> +
> +		fdma0: fdma-audio@0 {

Same comment as above.

> +			compatible =3D "st,fdma_mpe31";

DT doesn't usually like underscores.

> +			reg =3D <0x8e20000 0x20000>;
> +			interrupts =3D <GIC_SPI 5 IRQ_TYPE_NONE>;
> +			dma-channels =3D <16>;
> +			#dma-cells =3D <3>;
> +			st,fw-name =3D "fdma_STiH407_0.elf";

I've bought this up before somewhere (although there doesn't appear to
be a Firmware Maintainer), surely we should define a generic binding
for passing firmware names?  Many vendors are going to require it.

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
> +		fdma1: fdma-app@1 {

As above.

> +			compatible =3D "st,fdma_mpe31";

As above.

> +			reg =3D <0x8e40000 0x20000>;
> +			interrupts =3D <GIC_SPI 7 IRQ_TYPE_NONE>;
> +			dma-channels =3D <16>;
> +			#dma-cells =3D <3>;
> +			st,fdma-xbar =3D <&xbar0 0>;
> +			st,fw-name =3D "fdma_STiH407_1.elf";
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
> +		fdma2: fdma-free_running@2 {
> +			compatible =3D "st,fdma_mpe31";
> +			reg =3D <0x8e60000 0x20000>;
> +			interrupts =3D <GIC_SPI 9 IRQ_TYPE_NONE>;
> +			dma-channels =3D <16>;
> +			#dma-cells =3D <3>;
> +			st,fw-name =3D "fdma_STiH407_2.elf";
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
