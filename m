From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 8/8] reset: Add driver for gpio-controlled reset pins
Date: Mon, 27 May 2013 13:25:24 -0300
Message-ID: <CAOMZO5BJ7h=_cqSUG6X25SHTMe5ym1_nToj5P_PMR9bxN+B2Ow@mail.gmail.com>
References: <1361878774-6382-1-git-send-email-p.zabel@pengutronix.de>
	<1361878774-6382-9-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1361878774-6382-9-git-send-email-p.zabel@pengutronix.de>
Sender: linux-pm-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>, Mike Turquette <mturquette@linaro.org>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 26, 2013 at 8:39 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> This driver implements a reset controller device that toggles gpios
> connected to reset pins of peripheral ICs. The delay between assertion
> and de-assertion of the reset signal can be configured.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Looks good and it is a very useful binding.

Will anyone apply this?

Thanks,

Fabio Estevam
