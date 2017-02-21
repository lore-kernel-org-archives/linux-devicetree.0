From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/3] PCI: imx6: Add code to support i.MX7D
Date: Tue, 21 Feb 2017 10:38:31 -0600
Message-ID: <CAL_Jsq+zo9cVEiT3p4oEL8UWqHNEVqszkC3htO-p+C2oFXPuSw@mail.gmail.com>
References: <20170207155027.7734-1-andrew.smirnov@gmail.com>
 <20170207155027.7734-4-andrew.smirnov@gmail.com> <20170215171700.5vz5seeihgtwn76p@rob-hp-laptop>
 <1487236340.13536.5.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487236340.13536.5.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 16, 2017 at 3:12 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Am Mittwoch, den 15.02.2017, 11:17 -0600 schrieb Rob Herring:
>> On Tue, Feb 07, 2017 at 07:50:27AM -0800, Andrey Smirnov wrote:
>> > Add various bits of code needed to support i.MX7D variant of the IP.
>> >
>> > Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>> > Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> > Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> > Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>> > Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> > Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> > Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/pci/fsl,imx6q-pcie.txt     |  13 ++-
>> >  drivers/pci/host/pci-imx6.c                        | 121 ++++++++++++++++-----
>> >  include/linux/mfd/syscon/imx7-iomuxc-gpr.h         |   4 +
>> >  3 files changed, 112 insertions(+), 26 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> > index 83aeb1f..11db2ab 100644
>> > --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> > +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> > @@ -4,7 +4,11 @@ This PCIe host controller is based on the Synopsis Designware PCIe IP
>> >  and thus inherits all the common properties defined in designware-pcie.txt.
>> >
>> >  Required properties:
>> > -- compatible: "fsl,imx6q-pcie", "fsl,imx6sx-pcie", "fsl,imx6qp-pcie"
>> > +- compatible:
>> > +   - "fsl,imx6q-pcie"
>> > +   - "fsl,imx6sx-pcie",
>> > +   - "fsl,imx6qp-pcie"
>> > +   - "fsl,imx7d-pcie"
>> >  - reg: base address and length of the PCIe controller
>> >  - interrupts: A list of interrupt outputs of the controller. Must contain an
>> >    entry for each entry in the interrupt-names property.
>> > @@ -34,6 +38,13 @@ Additional required properties for imx6sx-pcie:
>> >  - clock names: Must include the following additional entries:
>> >     - "pcie_inbound_axi"
>> >
>> > +Additional required properties for imx7d-pcie:
>> > +- power-domains: Must be set to a phandle pointing to PCIE_PHY power domain
>>
>> This domain is just the PHY? Seems like this needs a separate PHY
>> driver.
>>
> No, it's called the PHY power domain, as that is probably the part that
> draws the most power, but the PCIe core also looses it's state when this
> domain is powered down. So it's probably the complete core that is
> inside this domain.

A shared domain doesn't mean the phy and core should be 1 node. It is
the separate reset and clock for the PHY that tell me they should be
separate. And I'm pretty sure the DW block and PHY are separate. If
the PHY registers were part of the same register range, then I'd say
they should be one.

>> > +- resets: Must contain phandles to PCIE related reset lines exposed by SRC IP block
>> > +- reset-names: Must contain the following entires:
>> > +          - "pciephy"
>>
>> And for this too.
>>
>> > +          - "apps"
>> > +
>> >  Example:
>> >
>> >     pcie@0x01000000 {
>>
>> [...]
>>
>> > @@ -251,6 +261,10 @@ static void imx6_pcie_assert_core_reset(struct imx6_pcie *imx6_pcie)
>> >     u32 val, gpr1, gpr12;
>> >
>> >     switch (imx6_pcie->variant) {
>> > +   case IMX7D:
>> > +           reset_control_assert(imx6_pcie->pciephy_reset);
>> > +           reset_control_assert(imx6_pcie->apps_reset);
>> > +           break;
>> >     case IMX6SX:
>> >             regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
>> >                                IMX6SX_GPR12_PCIE_TEST_POWERDOWN,
>>
>> So the difference with i.MX7D is not really that it has a reset or not,
>> but some platforms use a reset driver and some do not. The latter should
>> be fixed.
>
> The resets on anything before i.MX7 are not in a separate reset driver,
> but are just some signals from the PCIe core wired into a syscon (IOMUX
> GPR) area. While we could invent a reset controller for those, I don't
> see how this would improve things. Especially as the reset on i.MX6
> seems to be some side-effect of the "power-down" signal of the core, so
> not strictly a reset.
>
> Also I don't see why we should change the binding for the driver with a
> long history of deployed DTs. That seems like a total waste of manpower.

We can debate whether or not we change existing platforms. Maybe that
doesn't make sense now. But best practices should be considered when
adding new bindings rather than just extending existing bindings. We
didn't split out PHYs at one time and now we generally do. I'm not so
concerned with just adding i.MX7D, but really the next chip (and the
next).

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
