From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V5 1/2] arm64: dts: freescale: imx8qxp: add cpu opp table
Date: Thu, 14 Feb 2019 15:50:47 +0530
Message-ID: <20190214102047.giu5lwxw7dtyfdqy@vireshk-i7>
References: <1550131046-2069-1-git-send-email-Anson.Huang@nxp.com>
 <20190214083419.slnuolyy5xhz4szy@vireshk-i7>
 <DB3PR0402MB39163EE75B512102C5FE19E9F5670@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB39163EE75B512102C5FE19E9F5670@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 14-02-19, 09:47, Anson Huang wrote:
> Although all CPUs share same clock and opp table, but OK, I will add clock to
> all CPUs.

Right, but still these must be present for all CPUs as on certain
occasions a CPU other than CPU0 can be used to bring up the cupfreq
policy.

-- 
viresh
