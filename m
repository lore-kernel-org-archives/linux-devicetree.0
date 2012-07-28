From: Chandrabhanu Mahapatra <cmahapatra@ti.com>
Subject: [PATCH V1 0/3] Extend TCA6424 support
Date: Sat, 28 Jul 2012 11:35:36 +0530
Message-ID: <cover.1343026861.git.cmahapatra@ti.com>
References: <cover.1341925681.git.cmahapatra@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1341925681.git.cmahapatra@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@stericsson.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, tony@atomide.com
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, leed.aguilar@ti.com, Chandrabhanu Mahapatra <cmahapatra@ti.com>
List-Id: devicetree@vger.kernel.org

Hi everyone!
This following patch series extends support capabilities of TCA6424 through
following patches.

The 1st patch adds 24 bit support for polarity inversion registers by providing
24 bit support for invert variable.
The 2nd patch adds 24 bit support of the variables such as irq_mask, irq_stat, etc.
The 3rd patch extends 24 lines irq support for TCA6424.

The 4th patch for the previous patch series has been removed.

These patches were based on mainline kernel v3.5rc7.

All your comments and suggestions are welcome.

Regards,
Chandrabhanu

Chandrabhanu Mahapatra (1):
  GPIO: PCA953X: Increase size of invert variable to support 24 bit

Leed Aguilar (2):
  gpio/pca953x: increase variables size to support 24 bit of data
  OMAP: Define TCA6424 max number of possible IRQs

 arch/arm/plat-omap/include/plat/irqs.h |   11 ++++++++-
 drivers/gpio/gpio-pca953x.c            |   39 ++++++++++++++++----------------
 include/linux/i2c/pca953x.h            |    2 +-
 3 files changed, 31 insertions(+), 21 deletions(-)

-- 
1.7.10
