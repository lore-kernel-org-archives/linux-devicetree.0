From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 5/5] RFC: ARM64: dts: Add Low-Speed Connector to ZCU100
Date: Fri, 22 Jun 2018 15:22:31 +0200
Message-ID: <6c73bcf5-3847-adb2-ac71-5f2700fa72f8@xilinx.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <20180618074556.6944-6-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180618074556.6944-6-linus.walleij@linaro.org>
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
To: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dev@lists.96boards.org
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, John Stultz <john.stultz@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Andy Shevchenko <andy@infradead.org>
List-Id: devicetree@vger.kernel.org

On 18.6.2018 09:45, Linus Walleij wrote:
> This adds the low-speed connector to the ZCU100 rev C device
> tree (also known as the Ultra96 board).
> 
> This is a proof-of-concept only, showing how it is possible
> to populate a Secure96 board using the other patches in the
> series.
> 
> If you comment out or delete the board {} node, you can
> populate/depopulate the board from sysfs instead.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../boot/dts/xilinx/zynqmp-zcu100-revC.dts    | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> index d62276e0e0a9..fc30497f248d 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> @@ -110,6 +110,28 @@
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&gpio 7 GPIO_ACTIVE_LOW>; /* WIFI_EN */
>  	};
> +
> +	lscon: connector {
> +		compatible = "96boards,low-speed-connector";
> +		i2c0 = <&i2csw_0>;
> +		i2c1 = <&i2csw_1>;
> +		spi = <&spi0>;
> +		gpios = <&gpio 36 GPIO_ACTIVE_HIGH>, /* GPIO-A */
> +		        <&gpio 37 GPIO_ACTIVE_HIGH>, /* GPIO-B */
> +			<&gpio 39 GPIO_ACTIVE_HIGH>, /* GPIO-C */
> +			<&gpio 40 GPIO_ACTIVE_HIGH>, /* GPIO-D */
> +			<&gpio 44 GPIO_ACTIVE_HIGH>, /* GPIO-E */
> +			<&gpio 45 GPIO_ACTIVE_HIGH>, /* GPIO-F */
> +			<&gpio 78 GPIO_ACTIVE_HIGH>, /* GPIO-G */
> +			<&gpio 79 GPIO_ACTIVE_HIGH>, /* GPIO-H */
> +			<&gpio 80 GPIO_ACTIVE_HIGH>, /* GPIO-I */
> +			<&gpio 81 GPIO_ACTIVE_HIGH>, /* GPIO-J */
> +			<&gpio 82 GPIO_ACTIVE_HIGH>, /* GPIO-K */
> +			<&gpio 83 GPIO_ACTIVE_HIGH>; /* GPIO-L */


This connector has also 2 uarts which you should have here too.

Thanks,
Michal


> +		board {
> +			compatible = "96boards,secure96";
> +		};
> +	};
>  };
>  
>  &dcc {
> @@ -134,8 +156,9 @@
>  			  "USB1_DIR", "USB1_DATA2", "USB1_NXT", "USB1_DATA0", "USB1_DATA1",
>  			  "USB1_STP", "USB1_DATA3", "USB1_DATA4", "USB1_DATA5", "USB1_DATA6",
>  			  "USB_DATA7", "WLAN_IRQ", "PMIC_IRQ", /* MIO end and EMIO start */
> -			  "", "",
> -			  "", "", "", "", "", "", "", "", "", "",
> +			  "GPIO-G", "GPIO-H",
> +			  "GPIO-I", "GPIO-J", "GPIO-K", "GPIO-L",
> +			  "", "", "", "", "", "",
>  			  "", "", "", "", "", "", "", "", "", "",
>  			  "", "", "", "", "", "", "", "", "", "",
>  			  "", "", "", "", "", "", "", "", "", "",
> 
