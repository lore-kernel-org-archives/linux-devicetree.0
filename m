From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH reset-next 0/2] reset: brcmstb: Misc fixes
Date: Tue, 22 Jan 2019 16:33:43 -0800
Message-ID: <20190123003345.13750-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, rdunlap@infradead.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, paul.gortmaker@windriver.com
List-Id: devicetree@vger.kernel.org

Hi Philipp,

These two patches fix some recent issues brought up by Paul and Randy,
feel free to squash into c196cdc7659d ("reset: Add Broadcom STB SW_INIT
reset controller driver") since this is only in reset/next and
linux-next so far.

Thank you!

Florian Fainelli (2):
  reset: brcmstb: Make it tristate
  reset: brcmstb: Fix 32-bit build with 64-bit resource_size_t

 drivers/reset/Kconfig         | 3 ++-
 drivers/reset/reset-brcmstb.c | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.17.1
