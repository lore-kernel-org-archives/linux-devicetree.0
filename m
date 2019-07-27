From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH 5/6] clk: imx8mq: Remove CLK_IS_CRITICAL flag for
 IMX8MQ_CLK_TMU_ROOT
Date: Sat, 27 Jul 2019 19:17:36 +0300
Message-ID: <20190727161736.4dkfqgwftre67v56@fsr-ub1664-175>
References: <20190705045612.27665-1-Anson.Huang@nxp.com>
 <20190705045612.27665-5-Anson.Huang@nxp.com>
 <CAEnQRZAZNMBx3ApVmRP8hYPw0XY_QgR-saE6WLcT8oZmHPCxSA@mail.gmail.com>
 <DB3PR0402MB3916233A56CF5DF778115716F5C30@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAEnQRZCrZybzcy__u4p_Eq4zSVc2ESyfKLk5sPf1JYba1JSOiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEnQRZCrZybzcy__u4p_Eq4zSVc2ESyfKLk5sPf1JYba1JSOiA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Anson Huang <anson.huang@nxp.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Carlo Caione <ccaione@baylibre.com>, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Leonard Crestez <leonard.crestez@nxp.com>, linux-pm@
List-Id: devicetree@vger.kernel.org

On 19-07-27 09:33:10, Daniel Baluta wrote:
> On Sat, Jul 27, 2019 at 9:19 AM Anson Huang <anson.huang@nxp.com> wrote:
> >
> > Hi, Daniel
> >
> > > Subject: Re: [PATCH 5/6] clk: imx8mq: Remove CLK_IS_CRITICAL flag for
> > > IMX8MQ_CLK_TMU_ROOT
> > >
> > > Hi all,
> > >
> > > latest linux-next hangs at boot.
> > >
> > > commit fde50b96be821ac9673a7e00847cc4605bd88f34 (HEAD -> master, tag:
> > > next-20190726, origin/master, origin/HEAD)
> > > Author: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date:   Fri Jul 26 15:18:02 2019 +1000
> > >
> > >     Add linux-next specific files for 20190726
> > >
> > >     Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > >
> > >
> > > I know this is crazy but reverting commit:
> > >
> > > commit 431bdd1df48ee2896ea9980d9153e3aeaf0c81ef (refs/bisect/bad)
> > > Author: Anson Huang <Anson.Huang@nxp.com>
> > > Date:   Fri Jul 5 12:56:11 2019 +0800
> > >
> > >     clk: imx8mq: Remove CLK_IS_CRITICAL flag for IMX8MQ_CLK_TMU_ROOT
> > >
> > >     IMX8MQ_CLK_TMU_ROOT is ONLY used for thermal module, the driver
> > >     should manage this clock, so no need to have CLK_IS_CRITICAL flag
> > >     set.
> > >
> > >
> > >
> > > makes the boot work again.
> > >
> > > Any idea?
> >
> > I just found if disabling SDMA1, then kernel can boot up, it does NOT make sense
> > TMU clock is related to SDMA1, I will check with design and get back to you soon.
> >
> 
> Hi Anson,
> 
> Applying Abel's patch:
> 
> commit 8816c47db6a82f55bb4d64f62fd9dd3af680f0e4 (HEAD -> master)
> Author: Abel Vesa <abel.vesa@nxp.com>
> Date:   Tue Jun 25 12:01:56 2019 +0300
> 
>     clk: imx8mq: Mark AHB clock as critical
> 
>     Keep the AHB clock always on since there is no driver to control it and
>     all the other clocks that use it as parent rely on it being always enabled.
> 
> 
> 
> The kernel boots up again.
> 
> It make some sense. I don't understand though why having
> IMX8MQ_CLK_TMU_ROOT as critical also "unhangs" the kernel.
> 

OK, so this is how it works.

By removing the critical flag from TMU, the AHB doesn't stay always on.
With my patch the AHB is marked as critical and therefore stays on.

The sdma1_clk has as parent the ipg_root which in turn has as parent the
ahb clock. And I think what happens is some read from the sdma registers hangs
because, for whatever reason, enabling the sdma1_clk doesn't propagate to enable
the ahb clock. I might be wrong though.

> thanks,
> Daniel.
