From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH 7/8] arm: dts: berlin: enable wdt0 on the Marvell BG2Q DMP
Date: Mon, 19 Oct 2015 16:49:48 +0800
Message-ID: <1445244589-4838-8-git-send-email-jszhang@marvell.com>
References: <1445244589-4838-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445244589-4838-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Enable wdt0 on the Marvell BG2Q DMP board to make use of the watchdog
functionality.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
index 0fa8f1e..e60f53a 100644
--- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
+++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
@@ -139,3 +139,7 @@
 &sata_phy {
 	status = "okay";
 };
+
+&wdt0 {
+	status = "okay";
+};
-- 
2.6.1
