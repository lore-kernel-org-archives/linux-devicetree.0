From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 2/3] arm: atmel: at91sam9n12: add qt1070 support
Date: Wed, 10 Jul 2013 16:38:35 +0200
Message-ID: <20130710143835.GG18012@ns203013.ovh.net>
References: <1373449869-5083-1-git-send-email-voice.shen@atmel.com>
 <1373449869-5083-3-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1373449869-5083-3-git-send-email-voice.shen@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bo Shen <voice.shen@atmel.com>
Cc: devicetree-discuss@lists.ozlabs.org, ludovic.desroches@atmel.com, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 17:51 Wed 10 Jul     , Bo Shen wrote:
> add qt1070 support on at91sam9n12ek board
> 
> Signed-off-by: Bo Shen <voice.shen@atmel.com>
> ---
>  arch/arm/boot/dts/at91sam9n12ek.dts |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/at91sam9n12ek.dts
> index d59b70c..3acac62 100644
> --- a/arch/arm/boot/dts/at91sam9n12ek.dts
> +++ b/arch/arm/boot/dts/at91sam9n12ek.dts
> @@ -40,6 +40,15 @@
>  
>  			i2c0: i2c@f8010000 {
>  				status = "okay";
> +
> +				qt1070: keyboard@1b {
> +					compatible = "qt1070";
> +					reg = <0x1b>;
> +					interrupt-parent = <&pioA>;
> +					interrupts = <2 0x0>;
use the macro
> +					pinctrl-names = "default";
> +					pinctrl-0 = <&pinctrl_qt1070_irq>;
> +				};
>  			};
>  
>  			i2c1: i2c@f8014000 {
> @@ -66,6 +75,13 @@
>  							<AT91_PIOA 7 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;	/* PA7 gpio CD pin pull up and deglitch */
>  					};
>  				};
> +
> +				qt1070 {
> +					pinctrl_qt1070_irq: qt1070_irq {
> +						atmel,pins =
> +							<AT91_PIOA 2 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>; /* PA2 GPIO with pull up deglith */
drop the comment as we use macro
> +					};
> +				};
>  			};
>  
>  			spi0: spi@f0000000 {
> -- 

Best Regards,
J.
