From: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ARM: dts: imx: Add mclk0 clock for SAI
Date: Mon, 22 Apr 2019 03:30:26 +0000
Message-ID: <VE1PR04MB647951B20E0F334FF1CC3B7AE3220@VE1PR04MB6479.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi

>=20
>=20
> On Sat, Apr 20, 2019 at 09:12:52AM +0000, Daniel Baluta wrote:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > SAI has 4 clock sources, which can be selected using MSEL bit of SAI
> > TCR2 register.
>=20
> I have a doubt at this statement. As far as I can understand, this MSEL i=
s
> probably used by its internal clock MUX, so it's not really proving that =
SAI
> has 4 MCLK inputs. What I know is that SAI block itself only has 3 MCLK
> inputs as we defined in DT. It's just internally connects bus clock or MC=
LK1
> to input0 of clock MUX's and connects MCLK[1-3] to input[1-3]. So adding =
an
> MCLK0 here doesn't sound a right way to me. Unless someone can justify
> for it, I think we should just fix it from driver side.
>=20
> Thanks
> Nicolin
>

The MSEL bit width is 2 bit, so there is 4 options,  the MCLK0 maybe the sa=
me input as
MCLK1 or bus clock as you said, so we think may be better to show this rela=
tion in DT,=20
And this is DT's capability.  Driver don't care about which clock connect t=
o MCLK0,=20
it only need to know there is 4 MCLK from DT.=20

Best regards
Wang shengjiu

=20
