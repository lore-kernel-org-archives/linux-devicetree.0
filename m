From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [RFC 1/2] dt-bindings: imx-ocotp: Add fusable-node property
Date: Mon, 20 May 2019 09:37:04 +0000
Message-ID: <AM0PR04MB44813D1223FDB9266C9F90D388060@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190520032020.7920-1-peng.fan@nxp.com>
 <AM0PR04MB643466338B440374D97F2805EE060@AM0PR04MB6434.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB643466338B440374D97F2805EE060@AM0PR04MB6434.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>
Cc: "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [RFC 1/2] dt-bindings: imx-ocotp: Add fusable-node property
>=20
> On 20.05.2019 06:06, Peng Fan wrote:
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
> >
> https://source.codeaurora.org/external/imx/uboot-imx/tree/arch/arm/mac
> > h-imx/mx6/module_fuse.c?h=3Dimx_v2018.03_4.14.98_2.0.0_ga#n149
> > But this approach is will not work if kernel dts node path changed.
> >
> > There are two approaches to resolve:
> >
> > 1. This patch is to add a fusable-node property, and Firmware will pars=
e
> >     the property and read fuse to decide whether to disable or keeep
> enable
> >     the nodes.
> >
> > 2. There is another approach is that add nvmem-cells for all nodes that
> >     could be disabled(fused). Then in each linux driver to use nvmem
> >     api to detect fused or not, or in linux driver common code to check
> >     device functionable or not with nvmem API.
> >
> >
> > To make it easy to work, we choose [1] here. Please advise whether it
> > is acceptable, because the property is not used by linux driver in
> > approach [1]. Or you prefer [2] or please advise if any better solution=
.
>=20
> Couldn't firmware parse nvmem-cells? Even without a full nvmem subsystem
> it would be possible for imx-specific code to walk the entire device tree=
, parse
> nvmem-cells and disable nodes which are disabled by fuse.

Firmware could parse nvmem-cells, but there are lots of modules that could
be fused. If using nvmem-cells, that means need to add nvmem property
for all the modules that could be fused. To make is looks cleaner, so intro=
duced
a fusable-node property.

Regards,
Peng.

>=20
> --
> Regards,
> Leonard
