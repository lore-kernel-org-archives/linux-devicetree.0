From: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [PATCH 2/3] pinctrl: pinctrl-imx: add imx6q pinctrl driver
Date: Wed, 18 Apr 2012 11:40:28 +0800
Message-ID: <20120418034027.GB18021@shlinux2.ap.freescale.net>
References: <1334333915-1174-1-git-send-email-b29396@freescale.com>
 <1334333915-1174-2-git-send-email-b29396@freescale.com>
 <4F8DCEC2.2060800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F8DCEC2.2060800@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Dong Aisheng-B29396 <B29396@freescale.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, Guo Shawn-R65073 <r65073@freescale.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 18, 2012 at 04:12:50AM +0800, Stephen Warren wrote:
> On 04/13/2012 10:18 AM, Dong Aisheng wrote:
> > From: Dong Aisheng <dong.aisheng@linaro.org>
> > 
> > Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> 
> > diff --git a/drivers/pinctrl/pinctrl-imx.c b/drivers/pinctrl/pinctrl-imx.c
> 
> >  static const struct of_device_id imx_pmx_dt_ids[] = {
> > +#ifdef CONFIG_PINCTRL_IMX6Q
> > +	{ .compatible = "fsl,imx6q-iomuxc", .data = (void *) &imx6q_pinctrl_info, },
> > +#endif
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, imx_pmx_dt_ids);
> 
> Sorry for the slow review.
> 
> Based on SPEAr pinctrl review comments, we shouldn't have a single
> driver that knows about all the different SoCs that it could support,
> but rather one driver per SoC, with each of those calling into some
> utility code in the core driver to do all the probe/remove work.
> 
Sound like a good idea.

> For more details, see commit a4c0738 "pinctrl: tegra: refactor probe
> handling" in
> git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
> (in branch for-3.5/gpio-pinmux).
> 
I will check it.
Thanks for the reminder.

Regards
Dong Aisheng
