From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/1] imx53.dtsi: Add IPU nodes for csi
Date: Fri, 05 Aug 2016 11:33:10 +0200
Message-ID: <1470389590.3141.22.camel@pengutronix.de>
References: <CAOMZO5BoRsrHv-+5c9bAXO2NCya8sPqmmpy9DOfav6NvQ+VMLQ@mail.gmail.com>
	 <1470318452-31391-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470318452-31391-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 04.08.2016, 15:47 +0200 schrieb Fabien Lahoudere:
> We have the following messages that tell csi devices are not used:
> imx-ipuv3 18000000.ipu: no port@0 node in /soc/ipu@18000000, not using CSI0
> imx-ipuv3 18000000.ipu: no port@1 node in /soc/ipu@18000000, not using CSI1
> 
> So we add them in the common device tree to make CSI ports available on
> imx53 boards.
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  arch/arm/boot/dts/imx53.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
> index c1bc97c..0777b41 100644
> --- a/arch/arm/boot/dts/imx53.dtsi
> +++ b/arch/arm/boot/dts/imx53.dtsi
> @@ -136,6 +136,14 @@
>  			clock-names = "bus", "di0", "di1";
>  			resets = <&src 2>;
>  
> +			ipu_csi0: port@0 {
> +				reg = <0>;
> +			};
> +
> +			ipu_csi1: port@1 {
> +				reg = <1>;
> +			};
> +
>  			ipu_di0: port@2 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
