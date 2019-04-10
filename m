Return-Path: <robherring2@gmail.com>
Date: Wed, 10 Apr 2019 09:13:31 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: phy: tegra-xusb: List PLL power supplies
Message-ID: <20190410141331.GA28160@bogus>
References: <20190404112511.28118-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190404112511.28118-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu,  4 Apr 2019 13:25:04 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> These power supplies provide power for various PLLs that are set up and
> driven by the XUSB pad controller. These power supplies were previously
> improperly added to the PCIe and XUSB controllers, but depending on the
> driver probe order, power to the PLLs will not be supplied soon enough
> and cause initialization to fail.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/phy/nvidia,tegra124-xusb-padctl.txt     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
