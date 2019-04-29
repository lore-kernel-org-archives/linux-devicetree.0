Return-Path: <robherring2@gmail.com>
Date: Mon, 29 Apr 2019 13:33:54 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 28/30] dt-bindings: pci: tegra: Document nvidia,rst-gpio
 optional prop
Message-ID: <20190429183354.GA9331@bogus>
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-29-mmaddireddy@nvidia.com>
 <20190415142012.GB29254@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415142012.GB29254@ulmo>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Manikanta Maddireddy <mmaddireddy@nvidia.com>, bhelgaas@google.com, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 15, 2019 at 04:20:12PM +0200, Thierry Reding wrote:
> On Thu, Apr 11, 2019 at 10:33:53PM +0530, Manikanta Maddireddy wrote:
> > Document "nvidia,rst-gpio" optional property which supports GPIO based
> > PERST# signal.
> > 
> > Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> > ---
> >  Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > index dca8393b86d1..23928fd59538 100644
> > --- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> > @@ -75,6 +75,8 @@ Optional properties:
> >    Pass pinctrl phandle to allow driver bring PCIe IO out of DPD state.
> >  - nvidia,plat-gpios: A list of platform specific gpios which controls
> >    endpoint's internal regulator or PCIe logic.
> > +- nvidia,rst-gpio: If GPIO is used as PERST# signal instead of available
> > +  SFIO, add this property with phandle to GPIO controller and GPIO number.
> 
> GPIO properties are pretty much standardized, so this should really be
> called just "reset-gpio".

"reset-gpios" actually.

Rob
