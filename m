From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v1 4/7] ARM: dts: apq8064: Add MDP support
Date: Tue, 28 Jul 2015 19:31:37 +0200
Message-ID: <55B7BC79.1060504@suse.de>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1438088049-17479-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1438088049-17479-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Cc: agross@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 28.07.2015 um 14:54 schrieb Srinivas Kandagatla:
> From: Rob Clark <robdclark@gmail.com>
>=20
> This patch adds MDP node to APQ8064 dt.
>=20
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> [Srinivas Kandagatla] : updated with new style rpm regulators
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 87 +++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 87 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/=
qcom-apq8064.dtsi
> index cba4ccb..7d2cc45 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
[...]
> +		gpu: qcom,adreno-3xx@4300000 {
> +			compatible =3D "qcom,adreno-3xx";

I thought that wildcards were forbidden in compatible strings? Then thi=
s
should be replaced by the real number, with a fallback to the first
compatible one.

And can't we just name the node qcom,adreno without version suffix?

Regards,
Andreas

> +			reg =3D <0x04300000 0x20000>;
> +			reg-names =3D "kgsl_3d0_reg_memory";
> +			interrupts =3D <GIC_SPI 80 0>;
> +			interrupt-names =3D "kgsl_3d0_irq";
> +			clock-names =3D
> +			    "core_clk",
> +			    "iface_clk",
> +			    "mem_clk",
> +			    "mem_iface_clk";
> +			clocks =3D
> +			    <&mmcc GFX3D_CLK>,
> +			    <&mmcc GFX3D_AHB_CLK>,
> +			    <&mmcc GFX3D_AXI_CLK>,
> +			    <&mmcc MMSS_IMEM_AHB_CLK>;
> +			qcom,chipid =3D <0x03020002>;
> +			qcom,gpu-pwrlevels {
> +				compatible =3D "qcom,gpu-pwrlevels";
> +				qcom,gpu-pwrlevel@0 {
> +					qcom,gpu-freq =3D <450000000>;
> +				};
> +				qcom,gpu-pwrlevel@1 {
> +					qcom,gpu-freq =3D <27000000>;
> +				};
> +			};
> +		};
> +
> +		mdp: qcom,mdp@5100000 {
> +			compatible =3D "qcom,mdp";
> +			reg =3D <0x05100000 0xf0000>;
> +			interrupts =3D <GIC_SPI 75 0>;
> +			connectors =3D <&hdmi>;
> +			gpus =3D <&gpu>;
> +			clock-names =3D
> +			    "core_clk",
> +			    "iface_clk",
> +			    "lut_clk",
> +			    "src_clk",
> +			    "hdmi_clk",
> +			    "mdp_clk",
> +			    "mdp_axi_clk";
> +			clocks =3D
> +			    <&mmcc MDP_CLK>,
> +			    <&mmcc MDP_AHB_CLK>,
> +			    <&mmcc MDP_LUT_CLK>,
> +			    <&mmcc TV_SRC>,
> +			    <&mmcc HDMI_TV_CLK>,
> +			    <&mmcc MDP_TV_CLK>,
> +			    <&mmcc MDP_AXI_CLK>;
> +		};
>  	};
>  };

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton; H=
RB
21284 (AG N=FCrnberg)
