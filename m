From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/3] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Date: Thu, 18 Apr 2019 10:13:50 -0500
Message-ID: <20190418151350.GC32345@bogus>
References: <20190417165514.18689-1-angus@akkea.ca>
 <20190417165514.18689-2-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190417165514.18689-2-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, m.felsch@pengutronix.de, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Kevin Hilman <khilman@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Ja
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2019 at 09:55:12AM -0700, Angus Ainslie (Purism) wrote:
> This is the development kit board for the Librem 5. The current level of
> support yields a working console and is able to boot userspace from the
> Network or eMMC.
> 
> Additional subsystems that are active :
> 
> - Both USB ports
> - SD card socket
> - WiFi usdhc
> - WWAN modem
> - GNSS
> - GPIO keys
> - LEDs
> - gyro
> - magnetometer
> - touchscreen
> - pwm
> - backlight
> - haptic motor
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx8mq-librem5-devkit.dts   | 833 ++++++++++++++++++
>  2 files changed, 834 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0bd122f60549..c043aca66572 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
>  
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-rmb3.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> new file mode 100644
> index 000000000000..846a72dc7640
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts

> +&usb3_phy0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	port@0 {
> +		reg = <0>;
> +
> +		typec_hs: endpoint {
> +			remote-endpoint = <&usb_con_hs>;
> +		};
> +	};
> +
> +	port@1 {
> +		reg = <1>;
> +
> +		typec_ss: endpoint {
> +			remote-endpoint = <&usb_con_ss>;
> +		};
> +	};

This is wrong. The graph should be between the USB controller and the 
connector. The phy is not involved.

> +};
> +
> +&usb3_phy1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	extcon = <&typec_ptn5100>;

extcon is deprecated and you should only have the usb-connector binding. 
>From the controller, you can walk the graph to the connector.

> +	dr_mode = "otg";
> +	status = "okay";
> +};
