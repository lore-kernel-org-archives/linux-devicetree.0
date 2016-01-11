From: kernel@martin.sperl.org
Subject: [PATCH V2 0/4] clk: bcm2835: add additinal clocks and add frac support
Date: Mon, 11 Jan 2016 19:55:52 +0000
Message-ID: <1452542157-2387-1-git-send-email-kernel@martin.sperl.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Remi Pommarel <repk@triplefau.lt>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel@martin.sperl.org>

The clk-bcm2835 driver right now relies on BCM2835_CLOCK_COUNT defined
in include/dt-binding/clocks/bcm2835.h
With every new clock introduced this value needs to increase,
which is not what should happen for bindings.

So we reorganize the driver so that it is no longer necessary
to define BCM2835_CLOCK_COUNT.

Also the driver calculates fractional clock dividers correctly,
but it does not enable the bit to enable support in the register.
As a minimal extension we now can also define higher order MASH
support when defining the clocks.

Finally we add all the 23 different HW clocks that have not been
configured in the driver.

Martin Sperl (4):
  clk: bcm2835: avoid the use of BCM2835_CLOCK_COUNT in clk-bcm2835
  clk: bcm2835: enable fractional and mash support
  clk: bcm2835: enable management of PCM clock
  clk: bcm2835: add missing 22 HW-clocks.

 drivers/clk/bcm/clk-bcm2835.c       |  527 +++++++++++++++++++++++++++++++----
 include/dt-bindings/clock/bcm2835.h |   25 +-
 2 files changed, 489 insertions(+), 63 deletions(-)

--
1.7.10.4

