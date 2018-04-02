From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 3/8] bindings: PCI: designware: Add support for the EP in
 designware driver
Date: Mon, 2 Apr 2018 11:05:05 +0530
Message-ID: <405911c8-fffc-5bd7-76c5-f7aabde3b7bc@ti.com>
References: <cover.1522235224.git.gustavo.pimentel@synopsys.com>
 <dd582bfc2780679b7a092d23547c316234a84c34.1522235224.git.gustavo.pimentel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dd582bfc2780679b7a092d23547c316234a84c34.1522235224.git.gustavo.pimentel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gustavo Pimentel <gustavo.pimentel@synopsys.com>, bhelgaas@google.com, lorenzo.pieralisi@arm.com, Joao.Pinto@synopsys.com, jingoohan1@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Wednesday 28 March 2018 05:08 PM, Gustavo Pimentel wrote:
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

Please add a commit message.
> ---
>  Documentation/devicetree/bindings/pci/designware-pcie.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> index 6300762..4bb2e08 100644
> --- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> @@ -3,6 +3,7 @@
>  Required properties:
>  - compatible:
>  	"snps,dw-pcie" for RC mode;
> +	"snps,dw-pcie-ep" for EP mode;
>  - reg: Should contain the configuration address space.
>  - reg-names: Must be "config" for the PCIe configuration space.
>      (The old way of getting the configuration address space from "ranges"
> @@ -56,3 +57,15 @@ Example configuration:
>  		#interrupt-cells = <1>;
>  		num-lanes = <1>;
>  	};
> +or
> +	pcie_ep: pcie_ep@dfc00000 {
> +		compatible = "snps,dw-pcie-ep";
> +		reg = <0xdfc00000 0x0001000>, /* IP registers 1 */
> +		      <0xdfc01000 0x0001000>, /* IP registers 2 */

Doesn't this have iATU unroll space?

Thanks
Kishon
