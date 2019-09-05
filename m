From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1] watchdog: imx_sc: this patch just fixes whitespaces
Date: Thu, 5 Sep 2019 08:06:00 -0700
Message-ID: <20190905150600.GA18080@roeck-us.net>
References: <20190905073730.22258-1-oliver.graute@kococonnector.com>
 <016e268c-f289-4127-a47e-3d8faa790ded@roeck-us.net>
 <20190905143525.GE23537@optiplex>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190905143525.GE23537@optiplex>
Sender: linux-kernel-owner@vger.kernel.org
To: Oliver Graute <oliver.graute@kococonnector.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 05, 2019 at 02:35:37PM +0000, Oliver Graute wrote:
> On 05/09/19, Guenter Roeck wrote:
> > On 9/5/19 12:44 AM, Oliver Graute wrote:
> > > Fix only whitespace errors in imx_sc_wdt_probe()
> > > 
> > > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> > 
> > This patch no longer applies due to commit "watchdog: imx_sc: Remove
> > unnecessary error log".
> > 
> 
> ok I'll rebase patch against linux-staging/watchdog-next
> 
I should have said "no longer necessary". The mentioned patch
makes the same change (and drops the error message).

Guenter
