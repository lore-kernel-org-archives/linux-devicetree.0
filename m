From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH v3 0/7] Pinctrl support for Zynq
Date: Fri, 12 Dec 2014 08:34:51 -0800
Message-ID: <1d59c0972da04ec89dec6c09724986a1@BY2FFO11FD010.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alessandro Rubini <rubini@unipv.it>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-rockchip@lists.infradead.org, linux-sh@vger.kernel.org, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Beniamino Galvani <b.galvani@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

I made those few adjustments that came up in the v2 review. Other than
those, these are the same patches as before.
The series is based on pinctrl-v3.19-1, the current pinctrl/devel
branch.
A branch with these changes is available at
https://github.com/sorenb-xlnx/linux-xlnx/commits/pinctrl

	Thanks,
	S=C3=B6ren

Soren Brinkmann (7):
  pinctrl: pinconf-generic: Infer map type from DT property
  pinctrl: pinconf-generic: Allow driver to specify DT params
  pinctrl: zynq: Document DT binding
  pinctrl: Add driver for Zynq
  ARM: zynq: Enable pinctrl
  ARM: zynq: DT: Add pinctrl information
  pinctrl: qcom-spmi-gpio: Migrate to pinconf-generic

 .../bindings/pinctrl/xlnx,zynq-pinctrl.txt         |  104 ++
 arch/arm/boot/dts/zynq-7000.dtsi                   |    8 +-
 arch/arm/boot/dts/zynq-zc702.dts                   |  181 +++
 arch/arm/boot/dts/zynq-zc706.dts                   |  152 +++
 arch/arm/mach-zynq/Kconfig                         |    2 +
 drivers/pinctrl/Kconfig                            |    8 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |    2 +-
 drivers/pinctrl/pinconf-generic.c                  |  199 ++--
 drivers/pinctrl/pinconf.c                          |    4 +-
 drivers/pinctrl/pinconf.h                          |   22 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |    2 +-
 drivers/pinctrl/pinctrl-tz1090-pdc.c               |    2 +-
 drivers/pinctrl/pinctrl-tz1090.c                   |    2 +-
 drivers/pinctrl/pinctrl-zynq.c                     | 1176 ++++++++++++=
++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  125 +--
 drivers/pinctrl/sh-pfc/pinctrl.c                   |    2 +-
 include/linux/pinctrl/pinconf-generic.h            |   29 +
 include/linux/pinctrl/pinctrl.h                    |    9 +
 19 files changed, 1808 insertions(+), 222 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynq=
-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-zynq.c

--=20
2.2.0.1.g9ee0458

