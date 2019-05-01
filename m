Return-Path: <robherring2@gmail.com>
Date: Wed, 1 May 2019 14:52:05 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 23/28] dt-bindings: pci: tegra: Document PCIe DPD
 pinctrl optional prop
Message-ID: <20190501195205.GA16256@bogus>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-24-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190423092825.759-24-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 23 Apr 2019 14:58:20 +0530, Manikanta Maddireddy wrote:
> Document PCIe DPD pinctrl optional property to put PEX clk & BIAS pads
> in low power mode.
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: Using standard pinctrl names, default and idle
> 
>  .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt       | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
