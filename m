From: Sricharan R <r.sricharan@ti.com>
Subject: [PATCH 0/2] ARM: dts: dra7: Add crossbar dt support
Date: Tue, 3 Jun 2014 14:40:33 +0530
Message-ID: <1401786635-5778-1-git-send-email-r.sricharan@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: tony@atomide.com, santosh.shilimkar@ti.com, nm@ti.com, rnayak@ti.com, tglx@linutronix.de, linux@arm.linux.org.uk, r.sricharan@ti.com
List-Id: devicetree@vger.kernel.org

This series introduces DT support for crossbar device and
changes dra7 peripherals to use crossbar number instead of irq.

This depends on below driver fixes and DMA cleanup series.
	http://www.spinics.net/lists/arm-kernel/msg336594.html

R Sricharan (2):
  ARM: dts: DRA7: Add routable-irqs property for gic node
  ARM: dts: DRA7: Add crossbar device binding

 arch/arm/boot/dts/dra7.dtsi |  134 ++++++++++++++++++++++++-------------------
 1 file changed, 76 insertions(+), 58 deletions(-)

-- 
1.7.9.5

