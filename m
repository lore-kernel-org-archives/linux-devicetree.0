From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 0/4] DT clock binding support
Date: Mon,  9 Apr 2012 15:24:57 -0500
Message-ID: <1334003101-17274-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Mike Turquette <mturquette@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <kernel@pengutronix.de>, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

This is yet another post of DT clock binding support. This adds support for
parsing clock data from DT and initializing clock trees using the common
clk infrastructure.

Functionally, this is mostly unchanged from the previous version. The major
change is the move of everything from drivers/of/clock.c and of_clk.h into
appropriate places in the core clock infrastructure. I've also squashed my
changes into Grant's original patches.

The highbank clock support is unchanged except for includes, so I have not
reposted it here.

The previous series is here:
http://www.spinics.net/lists/arm-kernel/msg164892.html

Rob

Grant Likely (2):
  clk: add DT clock binding support
  clk: add DT fixed-clock binding support

Rob Herring (2):
  clk: select CLKDEV_LOOKUP for COMMON_CLK
  clk: remove trailing whitespace from clk.h

 .../devicetree/bindings/clock/clock-bindings.txt   |  117 ++++++++++++++++
 .../devicetree/bindings/clock/fixed-clock.txt      |   22 +++
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/clk-fixed-rate.c                       |   23 ++++
 drivers/clk/clk.c                                  |  140 ++++++++++++++++++++
 drivers/clk/clkdev.c                               |   77 +++++++++++
 include/linux/clk-provider.h                       |   16 +++
 include/linux/clk.h                                |   23 +++-
 8 files changed, 417 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/clock-bindings.txt
 create mode 100644 Documentation/devicetree/bindings/clock/fixed-clock.txt

-- 
1.7.5.4
