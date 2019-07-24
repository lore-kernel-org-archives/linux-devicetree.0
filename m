From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] ARM: dts: stm32: add audio codec support on
 stm32mp157a-dk1 board
Date: Wed, 24 Jul 2019 18:40:32 +0200
Message-ID: <27476214-07fe-886b-1cab-20902837f29c@st.com>
References: <1562327580-19647-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562327580-19647-1-git-send-email-olivier.moysan@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Olivier Moysan <olivier.moysan@st.com>, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Olivier

On 7/5/19 1:53 PM, Olivier Moysan wrote:
> Add support of Cirrus cs42l51 audio codec on stm32mp157a-dk1 board.
> Configuration overview:
> - SAI2A is the CPU interface used for the codec audio playback
> - SAI2B is the CPU interface used for the codec audio record
> - SAI2A is configured as a clock provider for the audio codec
> - SAI2A&B are configured as slave of the audio codec
> - SAI2A&B share the same interface of the audio codec
> 
> Note:
> In master mode, cs42l51 audio codec provides a bitclock
> at 64 x FS, regardless of data width. This means that
> slot width is always 32 bits.
> Set slot width to 32 bits and slot number to 2
> in SAI2A&B endpoint nodes, to match this constraint.
> dai-tdm-slot-num and dai-tdm-slot-width properties are used here,
> assuming that i2s is a special case of tdm, where slot number is 2.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157a-dk1.dts | 89 +++++++++++++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
> 

...

>   
> +&sai2 {
> +	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
> +	clock-names = "pclk", "x8k", "x11k";
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sai2a_pins_a>, <&sai2b_pins_b>;
> +	pinctrl-1 = <&sai2a_sleep_pins_a>, <&sai2b_sleep_pins_b>;
> +	status = "okay";
> +
> +	sai2a: audio-controller@4400b004 {
> +		#clock-cells = <0>;
> +		dma-names = "tx";
> +		clocks = <&rcc SAI2_K>;
> +		clock-names = "sai_ck";
> +		status = "okay";
> +
> +		sai2a_port: port {
> +			sai2a_endpoint: endpoint {
> +				remote-endpoint = <&cs42l51_tx_endpoint>;
> +				format = "i2s";
> +				mclk-fs = <256>;
> +				dai-tdm-slot-num = <2>;
> +				dai-tdm-slot-width = <32>;
> +			};
> +		};
> +	};
> +
You could use label to overload sai2a and sai2b. no ?

> +	sai2b: audio-controller@4400b024 {
> +		dma-names = "rx";
> +		st,sync = <&sai2a 2>;
> +		clocks = <&rcc SAI2_K>, <&sai2a>;
> +		clock-names = "sai_ck", "MCLK";
> +		status = "okay";
> +
> +		sai2b_port: port {
> +			sai2b_endpoint: endpoint {
> +				remote-endpoint = <&cs42l51_rx_endpoint>;
> +				format = "i2s";
> +				mclk-fs = <256>;
> +				dai-tdm-slot-num = <2>;
> +				dai-tdm-slot-width = <32>;
> +			};
> +		};
> +	};
> +};
> +
>   &sdmmc1 {
>   	pinctrl-names = "default", "opendrain", "sleep";
>   	pinctrl-0 = <&sdmmc1_b4_pins_a>;
> 
