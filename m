From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Add WCN3990 BT node
Date: Thu, 17 Jan 2019 11:28:12 -0800
Message-ID: <20190117192812.GV261387@google.com>
References: <20190117044006.12463-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190117044006.12463-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Balakrishna Godavarthi <bgodavar@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 08:40:06PM -0800, Bjorn Andersson wrote:
> The SDM845 MTP has a WCN3990 Bluetooth chip on UART6, enable this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 44 +++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index af8c6a2445a2..f65d5a674103 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -17,6 +17,7 @@
>  
>  	aliases {
>  		serial0 = &uart9;
> +		hsuart0 = &uart6;
>  	};
>  
>  	chosen {
> @@ -357,6 +358,10 @@
>  	clock-frequency = <400000>;
>  };
>  
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
> @@ -373,6 +378,20 @@
>  	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
>  };
>  
> +&uart6 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		vddio-supply = <&vreg_s4a_1p8>;
> +		vddxo-supply = <&vreg_l7a_1p8>;
> +		vddrf-supply = <&vreg_l17a_1p3>;
> +		vddch0-supply = <&vreg_l25a_3p3>;
> +		max-speed = <3200000>;
> +	};
> +};
> +
>  &uart9 {
>  	status = "okay";
>  };
> @@ -470,6 +489,31 @@
>  	};
>  };
>  
> +&qup_uart6_default {
> +	pinmux {
> +		pins = "gpio45", "gpio46", "gpio47", "gpio48";
> +		function = "qup6";
> +	};
> +
> +	ctsrx {
> +		pins = "gpio45", "gpio48";
> +		drive-strength = <2>;

CTS and RX are input signals, no need to configure drive strength in
this case IIUC.

> +		bias-no-pull;

On another SDM845 based device we observe garbage on RX at
initialization time, unless we enable a pull-up.

> +	};
> +
> +	rts {
> +		pins = "gpio46";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};

On our device we don't configure a pull on the lines driven by the
AP. I think a pull-down on RTS should be fine though since it matches
the pull (during reset) on CTS of the BT module.

> +	tx {
> +		pins = "gpio47";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};

Similar to RTS, the pull matches the one on RXD of the BT module.

For reference, this is what we currently use on our device:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1391888/3/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi

Cheers

Matthias
