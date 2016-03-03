From: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Subject: [PATCH 0/3] pinmux support for Broadcom NS2 SoC
Date: Thu,  3 Mar 2016 06:41:40 -0500
Message-ID: <1457005303-26829-1-git-send-email-yendapally.reddy@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Pramod Kumar <pramodku@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patchset contains the pinmux support for the Broadcom's
Northstar 2 (NS2) SoC.

The first patch provides the documentation details and the
second patch contains the driver details. The third patch contains
the enable method.

This patchset has been tested on NS2 bcm958712K board.
This patchset is based on v4.5.0-rc3 and is available from github
repo: https://github.com/Broadcom/arm64-linux.git
branch: ns2-pinmux-v1

Yendapally Reddy Dhananjaya Reddy (3):
  pinctrl: Broadcom Northstar2 pinctrl device tree bindings
  pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC
  ARM: dts: enable pinctrl for Broadcom NS2 SoC

 .../bindings/pinctrl/brcm,ns2-pinmux.txt           |  102 ++
 arch/arm64/boot/dts/broadcom/ns2-svk.dts           |    9 +
 arch/arm64/boot/dts/broadcom/ns2.dtsi              |    7 +
 drivers/pinctrl/bcm/Kconfig                        |   13 +
 drivers/pinctrl/bcm/Makefile                       |    1 +
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c              | 1122 ++++++++++++++++++++
 6 files changed, 1254 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,ns2-pinmux.txt
 create mode 100644 drivers/pinctrl/bcm/pinctrl-ns2-mux.c

-- 
2.1.0
