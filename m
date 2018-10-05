From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 07/10] dt-bindings: phy: add binding for
 Allwinner USB3 PHY
Date: Fri, 5 Oct 2018 15:58:55 -0500
Message-ID: <20181005205855.GA2458@bogus>
References: <20181004122855.22981-1-icenowy@aosc.io>
 <20181004122855.22981-8-icenowy@aosc.io>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBENB37OQKGQELF42MRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181004122855.22981-8-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 04, 2018 at 08:28:52PM +0800, Icenowy Zheng wrote:
> The new Allwinner H6 SoC contains a USB3 PHY that is wired to the
> external USB3 pins of the SoC.
> 
> Add a device tree binding for the PHY.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> Changes in v4:
> - Changed Vbus regulator property to vbus-supply.
> 
> Changes in v3:
> - Added Chen-Yu's Review tag.
> 
> No changes in v2, v1.
> 
>  .../bindings/phy/sun50i-usb3-phy.txt          | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> new file mode 100644
> index 000000000000..9f49c6b8c7e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
> @@ -0,0 +1,23 @@
> +Allwinner sun50i USB3 PHY
> +-----------------------
> +
> +Required properties:
> +- compatible : should be one of
> +  * allwinner,sun60i-h6-usb3-phy
> +- reg : a list of offset + length pairs
> +- #phy-cells : from the generic phy bindings, must be 0
> +- clocks : phandle + clock specifier for the phy clock
> +- resets : phandle + reset specifier for the phy reset
> +
> +Optional Properties:
> +- vbus-supply : a phandle to a regulator that provides power to VBUS.

This belongs in a connector node as it is part of the connector unless 
the phy physically needs Vbus for power.

But others have done this, so all the phys can just be wrong...

> +
> +Example:
> +	usb3phy: phy@5210000 {

usb-phy@

> +		compatible = "allwinner,sun50i-h6-usb3-phy";
> +		reg = <0x5210000 0x10000>;
> +		clocks = <&ccu CLK_USB_PHY1>;
> +		resets = <&ccu RST_USB_PHY1>;
> +		#phy-cells = <0>;
> +		status = "disabled";

Don't show status in examples.

> +	};
> -- 
> 2.18.0
> 
