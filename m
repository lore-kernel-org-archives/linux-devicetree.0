From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH v2 0/2] ARM: ohci-at91: Add support to forcibly suspend ports while sleep
Date: Wed, 1 Jun 2016 12:29:58 +0800
Message-ID: <1464755400-6825-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

To save the power consumption, add a new compatible to support forcibly
suspend the USB PORTA/B/C via OHCI Interrupt Configuration SFR Register.

Changes in v2:
 - Add compatible to support forcibly suspend the ports.
 - Add soc/at91/at91_sfr.h to accommodate the defines.
 - Add error checking for .sfr_regmap.
 - Remove unnecessary regmap_read() statement.
 - Use the new compatible for ohci-node.

Wenyou Yang (2):
  usb: ohci-at91: Forcibly suspend ports while USB suspend
  ARM: at91/dt: sama5d2: Use new compatible for ohci node

 .../devicetree/bindings/usb/atmel-usb.txt          |  5 +-
 arch/arm/boot/dts/sama5d2.dtsi                     |  2 +-
 drivers/usb/host/ohci-at91.c                       | 80 +++++++++++++++++++++-
 include/soc/at91/at91_sfr.h                        | 29 ++++++++
 4 files changed, 112 insertions(+), 4 deletions(-)
 create mode 100644 include/soc/at91/at91_sfr.h

-- 
2.7.4
