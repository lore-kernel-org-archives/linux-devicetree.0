From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 1/8] bindings: PCI: designware: Example update
Date: Mon, 2 Apr 2018 10:53:23 +0530
Message-ID: <fa001440-0dfe-b84a-e5ef-9285043b5ede@ti.com>
References: <cover.1522235224.git.gustavo.pimentel@synopsys.com>
 <33aa86ee667e8b435db080b8c683cb5df1bd6544.1522235224.git.gustavo.pimentel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <33aa86ee667e8b435db080b8c683cb5df1bd6544.1522235224.git.gustavo.pimentel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gustavo Pimentel <gustavo.pimentel@synopsys.com>, bhelgaas@google.com, lorenzo.pieralisi@arm.com, Joao.Pinto@synopsys.com, jingoohan1@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wednesday 28 March 2018 05:08 PM, Gustavo Pimentel wrote:
> Changes the IP registers size to accommodate the ATU unroll space.
> 
> Replaces "ctrlreg" reg-name by "dbi" to be coherent with similar drivers.
> 
> Replaces the pcie base address example by a real pcie base address in use.
> 
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
>  Documentation/devicetree/bindings/pci/designware-pcie.txt | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> index 1da7ade..6300762 100644
> --- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> @@ -1,7 +1,8 @@
>  * Synopsys DesignWare PCIe interface
>  
>  Required properties:
> -- compatible: should contain "snps,dw-pcie" to identify the core.
> +- compatible:
> +	"snps,dw-pcie" for RC mode;

I think irrespective of RC mode or EP mode, "snps,dw-pcie" can be used to
identify the pcie core?
>  - reg: Should contain the configuration address space.
>  - reg-names: Must be "config" for the PCIe configuration space.
>      (The old way of getting the configuration address space from "ranges"
> @@ -41,11 +42,11 @@ EP mode:
>  
>  Example configuration:
>  
> -	pcie: pcie@dffff000 {
> +	pcie: pcie@dfc00000 {
>  		compatible = "snps,dw-pcie";
> -		reg = <0xdffff000 0x1000>, /* Controller registers */
> -		      <0xd0000000 0x2000>; /* PCI config space */
> -		reg-names = "ctrlreg", "config";
> +		reg = <0xdfc00000 0x302000>, /* IP registers */

which version of synopsys IP is this. I think the ideal thing to do here is to
have a separate register space for iATU.

Thanks
Kishon
