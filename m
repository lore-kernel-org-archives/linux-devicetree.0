From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] irqchip/renesas-intc-irqpin: fallback enhancements
Date: Fri,  9 Dec 2016 11:50:48 +0100
Message-ID: <1481280650-9258-1-git-send-email-horms+renesas@verge.net.au>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

Hi,

this short series aims to improve the fallback compatibility strings
for the renesas-intc-irqpin driver.

Based on v4.9-rc1.

Simon Horman (2):
  irqchip/renesas-intc-irqpin: List fallback compatibility last
  irqchip/renesas-intc-irqpin: Add R-Car Gen1 fallback binding

 .../interrupt-controller/renesas,intc-irqpin.txt   | 44 ++++++++++++----------
 drivers/irqchip/irq-renesas-intc-irqpin.c          |  4 +-
 2 files changed, 27 insertions(+), 21 deletions(-)

-- 
2.7.0.rc3.207.g0ac5344
