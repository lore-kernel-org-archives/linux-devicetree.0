From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: stm32: add analog switches
 supply control
Date: Sun, 16 Jun 2019 16:12:45 +0100
Message-ID: <20190616161245.38168d94@archlinux>
References: <1560324276-681-1-git-send-email-fabrice.gasnier@st.com>
        <1560324276-681-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560324276-681-2-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: robh+dt@kernel.org, alexandre.torgue@st.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 12 Jun 2019 09:24:34 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> On stm32h7 and stm32mp1, the ADC inputs are multiplexed with analog
> switches which have reduced performances when their supply is below 2.7V
> (vdda by default).
> 
> Add documentation for optional vdda-supply & vdd-supply that can be used
> to supply analog circuitry (controlled by syscfg bits).
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> index 8346bcb..3af48b9 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt
> @@ -46,6 +46,12 @@ Required properties:
>  Optional properties:
>  - A pinctrl state named "default" for each ADC channel may be defined to set
>    inX ADC pins in mode of operation for analog input on external pin.
> +- vdda-supply: Phandle to the vdda input voltage. It can be used to supply ADC
> +  analog inputs switches on stm32h7 and stm32mp1.

input switches

> +- vdd-supply: Phandle to the vdd input voltage. It can be used to supply ADC
> +  analog inputs switches on stm32mp1.
> +- st,syscfg: Phandle to system configuration controller. It can be used to
> +  control the analog circuitry on stm32h7 and stm32mp1.
>  
>  Contents of a stm32 adc child node:
>  -----------------------------------
