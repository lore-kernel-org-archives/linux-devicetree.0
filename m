From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH 3/3] ARM: dts: k2hk-evm: disable subpage write for davinci nand device
Date: Thu, 20 Mar 2014 19:06:24 +0200
Message-ID: <1395335184-4745-4-git-send-email-ivan.khoronzhuk@ti.com>
References: <1395335184-4745-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395335184-4745-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, galak@codeaurora.org, santosh.shilimkar@ti.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, rob@landley.net, linux@arm.linux.org.uk, grygorii.strashko@ti.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, Murali Karicheri <m-karicheri2@ti.com>, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
List-Id: devicetree@vger.kernel.org

From: Murali Karicheri <m-karicheri2@ti.com>

Add the property davinci-no-subpage-write to disable sub page write
in the nand driver.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 arch/arm/boot/dts/k2hk-evm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/k2hk-evm.dts b/arch/arm/boot/dts/k2hk-evm.dts
index 949ef7d..b0498c140 100644
--- a/arch/arm/boot/dts/k2hk-evm.dts
+++ b/arch/arm/boot/dts/k2hk-evm.dts
@@ -118,6 +118,7 @@
 			nand-ecc-mode = "hw";
 			ti,davinci-ecc-bits = <4>;
 			nand-on-flash-bbt;
+			ti,davinci-no-subpage-write;
 
 			partition@0 {
 				label = "u-boot";
-- 
1.8.3.2
