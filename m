From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: Add Stingray USB PHY binding
 document
Date: Fri, 22 Feb 2019 11:20:42 -0600
Message-ID: <20190222172042.GA6792@bogus>
References: <1550658842-19167-1-git-send-email-srinath.mannam@broadcom.com>
 <1550658842-19167-2-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550658842-19167-2-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Tejun Heo <tj@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 04:04:00PM +0530, Srinath Mannam wrote:
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
> index 0000000..da19236
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> @@ -0,0 +1,62 @@
> +Broadcom Stingray USB PHY
> +
> +Required properties:
> + - compatible : should be one of the listed compatibles
> +	- "brcm,sr-usb-combo-phy" is a combo PHY has one SS PHY and one HS PHY.
> +	- "brcm,sr-usb-hs-phy" has a single HS PHY.
> + - reg: offset and length of the PHY blocks registers
> + - address-cells: should be 1
> + - size-cells: should be 0
> +
> +Sub-nodes:
> +  brcm,sr-usb-combo-phy have two sub-nodes for one SS PHY and one HS PHY.
> +
> +Sub-nodes required properties:
> + - reg: required for brcm,sr-usb-phy model PHY.
> +	reg value 0 is HS PHY and 1 is SS PHY.
> + - phy-cells: generic PHY binding; must be 0
> +
> +Refer to phy/phy-bindings.txt for the generic PHY binding properties
> +
> +Example:
> +	usbphy0: usb-phy@0 {
> +		compatible = "brcm,sr-usb-combo-phy";
> +		reg = <0x00000000 0x100>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usb0_phy0: phy@0 {
> +			reg = <0>;
> +			#phy-cells = <0>;
> +		};
> +
> +		usb0_phy1: phy@1 {
> +			reg = <1>;
> +			#phy-cells = <0>;
> +		};

Again, you don't need child nodes here. There are not any per child 
resources. Clients can refer to <&usbphy0 1> just as easily as 
<&usb0_phy1>. This is why we have #phy-cells.

Rob
