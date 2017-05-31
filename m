From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/4] Documentation: dt: iio: at91-sama5d2_adc: add
 adtrg trigger binding
Date: Wed, 31 May 2017 12:59:18 -0500
Message-ID: <20170531175918.3fne7ijavvrw4sf6@rob-hp-laptop>
References: <1495711034-28410-1-git-send-email-eugen.hristev@microchip.com>
 <1495711034-28410-3-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1495711034-28410-3-git-send-email-eugen.hristev@microchip.com>
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
Cc: devicetree@vger.kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, ludovic.desroches@microchip.com, jic23@kernel.org, alexandre.belloni@microchip.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 25, 2017 at 02:17:12PM +0300, Eugen Hristev wrote:
> Add node information for ADTRG hardware pin and the three possible
> edge nodes that are available for the driver
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  .../devicetree/bindings/iio/adc/at91-sama5d2_adc.txt    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt b/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
> index 3223684..e30ede3 100644
> --- a/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
> @@ -11,6 +11,13 @@ Required properties:
>    - atmel,min-sample-rate-hz: Minimum sampling rate, it depends on SoC.
>    - atmel,max-sample-rate-hz: Maximum sampling rate, it depends on SoC.
>    - atmel,startup-time-ms: Startup time expressed in ms, it depends on SoC.
> +  - atmel,trigger-edge-type: phandle to one of the adtrg possible edge types
> +
> +Required adtrg node:
> +  - Required edge nodes:
> +	For each possible edge type for the ADTRG hardware trigger pin,
> +	 a specific sub node. The driver recognises only the three possible
> +	 edge types: external_rising, external_falling, external_any.

Why is this not just a simple property? Having 4 nodes just for this is 
pointless.

>  
>  Example:
>  
> @@ -25,4 +32,14 @@ adc: adc@fc030000 {
>  	atmel,startup-time-ms = <4>;
>  	vddana-supply = <&vdd_3v3_lp_reg>;
>  	vref-supply = <&vdd_3v3_lp_reg>;
> +	atmel,trigger-edge-type = <&external_rising>;
> +
> +	adtrg: adtrg {
> +		external_rising: external_rising {
> +		};
> +		external_falling: external_falling {
> +		};
> +		external_any: external_any {
> +		};
> +	};
>  }
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
