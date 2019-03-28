From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: phy: Add binding for Mediatek MT7621
 PCIe PHY
Date: Thu, 28 Mar 2019 17:06:05 +0100
Message-ID: <CAMhs-H8akrBVWf5G2unAYmEAv852jvGdieZVk=o59LWW8FnxSw@mail.gmail.com>
References: <20190314132210.654-1-sergio.paracuellos@gmail.com>
 <20190314132210.654-3-sergio.paracuellos@gmail.com> <20190328154238.GA20934@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328154238.GA20934@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: kishon@ti.com, linux-kernel <linux-kernel@vger.kernel.org>, driverdev-devel@linuxdriverproject.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for the review.

On Thu, Mar 28, 2019 at 4:42 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Mar 14, 2019 at 02:22:10PM +0100, Sergio Paracuellos wrote:
> > Add bindings to describe Mediatek MT7621 PCIe PHY.
>
> Binding should come before the driver.

Do you mean this should be PATCH 1 of the series?

>
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/phy/mediatek,mt7621-pci-phy.txt  | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.txt
> >
> > diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.txt b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.txt
> > new file mode 100644
> > index 000000000000..8addedbe815e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.txt
> > @@ -0,0 +1,54 @@
> > +Mediatek Mt7621 PCIe PHY
> > +
> > +Required properties:
> > +- compatible: must be "mediatek,mt7621-pci-phy"
> > +- reg: base address and length of the PCIe PHY block
> > +- #address-cells: must be 1
> > +- #size-cells: must be 0
> > +
> > +Each PCIe PHY should be represented by a child node
> > +
> > +Required properties For the child node:
> > +- reg: the PHY ID
> > +0 - PCIe RC 0
> > +1 - PCIe RC 1
> > +- #phy-cells: must be 0
> > +
> > +Example:
> > +     pcie0_phy: pcie-phy@1e149000 {
> > +             compatible = "mediatek,mt7621-pci-phy";
> > +             reg = <0x1e149000 0x0700>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             pcie0_port: pcie-phy@0 {
> > +                     reg = <0>;
> > +                     #phy-cells = <0>;
> > +             };
> > +
> > +             pcie1_port: pcie-phy@1 {
> > +                     reg = <1>;
> > +                     #phy-cells = <0>;
> > +             };
>
> If each phy port doesn't have its own resources, then you don't need
> child nodes. Just set #phy-cells to 1.

I see. I will change those two into:

pcie0_phy: pcie-phy@1e149000 {
     compatible = "mediatek,mt7621-pci-phy";
     reg = <0x1e149000 0x0700>;
     #phy-cells = <1>;
};

pcie1_phy: pcie-phy@1e14a000 {
     compatible = "mediatek,mt7621-pci-phy";
     reg = <0x1e14a000 0x0700>;
     #phy-cells = <0>;
};

>
> > +     };
> > +
> > +     pcie1_phy: pcie-phy@1e14a000 {
> > +             compatible = "mediatek,mt7621-pci-phy";
> > +             reg = <0x1e14a000 0x0700>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             pcie2_port: pcie-phy@0 {
> > +                     reg = <0>;
> > +                     #phy-cells = <0>;
> > +             };
> > +     };
> > +
> > +     /* users of the PCIe phy */
> > +
> > +     pcie: pcie@1e140000 {
> > +             ...
> > +             ...
> > +             phys = <&pcie0_port>, <&pcie1_port>, <&pcie2_port>;
> > +             phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
> > +     };

I think changing the previous one as you suggested make clients to do now:

pcie: pcie@1e140000 {
      phys = <&pcie0_phy 0>, <&pcie0_phy 1>, <&pcie1_phy>;
      phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
};

Am I right?

I have to figure out how to change the driver to achieve this changes
also to properly get the phy.

Thanks, I will make the changes in staging to be tested by Neil a send
v2 PATCHEs for this with your suggested changes.

Best regards and thanks again for your time.

Sergio Paracuellos
