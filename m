From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [PATCH 1/3] ARM: dts: at91: sama5d2_xplained: enable ADTRG pin
Date: Mon, 24 Apr 2017 11:04:43 +0200
Message-ID: <20170424090443.g4ywq5soomzbjmk3@rfolt0960.corp.atmel.com>
References: <1492590045-17329-1-git-send-email-eugen.hristev@microchip.com>
 <1492590045-17329-2-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1492590045-17329-2-git-send-email-eugen.hristev@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eugen Hristev <eugen.hristev@microchip.com>
Cc: devicetree@vger.kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com, alexandre.belloni@free-electrons.com, linux-arm-kernel@lists.infradead.org, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 19, 2017 at 11:20:43AM +0300, Eugen Hristev wrote:
> Enable pinctrl for ADTRG pin (PD31) for ADC hardware trigger support.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

> ---
>  arch/arm/boot/dts/at91-sama5d2_xplained.dts | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> index 0bef9e0..04754b1 100644
> --- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> @@ -303,7 +303,7 @@
>  				vddana-supply = <&vdd_3v3_lp_reg>;
>  				vref-supply = <&vdd_3v3_lp_reg>;
>  				pinctrl-names = "default";
> -				pinctrl-0 = <&pinctrl_adc_default>;
> +				pinctrl-0 = <&pinctrl_adc_default &pinctrl_adtrg_default>;
>  				status = "okay";
>  			};
>  
> @@ -322,6 +322,20 @@
>  					bias-disable;
>  				};
>  
> +				/*
> +				 * The ADTRG pin can work on any edge type.
> +				 * In here it's being pulled up, so need to
> +				 * connect it to ground to get an edge e.g.
> +				 * Trigger can be configured on falling, rise
> +				 * or any edge, and the pull-up can be changed
> +				 * to pull-down or left floating according to
> +				 * needs.
> +				 */
> +				pinctrl_adtrg_default: adtrg_default {
> +					pinmux = <PIN_PD31__ADTRG>;
> +					bias-pull-up;
> +				};
> +
>  				pinctrl_charger_chglev: charger_chglev {
>  					pinmux = <PIN_PA12__GPIO>;
>  					bias-disable;
> -- 
> 2.7.4
> 
