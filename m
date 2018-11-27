From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 3/3] PCI: imx: Add support for i.MX8MQ
Date: Tue, 27 Nov 2018 10:16:10 +0000
Message-ID: <VI1PR04MB553359EA5E0F88701A92A3AEEED00@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <20181117181225.10737-1-andrew.smirnov@gmail.com>
 <20181117181225.10737-4-andrew.smirnov@gmail.com>
 <ce2ac1a880ce2a7a39f0e42b5059676daa748e52.camel@nxp.com>
 <CAHQ1cqH6LT4GsxUchrmVG1m3fqawgyUjxdHvh=SzxhBiQOd8eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Richard Zhu <hongxing.zhu@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Chris Healy <cphealy@gmail.com>, Aisheng DONG <aisheng.dong@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

On 11/26/18 8:24 PM, Andrey Smirnov wrote:=0A=
> On Tue, Nov 20, 2018 at 2:49 AM Leonard Crestez <leonard.crestez@nxp.com>=
 wrote:=0A=
>> On Sat, 2018-11-17 at 10:12 -0800, Andrey Smirnov wrote:=0A=
=0A=
>>> +             if (of_property_read_u32_array(=0A=
>>> +                         node, "fsl,gpr12-device-type",=0A=
>>> +                         imx6_pcie->device_type,=0A=
>>> +                         ARRAY_SIZE(imx6_pcie->device_type))) {=0A=
>>> +                     dev_err(dev, "Failed to get device type=0A=
>>> mask/value\n");=0A=
>>> +                     return -EINVAL;=0A=
>>> +             }=0A=
>>=0A=
>> The device type can be set on multiple SOCs, why are you adding a=0A=
>> mandatory property only for 8m?=0A=
> =0A=
> My thinking was that other SoCs don't really have two controllers, so=0A=
> they don't really need to have that property, but, more importantly,=0A=
> not forcing them to have this property should preserve backwards=0A=
> compatibility with old DTBs.=0A=
=0A=
The "device_type" registers determine Root Complex versus End Point =0A=
mode. This is not yet supported on imx in upstream but it can be done on =
=0A=
many soc versions.=0A=
=0A=
Looking at other pcie controllers (and dwc core) this is normally done =0A=
with a different compatible string with an "-ep" suffix. It feels wrong =0A=
to expose bitmasks and values directly in DT instead.=0A=
=0A=
For this patch you should probably just hardcode RC mode.=0A=
