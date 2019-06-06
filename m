From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: add binding for USBSS-DRD controller.
Date: Thu, 6 Jun 2019 15:08:55 +0300
Message-ID: <f032b3f3-409d-b0fc-8d5f-01c898b4c7a7@ti.com>
References: <1559729030-16390-1-git-send-email-pawell@cadence.com>
 <1559729030-16390-2-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559729030-16390-2-git-send-email-pawell@cadence.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, felipe.balbi@linux.intel.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, jpawar@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

Pawel,

On 05/06/2019 13:03, Pawel Laszczak wrote:
> This patch aim at documenting USB related dt-bindings for the
> Cadence USBSS-DRD controller.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
>  .../devicetree/bindings/usb/cdns-usb3.txt     | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cdns-usb3.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/cdns-usb3.txt b/Documentation/devicetree/bindings/usb/cdns-usb3.txt
> new file mode 100644
> index 000000000000..1d2b449e3cb4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cdns-usb3.txt
> @@ -0,0 +1,30 @@
> +Binding for the Cadence USBSS-DRD controller
> +
> +Required properties:
> +  - reg: Physical base address and size of the controller's register areas.
> +	 Controller has 3 different regions:
> +	 region 1 - HOST registers area
> +	 region 2 - DEVICE registers area
> +	 region 3 - OTG/DRD registers area
> +  - reg-names - register memory area names:
> +	"xhci" - for HOST registers space
> +	"dev" - for DEVICE registers space
> +	"otg" - for OTG/DRD registers space
> +  - compatible: Should contain: "cdns,usb3-1.0.0" or "cdns,usb3-1.0.1"
> +  - interrupts: Interrupts used by cdns3 controller.

Since we are requesting 3 separate named interrupts in code we need to
mention them here.

> +
> +Optional properties:
> + - maximum-speed : valid arguments are "super-speed", "high-speed" and
> +                   "full-speed"; refer to usb/generic.txt
> + - dr_mode: Should be one of "host", "peripheral" or "otg".
> + - phys: reference to the USB PHY
> +
> +Example:
> +	usb@f3000000 {
> +		compatible = "cdns,usb3-1.0.1";
> +		interrupts = <USB_IRQ  7 IRQ_TYPE_LEVEL_HIGH>;

This example won't work as code requests for 3 separate interrupts.

> +		reg = <0xf3000000 0x10000	/* memory area for HOST registers */
> +			0xf3010000 0x10000	/* memory area for DEVICE registers */
> +			0xf3020000 0x10000>;	/* memory area for OTG/DRD registers */
> +		reg-names = "xhci", "dev", "otg";
> +	};
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
