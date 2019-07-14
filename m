From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: stm32: add analog
 switches supply control
Date: Sun, 14 Jul 2019 17:11:41 +0100
Message-ID: <20190714171141.12fc2d1d@archlinux>
References: <1562148496-26789-1-git-send-email-fabrice.gasnier@st.com>
        <1562148496-26789-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562148496-26789-2-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: robh+dt@kernel.org, alexandre.torgue@st.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 3 Jul 2019 12:08:14 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On stm32h7 and stm32mp1, the ADC inputs are multiplexed with analog
> switches which have reduced performances when their supply is below 2.7V
> (vdda by default). Booster or vdd can be used, to get full ADC
> performances.
> 
> Add documentation for:
> - optional booster-supply that can be used on stm32h7 and stm32mp1.
> - optional vdd-supply that can be used on stm32mp1 to supply analog
>   circuitry, selected by syscfg.
> Mark these as optional, since this is a trade-off between analog
> performance and power consumption.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Seems fine to me. Applied to the togreg branch of iio.git and pushed out
as testing for the autobuilders to play with it.

Thanks,

Jonathan

> ---
> Changes in v2:
> - Rework since: "Add missing vdda-supply to STM32 ADC" series.
> - Add booster-supply regulator description
> - typo: input switches
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> index 93a0bd2..4c0da8c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> @@ -47,6 +47,12 @@ Required properties:
>  Optional properties:
>  - A pinctrl state named "default" for each ADC channel may be defined to set
>    inX ADC pins in mode of operation for analog input on external pin.
> +- booster-supply: Phandle to the embedded booster regulator that can be used
> +  to supply ADC analog input switches on stm32h7 and stm32mp1.
> +- vdd-supply: Phandle to the vdd input voltage. It can be used to supply ADC
> +  analog input switches on stm32mp1.
> +- st,syscfg: Phandle to system configuration controller. It can be used to
> +  control the analog circuitry on stm32mp1.
>  
>  Contents of a stm32 adc child node:
>  -----------------------------------
