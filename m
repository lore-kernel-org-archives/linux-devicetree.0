From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-gxl-s905d-phicomm-n1: add status LED
Date: Tue, 12 Mar 2019 09:59:20 +0100
Message-ID: <5c580f1b-1038-2c34-7047-e504eb4ac323@baylibre.com>
References: <20190312083326.18029-1-gch981213@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190312083326.18029-1-gch981213@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhong Guo <gch981213@gmail.com>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Chuanhong,

On 12/03/2019 09:33, Chuanhong Guo wrote:
> There is a white LED on the front panel behind the logo and the
> manufacturer uses that LED to indicate network and USB drive status.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
> index 9a8a8a7e4b53..b5667f1fb2c8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts
> @@ -14,6 +14,16 @@
>  	cvbs-connector {
>  		status = "disabled";
>  	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		status {
> +			label = "n1:white:status";
> +			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +	};
>  };
>  
>  &cvbs_vdac_port {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

BTW, do you know if it's possible to have a sample of the Phicomm N1
in order to be added in kernelci ?

Neil
