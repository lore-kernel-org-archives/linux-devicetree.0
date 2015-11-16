From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH RESEND 8/8] arm64: dts: berlin: enable wdt0 on the Marvell BG4CT STB board
Date: Mon, 16 Nov 2015 19:09:54 +0800
Message-ID: <1447672194-483-9-git-send-email-jszhang@marvell.com>
References: <1447672194-483-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447672194-483-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Enable wdt0 on the Marvell BG4CT STB board to make use of the watchdog
functionality.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm64/boot/dts/marvell/berlin4ct-stb.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/berlin4ct-stb.dts b/arch/arm64/boot/dts/marvell/berlin4ct-stb.dts
index 348c37e..4f0a873 100644
--- a/arch/arm64/boot/dts/marvell/berlin4ct-stb.dts
+++ b/arch/arm64/boot/dts/marvell/berlin4ct-stb.dts
@@ -64,3 +64,7 @@
 &uart0 {
 	status = "okay";
 };
+
+&wdt0 {
+	status = "okay";
+};
-- 
2.6.1
