From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/3] rtc: imx-sc: Make compatible string more generic
Date: Tue, 11 Jun 2019 21:11:28 +0200
Message-ID: <20190611191128.GK25472@piout.net>
References: <20190611063333.48501-1-Anson.Huang@nxp.com>
 <20190611063333.48501-2-Anson.Huang@nxp.com>
 <AM0PR04MB4211DC4725A5FEBDC995560680ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB4211DC4725A5FEBDC995560680ED0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.co>
List-Id: devicetree@vger.kernel.org

On 11/06/2019 10:57:17+0000, Aisheng Dong wrote:
> > From: Anson.Huang@nxp.com [mailto:Anson.Huang@nxp.com]
> > Sent: Tuesday, June 11, 2019 2:34 PM
> > 
> > i.MX system controller RTC driver can support all i.MX SoCs with system
> > controller inside, this patch makes the compatible string more generic to
> > support other i.MX SoCs with system controller inside, such as i.MX8QM etc..
> > 
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> 
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> Regards
> Dong Aisheng
> 
> > ---
> >  drivers/rtc/rtc-imx-sc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c index
> > c933045..38ef3ca 100644
> > --- a/drivers/rtc/rtc-imx-sc.c
> > +++ b/drivers/rtc/rtc-imx-sc.c
> > @@ -178,7 +178,7 @@ static int imx_sc_rtc_probe(struct platform_device
> > *pdev)  }
> > 
> >  static const struct of_device_id imx_sc_dt_ids[] = {
> > -	{ .compatible = "fsl,imx8qxp-sc-rtc", },

Don't you want to keep that compatible for backward compatibility?

> > +	{ .compatible = "fsl,imx-sc-rtc", },
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, imx_sc_dt_ids);
> > --
> > 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
