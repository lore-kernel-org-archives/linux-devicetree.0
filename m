From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH RESEND 5/8] arm: dts: berlin: enable wdt0 on Sony NSZ-GS7
Date: Mon, 16 Nov 2015 19:09:51 +0800
Message-ID: <1447672194-483-6-git-send-email-jszhang@marvell.com>
References: <1447672194-483-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447672194-483-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Enable wdt0 on Marvell Berlin BG2 based Sony NSZ-GS7 to make use of the
watchdog functionality.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts b/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts
index 5c99fb3..f3c53b3 100644
--- a/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts
+++ b/arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts
@@ -71,3 +71,5 @@
 };
 
 &uart0 { status = "okay"; };
+
+&wdt0 { status = "okay"; };
-- 
2.6.1
