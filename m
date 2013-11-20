From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 3/9] ARM: at91/dt: add usb1 vbus and pullup pins
Date: Wed, 20 Nov 2013 15:57:30 +0100
Message-ID: <20131120145730.GD14627@ns203013.ovh.net>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
 <1377687881-10688-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1377687881-10688-1-git-send-email-b.brezillon@overkiz.com>
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

On 13:04 Wed 28 Aug     , Boris BREZILLON wrote:
> Add vbus and pullup pinctrl definitions.
> Request the vbus and pullup pins in usb1 node.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
> ---
>  arch/arm/boot/dts/at91rm9200ek.dts |   15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/at91rm9200ek.dts b/arch/arm/boot/dts/at91rm9200ek.dts
> index 37b0880..76f3e87 100644
> --- a/arch/arm/boot/dts/at91rm9200ek.dts
> +++ b/arch/arm/boot/dts/at91rm9200ek.dts
> @@ -29,6 +29,18 @@
>  
>  	ahb {
>  		apb {
> +			pinctrl@fffff400 {
> +				usb1 {
> +					pinctrl_usb1_vbus: usb1_vbus-0 {
> +						atmel,pins = <AT91_PIOD 4 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
> +					};

it's a gpio no-need
> +
> +					pinctrl_usb1_pullup: usb1_pullup-0 {
> +						atmel,pins = <AT91_PIOD 5 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;
> +					};
no-need multidrive
> +				};
> +			};
> +
>  			dbgu: serial@fffff200 {
>  				status = "okay";
>  			};
> @@ -56,6 +68,9 @@
>  
>  			usb1: gadget@fffb0000 {
>  				atmel,vbus-gpio = <&pioD 4 GPIO_ACTIVE_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_usb1_vbus
> +					     &pinctrl_usb1_pullup>;
>  				status = "okay";
>  			};
>  
> -- 
> 1.7.9.5
> 
