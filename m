From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: renesas: salvator-x: Add ADV7482 support
Date: Fri, 23 Jun 2017 10:43:50 +0300
Message-ID: <10057741.K1MBojqRFe@avalon>
References: <cover.90fc3153078e79a3f74af832de923ac675eb29ad.1497469745.git-series.kieran.bingham+renesas@ideasonboard.com> <ce388da93b793abc1b54df3e59ab287aedb9797f.1497469745.git-series.kieran.bingham+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <ce388da93b793abc1b54df3e59ab287aedb9797f.1497469745.git-series.kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Kieran Bingham <kbingham@kernel.org>
Cc: niklas.soderlund@ragnatech.se, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wednesday 14 Jun 2017 20:58:13 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The Salvator boards use an ADV7482 receiver for HDMI and CVBS inputs.
> 
> Provide ADV7482 node on the i2c4 bus, along with connectors for the
> hdmi and cvbs inputs, and link to the csi20 and csi40 nodes as outputs.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> v4:
>  - dt: Rebase to dts/renesas/salvator-x.dtsi
>  - dt: Use AIN0-7 rather than AIN1-8
> 
> v5:
>  - dt: Move to salvator-common.dtsi
> ---
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 123 ++++++++++++++++-
>  1 file changed, 123 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> b/arch/arm64/boot/dts/renesas/salvator-common.dtsi index
> aef35e0b685a..d74fb55c38bc 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -65,6 +65,27 @@
>  		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
>  	};
> 
> +	cvbs-in {
> +		compatible = "composite-video-connector";
> +		label = "CVBS IN";
> +
> +		port {
> +			cvbs_con: endpoint {
> +			};
> +		};
> +	};
> +
> +	hdmi-in {
> +		compatible = "hdmi-connector";
> +		label = "HDMI IN";
> +		type = "a";
> +
> +		port {
> +			hdmi_in_con: endpoint {
> +			};
> +		};
> +	};
> +
>  	reg_1p8v: regulator0 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-1.8V";
> @@ -257,6 +278,59 @@
>  	};
>  };
> 
> +&csi20 {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;

Aren't #address-cells, #size-cells and reg already present in the SoC .dtsi ? 
And if they're not, shouldn't they be ? :-)

> +			csi20_in: endpoint {
> +				clock-lanes = <0>;
> +				data-lanes = <1>;
> +				remote-endpoint = <&adv7482_txb>;
> +			};
> +		};
> +	};
> +};
> +
> +&csi40 {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			csi40_in: endpoint {
> +				clock-lanes = <0>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&adv7482_txa>;
> +			};
> +		};
> +	};
> +};
> +
> +&cvbs_con {
> +	port {
> +		cvbs_in: endpoint {
> +			remote-endpoint = <&adv7482_ain7>;
> +		};
> +	};
> +};

You could merge this with the cvbs_con node above.

Apart from that the patch looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +&hdmi_in_con {
> +	port {
> +		hdmi_in: endpoint {
> +			remote-endpoint = <&adv7482_hdmi>;
> +		};
> +	};
> +};
> +
>  &du {
>  	pinctrl-0 = <&du_pins>;
>  	pinctrl-names = "default";
> @@ -343,6 +417,55 @@
> 
>  		shunt-resistor-micro-ohms = <5000>;
>  	};
> +
> +	video-receiver@70 {
> +		compatible = "adi,adv7482";
> +		reg = <0x70>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		interrupt-parent = <&gpio6>;
> +		interrupt-names = "intrq1", "intrq2";
> +		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
> +			     <31 IRQ_TYPE_LEVEL_LOW>;
> +
> +		port@7 {
> +			reg = <7>;
> +
> +			adv7482_ain7: endpoint {
> +				remote-endpoint = <&cvbs_in>;
> +			};
> +		};
> +
> +		port@8 {
> +			reg = <8>;
> +
> +			adv7482_hdmi: endpoint {
> +				remote-endpoint = <&hdmi_in>;
> +			};
> +		};
> +
> +		port@10 {
> +			reg = <10>;
> +
> +			adv7482_txa: endpoint {
> +				clock-lanes = <0>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csi40_in>;
> +			};
> +		};
> +
> +		port@11 {
> +			reg = <11>;
> +
> +			adv7482_txb: endpoint {
> +				clock-lanes = <0>;
> +				data-lanes = <1>;
> +				remote-endpoint = <&csi20_in>;
> +			};
> +		};
> +	};
>  };
> 
>  &i2c_dvfs {

-- 
Regards,

Laurent Pinchart
