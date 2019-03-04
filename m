From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 0/3] arm: dts: imx8mq: Add cpufreq support
Date: Mon, 4 Mar 2019 13:25:30 +0800
Message-ID: <20190304052528.GW26041@dragon>
References: <1551390149-15443-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551390149-15443-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 28, 2019 at 09:42:43PM +0000, Abel Vesa wrote:
> Changes since v2:
>  * renamed the regulator
>  * removed the useless enable-active-high from the regulator 
>  * renamed a53_0_opp_table to a53_opp_table
> 
> Abel Vesa (3):
>   arm64: dts: imx8mq: Add the clocks and the latencies for the A53 cores
>   arm64: dts: imx8mq: Add the buck vdd_arm regulator
>   arm64: dts: imx8mq: Add the opp table and cores opp properties

Applied all, thanks.
