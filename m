From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: imx7ulp: add HSRUN mode clocks
Date: Thu, 10 Jan 2019 14:56:21 +0800
Message-ID: <20190110065619.GB25218@dragon>
References: <1544176659-32022-1-git-send-email-Anson.Huang@nxp.com>
 <1544176659-32022-3-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544176659-32022-3-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 07, 2018 at 10:03:39AM +0000, Anson Huang wrote:
> i.MX7ULP can switch CPU between RUN mode and HSRUN mode
> by programming SMC1 register, different clock sources
> will be used for CPU in different modes, so SMC1 can be
> abstracted as a clock controller for CPU clock switch,
> this patch adds support for it.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
