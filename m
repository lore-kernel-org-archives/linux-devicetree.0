From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH v3 0/2] clk/zynq: fclk-enable feature
Date: Thu,  7 Nov 2013 10:00:42 -0800
Message-ID: <1383847244-2079-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Michal Simek <michal.simek@xilinx.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi,

this is v3. The only change is a doc fix. Regarding the vendor prefix f=
or
properties, I counted one vote for it and one against + the already exi=
sting
bindings that don't have a vendor prefix and my personal preference; an=
d nobody
else seems to have a strong opinion on this. Therefore I left it out.

	Thanks,
	S=C3=B6ren

Soren Brinkmann (2):
  clk/zynq/clkc: Add 'fclk-enable' feature
  arm: dt: zynq: Add fclk-enable property to clkc node

 Documentation/devicetree/bindings/clock/zynq-7000.txt |  4 ++++
 arch/arm/boot/dts/zynq-7000.dtsi                      |  1 +
 drivers/clk/zynq/clkc.c                               | 18 +++++++++++=
++++---
 3 files changed, 20 insertions(+), 3 deletions(-)

--=20
1.8.4.2

