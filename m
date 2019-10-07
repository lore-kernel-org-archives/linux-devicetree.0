From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFCv1 3/5] arm64: dts: meson: Add missing regulator linked to
 VDDAO_3V3 regulator to FLASH_VDD
Date: Mon, 7 Oct 2019 16:20:59 +0200
Message-ID: <b73a1302-90ae-f1db-ff43-84d56ca4ba39@baylibre.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com>
 <20191007131649.1768-4-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007131649.1768-4-linux.amoon@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/10/2019 15:16, Anand Moon wrote:
> As per schematics add missing VDDAO_3V3 power supply to FLASH_VDD
> regulator. Also add TFLASH_VDD_EN signal name to gpio pin.
> 
> Fixes: c35f6dc5c377 (arm64: dts: meson: Add minimal support for Odroid-N2)
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index 66262a6ab3fe..6bd23a1e7e1d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -51,9 +51,12 @@
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  
> +		/* TFLASH_VDD_EN */
>  		gpio = <&gpio_ao GPIOAO_8 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  		regulator-always-on;
> +		/* U18 FC8731-09VF05NRR */
> +		vin-supply = <&vddao_3v3>;
>  	};
>  
>  	tf_io: gpio-regulator-tf_io {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
