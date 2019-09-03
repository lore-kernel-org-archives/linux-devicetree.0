From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: intel-sdxc-phy: Add YAML schema
 for LGM SDXC PHY
Date: Tue, 3 Sep 2019 11:34:16 +0100
Message-ID: <CAL_Jsq+f27t5Wu+qtynDd_O9vBVZFKHCrgCP7WhyGo+W1y-XAA@mail.gmail.com>
References: <20190828124315.48448-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190828124315.48448-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190902033716.GA18092@bogus> <9f4d6bdd-072a-ab71-1ef1-1d00c22bd064@linux.intel.com>
 <CAL_JsqKm=-5F-Ej1mzRaygJnjS2Lec6uJF4J3vfCnqdkQNNbug@mail.gmail.com> <39d6fe60-e9f5-d205-ec6c-4a3143fe1e13@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <39d6fe60-e9f5-d205-ec6c-4a3143fe1e13@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ramuthevar, Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 3, 2019 at 11:08 AM Ramuthevar, Vadivel MuruganX
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>
> Hi Rob,
>
>   Thank you so much for prompt reply.
>
> On 3/9/2019 5:19 PM, Rob Herring wrote:
> > On Tue, Sep 3, 2019 at 2:57 AM Ramuthevar, Vadivel MuruganX
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >> Hi Rob,
> >>
> >> Thank you for review comments.
> >>
> >> On 2/9/2019 9:38 PM, Rob Herring wrote:
> >>> On Wed, Aug 28, 2019 at 08:43:14PM +0800, Ramuthevar,Vadivel MuruganX wrote:
> >>>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> >>>>
> >>>> Add a YAML schema to use the host controller driver with the
> >>>> SDXC PHY on Intel's Lightning Mountain SoC.
> >>>>
> >>>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> >>>> ---
> >>>>    .../bindings/phy/intel,lgm-sdxc-phy.yaml           | 52 ++++++++++++++++++++++
> >>>>    .../devicetree/bindings/phy/intel,syscon.yaml      | 33 ++++++++++++++
> >>>>    2 files changed, 85 insertions(+)
> >>>>    create mode 100644 Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
> >>>>    create mode 100644 Documentation/devicetree/bindings/phy/intel,syscon.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml b/Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..99647207b414
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
> >>>> @@ -0,0 +1,52 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/phy/intel,lgm-sdxc-phy.yaml#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Intel Lightning Mountain(LGM) SDXC PHY Device Tree Bindings
> >>>> +
> >>>> +maintainers:
> >>>> +  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> >>>> +
> >>>> +allOf:
> >>>> +  - $ref: "intel,syscon.yaml"
> >>> You don't need this. It should be selected and applied by the compatible
> >>> string matching.
> >> Agreed, fix it in the next patch.
> >>>> +
> >>>> +description: Binding for SDXC PHY
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: intel,lgm-sdxc-phy
> >>>> +
> >>>> +  intel,syscon:
> >>>> +    description: phandle to the sdxc through syscon
> >>>> +
> >>>> +  clocks:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  clock-names:
> >>>> +    maxItems: 1
> >>>> +
> >>>> +  "#phy-cells":
> >>>> +    const: 0
> >>>> +
> >>>> +required:
> >>>> +  - "#phy-cells"
> >>>> +  - compatible
> >>>> +  - intel,syscon
> >>>> +  - clocks
> >>>> +  - clock-names
> >>>> +
> >>>> +additionalProperties: false
> >>>> +
> >>>> +examples:
> >>>> +  - |
> >>>> +    sdxc_phy: sdxc_phy {
> >>>> +        compatible = "intel,lgm-sdxc-phy";
> >>>> +        intel,syscon = <&sysconf>;
> >>> Make this a child of the below node and then you don't need this.
> >>>
> >>> If there's a register address range associated with this, then add a reg
> >>> property.
> >> Thanks for comments,  I have defined herewith example
> >>
> >> sysconf: chiptop@e0020000 {
> >>               compatible = "intel,syscon";
> > Needs to be SoC specific value.
> Agreed! it should be "intel, lgm-syscon"
> >>               reg = <0xe0020000 0x100>;
> >>
> >>               emmc_phy: emmc_phy {
> >>                   compatible = "intel,lgm-emmc-phy";
> >>                   intel,syscon = <&sysconf>;
> > This is redundant because you can just get the parent node.
> >
> > If there's a defined register range within the 'intel,syscon' block
> > then define it here with 'reg'.
>
> Agreed!, avoided redundant
>
> sysconf: chiptop@e0020000 {
>              compatible = "intel,lgm-syscon";
>              emmc_phy: emmc_phy {
>                  compatible = "intel,lgm-emmc-phy";
>                  reg = <0xe0020000 0x100>;

This is the same addresses you had for the parent, so that doesn't
seem right. The parent should have the entire range and then the child
nodes only the addresses for their functions. However, if the
registers are all interleaved then you can really put 'reg' in the
child nodes and just have it only in the parent. We don't want to have
overlapping addresses in DT.

Rob
