From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [RFC 0/5] Add cpufreq-dt support i.MX8MQ
Date: Thu, 14 Feb 2019 16:55:08 +0100
Message-ID: <1550159708.2546.45.camel@pengutronix.de>
References: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 13.02.2019, 19:05 +0000 schrieb Abel Vesa:
> I'm sending this as a patchseries (RFC) just to show all the changes
> needed for this to work. I'll resend separately once I get some
> feedback
> on the entire thing.
> 
> One thing that is missing compared to the earlier work
> (here: https://patchwork.kernel.org/patch/10807821/ )
> is the speed grading. That can be done as a separate change 
> once I figure out how to do it with cpufreq-dt.
> 
> Unfortumately, there is a need to update the dt-bindings
> once again in order to add missing ARM clock from patches 1 and 2.

Which isn't much of a problem as it's a backward compatible change. A
new kernel with cpufreq support will not find the clock when started
with an old DT and thus not expose cpufreq support. I.e. it's working
with exactly the same functionality level as a kernel matching the old
DT.

Regards,
Lucas

> Abel Vesa (5):
>   clk: imx: imx8mq: Fix the rate propagation for arm pll
>   dt-bindings: imx8mq-clock: Add the missing ARM clock
>   clk: imx8mq: Add the missing ARM clock
>   arm64: dts: imx8mq: Add the clocks and the latencies for the A53
> cores
>   arm64: dts: imx8mq: Add the opp table and the cpu-supply nodes
> 
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 17 +++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 31
> ++++++++++++++++++++++++++++
>  drivers/clk/imx/clk-imx8mq.c                 |  8 ++++++-
>  include/dt-bindings/clock/imx8mq-clock.h     |  4 +++-
>  4 files changed, 58 insertions(+), 2 deletions(-)
> 
