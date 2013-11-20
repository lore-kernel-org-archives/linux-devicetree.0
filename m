From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 5/9] ARM: at91/dt: add mmc0 slot0 support to at91rm9200ek
 board
Date: Wed, 20 Nov 2013 15:59:26 +0100
Message-ID: <20131120145926.GE14627@ns203013.ovh.net>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
 <1377687995-10758-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1377687995-10758-1-git-send-email-b.brezillon@overkiz.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris BREZILLON <b.brezillon@overkiz.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Joachim Eastwood <manabian@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13:06 Wed 28 Aug     , Boris BREZILLON wrote:
> Add slot0 of mmc0 pinctrl pins definitions:
>  - detect pin
>  - write protect pin
>  - enable slot0 pin: this pin is connected to an external switch which
>    enable mmc0 slot0 or spi dataflash connected to cs3
> 
> The mmc0 device is not enabled, as it depends on the choosen functionnality
> (spi cs3 or mmc0 slot0).
> 
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
> ---
>  arch/arm/boot/dts/at91rm9200ek.dts |   35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91rm9200ek.dts b/arch/arm/boot/dts/at91rm9200ek.dts
> index f2d6d79..2bad423 100644
> --- a/arch/arm/boot/dts/at91rm9200ek.dts
> +++ b/arch/arm/boot/dts/at91rm9200ek.dts
> @@ -39,6 +39,23 @@
>  						atmel,pins = <AT91_PIOD 5 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;
>  					};
>  				};
> +
> +				mmc0 {
> +					pinctrl_mmc0_slot0_detect: mmc0_slot0_detect-0 {
> +						atmel,pins =
> +							<AT91_PIOB 27 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
> +					};
> +
> +					pinctrl_mmc0_slot0_write_protect: mmc0_slot0_write_protect-0 {
> +						atmel,pins =
> +							<AT91_PIOA 17 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;
> +					};
> +
> +					pinctrl_mmc0_slot0_switch: mmc0_slot0_switch-0 {
> +						atmel,pins =
> +							<AT91_PIOB 22 AT91_PERIPH_GPIO (AT91_PINCTRL_OUTPUT | AT91_PINCTRL_OUTPUT_VAL(1))>;
> +					};
nack this is a regulator the pinctrl API is not done for gpio default value
> +				};
>  			};
>  
>  			dbgu: serial@fffff200 {
> @@ -84,6 +101,24 @@
>  					reg = <0>;
>  				};
>  			};
> +
> +			mmc0: mmc@fffb4000 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				pinctrl-0 = <&pinctrl_mmc0_clk
> +					     &pinctrl_mmc0_slot0_cmd_dat0
> +					     &pinctrl_mmc0_slot0_dat1_3
> +					     &pinctrl_mmc0_slot0_detect
> +					     &pinctrl_mmc0_slot0_write_protect
> +					     &pinctrl_mmc0_slot0_switch>;
> +
> +				slot0: slot@0 {
> +					reg = <0>;
> +					bus-width = <4>;
> +					cd-gpios = <&pioB 27 GPIO_ACTIVE_HIGH>;
> +					wp-gpios = <&pioA 17 GPIO_ACTIVE_HIGH>;
> +				};
> +			};
>  		};
>  
>  		usb0: ohci@00300000 {
> -- 
> 1.7.9.5
> 
