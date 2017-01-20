From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 7/7] ARM: dts: stm32: Enable pwm1 and pwm3 for
 stm32f469-eval
Date: Fri, 20 Jan 2017 11:19:08 +0100
Message-ID: <451b28a0-6cf3-d75a-59a2-d4e2f8a7b373@st.com>
References: <1484832854-6314-1-git-send-email-fabrice.gasnier@st.com>
 <1484832854-6314-8-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484832854-6314-8-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>, jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-iio@vger.kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, benjamin.gaignard@linaro.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Hi Fabrice


On 01/19/2017 02:34 PM, Fabrice Gasnier wrote:
> Define and enable pwm1 and pwm3, timers1 & 3 trigger outputs on
> stm32f469-eval board.
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---

Typo issue in commit header (stm32f469 --> stm32f429)


>  arch/arm/boot/dts/stm32429i-eval.dts | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
> index 2181220..892100f 100644
> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> @@ -171,3 +171,31 @@
>  	pinctrl-names = "default";
>  	status = "okay";
>  };
> +
> +&timers1 {
> +	status = "okay";
> +
> +	pwm {
> +		pinctrl-0 = <&pwm1_pins>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +
> +	timer@0 {
> +		status = "okay";
> +	};
> +};
> +
> +&timers3 {
> +	status = "okay";
> +
> +	pwm {
> +		pinctrl-0 = <&pwm3_pins>;
> +		pinctrl-names = "default";
> +		status = "okay";
> +	};
> +
> +	timer@2 {
> +		status = "okay";
> +	};
> +};
>
