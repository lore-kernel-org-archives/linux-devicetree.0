From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 0/8] pinctrl: aspeed: Fixes for core and g5,
 implement remaining pins
Date: Wed, 28 Sep 2016 00:20:12 +0930
Message-ID: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi all,

The initial Aspeed pinctrl patches implemented a subset of pins for each of the
g4 and g5 SoCs. This series provides a number of fixes to the initial patches,
mostly for issues identified in the g5 driver. The fixes account for the first
half of the series (up to and including "pinctrl: aspeed-g5: Fix pin
association of SPI1 function") and should be applied for 4.9.

The second half, from "pinctrl: aspeed: Enable capture of off-SCU pinmux
state", implements some additional functionality in the core engine for the
Aspeed SoCs and follows up with patches implementing mux configuration tables
for all remaining pins. Given the significant additions in the last few
patches, their lateness in the cycle and the light testing they have received
they are best left for 4.10, but I'm keen to get them out for review.

Cheers,

Andrew

Andrew Jeffery (8):
  pinctrl: aspeed: "Not enabled" is a significant mux state
  pinctrl: aspeed-g5: Fix names of GPID2 pins
  pinctrl: aspeed-g5: Fix GPIOE1 typo
  pinctrl: aspeed-g5: Fix pin association of SPI1 function
  pinctrl: aspeed: Enable capture of off-SCU pinmux state
  pinctrl: aspeed-g4: Capture SuperIO pinmux dependency
  pinctrl: aspeed-g4: Add mux configuration for all pins
  pinctrl: aspeed-g5: Add mux configuration for all pins

 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt |   36 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c                   | 1098 ++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c                   | 1574 ++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c                      |   65 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed.h                      |   19 +-
 5 files changed, 2737 insertions(+), 55 deletions(-)

base-commit: 8d0a0ac0abcdba5b5d52726055c95f1f6234e85e
-- 
git-series 0.8.10
