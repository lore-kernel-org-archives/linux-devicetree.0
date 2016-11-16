From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] drivers: usb: phy: Add qoriq usb 3.0 phy driver
 support
Date: Tue, 15 Nov 2016 18:07:40 -0600
Message-ID: <20161116000740.iq6ffcjanrrvrdnq@rob-hp-laptop>
References: <1479101215-26954-1-git-send-email-sriram.dash@nxp.com>
 <1479101215-26954-2-git-send-email-sriram.dash@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479101215-26954-2-git-send-email-sriram.dash-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sriram Dash <sriram.dash-3arQi8VN3Tc@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, pku.leo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, suresh.gupta-3arQi8VN3Tc@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 14, 2016 at 10:56:54AM +0530, Sriram Dash wrote:
> Adds qoriq usb 3.0 phy driver support for LS1043A platform.
> Describes the qoriq usb 2.0 phy driver binding, currently used
> for LS1043A platform.
> 
> Signed-off-by: Sriram Dash <sriram.dash-3arQi8VN3Tc@public.gmane.org>
> ---
>  .../devicetree/bindings/phy/phy-qoriq-usb3.txt     |  36 ++++
>  drivers/phy/Kconfig                                |   8 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-qoriq-usb3.c                       | 202 +++++++++++++++++++++
>  4 files changed, 247 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt
>  create mode 100644 drivers/phy/phy-qoriq-usb3.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt b/Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt
> new file mode 100644
> index 0000000..d934c80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-qoriq-usb3.txt
> @@ -0,0 +1,36 @@
> +Driver for Freescale USB 3.0 PHY
> +
> +Required properties:
> +
> +- compatible :	fsl,qoriq-usb3-phy
> +- reg :		register mappings for Parameter Configuration Register
> +		and Phy base offset.
> +- reg-names :	"param_ctrl" and "phy_base"
> +- phy_type :	For multi port host USB controllers, should be one of
> +		"ulpi", or "serial". For dual role USB controllers,
> +		should be one of "ulpi", "utmi", "utmi_wide", or "serial".

Do any of these really apply to a USB3 PHY?

Rob

> +
> +Example:
> +		usbphy0: usb3-phy@084F0000 {

usb-phy@...

> +                        compatible = "fsl,qoriq-usb3-phy";
> +                        reg = <0x0 0x01570070 0x0 0xC>, <0x0 0x084F0000 0x0 0x5000>;
> +                        reg-names = "param_ctrl", "phy_base";
> +                        #phy-cells = <0>;
> +                        phy_type = "utmi";
> +                };
> +
> +                usbphy1: usb3-phy@08500000 {
> +                        compatible = "fsl,qoriq-usb3-phy";
> +                        reg = <0x0 0x0157007C 0x0 0xC>, <0x0 0x08500000 0x0 0x5000>;
> +                        reg-names = "param_ctrl", "phy_base";
> +                        #phy-cells = <0>;
> +                        phy_type = "utmi";
> +                };
> +
> +                usbphy2: usb3-phy@08510000 {
> +                        compatible = "fsl,qoriq-usb3-phy";
> +                        reg = <0x0 0x01570088 0x0 0xC>, <0x0 0x08510000 0x0 0x5000>;
> +                        reg-names = "param_ctrl", "phy_base";
> +                        #phy-cells = <0>;
> +                        phy_type = "utmi";
> +                };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
