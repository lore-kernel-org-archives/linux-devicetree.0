From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH 4/5] ARM: dts: keystone: update reset node to work with reset driver
Date: Fri, 28 Feb 2014 20:07:44 +0200
Message-ID: <1393610865-23630-5-git-send-email-ivan.khoronzhuk@ti.com>
References: <1393610865-23630-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393610865-23630-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: santosh.shilimkar@ti.com
Cc: olof@lixom.net, w-kwok2@ti.com, grygorii.strashko@ti.com, anton@enomsg.org, catalin.marinas@arm.com, sboyd@codeaurora.org, ksankaran@apm.com, abhimany@codeaurora.org, ldewangan@nvidia.com, lho@apm.com, fkan@apm.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

The reset controller registers are part of the PLL Controller MMRs.
According to TRM there are the following registers:
RSTYPE, RSCTRL, RSCFG and RSISO. Currently declared only one of them,
but that is not enough to correctly setup reset properties, so add
whole range of pll registers - pllregs.

Also add range for reset multiplex registers for SoC on the device.
These registers are located in Bootcfg memory space and needed
to setup behaviour after appropriate watchdog is triggered.

Add "ti,wdt_list" option to declare what watchdog are used to reboot
the SoC.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---

CC: Rob Herring <robh+dt@kernel.org>
CC: Pawel Moll <pawel.moll@arm.com>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Ian Campbell <ijc+devicetree@hellion.org.uk>
CC: Kumar Gala <galak@codeaurora.org>
CC: Russell King <linux@arm.linux.org.uk>

 arch/arm/boot/dts/keystone.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index 3a83ffe..7092208 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -99,7 +99,9 @@
 
 		rstctrl: reset-controller {
 			compatible = "ti,keystone-reset";
-			reg = <0x023100e8 4>;	/* pll reset control reg */
+			reg = <0x23100e4 0x10>, <0x2620328 0x10>;
+			reg-names = "pllregs", "muxregs";
+			ti,wdt_list = <0>;
 		};
 
 		/include/ "keystone-clocks.dtsi"
-- 
1.8.3.2
