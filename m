Return-Path: <helgaas@kernel.org>
Date: Thu, 11 Apr 2019 15:18:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 26/30] dt-bindings: pci: tegra: Document
 nvidia,plat-gpios optional prop
Message-ID: <20190411201813.GT256045@google.com>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-27-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190411170355.6882-27-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 11, 2019 at 10:33:51PM +0530, Manikanta Maddireddy wrote:
> Document "nvidia,plat-gpios" optional property which supports configuring
> of platform specific gpios.

s/gpios/GPIOs/ (also in the description below)

Acronyms in commit logs, comments, printks, etc should be capitalized.

> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> index fbbd3bcb3435..dca8393b86d1 100644
> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> @@ -73,6 +73,8 @@ Optional properties:
>    pinctrl phandle to allow driver to explicitly put PCIe IO in DPD state.
>  - pinctrl-1: PCIe IO(bias & REFCLK) deep power down(DPD) enable state.
>    Pass pinctrl phandle to allow driver bring PCIe IO out of DPD state.
> +- nvidia,plat-gpios: A list of platform specific gpios which controls
> +  endpoint's internal regulator or PCIe logic.
>  
>  Required properties on Tegra124 and later (deprecated):
>  - phys: Must contain an entry for each entry in phy-names.
> @@ -567,6 +569,7 @@ Board DTS:
>  		pci@2,0 {
>  			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-4}>;
>  			phy-names = "pcie-0";
> +			nvidia,plat-gpios = <&gpio TEGRA_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
>  			status = "okay";
>  		};
>  	};
> -- 
> 2.17.1
> 
