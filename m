From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: add binding for USBSS-DRD controller.
Date: Fri, 26 Apr 2019 12:21:43 +0300
Message-ID: <d7ca7260-9337-0779-459b-bfed15113db0@ti.com>
References: <1554882504-9010-1-git-send-email-pawell@cadence.com>
 <1554882504-9010-2-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554882504-9010-2-git-send-email-pawell@cadence.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, felipe.balbi@linux.intel.com, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

Hi Pawel,

On 10/04/2019 10:48, Pawel Laszczak wrote:
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
> +
> +Optional properties:
> + - maximum-speed : valid arguments are "super-speed", "high-speed" and
> +                   "full-speed"; refer to usb/generic.txt
> + - dr_mode: Should be one of "host", "peripheral" or "otg".
> + - phys: reference to the USB PHY

In your test platform is this a 2.0PHY or 3.0PHY? Typical platforms will have both.
Is there any power-on sequencing requirements for powering up these PHYs vs powering up the controller?

> +
> +Example:
> +	usb@f3000000 {
> +		compatible = "cdns,usb3-1.0.1";
> +		interrupts = <USB_IRQ  7 IRQ_TYPE_LEVEL_HIGH>;
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
