From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add binding doc for Stingray
 PCIe PHY
Date: Fri, 29 Jun 2018 12:06:59 +0530
Message-ID: <424c21ea-e751-16e8-71b0-d05537b9e0b3@ti.com>
References: <1529540316-21706-1-git-send-email-ray.jui@broadcom.com>
 <1529540316-21706-2-git-send-email-ray.jui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529540316-21706-2-git-send-email-ray.jui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

+Rob and device tree list

On Thursday 21 June 2018 05:48 AM, Ray Jui wrote:
> Add binding document for Stingray PCIe PHYs for both PAXB and PAXC based
> root complex
> 
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  .../devicetree/bindings/phy/brcm,sr-pcie-phy.txt   | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt b/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
> new file mode 100644
> index 0000000..c2eede6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/brcm,sr-pcie-phy.txt
> @@ -0,0 +1,39 @@
> +Broadcom Stingray PCIe PHY
> +
> +Required properties:
> +- compatible: must be "brcm,sr-pcie-phy"
> +- brcm,sr-cdru: phandle to the CDRU syscon node
> +- brcm,sr-mhb: phandle to the MHB syscon node
> +- #phy-cells: Must be 1, denotes the PHY index
> +
> +For PAXB based root complex, one can have a configuration of up to 8 PHYs
> +PHY index goes from 0 to 7
> +
> +For the internal PAXC based root complex, PHY index is always 8
> +
> +Example:
> +	mhb: syscon@60401000 {
> +		compatible = "brcm,sr-mhb", "syscon";
> +		reg = <0 0x60401000 0 0x38c>;
> +	};
> +
> +	cdru: syscon@6641d000 {
> +		compatible = "brcm,sr-cdru", "syscon";
> +		reg = <0 0x6641d000 0 0x400>;
> +	};
> +
> +	pcie_phy: phy {
> +		compatible = "brcm,sr-pcie-phy";
> +		brcm,sr-cdru = <&cdru>;
> +		brcm,sr-mhb = <&mhb>;
> +		#phy-cells = <1>;
> +	};
> +
> +	/* users of the PCIe PHY */
> +
> +	pcie0: pcie@48000000 {
> +		...
> +		...
> +		phys = <&pcie_phy 0>;
> +		phy-names = "pcie-phy";
> +	};
> 
