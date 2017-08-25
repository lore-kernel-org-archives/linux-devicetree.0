From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: PCI: rockchip: Add support for pcie
 wake irq
Date: Fri, 25 Aug 2017 11:20:00 -0700
Message-ID: <20170825181959.GA64040@google.com>
References: <20170822031934.8675-1-jeffy.chen@rock-chips.com>
 <20170822031934.8675-4-jeffy.chen@rock-chips.com>
 <20170825181439.d3hlwrcbmcss3sx6@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170825181439.d3hlwrcbmcss3sx6@rob-hp-laptop>
Sender: linux-pci-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jeffy Chen <jeffy.chen@rock-chips.com>, linux-kernel@vger.kernel.org, bhelgaas@google.com, shawn.lin@rock-chips.com, dianders@chromium.org, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 25, 2017 at 01:14:39PM -0500, Rob Herring wrote:
> On Tue, Aug 22, 2017 at 11:19:33AM +0800, Jeffy Chen wrote:
> > Add an optional interrupt for PCIE_WAKE pin.
> > 
> > Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> > ---
> > 
> > Changes in v4: None
> > Changes in v3: None
> > Changes in v2: None
> > 
> >  .../devicetree/bindings/pci/rockchip-pcie.txt        | 20 ++++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> > index 5678be82530d..9f6504129e80 100644
> > --- a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> > +++ b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> > @@ -20,10 +20,13 @@ Required properties:
> >  - msi-map: Maps a Requester ID to an MSI controller and associated
> >  	msi-specifier data. See ./pci-msi.txt
> >  - interrupts: Three interrupt entries must be specified.
> > -- interrupt-names: Must include the following names
> > -	- "sys"
> > -	- "legacy"
> > -	- "client"
> > +- interrupt-names: Include the following names
> > +	Required:
> > +		- "sys"
> > +		- "legacy"
> > +		- "client"
> > +	Optional:
> > +		- "wake"
> 
> Use the wakeup source binding:
> Documentation/devicetree/bindings/power/wakeup-source.txt

And I suppose this means we'd fall under this paragraph?

    "However if the devices have dedicated interrupt as the wakeup source
    then they need to specify/identify the same using device specific
    interrupt name. In such cases only that interrupt can be used as wakeup
    interrupt."

We don't expect *any* interrupt to qualify as PCI WAKE#; so we should
still also document the interrupt name ("wake"?) in
Documentation/devicetree/bindings/pci/pci.txt as Bjorn suggested, in
addition to using the 'wakeup-source' property documented there.

Brian
