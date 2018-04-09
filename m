Return-Path: <SRS0=2q4m=G6=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <267e381f-64d7-ea76-b5b7-96e71f9536ce@cogentembedded.com>
References: <0f28c74d-f35a-5ccb-eeba-f21ae39c3857@cogentembedded.com>
 <CAMuHMdXNg32ECS+xNH46qK58JoU=VC_kbqhaVXD4xGZC16wY3A@mail.gmail.com> <267e381f-64d7-ea76-b5b7-96e71f9536ce@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Apr 2018 18:23:45 +0200
Message-ID: <CAMuHMdW1Abry=hcHZRqNed8PoNetogN57Tco9+gKkX6XSUiXDA@mail.gmail.com>
Subject: Re: [PATCH] phy: Renesas R-Car gen3 PCIe PHY driver
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

On Mon, Apr 9, 2018 at 5:57 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 04/09/2018 12:46 PM, Geert Uytterhoeven wrote:
>>> +static int rcar_gen3_phy_pcie_probe(struct platform_device *pdev)
>>> +{
>>> +       struct device *dev = &pdev->dev;
>>> +       struct phy_provider *provider;
>>> +       struct rcar_gen3_phy *phy;
>>> +       struct resource *res;
>>> +       void __iomem *base;
>>> +       int error;
>>> +
>>> +       if (!dev->of_node) {
>>> +               dev_err(dev,
>>> +                       "This driver must only be instantiated from the device tree\n");
>>> +               return -EINVAL;
>>> +       }
>>
>> Do we need this check? Just go bang, like most other DT-only drivers do?
>
>    You mean NULL pointer dereference?

Yep. (S)he who instantiates a "phy_rcar_gen3_pcie" device without DT is
bound to die.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
