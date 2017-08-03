From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: usb: Add documentation for NS2 IDM
 USB3
Date: Thu, 3 Aug 2017 14:08:38 -0500
Message-ID: <20170803190838.q4o7ijukgoliik5n@rob-hp-laptop>
References: <1501109787-15489-1-git-send-email-jon.mason@broadcom.com>
 <1501109787-15489-5-git-send-email-jon.mason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501109787-15489-5-git-send-email-jon.mason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Mason <jon.mason@broadcom.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 06:56:25PM -0400, Jon Mason wrote:
> Add documentation for IDM USB3 registers available in NS2 SoC
> 
> Signed-off-by: Jon Mason <jon.mason@broadcom.com>
> ---
>  Documentation/devicetree/bindings/usb/brcm,usb3-idm.txt | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/brcm,usb3-idm.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/brcm,usb3-idm.txt b/Documentation/devicetree/bindings/usb/brcm,usb3-idm.txt
> new file mode 100644
> index 000000000000..3618dbcbe890
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/brcm,usb3-idm.txt
> @@ -0,0 +1,14 @@
> +Broadcom IDM USB3 registers
> +
> +Required properties:
> +- compatible: "brcm,usb3-idm"
> +- reg: Base address and length of the USB registers
> +
> +
> +Example:
> +
> +usb3_idm: idm@67000000 {

I'm assuming these are all some misc registers in addition to the USB 
controller? If this is the USB controller itself, then use generic node 
names for the DT spec.

Acked-by: Rob Herring <robh@kernel.org>

> +        compatible = "brcm,usb3-idm";
> +        reg = <0x67000000 0x2000>;
> +};
> +
> -- 
> 2.7.4
> 
