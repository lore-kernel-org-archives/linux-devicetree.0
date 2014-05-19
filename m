From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH RESEND v2 0/3] bus: add Broadcom GISB bus arbiter timeout/error handler
Date: Mon, 19 May 2014 13:05:58 -0700
Message-ID: <1400529962-9612-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Pitre <nicolas.pitre@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Alexander Shiyan <shc_work@mail.ru>, Huang Shijie <b32955@freescale.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi all,

This patch adds support for the Broadcom GISB bus arbiter timeout/error handler.
GISB is a custom and proprietary bus used in the Broadcom Set Top Box devices
exclusively. The bus arbiter offers the possibly to decode faulting masters as
well as masters that are timing out on the bus.

V2 addresses some comments made by Arnd, and widens the audience by posting
on linux-arm-kernel as well.

These patches should be merged via the 'arm-soc' tree. I am resending those
such that every mailing-list has them in copy.

Thank you!

Florian Fainelli (3):
  bus: add Broadcom GISB arbiter bus timeout/error handler
  Documentation: devicetree: add Broadcom GISB arbiter bindings
  Documentation: sysfs: add Broadcom GISB arbiter sysfs properties

 .../ABI/testing/sysfs-platform-brcmstb-gisb-arb    |   8 +
 .../devicetree/bindings/bus/brcm,gisb-arb.txt      |  30 +++
 drivers/bus/Kconfig                                |  11 +-
 drivers/bus/Makefile                               |   1 +
 drivers/bus/brcmstb_gisb.c                         | 289 +++++++++++++++++++++
 5 files changed, 338 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-brcmstb-gisb-arb
 create mode 100644 Documentation/devicetree/bindings/bus/brcm,gisb-arb.txt
 create mode 100644 drivers/bus/brcmstb_gisb.c

-- 
1.9.1
