From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 5/6] clk: imx8mn: Add necessary frequency support for ARM
 PLL table
Date: Sat, 17 Aug 2019 22:22:01 +0000
Message-ID: <DB3PR0402MB3916D320EB51B2D9E28D55E1F5AE0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1565866783-19672-1-git-send-email-Anson.Huang@nxp.com>
 <1565866783-19672-5-git-send-email-Anson.Huang@nxp.com>
 <20190817035220.268F32173B@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190817035220.268F32173B@mail.kernel.org>
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
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi, Stephen

> Quoting Anson.Huang@nxp.com (2019-08-15 03:59:42)
> > diff --git a/drivers/clk/imx/clk-imx8mn.c
> > b/drivers/clk/imx/clk-imx8mn.c index ecd1062..3f1239a 100644
> > --- a/drivers/clk/imx/clk-imx8mn.c
> > +++ b/drivers/clk/imx/clk-imx8mn.c
> > @@ -82,6 +84,7 @@ static struct imx_pll14xx_clk imx8mn_dram_pll = {
> > static struct imx_pll14xx_clk imx8mn_arm_pll = {
> >                 .type = PLL_1416X,
> >                 .rate_table = imx8mn_pll1416x_tbl,
> > +               .rate_count = ARRAY_SIZE(imx8mn_pll1416x_tbl),
> 
> Why is rate_count added? That's not described in the commit text.

rate_count is necessary for table search during set_rate, it was missed previously,
I will add it into commit text in V2.

Thanks,
Anson.
