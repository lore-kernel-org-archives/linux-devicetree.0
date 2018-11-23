From: Roger Quadros <rogerq@ti.com>
Subject: Re: [RFC PATCH v2 03/15] dt-bindings: add binding for USBSS-DRD
 controller.
Date: Fri, 23 Nov 2018 12:53:06 +0200
Message-ID: <5BF7DC12.4060600@ti.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-4-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542535751-16079-4-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On 18/11/18 12:08, Pawel Laszczak wrote:
> Thsi patch aim at documenting USB related dt-bindings for the

s/Thsi/This

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
> +  - compatible: Should contain: "cdns,usb3"
> +  - interrupts: Interrupt specifier. Refer to interrupt bindings.

Do you also comply with USB generic bindings for dr_mode, speed, etc?
i.e. Documentation/devicetree/bindings/usb/generic.txt

If yes it must be mentioned in Optional properties:

> +
> +
> +Example:
> +	cdns3@f3000000 {
> +		compatible = "cdns,usb3";
> +		interrupts = <USB_IRQ  7 IRQ_TYPE_LEVEL_HIGH>;
> +		reg = <0xf3000000 0x10000	//memory area for OTG/DRD registers
> +			0xf3010000 0x10000	//memory area for HOST registers
> +			0xf3020000 0x10000>;	//memory area for Device registers
> +	};
> +
> 

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
