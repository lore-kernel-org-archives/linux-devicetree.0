Return-Path: <SRS0=gQZM=UF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbfFFRWL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 6 Jun 2019 13:22:11 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190606164443.6991-1-festevam@gmail.com> <20190606165546.6675520693@mail.kernel.org> <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
Subject: Re: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
From: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 06 Jun 2019 10:22:09 -0700
Message-Id: <20190606172210.7B3F82083E@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Leonard Crestez (2019-06-06 10:15:32)
> On 06.06.2019 19:55, Stephen Boyd wrote:
> > Quoting Fabio Estevam (2019-06-06 09:44:43)
> >> Use devm_platform_ioremap_resource() to simplify the code a bit.
> >>
> >> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> >> ---
> >=20
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>=20
> An extremely similar patch was already submitted and then reverted=20
> because it breaks boot:
>=20
>      https://patchwork.kernel.org/patch/10908807/
>=20
> I tested and this new patch also breaks boot.
>=20
> The current imx8 lpcg driver maps entire subsystems at once and if=20
> devm_platform_ioremap_resource is used then devices inside the subsystem =

> will fail to probe, including lpuart!
>=20
> The hardware on imx8qxp and related parts (imx8qm) has multiple separate =

> LPCG blocks interspersed between devices. Some refactoring patches were=20
> posted by Aisheng to split LPCG into multiple blocks but apparently got=20
> stuck in review:
>=20
>      https://patchwork.kernel.org/cover/10924029/
>      https://patchwork.kernel.org/cover/10824443/
>      https://patchwork.kernel.org/cover/10824537/
>=20
> There were some disagreements regarding DT bindings for split imx8=20
> clocks, what would it take to move those patches forward?
>=20

Don't know. I'll have to read those patches on the list and reply there.
