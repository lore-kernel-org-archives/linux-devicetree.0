Return-Path: <SRS0=9BnR=I7=chromium.org=mka@kernel.org>
Date: Wed, 13 Jun 2018 12:37:00 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v6 3/4] dt-bindings: power: supply: qcom_bms: Add bindings
Message-ID: <20180613193700.GL88063@google.com>
References: <20180407135934.26122-1-ctatlor97@gmail.com>
 <20180613160643.12638-1-ctatlor97@gmail.com>
 <20180613160643.12638-3-ctatlor97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180613160643.12638-3-ctatlor97@gmail.com>
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Craig,

On Wed, Jun 13, 2018 at 05:06:24PM +0100, Craig Tatlor wrote:
> Add bindings for the Qualcomm Battery Monitoring system.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> ---
> 
> * Changes from v5:
>   Mentions which values are 8 bit.
> 
> * Changes from v4:
>   Uses proper units and expands some definitions,
>   along with changing vadc@ to adc@.
>  .../bindings/power/supply/qcom_bms.txt        | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/qcom_bms.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/qcom_bms.txt b/Documentation/devicetree/bindings/power/supply/qcom_bms.txt
> new file mode 100644
> index 000000000000..9a29a2eb9f04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/qcom_bms.txt
> @@ -0,0 +1,92 @@
> +Qualcomm Battery Monitoring System
> +
> +The Qualcomm Battery Monitoring System is found inside of Qualcomm PM8941
> +PMICs. It provides open circuit voltage (OCV) and coulomb counter registers
> +that allow the OS to infer a capacity level.
> +
> +Required properties:
> +- compatible:                   Should contain "qcom,pm8941-bms".
> +- reg:                          Specifies the SPMI address and length of the
> +				controller's registers.
> +- interrupts:                   OCV threshold interrupt.
> +- io-channels:                  Should contain IIO channel specifier for the
> +				ADC channel that reports battery temperature.
> +- io-channel-names:             Should contain "temp".
> +- qcom,fcc-temp-legend-celcius: An 8 bit array containing the temperature,
> +				in degC, for each column of the full charge
> +				capacity lookup table.

s/celcius/celsius/

same for qcom,ocv-temp-legend-celcius

> +- qcom,fcc-lut-microamp-hours:  An array of full charge capacity values in uah,

nit: s/uah/uAh/

Thanks

Matthias
