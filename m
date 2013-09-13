From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH] SI570 clock driver
Date: Thu, 12 Sep 2013 17:55:36 -0700
Message-ID: <1379033737-30015-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyunk@xilinx.com>, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

This is another try to submit a driver for SI570 programmable clock
generators. The heart of the driver is G=C3=BCnther's code from
https://github.com/groeck/si570, which is wrapped in the common
clock infrastructure.

Due to the lack of platforms with oder devices only the SI570 is
actually tested.

	Thanks,
	S=C3=B6ren

Soren Brinkmann (1):
  clk: si570: Add a driver for SI570 oscillators

 .../devicetree/bindings/clock/silabs,si570.txt     |  31 ++
 drivers/clk/Kconfig                                |  10 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-si570.c                            | 546 +++++++++++++=
++++++++
 4 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/silabs,si57=
0.txt
 create mode 100644 drivers/clk/clk-si570.c

--=20
1.8.4

