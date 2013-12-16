From: Alex Elder <alex.elder@linaro.org>
Subject: [GIT PULL] clk: initial support  for Broadcom Kona clocks
Date: Mon, 16 Dec 2013 09:26:29 -0600
Message-ID: <52AF1BA5.6000902@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <Pawel.Moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>
Cc: "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Mike, please pull the following for 3.14.  It adds clock support
for Broadcom SoCs having "Kona" clock control units.  Thanks.

					-Alex

The following changes since commit 1459c837036a44e2dcf14a9452ed330201fb23b5:

  clk: si570: Add a driver for SI570 oscillators (2013-12-14 21:01:35 -0800)

are available in the git repository at:

  git://git.linaro.org/landing-teams/working/broadcom/kernel.git
pull/mturquette-kona-clocks

for you to fetch changes up to 143522e704d105bd2b3cbbca6e8fb2d217866ec0:

  clk: bcm281xx: add initial clock framework support (2013-12-16
07:34:52 -0600)

----------------------------------------------------------------
Alex Elder (2):
      clk: bcm281xx: define kona clock binding
      clk: bcm281xx: add initial clock framework support

 .../devicetree/bindings/clock/bcm-kona-clock.txt   |   93 ++
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/bcm/Kconfig                            |    8 +
 drivers/clk/bcm/Makefile                           |    3 +
 drivers/clk/bcm/clk-bcm281xx.c                     |  416 ++++++++
 drivers/clk/bcm/clk-kona-setup.c                   |  769 +++++++++++++++
 drivers/clk/bcm/clk-kona.c                         | 1033
++++++++++++++++++++
 drivers/clk/bcm/clk-kona.h                         |  414 ++++++++
 include/dt-bindings/clock/bcm281xx.h               |   65 ++
 10 files changed, 2803 insertions(+)
 create mode 100644
Documentation/devicetree/bindings/clock/bcm-kona-clock.txt
 create mode 100644 drivers/clk/bcm/Kconfig
 create mode 100644 drivers/clk/bcm/Makefile
 create mode 100644 drivers/clk/bcm/clk-bcm281xx.c
 create mode 100644 drivers/clk/bcm/clk-kona-setup.c
 create mode 100644 drivers/clk/bcm/clk-kona.c
 create mode 100644 drivers/clk/bcm/clk-kona.h
 create mode 100644 include/dt-bindings/clock/bcm281xx.h
