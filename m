From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [RESEND PATCH 1/4] ARM: STi: DT: STiH407: 407 DT Entry for clockgen
 A0
Date: Tue, 23 Sep 2014 09:44:11 +0200
Message-ID: <542124CB.1080307@st.com>
References: <1408977888-10473-1-git-send-email-gabriel.fernandez@linaro.org> <1408977888-10473-2-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408977888-10473-2-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, olof@lixom.net
Cc: linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Olivier Bideau <olivier.bideau@st.com>
List-Id: devicetree@vger.kernel.org



On 08/25/2014 04:44 PM, Gabriel FERNANDEZ wrote:
> Patch adds DT entries for clockgen A0
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
> ---
>   arch/arm/boot/dts/stih407-clock.dtsi | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
> index 800f46f..e03e86e 100644
> --- a/arch/arm/boot/dts/stih407-clock.dtsi
> +++ b/arch/arm/boot/dts/stih407-clock.dtsi
> @@ -7,6 +7,10 @@
>    */
>   / {
>   	clocks {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
>   		/*
>   		 * Fixed 30MHz oscillator inputs to SoC
>   		 */
> @@ -35,5 +39,33 @@
>   			clock-frequency = <200000000>;
>   			clock-output-names = "clk-s-icn-reg-0";
>   		};
> +
> +		/*
> +		 * ClockGenAs on SASG2
> +		 */
Note that I removed this comment since no SASG2 on STiH407.

> +		clockgen-a@090ff000 {
> +			compatible = "st,clkgen-c32";
> +			reg = <0x90ff000 0x1000>;
...
