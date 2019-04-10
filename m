From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/2] ARM: dts: stm32: Enable STM32F769 clock driver
Date: Wed, 10 Apr 2019 15:40:59 +0200
Message-ID: <5d6bc520-caa1-9dca-539d-e270562c4873@st.com>
References: <20190405075332.28530-1-gabriel.fernandez@st.com>
 <20190405075332.28530-3-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405075332.28530-3-gabriel.fernandez@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel Fernandez <gabriel.fernandez@st.com>, michael turquette <mturquette@baylibre.com>, stephen boyd <sboyd@kernel.org>, rob herring <robh+dt@kernel.org>, mark rutland <mark.rutland@arm.com>, maxime coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Gabriel

On 4/5/19 9:53 AM, Gabriel Fernandez wrote:
> This patch enables clocks for STM32F769 boards.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>   arch/arm/boot/dts/stm32f769-disco.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
> index 3c7216844a9b..6f1d0ac8c31c 100644
> --- a/arch/arm/boot/dts/stm32f769-disco.dts
> +++ b/arch/arm/boot/dts/stm32f769-disco.dts
> @@ -102,6 +102,10 @@
>   	};
>   };
>   
> +&rcc {
> +	compatible = "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
> +};
> +
>   &cec {
>   	pinctrl-0 = <&cec_pins_a>;
>   	pinctrl-names = "default";
> 

Even if driver part is not yet merged, this DT part can be taken as we 
will run with "st,stm32f746-rcc" compatible (the current one).

So:

Applied on stm32-next.

Thanks.
Alex
