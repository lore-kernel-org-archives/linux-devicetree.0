From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH 3/3] dt-bindings: dsp: fsl: Add DSP core binding support
Date: Thu, 18 Jul 2019 18:40:22 +0000
Message-ID: <VI1PR04MB5055597B7C3AC114FEB7E3E5EEC80@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190718151346.3523-1-daniel.baluta@nxp.com>
 <20190718151346.3523-4-daniel.baluta@nxp.com>
 <CAL_JsqJ6o9mTjLYjnfcYgfSFKb95W8FseZBBb8RLosB__GNBcw@mail.gmail.com>
 <CAEnQRZBubFz90Xf8irDwc=erTXmByXX4rkzZy9r8ymfAuQEsZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Paul Olaru <paul.olaru@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sound-open-firmware@alsa-project.org" <sound-open-fi>
List-Id: devicetree@vger.kernel.org

On 18.07.2019 21:24, Daniel Baluta wrote:=0A=
> On Thu, Jul 18, 2019 at 7:41 PM Rob Herring <robh+dt@kernel.org> wrote:=
=0A=
>>=0A=
>> On Thu, Jul 18, 2019 at 9:13 AM Daniel Baluta <daniel.baluta@nxp.com> wr=
ote:=0A=
>>>=0A=
>>> This describes the DSP device tree node.=0A=
>>>=0A=
>>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>=0A=
=0A=
>>> +  power-domains:=0A=
>>> +    description:=0A=
>>> +      List of phandle and PM domain specifier as documented in=0A=
>>> +      Documentation/devicetree/bindings/power/power_domain.txt=0A=
>>=0A=
>> How many? 4?=0A=
> =0A=
> Yes, 4 for i.MX8QXP. Also, the same number is for i.MX8QM. Anyhow, I didn=
't=0A=
> added added a limit here because I really don't know how many will be=0A=
> in upcoming i.MX platforms.=0A=
=0A=
Which 4? It might help to use power-domain-names explicitly just like =0A=
it's done for clocks and mboxes.=0A=
=0A=
This is very common for phandle lists.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
