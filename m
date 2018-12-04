From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v2 03/15] dt-bindings: add binding for USBSS-DRD
 controller.
Date: Tue, 4 Dec 2018 16:41:58 -0600
Message-ID: <20181204224158.GA29726@bogus>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-4-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542535751-16079-4-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On Sun, Nov 18, 2018 at 10:08:59AM +0000, Pawel Laszczak wrote:
> Thsi patch aim at documenting USB related dt-bindings for the

typo

> Cadence USBSS-DRD controller.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  .../devicetree/bindings/usb/cdns3-usb.txt       | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cdns3-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/cdns3-usb.txt b/Documentation/devicetree/bindings/usb/cdns3-usb.txt
> new file mode 100644
> index 000000000000..f9e953f32d47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cdns3-usb.txt
> @@ -0,0 +1,17 @@
> +Binding for the Cadence USBSS-DRD controller
> +
> +Required properties:
> +  - reg: Physical base address and size of the controller's register area.

1 or 3 regions? If 3, what is each one and the order?

> +  - compatible: Should contain: "cdns,usb3"

Only one version and one set of bugs?

> +  - interrupts: Interrupt specifier. Refer to interrupt bindings.

How many interrupts?

> +
> +
> +Example:
> +	cdns3@f3000000 {

usb@...

> +		compatible = "cdns,usb3";
> +		interrupts = <USB_IRQ  7 IRQ_TYPE_LEVEL_HIGH>;
> +		reg = <0xf3000000 0x10000	//memory area for OTG/DRD registers
> +			0xf3010000 0x10000	//memory area for HOST registers
> +			0xf3020000 0x10000>;	//memory area for Device registers
> +	};
> +
> -- 
> 2.17.1
> 
