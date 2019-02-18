From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: Add Stingray USB PHY binding
 document
Date: Mon, 18 Feb 2019 11:22:21 -0600
Message-ID: <20190218172221.GA20334@bogus>
References: <1549474347-7224-1-git-send-email-srinath.mannam@broadcom.com>
 <1549474347-7224-2-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549474347-7224-2-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Tejun Heo <tj@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Wed, Feb 06, 2019 at 11:02:25PM +0530, Srinath Mannam wrote:
> Add DT binding document for Stingray USB PHY.
> 
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  .../bindings/phy/brcm,stingray-usb-phy.txt         | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> new file mode 100644
> index 0000000..bfe1367
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> @@ -0,0 +1,62 @@
> +Broadcom Stingray USB PHY
> +
> +Required properties:
> + - compatible : should be one of the listed compatibles
> +	- "brcm,sr-usb-phy"
> +	- "brcm,sr-usb-phy-v2"

SoC specific compatibles are preferred. Version numbers can be used but 
should follow some documented scheme and be meaningful. What we don't 
want is just Linux developers making up numbering.

> + - reg: offset and length of the PHY blocks registers
> + - address-cells: should be 1
> + - size-cells: should be 0
> +
> +Sub-nodes:
> +  Each port's PHY should be represented as a sub-node.
> +
> +Sub-nodes required properties:
> + - reg: required for brcm,sr-usb-phy model phy.
> +	reg value 0 is HS phy and 1 is SS phy.
> + - phy-cells: generic PHY binding; must be 0
> +
> +Refer to phy/phy-bindings.txt for the generic PHY binding properties
> +
> +Example:
> +	usbphy0: usb-phy@0 {
> +		compatible = "brcm,sr-usb-phy";
> +		reg = <0x00000000 0x100>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usb0_phy0: phy@0 {
> +			reg = <0>;
> +			#phy-cells = <0>;

Unless there's DT resources for each child node, you don't need these. 
Just make #phy-cells 1 in the parent.

Rob
