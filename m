From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH RESEND V2 2/2] arm64: dts: freescale: imx8mq: add clock
 for GPIO node
Date: Tue, 19 Mar 2019 21:00:10 +0800
Message-ID: <20190319130009.GC28063@dragon>
References: <1551230622-30660-1-git-send-email-Anson.Huang@nxp.com>
 <1551230622-30660-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551230622-30660-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2019 at 01:28:32AM +0000, Anson Huang wrote:
> i.MX8MQ has clock gate for each GPIO bank, add clock info
> to GPIO node for clock management.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Prefix 'arm64: dts: imx8mq: ...' is good enough.  Dropped 'freescale: '
and applied the patch.

Shawn
