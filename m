Return-Path: <SRS0=wC6z=G6=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH] phy: Renesas R-Car gen3 PCIe PHY driver
References: <0f28c74d-f35a-5ccb-eeba-f21ae39c3857@cogentembedded.com>
 <CAMuHMdXNg32ECS+xNH46qK58JoU=VC_kbqhaVXD4xGZC16wY3A@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <267e381f-64d7-ea76-b5b7-96e71f9536ce@cogentembedded.com>
Date: Mon, 9 Apr 2018 18:57:11 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXNg32ECS+xNH46qK58JoU=VC_kbqhaVXD4xGZC16wY3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 04/09/2018 12:46 PM, Geert Uytterhoeven wrote:

>> This PHY is still mostly undocumented -- the only documented registers
>> exist on R-Car V3H (R8A77980) SoC  where this PHY stays in a powered-down
>> state after a reset and thus  we must power it on for PCIe to work...
> 
> Bogus spaces slipping in again?

   Yes, I should have worked in the type-setting. :-)

>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
>> --- /dev/null
>> +++ linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
>> @@ -0,0 +1,32 @@
[...]
>> +Example (R-Car V3H):
>> +
>> +       pcie-phy@e65d0000 {
>> +               compatible = "renesas,r8a77980-pcie-phy",
>> +                            "renesas,rcar-gen3-pcie-phy";
> 
> Is the R8A77980 PCIe PHY compatible with the generic version, given it needs
> to be powered up explicitly?

   I assumed it's upwardly compatible. However, given the lack of information,
it might not be...

> The only documented register is the lane reversal register, do we need bindings
> to configure it?

   Don't know, I'm not PCIe expert...

>> --- /dev/null
>> +++ linux-phy/drivers/phy/renesas/phy-rcar-gen3-pcie.c
>> @@ -0,0 +1,158 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Renesas R-Car Gen2 PHY driver
> 
> Gen3 PCIe PHY

  Yeah, my overlook. Thanks for noticing...

>> +static int rcar_gen3_phy_pcie_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct phy_provider *provider;
>> +       struct rcar_gen3_phy *phy;
>> +       struct resource *res;
>> +       void __iomem *base;
>> +       int error;
>> +
>> +       if (!dev->of_node) {
>> +               dev_err(dev,
>> +                       "This driver must only be instantiated from the device tree\n");
>> +               return -EINVAL;
>> +       }
> 
> Do we need this check? Just go bang, like most other DT-only drivers do?

   You mean NULL pointer dereference?

> Gr{oetje,eeting}s,
> 
>                         Geert
> 

MBR, Sergei
