From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 3/3] PCI: imx: Add support for i.MX8MQ
Date: Tue, 27 Nov 2018 10:46:44 +0000
Message-ID: <VI1PR04MB5533DE497786CD80D4FE0941EED00@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <20181117181225.10737-1-andrew.smirnov@gmail.com>
 <20181117181225.10737-4-andrew.smirnov@gmail.com>
 <ce2ac1a880ce2a7a39f0e42b5059676daa748e52.camel@nxp.com>
 <CAHQ1cqH6LT4GsxUchrmVG1m3fqawgyUjxdHvh=SzxhBiQOd8eg@mail.gmail.com>
 <1543313169.2507.39.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, Chris Healy <cphealy@gmail.com>, Aisheng DONG <aisheng.dong@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/27/18 12:06 PM, Lucas Stach wrote:=0A=
> Hi Andrey,=0A=
> =0A=
> Am Montag, den 26.11.2018, 10:24 -0800 schrieb Andrey Smirnov:=0A=
>> On Tue, Nov 20, 2018 at 2:49 AM Leonard Crestez <leonard.crestez@nxp.com=
> wrote:=0A=
>>>=0A=
>>> On Sat, 2018-11-17 at 10:12 -0800, Andrey Smirnov wrote:=0A=
>>>> @@ -921,7 +1004,28 @@ static int imx6_pcie_probe(struct platform_devic=
e *pdev)=0A=
>>>> -=A0=A0=A0=A0=A0case IMX7D:=0A=
>>>> +=A0=A0=A0=A0=A0case IMX8MQ:=0A=
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (of_property_read_u32(node,=
 "fsl,iomux-gpr1x",=0A=
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0&imx6_pcie->gpr1x)) {=0A=
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev_er=
r(dev, "Failed to get GPR1x address\n");=0A=
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return=
 -EINVAL;=0A=
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}=0A=
>>>=0A=
>>> This is for distinguishing multiple controllers on the SOC but other=0A=
>>> registers and bits might differ. Isn't it preferable to have a property=
=0A=
>>> for controller id instead of adding many registers to DT?=0A=
>>=0A=
>> I liked encoding necessary info in DT directly slightly better than=0A=
>> encoding abstract ID and then decoding it further in the driver code.=0A=
>> OTOH, I am not really attached to that path. Lucas, can you comment on=
=0A=
>> this please?=0A=
> =0A=
> Yes, after rereading the patch with this in mind I agree that having=0A=
> the GPR offset on DT directly is IMO the better approach than an=0A=
> abstract ID.=0A=
=0A=
But it's not a single offset, for example the device_type (EP/RC) has =0A=
bits for the two controllers side-by-side in GPR12.=0A=
=0A=
Adding a "ctrl-id" property would fully describe the hardware from the =0A=
start. If we add per-register information instead then when other =0A=
registers are used we'll get DT compatibility headaches.=0A=
=0A=
It's worth noting that 8qm/8qxp also have multiple controllers with a =0A=
different set of bits placed differently in iomuxc.=0A=
