From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: stm32: add syscfg to ADC on
 stm32mp157c
Date: Sun, 14 Jul 2019 17:13:10 +0100
Message-ID: <20190714171310.1816afe3@archlinux>
References: <1562148496-26789-1-git-send-email-fabrice.gasnier@st.com>
        <1562148496-26789-4-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562148496-26789-4-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: robh+dt@kernel.org, alexandre.torgue@st.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 3 Jul 2019 12:08:16 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On stm32mp157c, the ADC inputs are multiplexed with analog switches which
> have reduced performances when their supply is below 2.7V (vdda by
> default).
> Add syscfg registers that can be used on stm32mp157c, to get full ADC
> analog performances.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
I've applied the patches using this on the assumption this will go via
the usual SoC route.

Thanks,

Jonathan

> ---
>  arch/arm/boot/dts/stm32mp157c.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 2dd5162..b9a5b58 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -862,6 +862,7 @@
>  			clocks = <&rcc ADC12>, <&rcc ADC12_K>;
>  			clock-names = "bus", "adc";
>  			interrupt-controller;
> +			st,syscfg = <&syscfg>;
>  			#interrupt-cells = <1>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
