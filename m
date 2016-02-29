From: kernel@martin.sperl.org
Subject: [PATCH 0/3] reorganize clock initialization and add PCM clock
Date: Mon, 29 Feb 2016 12:51:40 +0000
Message-ID: <1456750304-2424-1-git-send-email-kernel@martin.sperl.org>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

From: Martin Sperl <kernel@martin.sperl.org>

As changing entries in the dt-bindings header files is frowned upon
and as we would need to change BCM2835_CLOCK_COUNT for every new
clock added, this patchset moves away from the use of
BCM2835_CLOCK_COUNT and removes it from the dt-bindings alltogether.

Instead - as recommended by Michael Turquette, Geert Uytterhoeven
and Remi Pommarel - patch 1 introduces a new initialization
process in probe that simply uses ARRAY_SIZE on a (sparse) array.

With patch 2 the initialization of the array is simplified and
better grouped together.

Patch 3 introduces the pcm clock of the bcm2835 soc and already
shows the simplification at work - the main reason for this patchset.

Martin Sperl (3):
  clk: bcm2835: remove use of BCM2835_CLOCK_COUNT in driver
  clk: bcm2835: reorganize bcm2835_clock_array assignment
  clk: bcm2835: enable management of PCM clock

 drivers/clk/bcm/clk-bcm2835.c       |  918 +++++++++++++++++------------------
 include/dt-bindings/clock/bcm2835.h |    3 +-
 2 files changed, 441 insertions(+), 480 deletions(-)

--
1.7.10.4

