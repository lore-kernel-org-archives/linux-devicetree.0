From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH/RESEND 0/2] ARM: shmobile: Remove #gpio-ranges-cells property
Date: Wed, 11 Sep 2013 15:51:00 +0200
Message-ID: <1378907462-19247-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

(Resending due to wrong copy&paste in mailing list e-mail addresses, sorry for
the noise.)

The property has been deprecated and unused since commit
d9fe0039c4247383c2783923a3860227813b4d82 ("gpio: implement gpio-ranges binding
document fix"). Remove it.

This is a v3.12 fix, based on top of the latest mainline master branch.
Regression and backward compatibility issue should not occur, as:

- The first patch hardcodes the number of gpio-range cells to 3, which was the
  value used by all boards so far.

- The second patch removes a property from .dtsi files that isn't used anymore
  since the above-mentioned commit.

However, care must be taken to merge the patches in the correct order. Linus,
Simon, would you like to two patches to go through a single tree, or should
Linus provide a stable branch ?

Laurent Pinchart (2):
  gpio: rcar: Remove #gpio-range-cells DT property usage
  ARM: shmobile: Remove #gpio-ranges-cells DT property

 arch/arm/boot/dts/r8a7778.dtsi | 1 -
 arch/arm/boot/dts/r8a7779.dtsi | 1 -
 arch/arm/boot/dts/r8a7790.dtsi | 1 -
 drivers/gpio/gpio-rcar.c       | 7 +++----
 4 files changed, 3 insertions(+), 7 deletions(-)

-- 
Regards,

Laurent Pinchart

