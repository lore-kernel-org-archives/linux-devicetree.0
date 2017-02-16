From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/3] PCI: imx6: Add code to support i.MX7D
Date: Wed, 15 Feb 2017 22:07:06 -0800
Message-ID: <CAHQ1cqH_y3104hD8k2qWDCH1PM0KpkFGwK=Q2WBT5g7asu8X4g@mail.gmail.com>
References: <20170207155027.7734-1-andrew.smirnov@gmail.com>
 <20170207155027.7734-4-andrew.smirnov@gmail.com> <20170215171700.5vz5seeihgtwn76p@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215171700.5vz5seeihgtwn76p@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Yurovsky <yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 15, 2017 at 9:17 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Feb 07, 2017 at 07:50:27AM -0800, Andrey Smirnov wrote:
>> Add various bits of code needed to support i.MX7D variant of the IP.
>>
>> Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>> Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/pci/fsl,imx6q-pcie.txt     |  13 ++-
>>  drivers/pci/host/pci-imx6.c                        | 121 ++++++++++++++++-----
>>  include/linux/mfd/syscon/imx7-iomuxc-gpr.h         |   4 +
>>  3 files changed, 112 insertions(+), 26 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> index 83aeb1f..11db2ab 100644
>> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> @@ -4,7 +4,11 @@ This PCIe host controller is based on the Synopsis Designware PCIe IP
>>  and thus inherits all the common properties defined in designware-pcie.txt.
>>
>>  Required properties:
>> -- compatible: "fsl,imx6q-pcie", "fsl,imx6sx-pcie", "fsl,imx6qp-pcie"
>> +- compatible:
>> +     - "fsl,imx6q-pcie"
>> +     - "fsl,imx6sx-pcie",
>> +     - "fsl,imx6qp-pcie"
>> +     - "fsl,imx7d-pcie"
>>  - reg: base address and length of the PCIe controller
>>  - interrupts: A list of interrupt outputs of the controller. Must contain an
>>    entry for each entry in the interrupt-names property.
>> @@ -34,6 +38,13 @@ Additional required properties for imx6sx-pcie:
>>  - clock names: Must include the following additional entries:
>>       - "pcie_inbound_axi"
>>
>> +Additional required properties for imx7d-pcie:
>> +- power-domains: Must be set to a phandle pointing to PCIE_PHY power domain
>
> This domain is just the PHY? Seems like this needs a separate PHY
> driver.

PCIE_PHY is the name of the power domain corresponding to PGC_PCIE
(which is what that property is expected to point to) as per
Frescale/NXP datasheet (p. 822 in v0.1 of i.MX7 Application Processors
Manual). I was never able to find any clear language indicating what
parts of DesignWare's IP core and Freescale's/NXP's PCIE PHY it powers
in the manual. However, experiments with hardware show that when that
domain remains non-powered any attempt to access registers of DW's IP
block result in system hanging, so it seemed to me that the two are
not independent of each other enough to be represented as individual
DT nodes.

>
>> +- resets: Must contain phandles to PCIE related reset lines exposed by SRC IP block
>> +- reset-names: Must contain the following entires:
>> +            - "pciephy"
>
> And for this too.
>
>> +            - "apps"
>> +
>>  Example:
>>
>>       pcie@0x01000000 {
>
> [...]
>
>> @@ -251,6 +261,10 @@ static void imx6_pcie_assert_core_reset(struct imx6_pcie *imx6_pcie)
>>       u32 val, gpr1, gpr12;
>>
>>       switch (imx6_pcie->variant) {
>> +     case IMX7D:
>> +             reset_control_assert(imx6_pcie->pciephy_reset);
>> +             reset_control_assert(imx6_pcie->apps_reset);
>> +             break;
>>       case IMX6SX:
>>               regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
>>                                  IMX6SX_GPR12_PCIE_TEST_POWERDOWN,
>
> So the difference with i.MX7D is not really that it has a reset or not,
> but some platforms use a reset driver and some do not. The latter should
> be fixed.

That depends on what variant of the SoC you are comparing it to. 6QP,
6SX do have reset and helper signals wire to bits in registers in
IOMUX, 6Q howerver doesn't have a reset line wire and have to do some
trickery as per comment in the driver several lines below:

"... As there is no dedicated reset signal wired up for MX6QDL, we
need to manually force LTSSM into "detect" state before completely
disabling LTSSM, which is a prerequisite for core configuration..."

If memory serves me well part of that 6Q trickery code is the reason
for driver using hook_fault_code().

That is not to say that all of this code could not be encapsulated as
a reset controller, and I agree, doing so might make the driver
better. At the same time I don't have the hardware to test all of
those platforms and I am hoping we can agree this kind of change to be
out of scope of this series.

Thanks,
Andrey Smironv
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
