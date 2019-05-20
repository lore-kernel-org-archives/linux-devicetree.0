From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [RFC 1/2] dt-bindings: imx-ocotp: Add fusable-node property
Date: Mon, 20 May 2019 09:33:36 +0000
Message-ID: <AM0PR04MB643466338B440374D97F2805EE060@AM0PR04MB6434.eurprd04.prod.outlook.com>
References: <20190520032020.7920-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>
Cc: "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 20.05.2019 06:06, Peng Fan wrote:=0A=
> Introduce fusable-node property for i.MX OCOTP driver.=0A=
> The property will only be used by Firmware(eg. U-Boot) to=0A=
> runtime disable the nodes.=0A=
> =0A=
> Take i.MX6ULL for example, there are several parts that only=0A=
> have limited modules enabled controlled by OCOTP fuse. It is=0A=
> not flexible to provide several dts for the serval parts, instead=0A=
> we could provide one device tree and let Firmware to runtime disable=0A=
> the device tree nodes for those modules that are disable(fused).=0A=
> =0A=
> Signed-off-by: Peng Fan <peng.fan@nxp.com>=0A=
> ---=0A=
> =0A=
> Currently NXP vendor use U-Boot to set status to disabled for devices=0A=
> that could not function,=0A=
> https://source.codeaurora.org/external/imx/uboot-imx/tree/arch/arm/mach-i=
mx/mx6/module_fuse.c?h=3Dimx_v2018.03_4.14.98_2.0.0_ga#n149=0A=
> But this approach is will not work if kernel dts node path changed.=0A=
> =0A=
> There are two approaches to resolve:=0A=
> =0A=
> 1. This patch is to add a fusable-node property, and Firmware will parse=
=0A=
>     the property and read fuse to decide whether to disable or keeep enab=
le=0A=
>     the nodes.=0A=
> =0A=
> 2. There is another approach is that add nvmem-cells for all nodes that=
=0A=
>     could be disabled(fused). Then in each linux driver to use nvmem=0A=
>     api to detect fused or not, or in linux driver common code to check=
=0A=
>     device functionable or not with nvmem API.=0A=
> =0A=
> =0A=
> To make it easy to work, we choose [1] here. Please advise whether=0A=
> it is acceptable, because the property is not used by linux driver in=0A=
> approach [1]. Or you prefer [2] or please advise if any better solution.=
=0A=
=0A=
Couldn't firmware parse nvmem-cells? Even without a full nvmem subsystem =
=0A=
it would be possible for imx-specific code to walk the entire device =0A=
tree, parse nvmem-cells and disable nodes which are disabled by fuse.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
