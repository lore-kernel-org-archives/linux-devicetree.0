From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v3 3/3] PCI: imx6: Add support for i.MX8MQ
Date: Tue, 18 Dec 2018 18:09:02 +0000
Message-ID: <VI1PR04MB5533533242C036C5CF6352BAEEBD0@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <20181218040702.29231-1-andrew.smirnov@gmail.com>
 <20181218040702.29231-4-andrew.smirnov@gmail.com>
 <20181218151533.GA2922@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/18/2018 5:15 PM, Rob Herring wrote:=0A=
> On Mon, Dec 17, 2018 at 08:07:02PM -0800, Andrey Smirnov wrote:=0A=
>> Add code needed to support i.MX8MQ variant.=0A=
>>=0A=
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>=0A=
>> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>=0A=
=0A=
>> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt=0A=
>> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt=0A=
>>   =0A=
>> +Additional required properties for imx8mq-pcie:=0A=
>> +- fsl,controller-id: Logical ID of a given PCIE controller. PCIE1 is 0,=
 PCIE2 is 1;=0A=
>> +=0A=
> =0A=
> Remove this.=0A=
> =0A=
> If GPR register offset is what you need, then put that into DT.=0A=
> Typically, we'd have a property with iomuxc phandle and offset.=0A=
=0A=
This series initially added explicit offsets but I suggested a single =0A=
"controller-id" because:=0A=
  * There are multiple bit and byte offsets=0A=
  * Other imx8 SOCs also have 2x pcie with other bit/byte offsets=0A=
=0A=
Hiding this behind a compatible string and single "controller-id" seem =0A=
preferable to elaborating register maps in dt bindings. It also makes =0A=
upgrades simpler: if features are added which use other bits there is no =
=0A=
need to describe them in DT and deal with compatibility headaches.=0A=
=0A=
Link to older thread: https://lkml.org/lkml/2018/11/29/888=0A=
=0A=
It's possible my suggestion was misguided.=0A=
