From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx51-babbage: Fix USB PHY duplicate
 unit-address
Date: Tue, 15 May 2018 16:06:26 +0800
Message-ID: <20180515080624.GR26863@dragon>
References: <1526322576-5838-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1526322576-5838-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>, robh+dt@kernel.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 14, 2018 at 03:29:35PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Currently the following DTC warning is seen with W=1:
> 
> arch/arm/boot/dts/imx51-babbage.dtb: Warning (unique_unit_address): /usbphy/usbphy@0: duplicate unit-address (also used in node /usbphy/usbh1phy@0)
> 
> Fix it by moving the USB PHY node outside of simple-bus and drop the
> unneeded unit-address.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  arch/arm/boot/dts/imx51-babbage.dts | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx51-babbage.dts b/arch/arm/boot/dts/imx51-babbage.dts
> index b8ca73d..de46906 100644
> --- a/arch/arm/boot/dts/imx51-babbage.dts
> +++ b/arch/arm/boot/dts/imx51-babbage.dts
> @@ -170,20 +170,13 @@
>  		mux-ext-port = <3>;
>  	};
>  
> -	usbphy {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		compatible = "simple-bus";
> -
> -		usbh1phy: usbh1phy@0 {
> -			compatible = "usb-nop-xceiv";
> -			reg = <0>;
> -			clocks = <&clk_usb>;
> -			clock-names = "main_clk";
> -			reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
> -			vcc-supply = <&vusb_reg>;
> -			#phy-cells = <0>;
> -		};
> +	usbh1phy: usbphy1 {
> +		compatible = "usb-nop-xceiv";
> +		clocks = <&clk_usb>;
> +		clock-names = "main_clk";
> +		reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&vusb_reg>;
> +		#phy-cells = <0>;

This should be considered as a whole together with usbphy in imx51.dtsi.
Also, I would like to get some input from DT folks on how we should name
the node uniquely.  @Rob.

Shawn

>  	};
>  };
>  
> -- 
> 2.7.4
> 
