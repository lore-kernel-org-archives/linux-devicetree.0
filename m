From: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 00/12] clk: bcm281xx: updates for 3.14
Date: Wed, 19 Feb 2014 18:12:50 -0600
Message-ID: <1392855182-21155-1-git-send-email-elder@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series includes updates for the bcm281xx clock code to be 
considered for kernel 3.14.  I've held off posting this because
a mixup caused the code to which this applies to be dropped at
the last minute from the 3.13 release, and I wanted to make sure
the dust had settled on getting that resolved.  The patches are
available here:
    http://git.linaro.org/landing-teams/working/broadcom/kernel.git
    Branch review/bcm-clk-next

These are based on three patches that implement the baseline
bcm281xx clock functionality, which I re-posted last week.
    https://lkml.org/lkml/2014/2/14/449
    https://lkml.org/lkml/2014/2/14/456
    https://lkml.org/lkml/2014/2/14/451

I've grouped them, and offer a little explanation of each of the
groups below.

					-Alex

Alex Elder (12):
  clk: bcm281xx: warn if ccu_wait_bit() fails
  clk: bcm281xx: use init_data.name for clock name
       Two small improvements to the code.

  clk: bcm281xx: change some symbol names
  mach-bcm: bcm281xx: more symbol cleanup
	Improve clarity by using "281xx" rather than "11351" in
	symbols; support for the bcm11351 board is going away, and
	in these cases there's no reason not to use "281xx" instead.

  clk: bcm281xx: initialize CCU structures statically
  clk: bcm281xx: define CCU clock data statically
  	This rearranges the way CCUs and the clocks they provide are
	defined, so that they're defined statically to the extent
	possible rather than allocating and initializing things
	at runtime.

  clk: bcm281xx: add clock policy support
  clk: bcm281xx: add clock hysteresis support
  clk: bcm281xx: add an initialized flag
  clk: bcm281xx: implement prerequisite clocks
  clk: bcm281xx: add bus clock support
  clk: bcm281xx: define a bus clock
  	This series adds a few new features, ultimately for the
	purpose of adding support for another type of Kona clock.
	Currently only peripheral clocks are supported; this adds
	the ability to define and control bus clocks.  In addition,
	support is added for clocks to identify a prerequisite
	clock; a clock won't be initialized until after its
	prerequisite has been.

 arch/arm/boot/dts/bcm11351.dtsi      |    3 +-
 arch/arm/mach-bcm/board_bcm281xx.c   |    9 +-
 drivers/clk/bcm/clk-bcm281xx.c       |  254 ++++++++++++--------------
 drivers/clk/bcm/clk-kona-setup.c     |  331 +++++++++++++++++++++++++++-------
 drivers/clk/bcm/clk-kona.c           |  331 ++++++++++++++++++++++++++++++++--
 drivers/clk/bcm/clk-kona.h           |  189 ++++++++++++++++---
 include/dt-bindings/clock/bcm281xx.h |    3 +-
 7 files changed, 878 insertions(+), 242 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
