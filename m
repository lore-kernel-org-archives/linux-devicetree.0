From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v3 3/3] PCI: imx6: Add support for i.MX8MQ
Date: Thu, 20 Dec 2018 13:49:38 +0000
Message-ID: <VI1PR04MB553399573A1D360C62C17E61EEBF0@VI1PR04MB5533.eurprd04.prod.outlook.com>
References: <20181218040702.29231-1-andrew.smirnov@gmail.com>
 <20181218040702.29231-4-andrew.smirnov@gmail.com>
 <20181218151533.GA2922@bogus>
 <VI1PR04MB5533533242C036C5CF6352BAEEBD0@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <CAL_JsqJb24ZpM7qQfy_F7RUVEGyceBAXOndbZcTMh3a__k38UQ@mail.gmail.com>
 <CAHQ1cqEMxxo9JGN5be4XQWAtPz7nC2JyLCr3qasnD5QK7_hOYQ@mail.gmail.com>
 <1545268969.22930.77.camel@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "robh@kernel.org" <robh@kernel.org>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, "cphealy@gmail.com" <cphealy@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/20/2018 3:22 AM, Trent Piepho wrote:=0A=
> On Wed, 2018-12-19 at 16:47 -0800, Andrey Smirnov wrote:=0A=
=0A=
>>>> This series initially added explicit offsets but I suggested a single=
=0A=
>>>> "controller-id" because:=0A=
>>>>    * There are multiple bit and byte offsets=0A=
>>>>    * Other imx8 SOCs also have 2x pcie with other bit/byte offsets=0A=
>>>>=0A=
>>>> Hiding this behind a compatible string and single "controller-id" seem=
=0A=
>>>> preferable to elaborating register maps in dt bindings. It also makes=
=0A=
>>>> upgrades simpler: if features are added which use other bits there is =
no=0A=
>>>> need to describe them in DT and deal with compatibility headaches.=0A=
>>>=0A=
>>> You already have an id for the controllers: the address. Use that if=0A=
>>> you don't want to put the register offsets in DT.=0A=
>>=0A=
>> Lucas, are you on board with this?=0A=
> =0A=
> Does address here mean the address from the controller's reg property?=0A=
>   =0A=
> How do you map that address to the controller's index?=0A=
=0A=
I guess you could have a constant for the address of the first =0A=
controller and then substract. But hardcoding any sort of physical =0A=
address feels wrong with DT.=0A=
> The situation here is that some registers for these controllers are=0A=
> interleaved, right?  I.e., there's one register somewhere where bit 0=0A=
> means enable controller 0 and bit 1 means enable controller 1 and so=0A=
> on.=0A=
> =0A=
> Isn't cell-index already the standard device tree property for this=0A=
> kind of setup?=0A=
=0A=
Look at how this cell-index property is documented in other bindings it =0A=
seems to be an excellent fit: just rename controller-id to cell-index.=0A=
