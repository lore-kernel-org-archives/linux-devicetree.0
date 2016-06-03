From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v2, 1/2] Documentation: bindings: add DT documentation for
 Rockchip USB2PHY
Date: Fri, 3 Jun 2016 12:25:32 -0700
Message-ID: <20160603192532.GA4241@roeck-us.net>
References: <1464850090-99371-2-git-send-email-frank.wang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1464850090-99371-2-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 02, 2016 at 02:48:09PM +0800, Frank Wang wrote:
> Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
> Changes in v2:
>  - Changed vbus_host optional property from gpio to regulator.
>  - Specified vbus_otg-supply optional property.
>  - Specified otg_id and otg_bvalid property.
> 
>  .../bindings/phy/phy-rockchip-inno-usb2.txt        |   55 ++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> new file mode 100644
> index 0000000..132e707
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> @@ -0,0 +1,55 @@
> +ROCKCHIP USB2.0 PHY WITH INNO IP BLOCK
> +
> +Required properties (phy (parent) node):
> + - compatible : should contain:
> +	* "rockchip,rk3366-usb2phy"
> +	* "rockchip,rk3399-usb2phy"
> + - #clock-cells : should be 0.
> + - clock-names : specify the 480m output clk name.
> +
> +Optional properties:
> + - vbus_host-supply : phandle to a regulator that supplies host vbus.
> + - vbus_otg-supply : phandle to a regulator that supplies otg vbus.
> +
> +Required nodes : a sub-node is required for each port the phy provides.
> +		 The sub-node name is used to identify host or otg port.
> +
Would it make sense to also specify the sub-node names ? The driver matches
"host-port", and presumably once supported "otg-port". Someone not knowing
this may specify "hostport" or some other name variant and wonder why nothing
works as expected.

> +Required properties (port (child) node):
> + - #phy-cells : must be 0. See ./phy-bindings.txt for details.
> + - interrupts : specify an interrupt for each entry in interrupt-names.
> + - interrupt-names : a list which shall be the following entries:
> +	* "otg_id" : for the otg id interrupt.
> +	* "otg_bvalid" : for the otg vbus interrupt.
> +	* "linestate" : for the host or otg linestate interrupt.
> +
> +Example:
> +
> +grf: syscon@ff770000 {
> +	compatible = "rockchip,rk3366-grf", "syscon", "simple-mfd";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +...
> +
> +	u2phy: usb2-phy {
> +		compatible = "rockchip,rk3366-usb2phy";
> +		#clock-cells = <0>;
> +		clock-output-names = "sclk_otgphy0_480m";
> +
> +		u2phy_otg: otg-port {
> +			#phy-cells = <0>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "otg_id", "otg_bvalid", "linestate";
> +			status = "okay";
> +		};
> +
> +		u2phy_host: host-port {
> +			#phy-cells = <0>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "linestate";
> +			status = "okay";
> +		};
> +	};
> +};
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
