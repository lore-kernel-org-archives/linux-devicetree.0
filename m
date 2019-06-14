From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [RFC 1/2] dt-bindings: imx-ocotp: Add fusable-node property
Date: Fri, 14 Jun 2019 01:19:22 +0000
Message-ID: <AM0PR04MB4481288D0D1B8DA704FEF82B88EE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190520032020.7920-1-peng.fan@nxp.com>
 <20190613230055.GA19296@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613230055.GA19296@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> Subject: Re: [RFC 1/2] dt-bindings: imx-ocotp: Add fusable-node property
>=20
> On Mon, May 20, 2019 at 03:06:35AM +0000, Peng Fan wrote:
> > Introduce fusable-node property for i.MX OCOTP driver.
> > The property will only be used by Firmware(eg. U-Boot) to runtime
> > disable the nodes.
> >
> > Take i.MX6ULL for example, there are several parts that only have
> > limited modules enabled controlled by OCOTP fuse. It is not flexible
> > to provide several dts for the serval parts, instead we could provide
> > one device tree and let Firmware to runtime disable the device tree
> > nodes for those modules that are disable(fused).
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >
> > Currently NXP vendor use U-Boot to set status to disabled for devices
> > that could not function,
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsou=
r
> >
> ce.codeaurora.org%2Fexternal%2Fimx%2Fuboot-imx%2Ftree%2Farch%2Far
> m%2Fm
> >
> ach-imx%2Fmx6%2Fmodule_fuse.c%3Fh%3Dimx_v2018.03_4.14.98_2.0.0_g
> a%23n1
> >
> 49&amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%7Ceb74876c943c4471d7f
> f08d6f05
> >
> 2fffb%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63696063660
> 6051306&
> >
> amp;sdata=3DMrjCP0ufBu3uTb1ehTEu2g5eSQuYcho4UxuR9KUFEOA%3D&amp;
> reserved=3D
> > 0 But this approach is will not work if kernel dts node path changed.
>=20
> Why would the path change? The DT should be stable.

It changes sometimes, such as
efb9adb27475 ("ARM: dts: imx6ul: Remove leading zeroes from unit addresses"=
),

in bootloader, we are using node path, so if the node name changes, the boo=
tloader
will fail to disable the node.

Thanks,
Peng.

>=20
> Rob
