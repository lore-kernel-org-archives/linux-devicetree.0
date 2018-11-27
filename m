From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 3/3] PCI: imx: Add support for i.MX8MQ
Date: Tue, 27 Nov 2018 13:03:56 -0800
Message-ID: <CAHQ1cqE0cUUsT99A5ZM6XkNd7E5+17qjZRkCdCERSp2-nWsf=Q@mail.gmail.com>
References: <20181117181225.10737-1-andrew.smirnov@gmail.com>
 <20181117181225.10737-4-andrew.smirnov@gmail.com> <ce2ac1a880ce2a7a39f0e42b5059676daa748e52.camel@nxp.com>
 <CAHQ1cqH6LT4GsxUchrmVG1m3fqawgyUjxdHvh=SzxhBiQOd8eg@mail.gmail.com> <VI1PR04MB553359EA5E0F88701A92A3AEEED00@VI1PR04MB5533.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB553359EA5E0F88701A92A3AEEED00@VI1PR04MB5533.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Richard Zhu <hongxing.zhu@nxp.com>, linux-imx@nxp.com, Chris Healy <cphealy@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kishon@ti.com, lorenzo.pieralisi@arm.com
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27, 2018 at 2:16 AM Leonard Crestez <leonard.crestez@nxp.com> wrote:
>
> On 11/26/18 8:24 PM, Andrey Smirnov wrote:
> > On Tue, Nov 20, 2018 at 2:49 AM Leonard Crestez <leonard.crestez@nxp.com> wrote:
> >> On Sat, 2018-11-17 at 10:12 -0800, Andrey Smirnov wrote:
>
> >>> +             if (of_property_read_u32_array(
> >>> +                         node, "fsl,gpr12-device-type",
> >>> +                         imx6_pcie->device_type,
> >>> +                         ARRAY_SIZE(imx6_pcie->device_type))) {
> >>> +                     dev_err(dev, "Failed to get device type
> >>> mask/value\n");
> >>> +                     return -EINVAL;
> >>> +             }
> >>
> >> The device type can be set on multiple SOCs, why are you adding a
> >> mandatory property only for 8m?
> >
> > My thinking was that other SoCs don't really have two controllers, so
> > they don't really need to have that property, but, more importantly,
> > not forcing them to have this property should preserve backwards
> > compatibility with old DTBs.
>
> The "device_type" registers determine Root Complex versus End Point
> mode. This is not yet supported on imx in upstream but it can be done on
> many soc versions.
>

Yeah, I am aware, I wasn't really trying to make it possible to
configure IP block to be a EP, that is just an unavoidable consequence
of the approach taken.

> Looking at other pcie controllers (and dwc core) this is normally done
> with a different compatible string with an "-ep" suffix. It feels wrong
> to expose bitmasks and values directly in DT instead.
>
> For this patch you should probably just hardcode RC mode.

Hmm, given how the mask/value have to be different for each
controller, the only way to hardcode it  that I can think of would be
to change the property pass a bit offset instead of mask/value pair.
Is that what you are suggesting?

Thanks,
Andrey Smirnov
