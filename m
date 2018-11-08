From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-axg: s400: add cts-rts to the bluetooth
 uart
Date: Thu, 8 Nov 2018 14:26:18 +0100
Message-ID: <79dd5a96-b7e1-31ed-745f-5ba05ba30173@baylibre.com>
References: <20181108095640.27876-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108095640.27876-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/11/2018 10:56, Jerome Brunet wrote:
> The uart used with bluetooth chipset on the s400 has flow control
> available. Let's enable it.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> index ba44b0419404..29ccb8ad0de6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> @@ -543,8 +543,9 @@
>  
>  &uart_A {
>  	status = "okay";
> -	pinctrl-0 = <&uart_a_pins>;
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
>  	pinctrl-names = "default";
> +	uart-has-rtscts;
>  };
>  
>  &uart_AO {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
