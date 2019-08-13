From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/8] dt-bindings: PCI: Add Amazon's Annapurna Labs PCIe
 host bridge binding
Date: Tue, 13 Aug 2019 14:46:19 -0600
Message-ID: <CAL_Jsq+ME-faxK8o7rq8gyYC8cjtr+yZOz8A47zKMrjYAtmumw@mail.gmail.com>
References: <20190723092529.11310-1-jonnyc@amazon.com> <20190723092711.11786-1-jonnyc@amazon.com>
 <20190813153046.GA31480@bogus> <06c198ff2f8f9b1b29283a7b8764ab776c1e574b.camel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <06c198ff2f8f9b1b29283a7b8764ab776c1e574b.camel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chocron, Jonathan" <jonnyc@amazon.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "Woodhouse, David" <dwmw@amazon.co.uk>, "Hanoch, Uri" <hanochu@amazon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "Wasserstrom, Barak" <barakw@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "Shenhar, Talel" <talel@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 10:49 AM Chocron, Jonathan <jonnyc@amazon.com> wrote:
>
> On Tue, 2019-08-13 at 09:30 -0600, Rob Herring wrote:
> > On Tue, Jul 23, 2019 at 12:27:08PM +0300, Jonathan Chocron wrote:
> > > Document Amazon's Annapurna Labs PCIe host bridge.
> > >
> > > Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> > > ---
> > >  .../devicetree/bindings/pci/pcie-al.txt       | 45
> > > +++++++++++++++++++
> > >  MAINTAINERS                                   |  3 +-
> > >  2 files changed, 47 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/devicetree/bindings/pci/pcie-
> > > al.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/pci/pcie-al.txt
> > > b/Documentation/devicetree/bindings/pci/pcie-al.txt
> > > new file mode 100644
> > > index 000000000000..89876190eb5a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pci/pcie-al.txt
> > > @@ -0,0 +1,45 @@
> > > +* Amazon Annapurna Labs PCIe host bridge
> > > +
> > > +Amazon's Annapurna Labs PCIe Host Controller is based on the
> > > Synopsys DesignWare
> > > +PCI core.
> > > +It shares common functions with the PCIe DesignWare core driver
> > > and inherits
> >
> > Driver details are irrelevant to the binding.
> >
> Will remove.
>
> > > +common properties defined in
> > > Documentation/devicetree/bindings/pci/designware-pcie.txt.
> > > +Properties of the host controller node that differ from it are:
> > > +
> > > +- compatible:
> > > +   Usage: required
> > > +   Value type: <stringlist>
> > > +   Definition: Value should contain
> > > +                   - "amazon,al-pcie"
> >
> > Needs to be SoC specific.
> >
> I'm not sure I follow. The PCIe controller can be implemented in
> different SoCs. Could you please clarify?

All the features, bugs, and integration will be exactly the same on
all SoCs and you will never need to distinguish?

This is standard convention for compatible strings and how you avoid
updating the DT (part of firmware) when you find some difference the
OS needs to handle down the road.

If the next SoC is 'the same', then you do:

compatible = "amazon,newsoc-pcie", "amazon,oldsoc-pcie";

Rob
