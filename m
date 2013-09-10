From: "Christian Daudt" <csd@broadcom.com>
Subject: Re: [PATCH v9 3/3] ARM: bcm281xx: Add device node for the GPIO
 controller
Date: Tue, 10 Sep 2013 15:32:26 -0700
Message-ID: <522F9DFA.8000807@broadcom.com>
References: <1378836423-12467-1-git-send-email-markus.mayer@linaro.org>
 <1378836423-12467-4-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378836423-12467-4-git-send-email-markus.mayer@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Device Tree List <devicetree@vger.kernel.org>, Linaro Patches <patches@linaro.org>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Tim Kryger <tim.kryger@linaro.org>, Matt Porter <matt.porter@linaro.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 13-09-10 11:07 AM, Markus Mayer wrote:
> Add the GPIO controller device node for the Broadcom bcm281xx family of
> mobile SoCs.
>
> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
> Reviewed-by: Matt Porter <matt.porter@linaro.org>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   arch/arm/boot/dts/bcm11351.dtsi |   16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
> index 05a5aab..77af396 100644
> --- a/arch/arm/boot/dts/bcm11351.dtsi
> +++ b/arch/arm/boot/dts/bcm11351.dtsi
> @@ -68,6 +68,22 @@
>   		clock-frequency = <32768>;
>   	};
>   
> +	gpio: gpio@35003000 {
> +		compatible = "brcm,bcm11351-gpio", "brcm,kona-gpio";
> +		reg = <0x35003000 0x800>;
> +		interrupts =
> +		       <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH
> +			GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH
> +			GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH
> +			GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH
> +			GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH
> +			GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> +		#gpio-cells = <2>;
> +		#interrupt-cells = <2>;
> +		gpio-controller;
> +		interrupt-controller;
> +	};
> +
>   	sdio1: sdio@3f180000 {
>   		compatible = "brcm,kona-sdhci";
>   		reg = <0x3f180000 0x10000>;
Applied to bcm armsoc/for-3.13/dt

  thanks,
    csd
