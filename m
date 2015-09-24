From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC PATCH 1/2] usb: doc: Add bindings for ULPI platform driver
Date: Thu, 24 Sep 2015 17:10:35 +0800
Message-ID: <20150924091034.GB27847@shlinux2>
References: <1443012841-13673-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443012841-13673-1-git-send-email-sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 23, 2015 at 06:24:01PM +0530, Subbaraya Sundeep Bhatta wrote:
> This patch adds binding doc info for generic ULPI PHYs
> platform driver.
> 
> Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/ulpi-platform-phy.txt  |   34 ++++++++++++++++++++
>  1 files changed, 34 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt b/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
> new file mode 100644
> index 0000000..7b8cbb4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
> @@ -0,0 +1,34 @@
> +Platform driver for generic ULPI PHYs
> +
> +Required properties:
> +- compatible		: Should be "ulpi-phy"
> +- reg			: Physical base address and size of the USB
> +			  controller registers map to which this PHY
> +			  is connected.
> +- view-port		: Should contain viewport register offset of the
> +			  USB controller to which this PHY is connected
> +Optional properties:
> +- drv-vbus		: required if turning VBUS on/off has to be driven
> +			  by writing to PHY. This feature depends on board
> +			  design.
> +
> +Example:
> +Below example shows the PHY binding for Chipidea USB controller which has
> +ulpi viewport register at 0x0170
> +
> +		usb_phy0: phy0 {
> +                	compatible = "ulpi-phy";
> +                	reg = <0xe0002000 0x1000>;
> +                	view-port = <0x0170>;
> +                	drv-vbus;
> +        	};
> +
> +		usb0: usb@e0002000 {
> +                        compatible = "chipidea,usb2";
> +                        interrupt-parent = <&intc>;
> +                        interrupts = <0 21 4>;
> +                        reg = <0xe0002000 0x1000>;

Although just call devm_ioremap twice for the same register region
does not cause any errors, I am not sure if it will has other
potential problems. Cc: arm list.

> +                        phy_type = "ulpi";
> +			dr_mode = "host";
> +			usb-phy = <&usb_phy0>;
> +                };
> -- 
> 1.7.1
> 

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
