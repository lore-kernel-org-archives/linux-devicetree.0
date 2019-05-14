Return-Path: <robherring2@gmail.com>
Date: Tue, 14 May 2019 13:23:40 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 26/29] PCI: Add DT binding for "reset-gpios" property
Message-ID: <20190514182340.GA32467@bogus>
References: <20190513180744.16493-1-mmaddireddy@nvidia.com>
 <20190513180744.16493-27-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513180744.16493-27-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: thierry.reding@gmail.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 13 May 2019 23:37:41 +0530, Manikanta Maddireddy wrote:
> Add DT binding for "reset-gpios" property which supports GPIO based PERST#
> signal.
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> V3: Moved to common pci binding doc
> 
> V2: Using standard "reset-gpio" property
> 
>  Documentation/devicetree/bindings/pci/pci.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
