From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: add binding for the Lantiq
 VRX200 and ARX300 PCIe PHYs
Date: Mon, 7 Oct 2019 22:18:29 +0200
Message-ID: <CAFBinCDrEhCANr2V4mmhE62C8WNi=DBfyCh+yZ7jb0bXqUPfUA@mail.gmail.com>
References: <20190704122319.8983-1-martin.blumenstingl@googlemail.com>
 <20190704122319.8983-2-martin.blumenstingl@googlemail.com> <CAL_JsqJ9yUK2HNu9fLes1eEtEKdAZcXqBjGF90xKEuQh9fCU6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ9yUK2HNu9fLes1eEtEKdAZcXqBjGF90xKEuQh9fCU6g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "open list:MIPS" <linux-mips@vger.kernel.org>, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, Mark Rutland <mark.rutland@arm.com>, Martin Schiller <ms@dev.tdt.de>, mripard@kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Wed, Oct 2, 2019 at 4:37 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Thu, Jul 4, 2019 at 7:23 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Add the bindings for the PCIe PHY on Lantiq VRX200 and ARX300 SoCs.
> > The IP block contains settings for the PHY and a PLL.
> > The PLL mode is configurable through a dedicated #phy-cell in .dts.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  | 95 +++++++++++++++++++
> >  .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  | 11 +++
> >  2 files changed, 106 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> >  create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h
> >
> > diff --git a/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > new file mode 100644
> > index 000000000000..8a56a8526cef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/lantiq,vrx200-pcie-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Lantiq VRX200 and ARX300 PCIe PHY Device Tree Bindings
> > +
> > +maintainers:
> > +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > +
> > +properties:
> > +  "#phy-cells":
> > +    const: 1
> > +    description: selects the PHY mode as defined in <dt-bindings/phy/phy-lantiq-vrx200-pcie.h>
> > +
> > +  compatible:
> > +    enum:
> > +      - lantiq,vrx200-pcie-phy
> > +      - lantiq,arx300-pcie-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: PHY module clock
> > +      - description: PDI register clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: phy
> > +      - const: pdi
> > +
> > +  resets:
> > +    items:
> > +      - description: exclusive PHY reset line
> > +      - description: shared reset line between the PCIe PHY and PCIe controller
> > +
> > +  resets-names:
>
> This breaks 'make dt_binding_check'. It should be 'reset-names'.
sorry for the typo

Maxime has already fixed this (thank you!) and the fix has already
landed in 5.4-rc2 with f437ade3296bacaddb6d7882ba0515940f01daf4


Martin
