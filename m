From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: phy: add binding for the Lantiq VRX200
 and ARX300 PCIe PHYs
Date: Wed, 3 Jul 2019 07:25:02 -0600
Message-ID: <CAL_JsqJwd63-BJq2Bw5xnSN7XRGj=KmhHXcxRbsaKMX8jYdAjg@mail.gmail.com>
References: <20190702203523.2412-1-martin.blumenstingl@googlemail.com>
 <20190702203523.2412-2-martin.blumenstingl@googlemail.com>
 <CAL_Jsq+3H-cbrUna27RJ1o0w5MxaubkA9hcZjpWsaEYnx6bWQg@mail.gmail.com> <CAFBinCCaK5USb062tywd54y=6B0jTFsx1-k7NMfqvjmS7+5LgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCCaK5USb062tywd54y=6B0jTFsx1-k7NMfqvjmS7+5LgA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Paul Burton <paul.burton@mips.com>, Ralf Baechle <ralf@linux-mips.org>, Mark Rutland <mark.rutland@arm.com>, Martin Schiller <ms@dev.tdt.de>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 2, 2019 at 5:37 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Rob,
>
> On Wed, Jul 3, 2019 at 1:34 AM Rob Herring <robh+dt@kernel.org> wrote:
> [...]
> > > +  lantiq,rcu:
> > > +    maxItems: 1
> > > +    description: phandle to the RCU syscon
> >
> > You need to define the type (and drop maxItems):
> >
> > $ref: /schemas/types.yaml#/definitions/phandle
> thank you for this hint - the examples I used didn't have it
>
> > > +
> > > +  lantiq,rcu-endian-offset:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: the offset of the endian registers for this PHY instance in the RCU syscon
> > > +
> > > +  lantiq,rcu-big-endian-mask:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: the mask to set the PDI (PHY) registers for this PHY instance to big endian
> > > +
> > > +required:
> > > +  - "#phy-cells"
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - resets
> > > +  - reset-names
> > > +  - lantiq,rcu
> > > +  - lantiq,rcu-endian-offset
> > > +  - lantiq,rcu-big-endian-mask
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    pcie0_phy: phy@106800 {
> > > +        compatible = "lantiq,vrx200-pcie-phy";
> > > +        reg = <0x106800 0x100>;
> > > +        lantiq,rcu = <&rcu0>;
> > > +        lantiq,rcu-endian-offset = <0x4c>;
> > > +        lantiq,rcu-big-endian-mask = <0x80>; /* bit 7 */
> > > +        big-endian;
> >
> > The example will fail to validate because big-endian is not listed as
> > a property and you have 'additionalProperties: false'. So you have to
> > either list big-endian or drop additionalProperties.
> good catch, thank you.
> I'll add big-endian and little-endian as allowed (but optional) properties
>
> > Note that the examples are validated against the schema in linux-next now.
> I tested this with yesterday's linux-next tree and it didn't fail for me
> do you have any hint how I can run this validation myself?

It's not a default target:

make dt_binding_check

Rob
