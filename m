From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v9 3/4] arm64: dts: rockchip: add usb2-phy support for
 rk3399
Date: Wed, 03 Aug 2016 21:34:32 +0200
Message-ID: <6424793.E7ikTBCxd6@diego>
References: <1469170846-15617-1-git-send-email-frank.wang@rock-chips.com>
 <1469170846-15617-4-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1469170846-15617-4-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 22. Juli 2016, 15:00:45 schrieb Frank Wang:
> Add usb2-phy nodes and specify phys phandle for ehci.
> 
> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

looks good to me. Of course we need Kishon to be happy with the driver itself 
first and the merge-window to end :-) .

I see that this won't apply cleanly, as the grf changed under your feet, but 
no need to resend for this alone, as I can fix that up myself.


Heiko

> ---
> 
> Changes in v9:
>  - Move the usb gpio config to rk3399-evb.dts
>  - Fix ehci phy-names property.
> 
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi |   42
> +++++++++++++++++++++++++++++- 1 file changed, 41 insertions(+), 1
> deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399.dtsi index d7f8e06..843d51c 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -221,6 +221,8 @@
>  		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&cru HCLK_HOST0>, <&cru HCLK_HOST0_ARB>;
>  		clock-names = "hclk_host0", "hclk_host0_arb";
> +		phys = <&u2phy0_host>;
> +		phy-names = "usb";
>  		status = "disabled";
>  	};
> 
> @@ -239,6 +241,8 @@
>  		interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&cru HCLK_HOST1>, <&cru HCLK_HOST1_ARB>;
>  		clock-names = "hclk_host1", "hclk_host1_arb";
> +		phys = <&u2phy1_host>;
> +		phy-names = "usb";
>  		status = "disabled";
>  	};
> 
> @@ -481,8 +485,44 @@
>  	};
> 
>  	grf: syscon@ff770000 {
> -		compatible = "rockchip,rk3399-grf", "syscon";
> +		compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
>  		reg = <0x0 0xff770000 0x0 0x10000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		u2phy0: usb2-phy@e450 {
> +			compatible = "rockchip,rk3399-usb2phy";
> +			reg = <0xe450 0x10>;
> +			clocks = <&cru SCLK_USB2PHY0_REF>;
> +			clock-names = "phyclk";
> +			#clock-cells = <0>;
> +			clock-output-names = "clk_usbphy0_480m";
> +			status = "disabled";
> +
> +			u2phy0_host: host-port {
> +				#phy-cells = <0>;
> +				interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "linestate";
> +				status = "disabled";
> +			};
> +		};
> +
> +		u2phy1: usb2-phy@e460 {
> +			compatible = "rockchip,rk3399-usb2phy";
> +			reg = <0xe460 0x10>;
> +			clocks = <&cru SCLK_USB2PHY1_REF>;
> +			clock-names = "phyclk";
> +			#clock-cells = <0>;
> +			clock-output-names = "clk_usbphy1_480m";
> +			status = "disabled";
> +
> +			u2phy1_host: host-port {
> +				#phy-cells = <0>;
> +				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "linestate";
> +				status = "disabled";
> +			};
> +		};
>  	};
> 
>  	watchdog@ff840000 {
