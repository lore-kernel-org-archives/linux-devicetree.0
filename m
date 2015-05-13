From: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 3/3 v2] ARM: bcm2835: Add the mailbox to the device tree
Date: Wed, 13 May 2015 08:57:32 +0100
Message-ID: <20150513075732.GC3394@x1>
References: <1430857666-18877-1-git-send-email-eric@anholt.net>
 <1430857666-18877-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430857666-18877-3-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, Craig McGeachie <slapdau@yahoo.com.au>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

On Tue, 05 May 2015, Eric Anholt wrote:

> Signed-off-by: Eric Anholt <eric@anholt.net>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
> ---
> 
> v2: Update for #mbox-cells 0 change in the driver.
> 
>  arch/arm/boot/dts/bcm2835.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> index 4d4c129..4ff1b83 100644
> --- a/arch/arm/boot/dts/bcm2835.dtsi
> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> @@ -61,6 +61,13 @@
>  			reg = <0x7e104000 0x10>;
>  		};
>  
> +		mailbox: mailbox@7e00b800 {
> +			compatible = "brcm,bcm2835-mbox";
> +			reg = <0x7e00b880 0x40>;
> +			interrupts = <0 1>;
> +			#mbox-cells = <0>;
> +		};
> +
>  		gpio: gpio@7e200000 {
>  			compatible = "brcm,bcm2835-gpio";
>  			reg = <0x7e200000 0xb4>;
