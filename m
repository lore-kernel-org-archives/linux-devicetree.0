From: Abel Vesa <abel.vesa@nxp.com>
Subject: [RFC 0/5] Add cpufreq-dt support i.MX8MQ
Date: Wed, 13 Feb 2019 19:05:11 +0000
Message-ID: <1550084693-9797-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>, Anson Huang <anson.huang@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

I'm sending this as a patchseries (RFC) just to show all the changes
needed for this to work. I'll resend separately once I get some feedback
on the entire thing.

One thing that is missing compared to the earlier work
(here: https://patchwork.kernel.org/patch/10807821/ )
is the speed grading. That can be done as a separate change 
once I figure out how to do it with cpufreq-dt.

Unfortumately, there is a need to update the dt-bindings
once again in order to add missing ARM clock from patches 1 and 2.

Abel Vesa (5):
  clk: imx: imx8mq: Fix the rate propagation for arm pll
  dt-bindings: imx8mq-clock: Add the missing ARM clock
  clk: imx8mq: Add the missing ARM clock
  arm64: dts: imx8mq: Add the clocks and the latencies for the A53 cores
  arm64: dts: imx8mq: Add the opp table and the cpu-supply nodes

 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 17 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 31 ++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx8mq.c                 |  8 ++++++-
 include/dt-bindings/clock/imx8mq-clock.h     |  4 +++-
 4 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.7.4
