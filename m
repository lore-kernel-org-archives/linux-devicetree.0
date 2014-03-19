From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [PATCH 2/2] ARM: dts: keystone: disable subpage write for davinci nand device
Date: Thu, 20 Mar 2014 00:15:45 +0200
Message-ID: <1395267345-27795-3-git-send-email-ivan.khoronzhuk@ti.com>
References: <1395267345-27795-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395267345-27795-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: santosh.shilimkar@ti.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Murali Karicheri <m-karicheri2@ti.com>
List-Id: devicetree@vger.kernel.org

Add the property davinci-no-subpage-write to disable sub page write in the
nand driver.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 arch/arm/boot/dts/k2hk-evm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/k2hk-evm.dts b/arch/arm/boot/dts/k2hk-evm.dts
index 1a1335b..624520f 100644
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
