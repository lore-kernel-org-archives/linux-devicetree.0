Return-Path: <SRS0=gQZM=UF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45756 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728762AbfFFR5T (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Jun 2019 13:57:19 -0400
MIME-Version: 1.0
References: <20190606164443.6991-1-festevam@gmail.com> <20190606165546.6675520693@mail.kernel.org>
 <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jun 2019 14:57:10 -0300
Message-ID: <CAOMZO5Dt+3FOdvkWTGdLet8r9C1MPia=uwODNYc7T7k2EDdO-Q@mail.gmail.com>
Subject: Re: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jun 6, 2019 at 2:15 PM Leonard Crestez <leonard.crestez@nxp.com> wrote:

> An extremely similar patch was already submitted and then reverted
> because it breaks boot:
>
>      https://patchwork.kernel.org/patch/10908807/
>
> I tested and this new patch also breaks boot.

Ops, sorry about that!
