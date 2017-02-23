From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] ATM: dts: at91: sama5d2_xplained: add pwm controller
Date: Thu, 23 Feb 2017 09:42:41 +0100
Message-ID: <20170223084241.6eqm5jxe4t7fpn6a@piout.net>
References: <1487838778-13473-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1487838778-13473-1-git-send-email-claudiu.beznea@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, ludovic.desroches@atmel.com, nicolas.ferre@atmel.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, cyrille.pitchen@atmel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

There is a typo in your subject, please fix.

On 23/02/2017 at 10:32:58 +0200, Claudiu Beznea wrote:
> Add pwm controller bindings for sam5d2_xplained
> and enable it.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  arch/arm/boot/dts/at91-sama5d2_xplained_common.dtsi | 4 ++++
>  arch/arm/boot/dts/sama5d2.dtsi                      | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained_common.dtsi b/arch/arm/boot/dts/at91-sama5d2_xplained_common.dtsi
> index 9fc270f..493ea29 100644
> --- a/arch/arm/boot/dts/at91-sama5d2_xplained_common.dtsi
> +++ b/arch/arm/boot/dts/at91-sama5d2_xplained_common.dtsi
> @@ -318,6 +318,10 @@
>  				};
>  			};
>  
> +			pwm0: pwm@f802c000 {
> +				status = "okay";
> +			};
> +
>  			flx0: flexcom@f8034000 {
>  				atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
>  				status = "disabled"; /* conflict with ISC_D2 & ISC_D3 data pins */
> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
> index cd459e8..e88785e 100644
> --- a/arch/arm/boot/dts/sama5d2.dtsi
> +++ b/arch/arm/boot/dts/sama5d2.dtsi
> @@ -1098,6 +1098,14 @@
>  				status = "disabled";
>  			};
>  
> +			pwm0: pwm@f802c000 {
> +				compatible = "atmel,sama5d2-pwm";

This compatible is not documented and is not used in any driver. Is that
really working?

> +				reg = <0xf802c000 0x4000>;
> +				interrupts = <38 IRQ_TYPE_LEVEL_HIGH 7>;
> +				#pwm-cells = <3>;
> +				clocks = <&pwm_clk>;
> +			};
> +
>  			sfr: sfr@f8030000 {
>  				compatible = "atmel,sama5d2-sfr", "syscon";
>  				reg = <0xf8030000 0x98>;
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
