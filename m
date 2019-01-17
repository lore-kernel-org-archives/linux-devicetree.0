From: Balakrishna Godavarthi <bgodavar@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: Add WCN3990 BT node
Date: Thu, 17 Jan 2019 11:40:35 +0530
Message-ID: <aebd3bbb4bb3faac2570244af610b43d@codeaurora.org>
References: <20190117044006.12463-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117044006.12463-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Anderson,

On 2019-01-17 10:10, Bjorn Andersson wrote:
> The SDM845 MTP has a WCN3990 Bluetooth chip on UART6, enable this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 44 +++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
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
> +		bias-no-pull;
> +	};
> +
> +	rts {
> +		pins = "gpio46";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	tx {
> +		pins = "gpio47";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
>  &qup_uart9_default {
>  	pinconf-tx {
>  		pins = "gpio4";


[Bala]:
        GPIO 45 is CTS
        GPIO 46 is RTS
        GPIO 47 is Tx
        GPIO 48 is Rx.

        Tx & RTS are inputs to APPS processor, bias should be disable as 
the source i.e. BT chip will pull them up.
        CTS & RX are outputs from APPS processor, where as CTS is GPIO 
which need to toggled, so the default state should be pull down.
              RX is should be pulled up.
        when TX & RX are pulled high it indicates that the lines are 
ideal i.e. no data.

Above is just my assumption, not sure whether they work on MTP.

-- 
Regards
Balakrishna.
