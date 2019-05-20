From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] ARM: dts: at91: Avoid colliding 'display' node and
 property names
Date: Mon, 20 May 2019 16:58:30 +0200
Message-ID: <20190520145830.GE3274@piout.net>
References: <20190516225614.1458-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190516225614.1458-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 16/05/2019 17:56:14-0500, Rob Herring wrote:
> While properties and child nodes with the same name are valid DT, the
> practice is not encouraged.

I don't see anything mentioning that in the devicetree specification. I
think this is something you should add if you don't want that to happen
again.

> Furthermore, the collision is problematic for
> YAML encoded DT. Let's just avoid the issue and rename the nodes.
> 

Or maybe you should fix the tool ;)

Do you plan to enforce it at some point? How close are you?

> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/arm/boot/dts/at91sam9261ek.dts    | 2 +-
>  arch/arm/boot/dts/at91sam9263ek.dts    | 2 +-
>  arch/arm/boot/dts/at91sam9m10g45ek.dts | 2 +-
>  arch/arm/boot/dts/at91sam9rlek.dts     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9261ek.dts b/arch/arm/boot/dts/at91sam9261ek.dts
> index f681cd727010..02b116b48c3b 100644
> --- a/arch/arm/boot/dts/at91sam9261ek.dts
> +++ b/arch/arm/boot/dts/at91sam9261ek.dts
> @@ -49,7 +49,7 @@
>  			atmel,power-control-gpio = <&pioA 12 GPIO_ACTIVE_LOW>;
>  			status = "okay";
>  
> -			display0: display {
> +			display0: panel {
>  				bits-per-pixel = <16>;
>  				atmel,lcdcon-backlight;
>  				atmel,dmacon = <0x1>;
> diff --git a/arch/arm/boot/dts/at91sam9263ek.dts b/arch/arm/boot/dts/at91sam9263ek.dts
> index 13d415c22a69..924fe563f6fa 100644
> --- a/arch/arm/boot/dts/at91sam9263ek.dts
> +++ b/arch/arm/boot/dts/at91sam9263ek.dts
> @@ -111,7 +111,7 @@
>  			display = <&display0>;
>  			status = "okay";
>  
> -			display0: display {
> +			display0: panel {
>  				bits-per-pixel = <16>;
>  				atmel,lcdcon-backlight;
>  				atmel,dmacon = <0x1>;
> diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot/dts/at91sam9m10g45ek.dts
> index 46107c2f1ab9..5226e952a729 100644
> --- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
> +++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
> @@ -236,7 +236,7 @@
>  			display = <&display0>;
>  			status = "okay";
>  
> -			display0: display {
> +			display0: panel {
>  				bits-per-pixel = <32>;
>  				atmel,lcdcon-backlight;
>  				atmel,dmacon = <0x1>;
> diff --git a/arch/arm/boot/dts/at91sam9rlek.dts b/arch/arm/boot/dts/at91sam9rlek.dts
> index 27d8a1f44233..a000a459f17b 100644
> --- a/arch/arm/boot/dts/at91sam9rlek.dts
> +++ b/arch/arm/boot/dts/at91sam9rlek.dts
> @@ -37,7 +37,7 @@
>  			display = <&display0>;
>  			status = "okay";
>  
> -			display0: display {
> +			display0: panel {
>  				bits-per-pixel = <16>;
>  				atmel,lcdcon-backlight;
>  				atmel,dmacon = <0x1>;
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
