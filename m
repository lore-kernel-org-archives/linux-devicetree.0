From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 5/6] clk: imx8mq: Remove CLK_IS_CRITICAL flag for IMX8MQ_CLK_TMU_ROOT
Date: Mon, 29 Jul 2019 10:21:14 +0300
Message-ID: <CAEnQRZDSjmcU8Q7+kMeFf12tx0NuMNjrcsgnXayvHpu4ChwHGA@mail.gmail.com>
References: <20190705045612.27665-1-Anson.Huang@nxp.com> <20190705045612.27665-5-Anson.Huang@nxp.com>
 <CAEnQRZAZNMBx3ApVmRP8hYPw0XY_QgR-saE6WLcT8oZmHPCxSA@mail.gmail.com>
 <DB3PR0402MB3916233A56CF5DF778115716F5C30@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAEnQRZCrZybzcy__u4p_Eq4zSVc2ESyfKLk5sPf1JYba1JSOiA@mail.gmail.com>
 <20190727161736.4dkfqgwftre67v56@fsr-ub1664-175> <DB3PR0402MB391600891BA75DFFA9674058F5DD0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAEnQRZB6tmYFA8wwh0Fm49LTTDuCLq-SWVfrcUkRWWBo=0U13w@mail.gmail.com>
 <DB3PR0402MB391627F725AA7237BCACBE87F5DD0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAEnQRZBrmikenTvnh7syhy=PDPcTL3fn2TJ+ya=ToZ+SFmH5tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEnQRZBrmikenTvnh7syhy=PDPcTL3fn2TJ+ya=ToZ+SFmH5tw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Abel Vesa <abel.vesa@nxp.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Carlo Caione <ccaione@baylibre.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Leonard Crestez <leonard.crestez@nxp.com>, linux-pm@vger
List-Id: devicetree@vger.kernel.org

On Mon, Jul 29, 2019 at 10:20 AM Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> <snip>
> > > Your explanation makes a lot of sense. We will take care today of Abel's
> > > patch.
> > > What do you think about Fabio's patch? I also think this is a valid patch:
> > >
> <snip>
>
> >
> > Hmm, when did Fabio sent out this patch? I can NOT find it...
> > I also have a patch in this series (#4/6) doing same thing on July 5th...
> >
> > https://patchwork.kernel.org/patch/11032783/
>
> He didn't send the patch yet. It was just a request for test here:
>
> http://code.bulix.org/pd88jp-812381
>
> But, now I see is exactly like your patch here:

... pressed send to early.

https://lkml.org/lkml/2019/7/5/19

We are all set then. Thanks Anson for clarifications!
