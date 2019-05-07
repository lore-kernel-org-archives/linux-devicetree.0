From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCHv2 1/2] ARM: dts: imx6sx: Use MX6SX_CLK_ENET for fec 'ahb' clock
Date: Tue, 7 May 2019 20:09:58 -0300
Message-ID: <CAOMZO5CSaRZEiaqxBTcBhaYjRLxMjb6Boyy0eO6OAEFBPv3_Kw@mail.gmail.com>
References: <1556190530-19541-1-git-send-email-liuk@cetca.net.cn>
 <CAOMZO5BbA6oq8okTR-r800k4XY76XxxEdufd1mjcV6HdTpVotA@mail.gmail.com>
 <AM0PR04MB421133A3F3C6B534B6ECEA7880370@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <VI1PR0402MB360058CE70AD60C116EE0634FF370@VI1PR0402MB3600.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR0402MB360058CE70AD60C116EE0634FF370@VI1PR0402MB3600.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Duan <fugang.duan@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Kay-Liu <liuk@cetca.net.cn>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andy,

On Sun, May 5, 2019 at 5:15 AM Andy Duan <fugang.duan@nxp.com> wrote:

> Nack the patch !
>
> Firstly, i.MX6SX has ENET AHB bus clock for MAC, and currently it is set 200Mhz like clock tree:
>         IMX6SX_CLK_ENET_PODF 200Mhz -> IMX6SX_CLK_ENET_SEL -> IMX6SX_CLK_ENET_AHB
>
> IMX6SX_CLK_ENET the clock is IPG clock for ENET IP ipg_clk_mac0_s/ipg_clk_s.
> (Please check RM Table 18-3. System Clocks, Gating, and Override)

Ok, but could you please show us where in the Reference Manual the
IMX6SX_CLK_ENET_AHB is mentioned?

I don't see ENET_AHB in imx6qdl Reference Manual either and we don't
have a ENET_AHB the clk-imx6q driver and nor in the devicetree,

> Secondly,  for your issue you caught, which was fixed by patch:
> commit d7c3a206e6338e4ccdf030719dec028e26a521d5
> Author: Andy Duan <fugang.duan@nxp.com>
> Date:   Tue Apr 9 03:40:56 2019 +0000
>
>     net: fec: manage ahb clock in runtime pm

Would this also fix the case where power management support is disabled?

If I understand correctly the explanation from Kay-Liu he would still
see a hang in the case when PM is disabled.

Thanks
