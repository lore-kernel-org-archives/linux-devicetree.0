From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 5/6] clk: imx8mq: Remove CLK_IS_CRITICAL flag for
 IMX8MQ_CLK_TMU_ROOT
Date: Sat, 27 Jul 2019 06:19:07 +0000
Message-ID: <DB3PR0402MB3916233A56CF5DF778115716F5C30@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20190705045612.27665-1-Anson.Huang@nxp.com>
 <20190705045612.27665-5-Anson.Huang@nxp.com>
 <CAEnQRZAZNMBx3ApVmRP8hYPw0XY_QgR-saE6WLcT8oZmHPCxSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAEnQRZAZNMBx3ApVmRP8hYPw0XY_QgR-saE6WLcT8oZmHPCxSA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Carlo Caione <ccaione@baylibre.com>, =?utf-8?B?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Leonard Crestez <leonard.crestez@nxp.com>, Fabio Estevam <festevam@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, dl-linux-imx <linux-imx@nxp.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, Michael Turquette <mturquette@baylibre.com>, Devicetree List <devicetree@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "edubezval@gmail.com" <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, Linux
List-Id: devicetree@vger.kernel.org

Hi, Daniel

> Subject: Re: [PATCH 5/6] clk: imx8mq: Remove CLK_IS_CRITICAL flag for
> IMX8MQ_CLK_TMU_ROOT
> 
> Hi all,
> 
> latest linux-next hangs at boot.
> 
> commit fde50b96be821ac9673a7e00847cc4605bd88f34 (HEAD -> master, tag:
> next-20190726, origin/master, origin/HEAD)
> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> Date:   Fri Jul 26 15:18:02 2019 +1000
> 
>     Add linux-next specific files for 20190726
> 
>     Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> 
> I know this is crazy but reverting commit:
> 
> commit 431bdd1df48ee2896ea9980d9153e3aeaf0c81ef (refs/bisect/bad)
> Author: Anson Huang <Anson.Huang@nxp.com>
> Date:   Fri Jul 5 12:56:11 2019 +0800
> 
>     clk: imx8mq: Remove CLK_IS_CRITICAL flag for IMX8MQ_CLK_TMU_ROOT
> 
>     IMX8MQ_CLK_TMU_ROOT is ONLY used for thermal module, the driver
>     should manage this clock, so no need to have CLK_IS_CRITICAL flag
>     set.
> 
> 
> 
> makes the boot work again.
> 
> Any idea?

I just found if disabling SDMA1, then kernel can boot up, it does NOT make sense
TMU clock is related to SDMA1, I will check with design and get back to you soon.

Anson
