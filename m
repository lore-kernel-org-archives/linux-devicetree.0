From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] ARM: dts: atmel: Fix I2C and SPI bus warnings
Date: Fri, 14 Sep 2018 17:20:34 +0200
Message-ID: <50f3b6db-e892-e614-ccb4-589fcb971827@microchip.com>
References: <20180913181245.25484-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180913181245.25484-4-robh@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On 13/09/2018 at 20:12, Rob Herring wrote:
> dtc has new checks for I2C and SPI buses. Fix the warnings in node names
> and unit-addresses.
> 
> arch/arm/boot/dts/at91-dvk_som60.dtb: Warning (i2c_bus_reg): /ahb/apb/i2c@f0018000/eeprom@87: I2C bus unit address format error, expected "57"
> arch/arm/boot/dts/at91-dvk_som60.dtb: Warning (i2c_bus_reg): /ahb/apb/i2c@f0018000/ft5426@56: I2C bus unit address format error, expected "38"
> arch/arm/boot/dts/at91-vinco.dtb: Warning (i2c_bus_reg): /ahb/apb/i2c@f8024000/rtc@64: I2C bus unit address format error, expected "32"
> arch/arm/boot/dts/at91sam9260ek.dtb: Warning (spi_bus_reg): /ahb/apb/spi@fffc8000/mtd_dataflash@0: SPI bus unit address format error, expected "1"
> arch/arm/boot/dts/at91sam9g20ek_2mmc.dtb: Warning (spi_bus_reg): /ahb/apb/spi@fffc8000/mtd_dataflash@0: SPI bus unit address format error, expected "1"
> arch/arm/boot/dts/at91sam9g20ek.dtb: Warning (spi_bus_reg): /ahb/apb/spi@fffc8000/mtd_dataflash@0: SPI bus unit address format error, expected "1"
> arch/arm/boot/dts/at91sam9261ek.dtb: Warning (spi_bus_reg): /ahb/apb/spi@fffc8000/tsc2046@0: SPI bus unit address format error, expected "2"
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>

Looks good to me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please apply to the sub-arch tree. The dtc changes haven't landed, but
> will for 4.20.
> 
>   arch/arm/boot/dts/at91-dvk_su60_somc.dtsi     | 4 ++--
>   arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi | 4 ++--
>   arch/arm/boot/dts/at91-vinco.dts              | 2 +-
>   arch/arm/boot/dts/at91sam9260ek.dts           | 2 +-
>   arch/arm/boot/dts/at91sam9261ek.dts           | 2 +-
>   arch/arm/boot/dts/at91sam9g20ek_common.dtsi   | 2 +-
>   6 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91-dvk_su60_somc.dtsi b/arch/arm/boot/dts/at91-dvk_su60_somc.dtsi
> index bb86f17ed5ed..21876da7c442 100644
> --- a/arch/arm/boot/dts/at91-dvk_su60_somc.dtsi
> +++ b/arch/arm/boot/dts/at91-dvk_su60_somc.dtsi
> @@ -70,9 +70,9 @@
>   &i2c1 {
>   	status = "okay";
>   
> -	eeprom@87 {
> +	eeprom@57 {
>   		compatible = "giantec,gt24c32a", "atmel,24c32";
> -		reg = <87>;
> +		reg = <0x57>;
>   		pagesize = <32>;
>   	};
>   };
> diff --git a/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi b/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi
> index 4b9176dc5d02..df0f0cc575c1 100644
> --- a/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi
> +++ b/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi
> @@ -59,9 +59,9 @@
>   &i2c1 {
>   	status = "okay";
>   
> -	ft5426@56 {
> +	ft5426@38 {
>   		compatible = "focaltech,ft5426", "edt,edt-ft5406";
> -		reg = <56>;
> +		reg = <0x38>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&pinctrl_lcd_ctp_int>;
>   
> diff --git a/arch/arm/boot/dts/at91-vinco.dts b/arch/arm/boot/dts/at91-vinco.dts
> index 1be9889a2b3a..430277291e02 100644
> --- a/arch/arm/boot/dts/at91-vinco.dts
> +++ b/arch/arm/boot/dts/at91-vinco.dts
> @@ -128,7 +128,7 @@
>   			i2c2: i2c@f8024000 {
>   				status = "okay";
>   
> -				rtc1: rtc@64 {
> +				rtc1: rtc@32 {
>   					compatible = "epson,rx8900";
>   					reg = <0x32>;
>   				};
> diff --git a/arch/arm/boot/dts/at91sam9260ek.dts b/arch/arm/boot/dts/at91sam9260ek.dts
> index d2b865f60293..07d1b571e601 100644
> --- a/arch/arm/boot/dts/at91sam9260ek.dts
> +++ b/arch/arm/boot/dts/at91sam9260ek.dts
> @@ -127,7 +127,7 @@
>   
>   			spi0: spi@fffc8000 {
>   				cs-gpios = <0>, <&pioC 11 0>, <0>, <0>;
> -				mtd_dataflash@0 {
> +				mtd_dataflash@1 {
>   					compatible = "atmel,at45", "atmel,dataflash";
>   					spi-max-frequency = <50000000>;
>   					reg = <1>;
> diff --git a/arch/arm/boot/dts/at91sam9261ek.dts b/arch/arm/boot/dts/at91sam9261ek.dts
> index a29fc0494076..a57f2d435dca 100644
> --- a/arch/arm/boot/dts/at91sam9261ek.dts
> +++ b/arch/arm/boot/dts/at91sam9261ek.dts
> @@ -160,7 +160,7 @@
>   					spi-max-frequency = <15000000>;
>   				};
>   
> -				tsc2046@0 {
> +				tsc2046@2 {
>   					reg = <2>;
>   					compatible = "ti,ads7843";
>   					interrupts-extended = <&pioC 2 IRQ_TYPE_EDGE_BOTH>;
> diff --git a/arch/arm/boot/dts/at91sam9g20ek_common.dtsi b/arch/arm/boot/dts/at91sam9g20ek_common.dtsi
> index 71df3adfc7ca..ec1f17ab6753 100644
> --- a/arch/arm/boot/dts/at91sam9g20ek_common.dtsi
> +++ b/arch/arm/boot/dts/at91sam9g20ek_common.dtsi
> @@ -109,7 +109,7 @@
>   
>   			spi0: spi@fffc8000 {
>   				cs-gpios = <0>, <&pioC 11 0>, <0>, <0>;
> -				mtd_dataflash@0 {
> +				mtd_dataflash@1 {
>   					compatible = "atmel,at45", "atmel,dataflash";
>   					spi-max-frequency = <50000000>;
>   					reg = <1>;
> 


-- 
Nicolas Ferre
