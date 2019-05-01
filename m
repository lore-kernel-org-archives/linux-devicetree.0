Return-Path: <robherring2@gmail.com>
Date: Wed, 1 May 2019 14:58:04 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 26/28] dt-bindings: pci: tegra: Document reset-gpio
 optional prop
Message-ID: <20190501195804.GA16435@bogus>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-27-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190423092825.759-27-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: thierry.reding@gmail.com, bhelgaas@google.com, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 23, 2019 at 02:58:23PM +0530, Manikanta Maddireddy wrote:
> Document "reset-gpio" optional property which supports GPIO based PERST#
> signal.
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Using standard "reset-gpio" property
> 
>  .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt          | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> index 7939bca47861..4e75e017f660 100644
> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> @@ -162,6 +162,10 @@ Required properties:
>    - Root port 0 uses 4 lanes, root port 1 is unused.
>    - Both root ports use 2 lanes.
>  
> +Optional properties:
> +- reset-gpio: If GPIO is used as PERST# signal instead of available
> +  SFIO, add this property with phandle to GPIO controller and GPIO number.

'reset-gpios' is the preferred form.

This is already defined in several other drivers. Perhaps document in a 
common location and also parse the property in common code.

Rob
